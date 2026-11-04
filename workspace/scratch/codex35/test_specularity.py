"""Test the actual lookup-map draft; host math is not x87 byte proof."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_specularityimage.cpp').read_text()
source = source[source.index('void Image_BuildSpecularityMap('):source.index('// Cubemap pixel callback')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
#define __min(a,b) ((a)<(b)?(a):(b))
#define __max(a,b) ((a)>(b)?(a):(b))
int I_fround(float x) {
    if(!std::isfinite(x)) return std::numeric_limits<int>::min();
    return (int)std::lrint((double)x+9.313225746154785e-10);
}
'''
program += source + r'''
int main() {
    unsigned char guarded[8194];
    const float shifts[]={-100.0f,-1.0f,-0.25f,0.0f,0.25f,1.0f,100.0f};
    for(float shift:shifts) {
        std::memset(guarded,0xcc,sizeof(guarded));
        Image_BuildSpecularityMap(shift,guarded+1);
        assert(guarded[0]==0xcc && guarded[8193]==0xcc);
        for(int power=0;power<32;++power) {
            double exponent=30.0;
            if(power!=31) {
                double fraction=power*(1.0f/30.0f)+shift;
                if(fraction<0.0) fraction=0.0;
                if(fraction>1.0) fraction=1.0;
                exponent=std::log((double)0.1f)/std::log(std::cos(
                    (180.0-fraction*175.0)*(3.14159265358979323846/720.0)));
            }
            for(int level=0;level<256;++level) {
                float value=(float)(std::pow((double)(level*(1.0f/255.0f)),exponent)*255.0);
                assert(guarded[1+level*32+power]==(unsigned char)I_fround(value));
                if(level>0) assert(guarded[1+level*32+power]>=guarded[1+(level-1)*32+power]);
            }
        }
    }
    Image_BuildSpecularityMap(std::numeric_limits<float>::quiet_NaN(),guarded+1);
    for(int power=0;power<31;++power) {
        assert(guarded[1+128*32+power]==0);
        assert(guarded[1+255*32+power]==255);
    }
    assert(guarded[1+255*32+31]==255);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_specularity_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual specularity map vs scalar oracle, clamp extremes, NaN, orientation and guards')
