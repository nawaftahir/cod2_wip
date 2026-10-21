"""Actual hardware gamma replication and swap-chain routing, without Direct3D."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('void RB_SetGammaRamp('):text.index('// PINNED 106d3194')]
header = (work / 'src/gfx_d3d/rb_backend.h').read_text()
start = header.index('struct GfxGammaRamp\n')
types = header[start:header.index('\n};', start)+3]
program = r'''
#include <cassert>
#include <cstdint>
#include <cstddef>
#include <initializer_list>
'''+types+r'''
struct D3DGAMMARAMP { uint16_t red[256],green[256],blue[256]; } observed;
static_assert(sizeof(GfxGammaRamp)==512 && sizeof(D3DGAMMARAMP)==1536,"gamma extents");
static_assert(offsetof(D3DGAMMARAMP,green)==512 && offsetof(D3DGAMMARAMP,blue)==1024,"gamma channels");
unsigned observedWindow,calls;
struct Device {
    void SetGammaRamp(unsigned window,unsigned flags,const D3DGAMMARAMP *ramp) {
        assert(flags==0);observedWindow=window;observed=*ramp;++calls;
    }
} device;
struct { Device *device;int targetWindowIndex; } dx;
'''+source+r'''
int main() {
    dx.device=&device;
    for(int window:{-1,0,1,8})for(unsigned seed:{0u,12345u,65535u})
    for(unsigned multiplier:{0u,1u,257u,65535u}) {
        GfxGammaRamp table;
        for(int i=0;i<256;++i)table.entries[i]=uint16_t(seed+multiplier*i);
        GfxGammaRamp saved=table;
        dx.targetWindowIndex=window;calls=0;RB_SetGammaRamp(&table);
        assert(calls==1 && observedWindow==unsigned(window) && dx.targetWindowIndex==window);
        for(int i=0;i<256;++i) {
            assert(table.entries[i]==saved.entries[i]);
            assert(observed.red[i]==saved.entries[i] && observed.green[i]==saved.entries[i] && observed.blue[i]==saved.entries[i]);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_gamma_ramp_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 48 actual hardware gamma ramps, all RGB entries, swap-chain indices and unmodified inputs')
