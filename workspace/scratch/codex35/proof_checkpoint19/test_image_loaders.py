"""Actual PC bitmap/DXT loaders and format dispatcher against a scalar oracle."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()

def body(name):
    start = source.index(name + '(')
    start = source.rfind('\n', 0, start) + 1
    brace = source.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

program = r'''
#include <cassert>
#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <vector>
typedef unsigned char byte;
typedef int D3DFORMAT;
typedef int D3DCUBEMAP_FACES;
enum { D3DFMT_A8R8G8B8=21,D3DFMT_X8R8G8B8=22,D3DFMT_A8L8=51,
       D3DFMT_L8=50,D3DFMT_A8=28,D3DFMT_DXT1=0x31545844,
       D3DFMT_DXT3=0x33545844,D3DFMT_DXT5=0x35545844 };
struct GfxImageFileHeader { byte tag[3],version,format,flags;short dimensions[3];int fileSizeForPicmip[4]; };
struct GfxImage { int mapType;struct { void *basemap; } texture;
    struct { byte platform[2]; } picmip;unsigned short width,height; };
int I_max(int a,int b) { return a>b?a:b; }
std::vector<byte*> allocated,freed;
void *allocate(int size) { auto p=(byte*)std::malloc(size);assert(p);allocated.push_back(p);return p; }
void release(void *p) { freed.push_back((byte*)p);std::free(p); }
struct { void *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void*); } ri={allocate,release};
int setupCount,expectedFormat,expectedFlags,baseWidth,baseHeight,uploadCount,expectedLevel,expectedFace;
bool cubeMips;
const byte *nextInput;
int inputBytes,expectedFamily,waveletCount;
void Image_Setup(GfxImage *im,int w,int h,int d,int flags,int usage,int format) {
    assert(w==baseWidth && h==baseHeight && d==1);
    assert(!usage && format==expectedFormat && flags==expectedFlags);++setupCount;
    im->width=I_max(1,w>>im->picmip.platform[0]);
    im->height=I_max(1,h>>im->picmip.platform[0]);
}
void Image_UploadData(GfxImage *im,int format,int face,unsigned mip,const byte *src) {
    assert(expectedFamily==1 || expectedFamily==3);
    assert(format==expectedFormat && face==expectedFace);
    assert(mip==unsigned(expectedLevel-im->picmip.platform[0]));
    int w=I_max(1,baseWidth>>expectedLevel),h=I_max(1,baseHeight>>expectedLevel);
    int size;
    if(expectedFamily==3) {
        size=((w+3)>>2)*((h+3)>>2)*inputBytes;assert(src==nextInput);
    } else {
        size=w*h*inputBytes;
        if(format==D3DFMT_X8R8G8B8) {
            assert(allocated.size()==1 && src==allocated[0]);
            for(int i=0;i<w*h;++i) {
                assert(std::equal(nextInput+3*i,nextInput+3*i+3,src+4*i));
                assert(src[4*i+3]==255);
            }
        } else assert(src==nextInput);
    }
    // Shared upload gate is separately tested; skipped uploads still consume input.
    if(im->mapType!=5 || mip==0 || cubeMips)++uploadCount;
    nextInput+=size;
    if(++expectedFace==(im->mapType==5?6:1)){expectedFace=0;--expectedLevel;}
}
void Image_LoadWavelet(GfxImage *im,const GfxImageFileHeader *header,const byte *data,int format,int bpp) {
    assert(expectedFamily==2 && header->format>=6 && header->format<=10);
    assert(data==nextInput && format==expectedFormat && bpp==inputBytes);
    assert(im->texture.basemap==0);++waveletCount;
}
'''
program += '\n'.join(body(n) for n in ['Image_CountMipmapsForFile', 'Image_LoadBitmap',
                                      'Image_LoadDxtc', 'Image_LoadFromData'])
program += r'''
int main() {
    const int formats[13]={21,22,51,50,28,21,22,51,50,28,0x31545844,0x33545844,0x35545844};
    const int sizes[13]={4,3,2,1,1,4,3,2,1,1,8,16,16};
    std::vector<byte> stream(65536);
    for(unsigned i=0;i<stream.size();++i)stream[i]=byte(i*23+17);
    for(int dim=0;dim<3;++dim)for(int fmt=1;fmt<=13;++fmt)for(int map:{3,4,5})
    for(int picmip=0;picmip<5;++picmip)for(int single=0;single<2;++single)for(int cube=0;cube<2;++cube) {
        baseWidth=dim==0?1:dim==1?4:5;baseHeight=dim==0?1:dim==1?8:9;
        expectedFlags=single?2:0;expectedFormat=formats[fmt-1];inputBytes=sizes[fmt-1];
        expectedFamily=fmt<=5?1:fmt<=10?2:3;cubeMips=cube;
        setupCount=uploadCount=waveletCount=0;allocated.clear();freed.clear();
        nextInput=stream.data();expectedFace=0;
        int top=0;
        if(!single)for(int d=1;d<baseWidth || d<baseHeight;d*=2)++top;
        expectedLevel=top;
        GfxImage image={};image.mapType=map;image.texture.basemap=(void*)1;
        image.picmip.platform[0]=byte(picmip);
        GfxImageFileHeader header={};header.format=byte(fmt);header.flags=byte(expectedFlags);
        header.dimensions[0]=short(baseWidth);header.dimensions[1]=short(baseHeight);header.dimensions[2]=1;
        Image_LoadFromData(&image,&header,stream.data());
        assert(image.texture.basemap==0);
        if(expectedFamily==2){assert(waveletCount==1 && setupCount==0);continue;}
        assert(setupCount==1 && !waveletCount && allocated.size()==freed.size());
        assert(allocated.size()==unsigned(fmt==2));
        int expectedUploads=0;
        const byte *cursor=stream.data();
        for(int level=top;level>=picmip;--level) {
            int w=I_max(1,baseWidth>>level),h=I_max(1,baseHeight>>level);
            int bytes=expectedFamily==1?w*h*inputBytes:((w+3)>>2)*((h+3)>>2)*inputBytes;
            cursor+=bytes*(map==5?6:1);
            if(map!=5 || level==picmip || cube)expectedUploads+=map==5?6:1;
        }
        assert(cursor==nextInput && uploadCount==expectedUploads);
    }
    for(int format:{0,14,255}) {
        GfxImage image={};image.texture.basemap=(void*)1;
        GfxImageFileHeader header={};header.format=byte(format);
        setupCount=waveletCount=0;Image_LoadFromData(&image,&header,stream.data());
        assert(!image.texture.basemap && !setupCount && !waveletCount);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_image_loaders_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual bitmap BGR/alpha, DXT block cursors, 13 format routes, mip/face skips and frees')
