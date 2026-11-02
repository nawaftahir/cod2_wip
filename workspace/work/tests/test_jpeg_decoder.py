"""Decode real JPEGs through the renderer adapter and check pixels and ownership."""
from pathlib import Path
import subprocess
import tempfile
from PIL import Image

work = Path(__file__).resolve().parents[1]
codec = work / 'src/jpeg-6b'
text = (work / 'src/gfx_d3d/r_jpeg.cpp').read_text()
callbacks = text[text.index('static void *Z_MallocJpeg('):text.index('// PINNED 100145d0/62;')]
source = text[text.index('// PINNED 10014940/785:'):]
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
extern "C" {
#include "jpeglib.h"
}
typedef unsigned char byte;typedef int D3DFORMAT;
enum {D3DFMT_A8R8G8B8=21,ERR_FATAL=0};
struct {int maxTextureSize;} vidConfig;
std::map<void*,int> blocks;
std::vector<byte> temp;
std::string folder;
void *fileBlock;
int releases,allocations,reads,fileFrees,tempFrees,prints,limit,which;
void *allocate(int size){assert(size>0);void *p=malloc(size);blocks[p]=size;++allocations;return p;}
void release(void *p){assert(blocks.erase(p)==1);free(p);++releases;}
int read(const char *name,void **out){
    assert(!strcmp(name,"input.jpg")&&!fileBlock);++reads;
    if(which==0){*out=0;return -1;}
    std::string path=folder+"/case"+std::to_string(which)+".jpg";
    FILE *f=fopen(path.c_str(),"rb");assert(f);fseek(f,0,SEEK_END);int n=ftell(f);rewind(f);
    *out=fileBlock=malloc(n);assert(fread(*out,1,n,f)==size_t(n));fclose(f);return n;
}
void freeFile(void *p){assert(p==fileBlock&&blocks.empty());free(p);fileBlock=0;++fileFrees;}
void *allocateTemp(int size){assert(!blocks.empty()&&temp.empty());temp.assign(size+16,0xa5);return temp.data();}
void freeTemp(void *p){assert(p==temp.data()&&blocks.empty());++tempFrees;temp.clear();}
void fatal(int,const char*,...){assert(false);}
void print(int channel,const char *format,...){
    assert(channel==2);++prints;va_list args;va_start(args,format);
    assert(!strcmp(va_arg(args,const char*),"input.jpg"));
    if(which==5||which==6){assert(!strcmp(format,"WARNING: image '%s' is larger than %i on at least one side\n"));assert(va_arg(args,int)==limit);}
    else assert(!strcmp(format,"WARNING: jpeg image '%s' is not RGB\n"));
    va_end(args);
}
struct {void *(*Z_MallocInternal)(int);void (*Z_FreeInternal)(void*);
 void *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void*);
 int (*FS_ReadFile)(const char*,void**);void (*FS_FreeFile)(void*);
 void (*Error)(int,const char*,...);void (*Printf)(int,const char*,...);
} ri={allocate,release,allocateTemp,freeTemp,read,freeFile,fatal,print};
''' + callbacks + source + r'''
int main(int argc,char **argv){
 assert(argc==2);folder=argv[1];
 static_assert(sizeof(jpeg_decompress_struct)==440,"PC decompressor layout");
 static_assert(offsetof(jpeg_decompress_struct,output_width)==0x64,"PC dimensions");
 static_assert(offsetof(jpeg_decompress_struct,output_components)==0x70,"PC component count");
 for(which=0;which<=7;++which){
    reads=fileFrees=tempFrees=prints=allocations=releases=0;limit=which==5||which==6?16:128;vidConfig.maxTextureSize=limit;
    int w=-1,h=-2;D3DFORMAT format=-3;byte *file=(byte*)1,*pic=0;
    R_LoadJpg("input.jpg",&file,&pic,&w,&h,&format);
    assert(reads==1&&blocks.empty()&&allocations==releases&&!tempFrees);
    if((which>=1&&which<=2)||which==7){
      assert(file==fileBlock&&pic==temp.data()&&w==37&&h==19&&format==21&&!fileFrees&&!prints);
      for(int i=w*h*4;i<w*h*4+16;++i)assert(temp[i]==0xa5);
      std::string expected=folder+"/case"+std::to_string(which)+".bgra";FILE *f=fopen(expected.c_str(),"rb");assert(f);
      for(int i=0;i<w*h*4;++i){int value=fgetc(f);assert(value>=0&&abs(value-int(pic[i]))<=3);}assert(fgetc(f)==EOF);fclose(f);
      ri.Hunk_FreeTempMemory(pic);ri.FS_FreeFile(file);assert(tempFrees==1&&fileFrees==1);
    }else{
      assert(!pic&&file==(byte*)1&&w==-1&&h==-2&&format==-3&&temp.empty());
      assert(prints==int(which!=0)&&fileFrees==int(which!=0)&&!fileBlock);
    }
 }
 jpeg_decompress_struct info;jpeg_error_mgr error;
 info.err=jpeg_std_error(&error,ExitJpeg,PrintfJpeg);info.alloc.malloc=Z_MallocJpeg;info.alloc.free=Z_FreeJpeg;
 jpeg_create_decompress(&info);byte bytes[12]={};jpeg_memory_src(&info,bytes,12);
 auto *src=info.src;assert(src->next_input_byte==bytes&&src->bytes_in_buffer==12&&!src->fill_input_buffer);
 src->init_source(&info);assert(((byte*)src)[28]==1);
 src->skip_input_data(&info,0);src->skip_input_data(&info,-1);assert(src->next_input_byte==bytes&&src->bytes_in_buffer==12);
 src->skip_input_data(&info,4);assert(src->next_input_byte==bytes+4&&src->bytes_in_buffer==8);
 src->term_source(&info);jpeg_memory_src(&info,bytes,12);assert(info.src==src&&src->bytes_in_buffer==12);
 jpeg_destroy_decompress(&info);assert(blocks.empty());
 puts("PASS: actual JPEG decoder baseline/progressive, BGR expansion, grayscale/CMYK rejection, both size limits, missing files, guards and allocation ownership");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_jpeg_decoder_') as directory:
    folder = Path(directory)
    for index in range(1,8):
        image = Image.new('RGB', (37,19))
        image.putdata([((x*5+y*3)%256,(x*2+y*7)%256,(x*3+y*5)%256) for y in range(19) for x in range(37)])
        if index == 4:
            image = image.convert('L')
        if index == 5:
            image = image.resize((37,8))
        if index == 6:
            image = image.resize((8,19))
        if index == 7:
            image = Image.new('RGB',(37,19),(32,128,224))
        if index == 3:
            image = image.convert('CMYK')
        image.save(folder / ('case%d.jpg' % index), quality=95, progressive=index==2)
        with Image.open(folder / ('case%d.jpg' % index)) as decoded:
            (folder / ('case%d.bgra' % index)).write_bytes(decoded.convert('RGBA').tobytes('raw','BGRA'))
    subprocess.run(['gcc','-m32','-malign-double','-O2','-std=c89','-DNO_GETENV','-I',str(codec),'-c',*map(str,sources)],cwd=folder,check=True)
    binary = str(folder / 'test')
    subprocess.run(['g++','-m32','-malign-double','-std=c++11','-O2','-I',str(codec),'-x','c++','-','-x','none',*map(str,sorted(folder.glob('*.o'))),'-o',binary],input=program,text=True,check=True)
    subprocess.run([binary,directory],check=True)
