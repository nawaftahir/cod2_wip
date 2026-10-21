"""Check actual FFT source against a separate indexed retail-butterfly oracle."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/universal/fft.cpp').read_text()
source = text[text.index('void FFT(complex_s *data,'):]
program = r'''
#include <cassert>
#include <cmath>
#include <vector>
#include <initializer_list>
struct complex_s { float real,imag; };
'''+source+r'''
void reference(std::vector<complex_s> &data,int count,int stride,int *bits,complex_s *trig,int log) {
    for(int i=0;i<count;++i) {
        int j=bits[i]>>(8-log);
        if(j<i)std::swap(data[i*stride],data[j*stride]);
    }
    for(int block=0;block<count;block+=4) {
        complex_s a=data[block*stride],b=data[(block+1)*stride];
        complex_s c=data[(block+2)*stride],d=data[(block+3)*stride];
        float ar=a.real+b.real,cr=c.real+d.real;
        float ai=a.imag+b.imag,ci=c.imag+d.imag;
        data[block*stride]={ar+cr,ai+ci};
        data[(block+2)*stride]={ar-cr,ai-ci};
        float dr=b.real-a.real,di=d.imag-c.imag;
        float rr=d.real-c.real,ii=b.imag-a.imag;
        data[(block+1)*stride]={dr-di,rr+ii};
        data[(block+3)*stride]={dr+di,ii-rr};
    }
    for(int half=4,shift=5;half<count;half*=2,--shift) {
        for(int lane=0;lane<half;++lane) {
            const complex_s w=trig[lane<<shift];
            for(int i=lane;i<count;i+=2*half) {
                complex_s a=data[i*stride],b=data[(i+half)*stride];
                float real=w.real*b.real-w.imag*b.imag;
                float imag=w.imag*b.real+w.real*b.imag;
                data[(i+half)*stride]={a.real-real,a.imag-imag};
                data[i*stride]={a.real+real,a.imag+imag};
            }
        }
    }
}
int main() {
    int bits[256];complex_s trig[256];
    for(int i=0;i<256;++i) {
        bits[i]=0;for(int bit=0;bit<8;++bit)bits[i]|=((i>>bit)&1)<<(7-bit);
        trig[i]={float(cos(i*6.283185307179586/256)),float(sin(i*6.283185307179586/256))};
    }
    int cases=0;
    for(int log=2;log<=8;++log)for(int stride:{1,2,5})for(int pattern=0;pattern<8;++pattern) {
        int count=1<<log;
        std::vector<complex_s> actual((count+1)*stride,{12345,-6789});
        for(int i=0;i<count;++i)actual[i*stride]={float((i*17+pattern)%31-15)/8,float((i*7+pattern)%23-11)/16};
        auto expected=actual;
        reference(expected,count,stride,bits,trig,log);
        FFT(actual.data(),log,stride,bits,trig);
        for(unsigned i=0;i<actual.size();++i) {
            assert(fabs(actual[i].real-expected[i].real)<0.001f);
            assert(fabs(actual[i].imag-expected[i].imag)<0.001f);
        }
        ++cases;
    }
    assert(cases==168);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_fft_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS:168 actual FFT cases,4..256 samples,three strides and untouched gaps')
