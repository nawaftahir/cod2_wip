"""Actual packed watercolor callback and its cubemap constructor."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import subprocess
import tempfile
import pefile
import struct

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(retail_anchor()))
assert struct.pack('<f',1.333) == struct.pack('<I',0x3faa9fbe)
text = (work / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
source = text[text.index('void Image_WaterColorForDirection('):text.index('void R_CreateOutdoorImage(GfxImage *image);')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <initializer_list>
typedef unsigned char byte;
struct GfxImage {} image;
typedef void (*CubemapPixelCallback)(const float*,int,byte*);
int normalizations,reflectCalls,cubes,expectedColor;
float normalZ,reflectance;
float Vec3NormalizeTo(const float *in,float *out) {
    float length=sqrtf(in[0]*in[0]+in[1]*in[1]+in[2]*in[2]);
    for(int axis=0;axis<3;++axis)out[axis]=length?in[axis]/length:0;
    normalZ=out[2];++normalizations;return length;
}
float FresnelTerm(float n0,float n1,float cosine){
    unsigned bits;memcpy(&bits,&n1,4);
    assert(n0==1&&bits==0x3faa9fbe&&fabs(cosine-normalZ)<1e-7);
    ++reflectCalls;return reflectance;
}
int I_fround(float value){return (int)nearbyint((double)value+1.0/(1<<30));}
void Image_WaterColorForDirection(const float*,int,byte*);
void Image_GenerateCubemapFunction(GfxImage *im,byte *pixels,int size,int color,CubemapPixelCallback callback) {
    assert(im==&image&&size==16&&color==expectedColor&&callback==Image_WaterColorForDirection);
    float direction[3]={3,4,-5};callback(direction,color,pixels);++cubes;
}
'''+source+r'''
int main() {
    int cases=0;
    for(int packed:{0,0x33404d,0x12345678})for(float alpha:{0.f,.5f,1.f})for(int axis=-1;axis<=1;++axis) {
        byte pixel[8];memset(pixel,0xa5,sizeof(pixel));float direction[3]={3,4,(float)axis};
        reflectance=alpha;normalizations=reflectCalls=0;Image_WaterColorForDirection(direction,packed,pixel+1);
        assert(normalizations==1&&reflectCalls==1&&pixel[0]==0xa5&&pixel[5]==0xa5);
        assert(pixel[1]==byte(packed)&&pixel[2]==byte(packed>>8)&&pixel[3]==byte(packed>>16));
        assert(pixel[4]==I_fround(alpha*255));++cases;
    }
    for(int b:{0,77,255})for(int g:{0,64,255})for(int r:{0,51,255}) {
        expectedColor=(int)((unsigned)b|((unsigned)g<<8)|((unsigned)r<<16)|0xff000000U);
        cubes=0;Image_GenerateWaterColor(&image,r,g,b);assert(cubes==1);++cases;
    }
    printf("PASS: %d actual watercolor routes, packed BGRA, normalized Fresnel input, alpha rounding and callback binding\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_water_color_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
