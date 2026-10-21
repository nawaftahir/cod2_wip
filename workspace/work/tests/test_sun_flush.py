"""Check actual sun reset stores and preserve every other per-view byte."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_sky.cpp').read_text()
start = text.index('void R_FlushSun()')
source = text[start:text.index('\n}', start) + 2]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstring>
struct SunFlareDynamic {
 float flareIntensity,currentBlind,currentGlare;int lastTime;unsigned char error;
 float cumulVisibility,lastVisibility,lastDot;int hitNum;void *sunQuery[2];unsigned char sunQueryIssued[2];
};
SunFlareDynamic sunFlareState[4];
static_assert(sizeof(SunFlareDynamic)==48&&offsetof(SunFlareDynamic,hitNum)==32,"PC layout");
''' + source + r'''
int main() {
 for(unsigned seed=1;seed<256;++seed) {
  unsigned char before[192],expected[192];
  for(unsigned i=0;i<192;++i)before[i]=(unsigned char)(seed+13*i);
  std::memcpy(expected,before,192);
  const unsigned offsets[]={4,8,0,32,28,12,24};
  for(unsigned view=0;view<4;++view)for(unsigned offset:offsets)
   std::memset(expected+48*view+offset,0,4);
  std::memcpy(sunFlareState,before,192);R_FlushSun();
  assert(!std::memcmp(sunFlareState,expected,192));
  R_FlushSun();assert(!std::memcmp(sunFlareState,expected,192));
 }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sun_flush_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 255 actual four-view sun resets; visibility/query/error/padding bytes preserved and reset idempotent')
