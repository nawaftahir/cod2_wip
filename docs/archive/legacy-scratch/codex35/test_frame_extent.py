"""Actual framebuffer/desktop extents, Win32 query order and fullscreen aliasing."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_init.cpp').read_text()
start = source.index('static void R_GetDesktopExtent(')
end = source.index('// PINNED PC 1.0 sizes:', start)
program = r'''
#include <cassert>
#include <vector>
#include <initializer_list>
struct { int width,height,isFullscreen; } vidConfig;
int vw,vh,sw,sh;
std::vector<int> queries;
int GetSystemMetrics(int index) {
 queries.push_back(index);switch(index){case 78:return vw;case 79:return vh;case 0:return sw;case 1:return sh;default:assert(false);return 0;}
}
int I_max(int x,int y) { return x-y>=0?x:y; }
'''
program += source[start:end]
program += r'''
int main() {
 for(int w:{0,1,640,1920})for(int h:{0,1,480,1080})
 for(int dw:{0,1,640,3840})for(int dh:{0,1,480,2160})for(bool fullscreen:{false,true}) {
  vidConfig.width=320;vidConfig.height=240;vidConfig.isFullscreen=fullscreen;
  vw=w;vh=h;sw=dw;sh=dh;queries.clear();int outW=-1,outH=-1;
  R_GetFrameBufferExtent(&outW,&outH);
  assert(outW==(fullscreen?320:(w>dw?w:dw)) && outH==(fullscreen?240:(h>dh?h:dh)));
  assert(queries==(fullscreen?std::vector<int>{}:std::vector<int>{78,79,0,1}));
 }
 vidConfig.width=1920;vidConfig.height=1080;vidConfig.isFullscreen=1;
 // Primary caches both dimensions before either output store.
 R_GetFrameBufferExtent(&vidConfig.height,&vidConfig.width);
 assert(vidConfig.width==1080 && vidConfig.height==1920);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_frame_extent_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual desktop/fullscreen extents, Win32 query order, zero sizes and aliased outputs')
