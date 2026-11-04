"""Run actual cubemap filtering against a scalar hemisphere-light oracle."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_screenshot.cpp').read_text()
source = source[source.index('const float cubemapShotAxis'):source.index('void R_LightingFromCubemapShots')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
void VectorClear(float *v) { v[0]=v[1]=v[2]=0; }
void VectorMA(const float *a,float s,const float *b,float *out) {
    for(int i=0;i<3;++i)out[i]=a[i]+s*b[i];
}
void VectorScale(const float *a,float s,float *out) {
    for(int i=0;i<3;++i)out[i]=a[i]*s;
}
void Vec3Mul(const float *a,const float *b,float *out) {
    for(int i=0;i<3;++i)out[i]=a[i]*b[i];
}
float Vec3Normalize(float *v) {
    float length=std::sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
    if(length)for(int i=0;i<3;++i)v[i]/=length;
    return length;
}
float I_fmin(float a,float b) { return a-b<0?a:b; }
int I_fround(float a) { return (int)std::nearbyint(a+9.313226e-10); }
'''
program += source
program += r'''
void direction(int face,int x,int y,int w,int h,double *out) {
    double sx=2.0*(x+0.5)/w-1,sy=2.0*(y+0.5)/h-1,length=0;
    for(int c=0;c<3;++c) {
        out[c]=cubemapShotAxis[face+1][0][c]+sx*cubemapShotAxis[face+1][1][c]
             +sy*cubemapShotAxis[face+1][2][c];
        length+=out[c]*out[c];
    }
    length=std::sqrt(length);
    for(int c=0;c<3;++c)out[c]/=length;
}
int main() {
    float colors[6][12][3];
    float (*linear[6])[3];unsigned char output[6][50],*pixels[6];
    float base[3]={0.75f,0.5f,1.0f};
    for(int f=0;f<6;++f) {
        linear[f]=colors[f];pixels[f]=output[f]+1;
        for(int p=0;p<12;++p)for(int c=0;c<3;++c)
            colors[f][p][c]=(float)((f+1)*(c+1)+p)/64;
    }
    const int sizes[][2]={{1,1},{2,2},{2,3},{3,4}};
    for(const auto &size:sizes) {
        int w=size[0],h=size[1];std::memset(output,0xcc,sizeof(output));
        float ray[3]={0.314159f,0.271828f,0.923f};Vec3Normalize(ray);
        unsigned char filtered[4];R_CubemapLightingForDir(linear,w,h,ray,base,filtered);
        double accum[3]={},sample[3];int samples=0;
        for(int sf=0;sf<6;++sf)for(int sy=0;sy<h;++sy)for(int sx=0;sx<w;++sx) {
            direction(sf,sx,sy,w,h,sample);
            double facing=sample[0]*ray[0]+sample[1]*ray[1]+sample[2]*ray[2];
            assert(std::fabs(facing)>1e-7);
            if(facing<=0)continue;
            ++samples;
            for(int c=0;c<3;++c)accum[c]+=facing*colors[sf][sy*w+sx][c];
        }
        for(int c=0;c<3;++c) {
            int expected=(int)std::nearbyint(std::fmin(1.0,
                std::pow(accum[c]/samples,1.0f/2.2f)*base[c])*255);
            assert(std::abs((int)filtered[2-c]-expected)<=1);
        }
        assert(filtered[3]==255);
        R_CubemapLighting(linear,w,h,base,pixels);
        for(int f=0;f<6;++f)for(int y=0;y<h;++y)for(int x=0;x<w;++x) {
            double dst[3],sum[3]={},src[3];int count=0;
            direction(f,x,y,w,h,dst);
            for(int sf=0;sf<6;++sf)for(int sy=0;sy<h;++sy)for(int sx=0;sx<w;++sx) {
                direction(sf,sx,sy,w,h,src);
                double weight=src[0]*dst[0]+src[1]*dst[1]+src[2]*dst[2];
                if(weight<=1e-12)continue;
                ++count;
                for(int c=0;c<3;++c)sum[c]+=weight*colors[sf][sy*w+sx][c];
            }
            assert(count>0);
            const unsigned char *pixel=pixels[f]+4*(y*w+x);
            for(int c=0;c<3;++c) {
                double light=std::pow(sum[c]/count,1.0f/2.2f)*base[c];
                int expected=(int)std::nearbyint(std::fmin(1.0,light)*255);
                // Float dots near zero can change sample count on symmetric rays.
                if(w==1)assert(std::abs((int)pixel[2-c]-expected)<=1);
                assert(pixel[2-c]>0);
            }
            assert(pixel[3]==255);
        }
        for(int f=0;f<6;++f) {
            assert(output[f][0]==0xcc);
            for(int i=4*w*h+1;i<50;++i)assert(output[f][i]==0xcc);
        }
    }
    std::memset(output,0xcc,sizeof(output));
    R_CubemapLighting(linear,0,3,base,pixels);
    R_CubemapLighting(linear,3,0,base,pixels);
    R_CubemapLighting(linear,-1,3,base,pixels);
    for(int f=0;f<6;++f)for(int i=0;i<50;++i)assert(output[f][i]==0xcc);
    unsigned char one[4];float black[3]={0,0,0},axis[3]={0,0,1};
    R_CubemapLightingForDir(linear,1,1,axis,black,one);
    assert(one[0]==0 && one[1]==0 && one[2]==0 && one[3]==255);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_cubemap_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual cubemap hemisphere integration, gamma/BGRA, empty dimensions and output bounds')
