"""Actual water FFT against a direct, independently evaluated transform."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/universal/fft.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
program = r'''
#include <cassert>
#include <cmath>
#include <vector>
void FastSinCos(float v,float *s,float *c) { *s=std::sin(v);*c=std::cos(v); }
'''
program += source
program += r'''
int main() {
    int bits[256];complex_s trig[256];FFT_Init(bits,trig);
    for(int i=0;i<256;++i) {
        int reversed=0;for(int b=0;b<8;++b)reversed=(reversed<<1)|((i>>b)&1);
        assert(bits[i]==reversed);
        assert(std::fabs(trig[i].real-std::cos(i*0.024543693f))<1e-6f);
        assert(std::fabs(trig[i].imag-std::sin(i*0.024543693f))<1e-6f);
    }
    for(unsigned log=2;log<=8;++log)for(unsigned stride:{1u,3u,8u})for(int fixture=0;fixture<3;++fixture) {
        unsigned n=1u<<log;
        std::vector<complex_s> input(n),data(n*stride+4,complex_s{1234.5f,-5678.5f});
        for(unsigned i=0;i<n;++i) {
            if(fixture==0)input[i]={float(int(i*17%31)-15)/8,float(int(i*11%23)-11)/8};
            if(fixture==1)input[i]={float(i==1),0};
            if(fixture==2)input[i]={1,0};
            data[i*stride]=input[i];
        }
        FFT(data.data(),log,stride,bits,trig);
        for(unsigned k=0;k<n;++k) {
            double re=0,im=0;
            for(unsigned i=0;i<n;++i) {
                double angle=6.2831853071795864769*k*i/n,c=std::cos(angle),s=std::sin(angle);
                re+=input[i].real*c-input[i].imag*s;
                im+=input[i].real*s+input[i].imag*c;
            }
            if(k&1){re=-re;im=-im;}
            assert(std::fabs(data[k*stride].real-re)<0.0001*n);
            assert(std::fabs(data[k*stride].imag-im)<0.0001*n);
        }
        for(unsigned i=0;i<data.size();++i)if(i>=n*stride || i%stride)
            assert(data[i].real==1234.5f&&data[i].imag==-5678.5f);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_fft_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual FFT tables and 63 strided, Nyquist-centered transforms against direct sums')
