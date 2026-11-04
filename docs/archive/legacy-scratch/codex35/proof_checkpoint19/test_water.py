#!/usr/bin/env python3
"""Check the actual water comparison, including the target's NaN behavior."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_water_load_obj.cpp').read_text()
source = source[source.index('qboolean R_WatersEquivalent'):source.index('void R_ShutdownLoadWater')]
program = r'''
#include <cassert>
#include <cmath>
#include <limits>
typedef int qboolean;
inline float I_fabs(float x) { return std::fabs(x); }
inline float I_sqrt(float x) { return std::sqrt(x); }
struct water_t { int M,N;float Lx,Lz,amplitude,gravity,windvel,winddir[2]; };
'''
math_header = (packet / 'src/universal/com_math.h').read_text()
program += 'typedef float vec2_t[2];\n#define TU_STATIC inline\n'
for helper in ('Dot2Product', 'Vec2Multiply'):
    start = math_header.index('TU_STATIC float ' + helper + '(')
    end = math_header.index('\n}', start) + 2
    program += math_header[start:end] + '\n'
program += source
program += r'''
int main() {
    water_t a={4,8,10,20,1,9.8f,2,{1,0}},b=a;
    assert(R_WatersEquivalent(&a,&b));
    b.M=8;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.Lx=11;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.amplitude+=0.002f;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.gravity+=0.2f;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.windvel+=0.2f;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.winddir[0]=0;b.winddir[1]=1;assert(!R_WatersEquivalent(&a,&b));b=a;
    b.winddir[0]=2;assert(R_WatersEquivalent(&a,&b));b=a;
    b.winddir[0]=std::numeric_limits<float>::quiet_NaN();
    assert(R_WatersEquivalent(&a,&b));
    b=a;b.Lx=std::numeric_limits<float>::quiet_NaN();assert(!R_WatersEquivalent(&a,&b));
    a.winddir[0]=0;b=a;assert(!R_WatersEquivalent(&a,&b));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_water_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: water sizes, tolerances, direction, zero vector, target NaN distinction')
