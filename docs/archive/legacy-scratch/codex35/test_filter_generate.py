"""Actual filter generators: scalar kernel oracle and pass/layout contracts."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
source = (packet / 'src/gfx_d3d/rb_filter_generate.cpp').read_text()
source = '\n'.join(line for line in source.splitlines()
                   if not line.startswith(('#include', 'typedef char')))
types = (gfx / 'target/src/opencod2/headers/common_types.h').read_text()
start = types.index('struct GfxImageFilterPass {')
filter_pass = types[start:types.index('};', start) + 2]
header = (packet / 'src/universal/com_math.h').read_text()
helpers = ''
for name, result in [('I_fsel', 'float'), ('I_fmin', 'float'),
                     ('I_fabs', 'float'), ('I_fround', 'int'), ('Vector4Set', 'void')]:
    start = header.index('TU_STATIC ' + result + ' ' + name + '(')
    helpers += header[start:header.index('\n}', start) + 2] + '\n'
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
typedef float vec4_t[4];
struct Material { int id; };
struct { Material *symmetricFilterMaterial[8]; } rgp;
#define TU_STATIC static inline
''' + filter_pass + helpers + source + r'''
bool near(float a, double b) { return std::fabs(a-b) < 2e-5 * (1+std::fabs(b)); }
int oracle(float radius,int src,int dst,int limit,double *offsets,double *weights) {
    double shift=(int(std::floor(float(src)/dst+0.5f)) & 1) ? 0 : 0.5;
    double sum=0;
    for(int i=0;i<limit;++i) {
        double a=2*i+shift,b=a+1;
        float exponent=-0.5f/(radius*radius);
        double w0=float(std::exp(float(a*a)*exponent));
        double w1=float(std::exp(float(b*b)*exponent));
        if(!i && !shift) w0*=0.5;
        weights[i]=w0+w1;
        offsets[i]=weights[i] ? (a*w0+b*w1)/(src*weights[i]) : (a+b)*0.5/src;
        sum+=weights[i];
    }
    if(sum<=0.001) { weights[0]=0.5;return 1; }
    int count=limit;
    for(int i=limit-1;i>=0;--i) {
        weights[i]*=0.5/sum;
        if(weights[i]<0.01) count=i+1;
    }
    return count;
}
int main() {
    Material materials[8];for(int i=0;i<8;++i)rgp.symmetricFilterMaterial[i]=&materials[i];
    const float radii[]={0.01f,0.2f,0.7f,1.389560461f,2.0f,6.497750282f,20.0f};
    const int sizes[][2]={{64,64},{64,32},{96,32},{65,64},{96,64}};
    for(float radius:radii)for(auto &size:sizes)for(int limit=0;limit<=8;++limit) {
        float offsets[10],weights[10];double expectedO[8],expectedW[8];
        for(int i=0;i<10;++i)offsets[i]=weights[i]=-123;
        int actual=RB_GaussianFilterPoints1D(radius,size[0],size[1],limit,offsets+1,weights+1);
        int expected=oracle(radius,size[0],size[1],limit,expectedO,expectedW);
        assert(actual==expected && actual>=1 && actual<=8);
        assert(offsets[0]==-123 && weights[0]==-123 && offsets[9]==-123 && weights[9]==-123);
        for(int i=0;i<limit;++i)assert(near(offsets[i+1],expectedO[i]) && near(weights[i+1],expectedW[i]));
        if(!limit)assert(offsets[1]==-123 && weights[1]==0.5f);
    }
    for(int axis=0;axis<2;++axis)for(float radius:radii) {
        int res[2]={64,96};GfxImageFilterPass p;
        std::memset(&p,0xcc,sizeof(p));
        RB_GenerateGaussianFilter1D(radius,res,axis,&p);
        assert(p.tapHalfCount>=1 && p.tapHalfCount<=8);
        assert(p.material==rgp.symmetricFilterMaterial[p.tapHalfCount-1]);
        assert(p.srcWidth==1 && p.srcHeight==1 && p.dstWidth==64 && p.dstHeight==96);
        double o[8],w[8];assert(p.tapHalfCount==oracle(radius,res[axis],res[axis],8,o,w));
        for(int i=0;i<8;++i) {
            assert(near(p.tapOffsetsAndWeights[i][axis],o[i]));
            assert(p.tapOffsetsAndWeights[i][1-axis]==0 && p.tapOffsetsAndWeights[i][2]==0);
            assert(near(p.tapOffsetsAndWeights[i][3],w[i]));
        }
    }
    for(float radius:radii) {
        GfxImageFilterPass p;RB_GenerateGaussianFilter2D(radius,96,64,32,32,&p);
        assert(p.tapHalfCount==8 && p.material==rgp.symmetricFilterMaterial[7]);
        assert(p.srcWidth==1 && p.srcHeight==1 && p.dstWidth==32 && p.dstHeight==32);
        double ox[8],oy[8],wx[8],wy[8];oracle(radius,96,32,2,ox,wx);oracle(radius,64,32,2,oy,wy);
        for(int y=0;y<2;++y)for(int x=0;x<2;++x)for(int sign=0;sign<2;++sign) {
            int i=4*y+2*x+sign;
            assert(near(p.tapOffsetsAndWeights[i][0],sign ? ox[x] : -ox[x]));
            assert(near(p.tapOffsetsAndWeights[i][1],oy[y]) && p.tapOffsetsAndWeights[i][2]==0);
            assert(near(p.tapOffsetsAndWeights[i][3],wx[x]*wy[y]));
        }
    }
    const float pairs[][2]={{0,0},{0.1f,0.2f},{1,1},{2,0},{0,2},{4,3},{20,20},{100,100}};
    for(auto &pair:pairs)for(int down=0;down<2;++down) {
        GfxImageFilterPass p[18];std::memset(p,0xcc,sizeof(p));
        int count=RB_GenerateGaussianFilterChain(pair[0],pair[1],128,64,
            down ? 64 : 128,down ? 32 : 64,p+1);
        assert(count>=0 && count<=16);
        if(pair[0]<0.3f && pair[1]<0.3f && !down)assert(count==0);
        if(pair[0]==1 && pair[1]==1 && !down)assert(count==1 && p[1].tapHalfCount==8);
        if(pair[0]==2 && pair[1]==0 && !down)assert(count==1 && p[1].tapOffsetsAndWeights[0][1]==0);
        if(pair[0]==0 && pair[1]==2 && !down)assert(count==1 && p[1].tapOffsetsAndWeights[0][0]==0);
        if(pair[0]==100 && pair[1]==100 && !down)assert(count==16);
        for(int i=0;i<count;++i) {
            assert(p[i+1].tapHalfCount>=1 && p[i+1].tapHalfCount<=8);
            assert(p[i+1].material==rgp.symmetricFilterMaterial[p[i+1].tapHalfCount-1]);
        }
        for(unsigned char c:*(unsigned char (*)[sizeof(GfxImageFilterPass)])&p[0])assert(c==0xcc);
        for(unsigned char c:*(unsigned char (*)[sizeof(GfxImageFilterPass)])&p[count+1])assert(c==0xcc);
    }
    GfxImageFilterPass p[16];float nan=std::numeric_limits<float>::quiet_NaN();
    assert(RB_GenerateGaussianFilterChain(nan,nan,64,64,64,64,p)==0);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_filter_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual Gaussian kernels vs scalar oracle, 1D/2D layout, downscale, axis selection, NaN and 16-pass bound')
