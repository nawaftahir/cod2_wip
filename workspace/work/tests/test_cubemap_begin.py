"""Actual cubemap begin path: 16-bit dimensions, framebuffer selection and clears."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_screenshot.cpp')
source = text[text.index('static __declspec(noinline) void R_ClearForCubemapShot()'):
              text.index('// PINNED 10026a70:')]
header = (work / 'src/gfx_d3d/r_local.h').read_text()
start = header.index('#define R_DX_STRING(call)')
macros = header[start:header.index('\n\n', start)]
program = r'''
#include <cassert>
#include <cstdint>
#include <string>
#include <vector>
#include <initializer_list>
#define __declspec(x)
#define D3DCLEAR_TARGET 1
#define D3DCLEAR_ZBUFFER 2
#define D3DCLEAR_STENCIL 4
#define D3DCOLOR_ARGB(a,r,g,b) ((uint32_t(a)<<24)|(uint32_t(r)<<16)|(uint32_t(g)<<8)|uint32_t(b))
enum GfxRenderTargetId { R_RENDERTARGET_FRAME_BUFFER=0 };
int alwaysfails,remaining,clears;std::vector<std::string> events;
struct Device {
    void Clear(int count,const void *rect,unsigned flags,uint32_t color,float depth,unsigned stencil) {
        assert(!count && !rect && flags==7 && color==0xffff00ff && depth==1 && !stencil);
        events.push_back("clear");++clears;alwaysfails=--remaining;
    }
} device;
struct { unsigned short cubemapShotRes,cubemapShotPixelBorder;Device *device; } dx;
void RB_SetRenderTarget(GfxRenderTargetId id) { assert(id==0);events.push_back("target"); }
void RB_LogPrint(const char *text) { assert(std::string(text).find("dx.device->Clear(")==0);events.push_back("log"); }
'''+macros+'\n'+source+r'''
int main() {
    dx.device=&device;
    for(int size:{-1,0,1,255,65535,65536})for(int border:{-8,0,1,65535,65537})
    for(int repeats:{1,2,3}) {
        events.clear();clears=0;remaining=repeats;alwaysfails=0;
        R_BeginCubemapShot(size,border);
        assert(dx.cubemapShotRes==static_cast<unsigned short>(size));
        assert(dx.cubemapShotPixelBorder==static_cast<unsigned short>(border));
        assert(clears==repeats && events.size()==1+2*repeats && events[0]=="target");
        for(int n=0;n<repeats;++n)assert(events[1+2*n]=="log"&&events[2+2*n]=="clear");
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cubemap_begin_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 90 actual cubemap-begin cases, ushort narrowing, target/log/clear order and retries')
