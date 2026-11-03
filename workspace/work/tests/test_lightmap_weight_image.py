"""Actual lightmap-weight image generator: directions, packing and upload order."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
source = text[text.index('void Image_LoadLightmapWeights('):text.index('float FresnelTerm(')]
math = (work / 'src/universal/com_math.cpp').read_text()
start = math.index('vec_t Vec2Normalize(')
normalize = math[start:math.index('/*', start)]
header = (work / 'src/universal/com_math.h').read_text()
start = header.index('TU_STATIC float Vec2Multiply(')
length_sq = header[start:header.index('/*', start)].replace('TU_STATIC ', 'inline ')
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
typedef float vec_t;
typedef float vec2_t[2];
typedef float vec3_t[3];
float I_sqrt(float value) {return std::sqrt(value);}
struct GfxImage {unsigned guard;} image={0x12345678};
const int D3DFMT_A8R8G8B8=21,D3DCUBEMAP_FACE_POSITIVE_X=0;
int calls,setups,uploads,outside;
float rowY;
void R_GetLightmapWeightsForDir(const float *dir,float *weights) {
    assert(!setups&&!uploads&&calls<1024);
    float x=((calls%32)+0.5f)/16.0f-1.0f;
    if(calls%32==0)rowY=((calls/32)+0.5f)/16.0f-1.0f;
    float y=rowY;
    float r2=x*x+y*y,z=0;
    // Retail retains normalized Y for the next column.
    if(r2>1) {float length=std::sqrt(r2);x/=length;y/=length;rowY=y;++outside;}
    else z=std::sqrt(1-r2);
    assert(std::fabs(dir[0]-x)<0.000001f);
    assert(std::fabs(dir[1]-y)<0.000001f);
    assert(std::fabs(dir[2]-z)<0.000001f);
    assert(std::fabs(dir[0]*dir[0]+dir[1]*dir[1]+dir[2]*dir[2]-1)<0.000001f);
    for(int c=0;c<4;++c)weights[c]=float((calls*11+c*43)%256)/255.0f;
    ++calls;
}
int I_fround(float value) {return int(std::nearbyint(double(value)+1.0/(1<<30)));}
void Image_Setup(GfxImage *im,int w,int h,int depth,int flags,unsigned usage,int format) {
    assert(im==&image&&calls==1024&&!setups&&!uploads);
    assert(w==32&&h==32&&depth==1&&flags==3&&usage==0&&format==21);++setups;
}
void Image_UploadData(GfxImage *im,int format,int face,unsigned mip,const unsigned char *pixels) {
    assert(im==&image&&setups==1&&!uploads&&format==21&&face==0&&mip==0);
    for(int i=0;i<1024;++i)for(int c=0;c<4;++c)
        assert(pixels[i*4+c]==(i*11+c*43)%256);
    ++uploads;
}
'''+normalize+length_sq+source+r'''
int main() {
    Image_LoadLightmapWeights(&image);
    assert(calls==1024&&setups==1&&uploads==1&&outside>0&&outside<1024);
    assert(image.guard==0x12345678);
    puts("PASS: 1024 lightmap directions, disc normalization, 4096 packed bytes and setup/upload order");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_lightmap_weights_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
