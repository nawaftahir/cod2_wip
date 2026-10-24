"""Actual cubemap TGA writer: channels, face rays, alpha routing and cleanup."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_screenshot.cpp')
source = text[text.index('const float cubemapShotAxis[7][3][3]'):
              text.index('static void R_GetDirForCubemapPixel(')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <vector>
#include <initializer_list>
#define __declspec(x)
typedef unsigned char byte;
typedef float vec3_t[3];
struct { unsigned short cubemapShotRes; } dx;
struct { byte *pixels[6]; } cubeShotGlob;
std::vector<byte> memory,written,facePixels;
std::vector<void*> freed;
std::vector<float> cosines;
std::vector<int> events;
const char *expectedName;float expectedN0,expectedN1;bool writeSucceeds;
void VectorScale(const float *in,float scale,float *out) { for(int i=0;i<3;++i)out[i]=scale*in[i]; }
void VectorMA(const float *a,float scale,const float *b,float *out) { for(int i=0;i<3;++i)out[i]=a[i]+scale*b[i]; }
float Vec3Normalize(float *v) { float length=std::sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);for(int i=0;i<3;++i)v[i]/=length;return length; }
float FresnelTerm(float n0,float n1,float c) {
    assert(n0==expectedN0 && n1==expectedN1);cosines.push_back(c);
    return .25f+std::fabs(c)*.5f;
}
int I_fround(float v) { return int(std::floor(double(v)+.5)); }
void *allocate(int bytes) { events.push_back(1);memory.assign(bytes+16,0xa5);return memory.data()+8; }
int writeFile(const char *name,const void *data,int bytes) {
    assert(name==expectedName && data==memory.data()+8 && bytes+16==memory.size());events.push_back(2);
    written.assign((const byte*)data,(const byte*)data+bytes);return writeSucceeds?bytes:0;
}
void release(void *p) { events.push_back(3);freed.push_back(p); }
struct { void *(*Z_MallocInternal)(int);int (*FS_WriteFile)(const char*,const void*,int);void (*Z_FreeInternal)(void*); } ri={allocate,writeFile,release};
'''+source+r'''
int main() {
    for(int size:{0,1,2,3,8,257})for(int face=1;face<=6;++face)
    for(bool success:{false,true})for(float n0:{1.0f,1.5f}) {
        dx.cubemapShotRes=size;expectedName="cubemap-test.tga";expectedN0=n0;expectedN1=1.333f;writeSucceeds=success;
        facePixels.resize(size*size*4+1);
        for(unsigned i=0;i<facePixels.size();++i)facePixels[i]=byte(i*19+face);
        byte sentinel;
        for(byte *&p:cubeShotGlob.pixels)p=&sentinel;
        cubeShotGlob.pixels[face-1]=facePixels.data();
        freed.clear();cosines.clear();events.clear();
        R_SaveCubemapShot(expectedName,face,expectedN0,expectedN1);
        assert(events==std::vector<int>({1,2,3,3}));
        assert(freed.size()==2 && freed[0]==memory.data()+8 && freed[1]==facePixels.data());
        assert(cubeShotGlob.pixels[face-1]==facePixels.data());
        for(int f=0;f<6;++f)if(f!=face-1)assert(cubeShotGlob.pixels[f]==&sentinel);
        assert(written.size()==18+size*size*4 && cosines.size()==size*size);
        for(int i=0;i<18;++i) {
            int expected=i==2?2:(i==12||i==14)?(size&255):(i==13||i==15)?(size>>8):i==16?32:0;
            assert(written[i]==expected);
        }
        for(int row=0;row<size;++row)for(int col=0;col<size;++col) {
            int index=row*size+col;
            for(int channel=0;channel<3;++channel)assert(written[18+index*4+channel]==facePixels[index*4+channel]);
            double h=size*.5,u=col-h+.5,v=row-h+.5;
            double z=face==1?h:face==2?-h:v;
            double cosine=z/std::sqrt(h*h+u*u+v*v);
            assert(std::fabs(cosines[index]-cosine)<.000001);
            float alpha=(.25f+std::fabs(cosines[index])*.5f)*255.f;
            assert(written[18+index*4+3]==byte(std::floor(double(alpha)+.5)));
        }
        for(int i=0;i<8;++i)assert(memory[i]==0xa5 && memory[memory.size()-1-i]==0xa5);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cubemap_save_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 144 actual TGA saves, 257-pixel headers, BGRA/alpha rays, six faces, failed writes, both frees and retained pointers')
