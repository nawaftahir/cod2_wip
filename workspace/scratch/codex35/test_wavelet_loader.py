"""Exercise actual loader allocation/cursor lifetime and shared upload selection."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
source = source[source.index('// PINNED 1.0 disk image header'):source.index('\nGfxImage *R_CreateWaterMap')]
upload = (packet / 'src/gfx_d3d/r_image_load_common.cpp').read_text()
st = upload.index('void Image_UploadData(')
upload = upload[st:upload.index('\n// Name UNCONFIRMED', st)]
types = (packet / 'src/gfx_d3d/r_image_wavelet_types.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <tuple>
#include <algorithm>
typedef unsigned char byte; typedef unsigned char Bool;
typedef int D3DFORMAT; typedef int D3DCUBEMAP_FACES;
struct Picmip { byte platform[2]; };
struct GfxImage { int mapType; Picmip picmip; };
struct { bool canMipCubemaps; } dx;
int expectedWidth,expectedHeight,expectedDepth,expectedFlags,setupCalls;
void Image_Setup(GfxImage *,int w,int h,int d,int flags,int usage,int format) {
    assert(w==expectedWidth && h==expectedHeight && d==expectedDepth && flags==expectedFlags);
    assert(!usage && format==21); ++setupCalls;
}
std::vector<byte*> allocated,freed;
std::vector<std::tuple<int,int,const byte*>> uploads;
byte *allocate(int size) { byte *p=(byte*)std::malloc(size);allocated.push_back(p);return p; }
void release(byte *p) { freed.push_back(p); }
struct { byte *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(byte*); } ri={allocate,release};
void Image_Upload2D(GfxImage *,int,int face,unsigned int mip,const byte *p) { uploads.emplace_back(face,mip,p); }
void Image_Upload3D(GfxImage *,int,unsigned int mip,const byte *p) { uploads.emplace_back(-1,mip,p); }
int I_max(int a,int b) { return a>b?a:b; }
'''
program += types+upload+source
program += r'''
std::vector<std::tuple<int,byte*,byte*>> decodeCalls;
void Wavelet_DecompressLevel(byte *src,byte *dst,WaveletDecode *decode) {
    assert(decode->width==expectedWidth && decode->height==expectedHeight);
    assert(decode->channels==3 && decode->bpp==4);
    assert(decode->data && !decode->dataInitialized && !decode->value && !decode->bit);
    decodeCalls.emplace_back(decode->mipLevel,src,dst);
    int size=std::max(1,decode->width>>decode->mipLevel)*std::max(1,decode->height>>decode->mipLevel)*decode->bpp;
    std::memset(dst,decode->mipLevel,size);
    ++decode->data;
}
int main() {
    expectedWidth=4;expectedHeight=8;expectedDepth=1;
    for(int map:{3,4,5})for(int picmip=0;picmip<4;++picmip)for(int single=0;single<2;++single)for(int mipCube=0;mipCube<2;++mipCube) {
        allocated.clear();freed.clear();uploads.clear();decodeCalls.clear();setupCalls=0;
        dx.canMipCubemaps=mipCube;expectedFlags=single?2:0;
        GfxImage image={map,{{byte(picmip),0}}};
        GfxImageFileHeader header={};header.flags=expectedFlags;
        header.dimensions[0]=4;header.dimensions[1]=8;header.dimensions[2]=1;
        byte stream[128]={};Image_LoadWavelet(&image,&header,stream,21,3);
        int faces=map==5?6:1,top=single?0:3;
        assert(setupCalls==1 && allocated.size()==unsigned(faces) && freed.size()==allocated.size());
        for(int i=0;i<faces;++i)assert(freed[i]==allocated[faces-i-1]);
        int call=0,upload=0;std::vector<byte*> prior(faces,0);
        for(int level=top;level>=picmip;--level) {
            int size=std::max(1,4>>level)*std::max(1,8>>level)*4;
            for(int face=0;face<faces;++face,++call) {
                auto record=decodeCalls[call];byte *dst=allocated[face]+128-size;
                assert(std::get<0>(record)==level && std::get<1>(record)==prior[face] && std::get<2>(record)==dst);
                prior[face]=dst;
                if(map!=5 || level==picmip || mipCube) {
                    auto u=uploads[upload++];assert(std::get<0>(u)==(map==4?-1:face));
                    assert(std::get<1>(u)==level-picmip && std::get<2>(u)==dst);
                }
            }
        }
        assert(call==int(decodeCalls.size()) && upload==int(uploads.size()));
        for(byte *p:allocated)std::free(p);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_wavelet_loader_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual wavelet loader mip/face cursors, shared cube-capability gate, upload routing and reverse frees')
