"""Execute the actual render-target transition source with a recording device."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parent.parent / 'src' / 'gfx_d3d/rb_state.cpp').read_text()
start = source.index('static const GfxViewportBehavior s_viewportBehaviorForRenderTarget')
end = source.index('// name unconfirmed: tail of the Dx7', start)
program = r'''
#include <cassert>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <vector>
enum GfxRenderTargetId { TARGET_ZERO, TARGET_NONE=14 };
enum GfxViewportBehavior { GFX_USE_VIEWPORT_FOR_VIEW, GFX_USE_VIEWPORT_FULL };
struct Surface { int id; } colors[14],depths[14];
struct GfxImage { int id; } images[13];
struct Viewport { unsigned X,Y,Width,Height;float MinZ,MaxZ; };
struct Target { GfxImage *image;Surface *colorSurface,*depthStencilSurface;int width,height; };
struct { GfxRenderTargetId renderTargetId;Surface *renderTargetSurface,*depthStencilSurface;
 int renderTargetWidth,renderTargetHeight;GfxViewportBehavior viewportBehavior;Viewport viewport; } dxState;
std::vector<int> events;
int unbound,updated;
GfxImage *expectedImage;
Surface *expectedColor,*expectedDepth;
struct Device {
 void SetRenderTarget(int index,Surface *surface) {
  assert(index==0&&surface==expectedColor);events.push_back(0);
 }
 void SetDepthStencilSurface(Surface *surface) {
  assert(surface==expectedDepth);events.push_back(1);
 }
} device;
struct { Device *device;Target renderTargets[13]; } dx={&device,{}};
struct { struct { int integer; } current; } logging;
const decltype(logging) *r_logFile=&logging;
int alwaysfails;
#define R_DX_CALL(call) do { call; } while(alwaysfails)
const char *va(const char *format,...) {
 static char text[256];va_list args;va_start(args,format);
 std::vsnprintf(text,sizeof(text),format,args);va_end(args);return text;
}
void RB_LogPrint(const char *text) {
 assert(std::strstr(text,"========== RB_SetRenderTarget( "));events.push_back(3);
}
void RB_UnbindImage(GfxImage *image) {
 assert(image==expectedImage);++unbound;events.push_back(-1);
}
void RB_UpdateViewportConstants() { ++updated;events.push_back(2); }
'''+source[start:end]+r'''
int main() {
 const int policies[13]={0,1,1,0,0,1,0,1,1,1,1,1,1};
 int cases=0;
 for(int old=0;old<=14;++old)for(int next=0;next<13;++next)for(int mode=0;mode<16;++mode) {
  Target &target=dx.renderTargets[next];
  target.image=mode&1?&images[next]:0;
  target.colorSurface=&colors[next];target.depthStencilSurface=next%3?&depths[next]:0;
  target.width=128+next*17;target.height=64+next*11;
  expectedImage=target.image;expectedColor=target.colorSurface;expectedDepth=target.depthStencilSurface;
  dxState.renderTargetId=(GfxRenderTargetId)old;
  dxState.renderTargetSurface=mode&2?target.colorSurface:&colors[13];
  dxState.depthStencilSurface=mode&4?target.depthStencilSurface:&depths[13];
  dxState.renderTargetWidth=765;dxState.renderTargetHeight=432;
  dxState.viewportBehavior=GFX_USE_VIEWPORT_FULL;
  dxState.viewport={7,8,9,10,.25f,.75f};
  logging.current.integer=mode&8;unbound=updated=0;events.clear();
  RB_SetRenderTarget((GfxRenderTargetId)next);++cases;
  if(old==next) {
   assert(events.empty()&&!unbound&&!updated);
   assert(dxState.renderTargetWidth==765&&dxState.viewport.X==7);
   continue;
  }
  std::vector<int> expected;
  if(mode&8)expected.push_back(3);
  if(mode&1)expected.push_back(-1);
  if(!(mode&2))expected.push_back(0);
  if(!(mode&4))expected.push_back(1);
  expected.push_back(2);
  assert(events==expected&&updated==1&&unbound==bool(mode&1));
  assert(dxState.renderTargetId==next&&dxState.renderTargetSurface==target.colorSurface);
  assert(dxState.depthStencilSurface==target.depthStencilSurface);
  if(mode&2) {
   assert(dxState.renderTargetWidth==765&&dxState.renderTargetHeight==432);
   assert(dxState.viewport.X==7&&dxState.viewport.MinZ==.25f);
  } else {
   assert(dxState.renderTargetWidth==target.width&&dxState.renderTargetHeight==target.height);
   assert(dxState.viewportBehavior==policies[next]);
   assert(dxState.viewport.X==0&&dxState.viewport.Y==0);
   assert(dxState.viewport.Width==(unsigned)target.width&&dxState.viewport.Height==(unsigned)target.height);
   assert(dxState.viewport.MinZ==0&&dxState.viewport.MaxZ==1);
  }
 }
 assert(cases==3120);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_render_target_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 3120 actual render-target transitions, cache skips, all13 policies, none sentinel, unbind/device order, null depth, logging and viewport reset')
