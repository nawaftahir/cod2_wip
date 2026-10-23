"""Actual IJG encoder and renderer wrapper: ABI, BGR colors and ownership."""
from pathlib import Path
import subprocess
import tempfile
from PIL import Image

work = Path(__file__).resolve().parents[1]
codec = work / 'src/jpeg-6b'
text = (work / 'src/gfx_d3d/r_jpeg.cpp').read_text()
source = text[text.index('struct JpegMemoryDestination'):]
sources = [work / 'src' / line.split()[0] for line in (work / 'src/tus.txt').read_text().splitlines() if line.startswith('jpeg-6b/')]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <map>
#include <stdexcept>
extern "C" {
#include "jpeglib.h"
#include "jerror.h"
}
typedef unsigned char byte;
enum errorParm_t {ERR_FATAL=0};
std::map<void*,int> blocks;
std::vector<byte> temp,encoded;
std::string directory;
int capacity,allocations,releases,writes,tempFrees,caseIndex,errors,prints;
bool tempLive,written;
j_common_ptr errorObject;
void *allocate(int size) {
    assert(size>0);if(!allocations)assert(size==84);++allocations;
    void *ptr=malloc(size);assert(ptr);blocks[ptr]=size;return ptr;
}
void release(void *ptr) {
    auto it=blocks.find(ptr);assert(it!=blocks.end());
    if(blocks.size()==1)assert(written&&!tempLive);
    blocks.erase(it);free(ptr);++releases;
}
void *allocateTemp(int size) {
    assert(!blocks.empty()&&!tempLive&&size==64*48*3);capacity=size;
    temp.assign(size+16,0xa5);tempLive=true;return temp.data();
}
void freeTemp(void *ptr) {
    assert(ptr==temp.data()&&tempLive&&written);++tempFrees;
    for(int i=0;i<16;++i)assert(temp[capacity+i]==0xa5);tempLive=false;
}
int writeFile(const char *path,const void *data,int size) {
    assert(!strcmp(path,"fixture.jpg")&&data==temp.data()&&tempLive&&size>4&&size<=capacity&&!written);
    encoded.assign((const byte*)data,(const byte*)data+size);
    assert(encoded[0]==0xff&&encoded[1]==0xd8&&encoded[size-2]==0xff&&encoded[size-1]==0xd9);
    std::string name=directory+"/case"+std::to_string(caseIndex)+".jpg";
    FILE *out=fopen(name.c_str(),"wb");assert(out);assert(fwrite(data,1,size,out)==size_t(size));fclose(out);
    written=true;++writes;return caseIndex&1?0:1;
}
void fatal(errorParm_t code,const char *message,...) {
    assert(code==ERR_FATAL&&!strcmp(message,"jpeg internal error"));
    assert(errorObject&&!errorObject->mem&&!errorObject->global_state&&prints==1);++errors;
    throw std::runtime_error("fatal");
}
void print(int channel,const char *format,...) {
    assert(channel==0&&!strcmp(format,"%s\n"));va_list args;va_start(args,format);
    assert(va_arg(args,char*)[0]);va_end(args);++prints;
}
struct {void *(*Z_MallocInternal)(int);void (*Z_FreeInternal)(void*);
    void *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void*);
    int (*FS_WriteFile)(const char*,const void*,int);void (*Error)(errorParm_t,const char*,...);
    void (*Printf)(int,const char*,...);
} ri={allocate,release,allocateTemp,freeTemp,writeFile,fatal,print};
''' + source + r'''
int main(int argc,char **argv) {
    assert(argc==2);directory=argv[1];
    static_assert(sizeof(boolean)==1&&offsetof(jpeg_compress_struct, alloc)==0x18,"original Windows byte-boolean/callback ABI");
    for(caseIndex=0;caseIndex<4;++caseIndex) {
        allocations=releases=writes=tempFrees=0;tempLive=written=false;hackSize=-1;
        std::vector<byte> pixels(64*48*3);
        for(int y=0;y<48;++y)for(int x=0;x<64;++x) {
            byte *p=&pixels[(y*64+x)*3];
            if(caseIndex==3){p[0]=x*3;p[1]=y*5;p[2]=(x+y)*2;}
            else p[2-caseIndex]=255;
        }
        auto before=pixels;R_SaveJpg("fixture.jpg",caseIndex==3?100:90,64,48,pixels.data());
        assert(pixels==before&&blocks.empty()&&!tempLive&&allocations==releases&&writes==1&&tempFrees==1&&hackSize==int(encoded.size()));
    }
    jpeg_compress_struct info={};JpegMemoryDestination dest={};byte small[17];
    info.dest=&dest.pub;dest.buffer=small;dest.size=17;init_destination(&info);
    assert(dest.pub.next_output_byte==small&&dest.pub.free_in_buffer==17);
    assert(empty_output_buffer(&info)==TRUE&&dest.pub.next_output_byte==small&&dest.pub.free_in_buffer==17);
    dest.pub.free_in_buffer=4;term_destination(&info);assert(hackSize==13);
    jpeg_error_mgr error;info.err=jpeg_std_error(&error,ExitJpeg,PrintfJpeg);
    info.global_state=7;error.msg_code=JERR_BAD_STATE;error.msg_parm.i[0]=7;errorObject=(j_common_ptr)&info;
    bool caught=false;try{error.error_exit(errorObject);}catch(const std::runtime_error&){caught=true;}
    assert(caught&&errors==1&&prints==1&&blocks.empty());
    puts("PASS: actual IJG/renderer JPEG encoding, four BGR images, allocator and output guards, write-failure cleanup, original destination exhaustion and fatal/print callbacks");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_jpeg_encoder_') as directory:
    folder = Path(directory)
    subprocess.run(['gcc','-m32','-malign-double','-O2','-std=c89','-fexceptions','-DNO_GETENV','-I',str(codec),'-c',*map(str,sources)],cwd=folder,check=True)
    binary = str(folder / 'test')
    subprocess.run(['g++','-m32','-malign-double','-std=c++11','-O2','-I',str(codec),'-x','c++','-','-x','none',*map(str,sorted(folder.glob('*.o'))),'-o',binary],input=program,text=True,check=True)
    subprocess.run([binary,directory],check=True)
    for index in range(4):
        with Image.open(folder / ('case%d.jpg' % index)) as image:
            assert image.size == (64,48)
            rgb = image.convert('RGB').getpixel((32,24))
            expected = [(255,0,0),(0,255,0),(0,0,255),(112,120,96)][index]
            assert max(abs(a-b) for a,b in zip(rgb,expected)) <= 5, (index,rgb,expected)
print('PASS: independent Pillow decoder confirms dimensions and BGR-to-RGB color mapping')
