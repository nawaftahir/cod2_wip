"""Actual 512x512 outdoor trace image and temporary-buffer ownership."""
from pathlib import Path
import subprocess
import tempfile
import struct
import pefile

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert struct.unpack('<d',retail.get_data(0x19bd68,8))[0] == .5-1.0/(1<<30)
text = (work / 'src/gfx_d3d/r_outdoor.cpp').read_text()
source = text[text.index('void R_GenerateOutdoorLookup('):]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <cfenv>
#include <initializer_list>
typedef unsigned char byte;
enum D3DFORMAT {D3DFMT_L8=50};
enum D3DCUBEMAP_FACES {D3DCUBEMAP_FACE_POSITIVE_X};
struct GfxImage {} image;
struct {float scale[3],add[3];byte *pic;} outdoorGlob;
byte storage[262144+32],replacement[1];
int traces,setups,uploads,frees,mode;bool replace;
const float samples[]={-10,-.5f,0,.5f,.99999994f,1,1.5f,127.999992f,128,255,255.5f,256,300};
float R_OutdoorTexelToWorld(int axis,int texel){assert(axis==0||axis==1);return (float)texel;}
float R_OutdoorTraceHeight(float x,float y){assert(x==traces%512&&y==traces/512);return samples[traces++%13];}
int I_fround(float value){return (int)nearbyint((double)value+1.0/(1<<30));}
byte *Allocate(int size){assert(size==262144);return storage+16;}
void Free(void *pixels){assert(pixels==(replace?(void*)replacement:(void*)(storage+16)));++frees;}
struct {byte *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void*);} ri={Allocate,Free};
void Image_Setup(GfxImage *im,int width,int height,int depth,int flags,unsigned long usage,D3DFORMAT format) {
    assert(im==&image&&width==512&&height==512&&depth==1&&flags==3&&!usage&&format==50);
    assert(traces==262144&&outdoorGlob.pic==storage+16);++setups;
    if(replace)outdoorGlob.pic=replacement;
}
void Image_UploadData(GfxImage *im,D3DFORMAT format,D3DCUBEMAP_FACES face,unsigned mip,const byte *pixels) {
    assert(im==&image&&format==50&&face==0&&!mip&&pixels==storage+16&&setups==1);++uploads;
    for(int index=0;index<262144;++index) {
        int target=(int)nearbyint((double)samples[index%13]-(.5-1.0/(1<<30)));
        int expected=target<0?0:target>255?255:target;assert(pixels[index]==expected);
    }
}
'''+source+r'''
int main() {
    int cases=0;
    for(int rounding:{FE_TONEAREST,FE_DOWNWARD,FE_UPWARD,FE_TOWARDZERO})for(int change=0;change<2;++change) {
        assert(!fesetround(rounding));replace=change;traces=setups=uploads=frees=0;
        memset(storage,0xa5,sizeof(storage));outdoorGlob.scale[2]=1;outdoorGlob.add[2]=0;
        R_CreateOutdoorImage(&image);
        assert(traces==262144&&setups==1&&uploads==1&&frees==1);
        assert(outdoorGlob.pic==(replace?replacement:storage+16));
        for(int index=0;index<16;++index)assert(storage[index]==0xa5&&storage[index+262160]==0xa5);
        ++cases;
    }
    assert(!fesetround(FE_TONEAREST));
    printf("PASS: %d full outdoor maps, all pixels/trace coordinates, four rounding modes, bounds and saved-upload/current-free ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_outdoor_image_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
