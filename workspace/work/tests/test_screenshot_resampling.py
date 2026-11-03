"""Compare actual pixel filters with independent area and center sampling."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_screenshot.cpp').read_text()
source = text[text.index('void R_DownsamplePixelData('):text.index('void R_ResampleImage(')]
program = r'''
#include <algorithm>
#include <cassert>
#include <cmath>
#include <cstdio>
#include <vector>
typedef unsigned char byte;
int I_fround(float x) { return int(std::nearbyint(double(x)+1.0/(1<<30))); }
''' + source + r'''
int main() {
    int cases=0;
    for(int old=1;old<=12;++old) for(int size=1;size<=20;++size)
    for(int stride=1;stride<=4;++stride) for(int bpp=3;bpp<=4;++bpp) {
        int step=stride*bpp;
        std::vector<byte> input((old+2)*step,0xa7), output((size+2)*step,0xcd);
        for(int j=0;j<old;++j) for(int c=0;c<3;++c)
            input[j*step+c]=byte((j*37+c*61+old*7)%256);
        auto original=input;
        if(size<old) R_DownsamplePixelData(old,size,stride,bpp,input.data(),output.data());
        else R_UpsamplePixelData(old,size,stride,bpp,input.data(),output.data());
        for(int j=0;j<size;++j) for(int c=0;c<step;++c) {
            if(c>=3) {assert(output[j*step+c]==0xcd);continue;}
            int expected;
            if(size<old) {
                int total=0;
                for(int k=0;k<old;++k) {
                    int overlap=std::max(0,std::min((j+1)*old,(k+1)*size)-std::max(j*old,k*size));
                    total+=overlap*original[k*step+c];
                }
                expected=I_fround((1.0f/old)*total);
            } else {
                int position=(2*j+1)*old-size;
                if(position<0) expected=original[c];
                else {
                    int lower=position/(2*size), weight=position%(2*size);
                    int upper=std::min(lower+1,old-1);
                    expected=I_fround((0.5f/size)*((2*size-weight)*original[lower*step+c]+weight*original[upper*step+c]));
                }
            }
            assert(output[j*step+c]==expected);
        }
        for(int j=size*step;j<int(output.size());++j) assert(output[j]==0xcd);
        for(int j=0;j<old*step;++j) assert(input[j]==original[j]);
        ++cases;
    }
    printf("PASS: %d actual RGB filters versus independent area/center sampling; strides, alpha and guards\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_pixel_filters_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
