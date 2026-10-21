"""Exercise actual plume expiry, swap removal, allocation and transfer."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_debug.cpp').read_text()
source = source[source.index('void R_TransferDebugGlobals('):]
program = r'''
#include <cassert>
#include <cstring>
#include <algorithm>
#include <vector>
struct GfxDebugPlume { float origin[3], color[4]; int score,startTime,duration; };
static_assert(sizeof(GfxDebugPlume)==40,"plume size");
struct DebugGlobals { GfxDebugPlume *plumes; int plumeCount,plumeLimit; } debugGlobals;
struct { struct { int time; } def; } scene;
GfxDebugPlume allocated[8]; int calls;
void *allocate(int bytes) { assert(bytes==sizeof(allocated)); ++calls; return allocated; }
struct { void *(*Z_MallocInternal)(int); } ri = {allocate};
'''+source+r'''
int main() {
  for(int count=0;count<=8;++count) for(int pattern=0;pattern<81;++pattern)
  for(int existing=0;existing<2;++existing) {
    GfxDebugPlume input[8], output[8];
    memset(input,0x5a,sizeof(input)); memset(output,0,sizeof(output));
    std::vector<int> expected;
    scene.def.time=100;
    for(int i=0;i<count;++i) {
      input[i].score=i; input[i].startTime=90+(pattern+i*7)%21;
      input[i].duration=(pattern*3+i*5)%13-2;
      int age=100-input[i].startTime;
      if(age>=0&&age<=input[i].duration) expected.push_back(i);
    }
    calls=0; debugGlobals={input,count,8};
    DebugGlobals dest={existing?output:nullptr,-1,8};
    R_TransferDebugGlobals(&dest);
    assert(calls==!existing && dest.plumeCount==(int)expected.size());
    assert(debugGlobals.plumeCount==dest.plumeCount);
    std::vector<int> actual;
    for(int i=0;i<dest.plumeCount;++i) {
      actual.push_back(dest.plumes[i].score);
      assert(!memcmp(&dest.plumes[i],&input[i],sizeof(input[i])));
    }
    std::sort(actual.begin(),actual.end()); assert(actual==expected);
  }
  DebugGlobals dest={nullptr,-1,8};
  debugGlobals={nullptr,0,8}; calls=0;
  R_TransferDebugGlobals(&dest);
  assert(!calls&&!dest.plumes&&dest.plumeCount==0);
  GfxDebugPlume input[3]={};
  for(int i=0;i<3;++i) { input[i].score=i;input[i].startTime=100;input[i].duration=0; }
  input[0].startTime=99;
  debugGlobals={input,3,8};
  R_TransferDebugGlobals(&dest);
  assert(dest.plumeCount==2&&dest.plumes[0].score==2&&dest.plumes[1].score==1);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_plumes_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 1,458 plume cases, swap ordering, expiry boundaries, allocation and null source')
