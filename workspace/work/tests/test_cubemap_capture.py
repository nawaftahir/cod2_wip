"""Actual capture/flip/software-gamma chain, without a graphics device."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
image = fragment('gfx_d3d/r_screenshot.cpp')
capture = image[image.index('static __declspec(noinline) void R_FlipCubemapShot('):
                image.index('// PINNED 100269c0;')]
end = image[image.index('void R_EndCubemapShot('):image.index('// PINNED 0x101903a8')]
init = fragment('gfx_d3d/r_init.cpp')
gamma = init[init.index('#pragma intrinsic(pow)'):init.index('\nGfxImage *Image_Register(')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdint>
#include <vector>
#include <initializer_list>
#define __declspec(x)
typedef unsigned char byte;
struct dvar_t { union { int integer;float value; } current; } overbright,gammaSetting;
const dvar_t *r_overbrightBits=&overbright,*r_gamma=&gammaSetting;
struct { unsigned short cubemapShotRes,cubemapShotPixelBorder; } dx;
struct { bool deviceSupportsGamma; } vidConfig;
struct GfxGammaRamp { unsigned short entries[256]; } observedGamma;
int mappings;
void RB_SetGammaRamp(const GfxGammaRamp *table) { ++mappings;observedGamma=*table; }
struct { byte *pixels[6]; } cubeShotGlob;
int rounds,allocated,readbacks,targets;bool readResult;
int I_fround(float value) { ++rounds;return int(std::nearbyint(double(value)+1.0/(1<<30))); }
std::vector<byte> storage;
void *allocate(int bytes) { ++allocated;storage.assign(bytes+16,0xcd);return storage.data()+8; }
struct { void *(*Z_MallocInternal)(int); } ri={allocate};
int R_GetFrontBufferData(int x,int y,int width,int height,int bpp,byte *out) {
    assert(x==dx.cubemapShotPixelBorder && y==x && width==dx.cubemapShotRes && height==width && bpp==4);
    assert(out==storage.data()+8);++readbacks;
    for(int i=0;i<width*height*4;++i)out[i]=byte(i*37+11);
    return readResult;
}
enum GfxRenderTargetId { R_RENDERTARGET_FRAME_BUFFER=0 };
void RB_SetRenderTarget(GfxRenderTargetId target) { assert(target==0 && readbacks==1);++targets; }
'''+gamma+capture+end+r'''
int main() {
    byte sentinel;
    gammaSetting.current.value=2.2f;
    for(int size:{0,1,2,3,7,8})for(int face=1;face<=6;++face)
    for(int bits:{-1,0,1,2})for(bool hardware:{false,true})for(bool success:{false,true}) {
        dx.cubemapShotRes=size;dx.cubemapShotPixelBorder=9;
        vidConfig.deviceSupportsGamma=hardware;overbright.current.integer=bits;readResult=success;
        for(byte *&p:cubeShotGlob.pixels)p=&sentinel;
        rounds=allocated=readbacks=targets=0;
        R_EndCubemapShot(face);
        assert(allocated==1 && readbacks==1 && targets==1);
        assert(rounds==((bits>0&&hardware)?256:0));
        for(int i=0;i<6;++i)assert(cubeShotGlob.pixels[i]==(i==face-1?storage.data()+8:&sentinel));
        for(int row=0;row<size;++row)for(int col=0;col<size;++col)for(int channel=0;channel<4;++channel) {
            byte expected=byte(((size-1-row)*size*4+col*4+channel)*37+11);
            if(bits>0&&hardware) {
                float value=float(std::pow(expected*(1.0f/255.0f),1.0f/2.2f)*65535.0f);
                int table=int(std::nearbyint(double(value)+1.0/(1<<30)));
                expected=byte(table*255/65535);
            }
            assert(storage[8+(row*size+col)*4+channel]==expected);
        }
        for(int i=0;i<8;++i)assert(storage[i]==0xcd && storage[8+size*size*4+i]==0xcd);
    }
    for(float setting:{0.5f,0.75f,1.0f,1.25f,2.0f,2.2f,3.0f}) {
        gammaSetting.current.value=setting;
        GfxGammaRamp table;R_BuildGammaTable(&table);
        assert(table.entries[0]==0 && table.entries[255]==65535);
        for(int i=1;i<256;++i)assert(table.entries[i]>=table.entries[i-1]);
        for(bool hardware:{false,true}) {
            vidConfig.deviceSupportsGamma=hardware;mappings=rounds=0;R_SetColorMappings();
            assert(mappings==hardware);
            if(hardware)assert(!memcmp(&table,&observedGamma,sizeof(table)));
            else assert(rounds==0);
        }
        for(int count:{-5,0,1,255,256}) {
            byte data[258];for(int i=0;i<258;++i)data[i]=byte(i);
            R_GammaCorrect(count,data+1);
            for(int i=0;i<258;++i)assert(data[i]==(i>=1&&i<=count?byte(table.entries[byte(i)]*255/65535):byte(i)));
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cubemap_capture_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 576 capture paths, six faces, flip/gamma after failed capture, 35 gamma buffers and canaries')
