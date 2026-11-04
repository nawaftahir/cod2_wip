"""Run the actual PC water helpers with independent scalar/pixel oracles."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
water = (packet / 'src/gfx_d3d/r_water.cpp').read_text()
water = water[water.index('// PINNED 1002c470'):]
image = (packet / 'src/gfx_d3d/r_image.cpp').read_text()
start = image.index('__declspec(noinline) void R_DownsampleMipMapBilinear')
end = image.index('{', start) + 1
depth = 1
while depth:
    depth += (image[end] == '{') - (image[end] == '}')
    end += 1
downsample = image[start:end]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <vector>
#include <algorithm>
#define __declspec(x)
typedef unsigned char byte;
typedef int D3DFORMAT;
typedef int D3DCUBEMAP_FACES;
enum { D3DCUBEMAP_FACE_POSITIVE_X=0,D3DFMT_A8R8G8B8=21,D3DFMT_L8=50 };
struct complex_s { float real,imag; };
typedef complex_s complex_t;
struct GfxImage { int mapType; };
struct water_t {
    struct { int frameCount; } writable;
    complex_t *H0;float *wTerm;int M,N;
};
struct WaterGlob { complex_t H[16384];byte pixels[65536]; } waterGlob;
struct { float sinTable[1024];complex_t fftTrigTable[256];int fftBitswap[256]; } rg;
struct { struct { float floatTime; } sceneDef; } backEnd;
struct GfxBackEndData { int frameCount; } payload;
GfxBackEndData *backEndData=&payload;
struct dvar_t { struct { int integer;bool enabled; } current; } drawWater,renderer;
const dvar_t *r_drawWater=&drawWater,*r_rendererInUse=&renderer;
int I_max(int a,int b) { return a>b?a:b; }
float I_sqrt(float v) { return std::sqrt(v); }
int I_fround(float v) { return int(std::nearbyint(double(v)+1.0/(1<<30))); }
struct FFTCall { complex_t *data;unsigned long log2,stride; };
std::vector<FFTCall> fftCalls;
void FFT(complex_t *data,unsigned long log2,unsigned long stride,int *bits,complex_t *trig) {
    assert(bits==rg.fftBitswap && trig==rg.fftTrigTable);
    fftCalls.push_back({data,log2,stride});
}
struct Upload { GfxImage *image;int format;unsigned mip; };
std::vector<Upload> uploads;
void Image_UploadData(GfxImage *image,int format,int face,unsigned mip,const byte *src) {
    assert(face==0 && src==waterGlob.pixels);
    uploads.push_back({image,format,mip});
}
'''
program += downsample + '\n' + water
program += r'''
int main() {
    for(int w:{1,2,4,8,16})for(int h:{1,2,4,8})for(int pitch:{1,2,3,4}) {
        std::vector<byte> original(w*h*pitch),actual,expected;
        for(unsigned i=0;i<original.size();++i)original[i]=byte(i*47+29);
        actual=original;expected=original;
        int dw=std::max(1,w/2),dh=std::max(1,h/2);
        if(w!=1 || h!=1)for(int y=0;y<dh;++y)for(int x=0;x<dw;++x)for(int c=0;c<pitch;++c) {
            unsigned sum=0,n=0;
            for(int oy=0;oy<(h>1?2:1);++oy)for(int ox=0;ox<(w>1?2:1);++ox) {
                sum+=original[((2*y+oy)*w+2*x+ox)*pitch+c];++n;
            }
            expected[(y*dw+x)*pitch+c]=byte(sum/n);
        }
        R_DownsampleMipMapBilinear(actual.data(),actual.size(),w,h,pitch,actual.data(),actual.size());
        assert(actual==expected);
        std::vector<byte> separate(original.size(),0x91);
        R_DownsampleMipMapBilinear(original.data(),original.size(),w,h,pitch,separate.data(),separate.size());
        if(w!=1 || h!=1)assert(std::equal(separate.begin(),separate.begin()+dw*dh*pitch,expected.begin()));
        else assert(separate[0]==0x91);
    }
    for(int i=0;i<1024;++i)rg.sinTable[i]=std::sin(i*6.283185307179586/1024);
    for(int m:{2,4,8,16})for(int n:{2,4,8}) {
        int size=m*n;
        std::vector<complex_t> h0(size),H(size),old;
        std::vector<float> omega(size);
        std::vector<byte> pixels(size*4+16,0x91),expected=pixels;
        water_t water={{-1},h0.data(),omega.data(),m,n};
        for(int i=0;i<size;++i) {
            h0[i]={float(i%7-3),float(i%5-2)};
            omega[i]=i%3?0.17f*(i+1):0.0f;
        }
        R_WaterHkt(H.data(),&water,1.75f);
        for(int i=0;i<size;++i) {
            int phase=I_fround(omega[i]*1.75f*162.97466f)&1023;
            assert(H[i].real==(omega[i]==0?0:h0[i].real*rg.sinTable[(phase+255)&1023]));
            assert(H[i].imag==(omega[i]==0?0:h0[i].imag*rg.sinTable[phase]));
        }
        fftCalls.clear();R_WaterFFT(H.data(),&water);assert(fftCalls.size()==unsigned(m+n));
        unsigned lm=0,ln=0;while((1u<<lm)!=unsigned(m))++lm;while((1u<<ln)!=unsigned(n))++ln;
        for(int i=0;i<n;++i)assert(fftCalls[i].data==H.data()+i*m && fftCalls[i].log2==lm && fftCalls[i].stride==1);
        for(int i=0;i<m;++i)assert(fftCalls[n+i].data==H.data()+i && fftCalls[n+i].log2==ln && fftCalls[n+i].stride==unsigned(m));
        old=H;R_WaterHeightMap(pixels.data(),H.data(),&water);
        for(int i=0;i<size;++i) {
            float v=std::sqrt(old[i].real*old[i].real+old[i].imag*old[i].imag)*(1.0f/size);
            assert(pixels[i]==byte(I_fround(std::min(v,1.0f)*255.0f)));
        }
        assert(std::all_of(pixels.begin()+size,pixels.end(),[](byte b){return b==0x91;}));
        std::fill(pixels.begin(),pixels.end(),0x91);
        std::vector<float> heights(size);
        for(int i=0;i<size;++i)heights[i]=std::sqrt(old[i].real*old[i].real+old[i].imag*old[i].imag);
        for(int i=0;i<size;++i) {
            float dx=heights[i]-heights[i?i-1:m-1];
            float dy=heights[i]-heights[(i+size-m)&(size-1)];
            float scale=127.5f/std::sqrt(dx*dx+dy*dy+float(size)*size);
            expected[4*i+2]=byte(I_fround(dx*scale+127.5f));
            expected[4*i+1]=byte(I_fround(dy*scale+127.5f));
            expected[4*i]=byte(I_fround(size*scale+127.5f));expected[4*i+3]=255;
        }
        R_WaterNormalMap(pixels.data(),H.data(),&water);assert(pixels==expected);
        for(int i=0;i<size;++i)assert(H[i].real==heights[i] && H[i].imag==old[i].imag);
        GfxImage image={3};payload.frameCount=5;uploads.clear();fftCalls.clear();
        drawWater.current.enabled=false;RB_UploadWaterTexture(&image,&water);
        assert(water.writable.frameCount==5 && uploads.empty() && fftCalls.empty());
        drawWater.current.enabled=true;RB_UploadWaterTexture(&image,&water);assert(uploads.empty());
        ++payload.frameCount;renderer.current.integer=2;RB_UploadWaterTexture(&image,&water);
        assert(uploads.size()==1 && uploads[0].format==21 && uploads[0].mip==0);
        ++payload.frameCount;renderer.current.integer=1;uploads.clear();RB_UploadWaterTexture(&image,&water);
        unsigned levels=std::max(lm,ln)+1;assert(uploads.size()==levels);
        for(unsigned i=0;i<levels;++i)assert(uploads[i].image==&image && uploads[i].format==50 && uploads[i].mip==i);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_water_render_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual water phase, FFT dispatch, normal/height pixels, in-place mips and frame gates')
