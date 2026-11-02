"""Actual lookup generator: target NaN propagation,clamp endpoints and fixed last exponent."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/r_specularityimage.cpp').read_text();s='\n'.join(line for line in s.splitlines() if not line.startswith('#include'))
program=r'''
#include <cassert>
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <limits>
#undef M_PI
#define M_PI 3.14159265358979323846f
#define __forceinline inline
#define __min(a,b) ((a)<(b)?(a):(b))
#define __max(a,b) ((a)>(b)?(a):(b))
int nanExponents;
double lookup_pow(double x,double exponent){nanExponents+=std::isnan(exponent);return std::pow(x,exponent);}
#define pow lookup_pow
int I_fround(float x){return std::isfinite(x)?(int)std::nearbyint(double(x)+1.0/(1<<30)):0;}
'''+s+r'''
int main(){unsigned char low[8192],high[8192],nan[8192],other[8192];
 Image_BuildSpecularityMap(-2,low);Image_BuildSpecularityMap(2,high);
 nanExponents=0;Image_BuildSpecularityMap(std::numeric_limits<float>::quiet_NaN(),nan);
 assert(nanExponents==31*256);
 assert(!memcmp(high,nan,sizeof(high)));
 Image_BuildSpecularityMap(-100,other);assert(!memcmp(low,other,sizeof(low)));
 for(int p=0;p<32;++p){assert(high[p]==0&&high[255*32+p]==255);assert(low[p]==0&&low[255*32+p]==255);}
 for(int i=0;i<256;++i)assert(low[i*32+31]==high[i*32+31]);
 puts("PASS: actual8192-byte lookup,lower/upper saturation,target preserved NaN exponent,last exponent and endpoint rows");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_specular_lookup_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
