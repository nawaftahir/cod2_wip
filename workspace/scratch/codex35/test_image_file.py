"""Actual PC image-header and file-loader ordering, errors and buffer ownership."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
start = source.index('void Com_Printf(')
end = source.index('// Blend weights', start)
program = r'''
#include <cassert>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <string>
#include <stdexcept>
typedef unsigned char byte;
typedef unsigned char Bool;
struct GfxImageFileHeader { byte tag[3],version,format,flags;short dimensions[3];int fileSizeForPicmip[4]; };
struct GfxImage { Bool noPicmip;const char *name; };
byte buffer[128];
int length,readCount,freeCount,loadCount;
std::string message,path;
void Com_Printf(const char *format,...) {
    char text[512];va_list args;va_start(args,format);
    std::vsnprintf(text,sizeof(text),format,args);va_end(args);message+=text;
}
int Com_sprintf(char *dest,size_t size,const char *format,...) {
    va_list args;va_start(args,format);int count=std::vsnprintf(dest,size,format,args);va_end(args);
    return count>=int(size)?-1:count;
}
int readFile(const char *name,void **out) {
    ++readCount;path=name;*out=buffer;return length;
}
void freeFile(void *p) { assert(p==buffer);++freeCount; }
struct { int (*FS_ReadFile)(const char*,void**);void (*FS_FreeFile)(void*); } ri={readFile,freeFile};
void Image_LoadFromData(GfxImage *image,const GfxImageFileHeader *header,const byte *data) {
    assert((const byte*)header==buffer && data==buffer+sizeof(GfxImageFileHeader));
    assert(image->noPicmip==Bool((header->flags&3)!=0));++loadCount;
}
'''
program += source[start:end]
reload_source = (packet / 'src/gfx_d3d/r_image.cpp').read_text()
reload_start = reload_source.index('void Image_Reload(')
reload_end = reload_source.index('\nIDirect3DSurface9', reload_start)
program += r'''
int releaseCount;
void Image_Release(GfxImage *) { ++releaseCount; }
enum { ERR_DROP=1 };
void R_Error(int code,const char *format,...) {
    assert(code==ERR_DROP);
    va_list args;va_start(args,format);const char *name=va_arg(args,const char*);va_end(args);
    assert(std::strcmp(format,"failed to load image '%s'")==0 && std::strcmp(name,"fixture")==0);
    throw std::runtime_error("drop");
}
'''
program += reload_source[reload_start:reload_end]
program += r'''
void reset() {
    std::memset(buffer,0,sizeof(buffer));std::memcpy(buffer,"IWi",3);buffer[3]=5;
    readCount=freeCount=loadCount=0;message.clear();path.clear();length=sizeof(buffer);
}
int main() {
    for(int flag=0;flag<256;++flag) {
        reset();buffer[5]=byte(flag);GfxImage image={0,"fixture"};
        assert(Image_LoadFromFile(&image)==1);
        assert(image.noPicmip==Bool((flag&3)!=0));
        assert(path=="images/fixture.iwi" && readCount==1 && loadCount==1 && freeCount==1 && message.empty());
    }
    for(int version=0;version<256;++version)if(version!=5) {
        reset();buffer[3]=byte(version);buffer[5]=1;GfxImage image={0,"fixture"};
        assert(!Image_LoadFromFile(&image));
        assert(image.noPicmip && readCount==1 && !loadCount && freeCount==1);
        assert(message.find("is version "+std::to_string(version)+" but should be version 5")!=std::string::npos);
    }
    for(int index=0;index<3;++index)for(int tag=0;tag<256;++tag)if(tag!="IWi"[index]) {
        reset();buffer[index]=byte(tag);buffer[5]=2;GfxImage image={0,"fixture"};
        assert(!Image_LoadFromFile(&image) && image.noPicmip);
        assert(readCount==1 && freeCount==1 && !loadCount);
        assert(message=="^1ERROR: image 'images/fixture.iwi' is not an IW image\n");
    }
    for(int size:{-1,0}) {
        reset();length=size;GfxImage image={0,"fixture"};
        assert(!Image_LoadFromFile(&image) && !image.noPicmip && !loadCount);
        assert(readCount==1 && freeCount==(size==0));
        assert(message.find(size<0?"is missing":"has 0 length")!=std::string::npos);
    }
    for(int nameSize:{52,53,54,70}) {
        reset();std::string name(nameSize,'a');GfxImage image={0,name.c_str()};
        bool valid=nameSize+11<64;
        assert(bool(Image_LoadFromFile(&image))==valid);
        assert(readCount==int(valid) && loadCount==int(valid) && freeCount==int(valid));
        assert(valid?message.empty():message.find("too long")!=std::string::npos);
    }
    for(int size:{-1,0,128}) {
        reset();length=size;releaseCount=0;GfxImage image={0,"fixture"};
        bool dropped=false;
        try { Image_Reload(&image); }catch(const std::runtime_error&){dropped=true;}
        assert(releaseCount==1 && dropped==(size<=0));
        assert(readCount==1 && loadCount==(size>0));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_image_file_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual file/header validation, all tag/version/flag bytes, path limits and ownership')
