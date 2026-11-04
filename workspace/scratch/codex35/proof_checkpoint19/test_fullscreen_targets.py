"""Actual PC render-target initializer against the binary-pinned allocation sequence."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parent / 'src/gfx_d3d/r_rendertarget.cpp').read_text()

def body(name):
    start = source.index(name + '(')
    start = source.rfind('\n', 0, start) + 1
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

program = r'''
#include <cassert>
#include <algorithm>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <vector>
typedef int D3DFORMAT;
#define __forceinline inline
enum { D3DFMT_A8R8G8B8=21,D3DFMT_R5G6B5=23,D3DFMT_A1R5G5B5=25,D3DFMT_A8B8G8R8=32,
 D3DFMT_D16_LOCKABLE=70,D3DFMT_D15S1=73,D3DFMT_D24S8=75,D3DFMT_D24X8=77,D3DFMT_D16=80,D3DFMT_R32F=114,
 D3DUSAGE_RENDERTARGET=1,D3DPOOL_DEFAULT=0,
 R_RENDERTARGET_FRAME_BUFFER=0,R_RENDERTARGET_RESOLVED_POST_SUN=1,R_RENDERTARGET_RESOLVED_SCENE=2,
 R_RENDERTARGET_DYNAMICSHADOWS=3,R_RENDERTARGET_SHADOWCOOKIE=4,R_RENDERTARGET_SHADOWCOOKIE_BLUR=5,
 R_RENDERTARGET_FLOAT_Z=6,R_RENDERTARGET_SAVED_SCREEN=7,R_RENDERTARGET_BLURRED_SCREEN=8,
 R_RENDERTARGET_GLOW_0=9,R_RENDERTARGET_GLOW_1=10,R_RENDERTARGET_PINGPONG_0=11,R_RENDERTARGET_PINGPONG_1=12 };
struct D3DSURFACE_DESC { D3DFORMAT Format; };
int actualFormat,descCalls,prints,depthCalls;
char *va(const char *fmt,int f) { static char buf[64];std::sprintf(buf,fmt,f);return buf; }
int I_max(int a,int b) { return std::max(a,b); }
struct Surface { int GetDesc(D3DSURFACE_DESC *d) { ++descCalls;d->Format=actualFormat;return -1; } } color,depth,untouched;
struct GfxImage { int id; } images[13];
struct GfxRenderTarget { GfxImage *image;Surface *colorSurface,*depthStencilSurface;int width,height; };
struct { int width,height; } vidConfig;
struct { GfxRenderTarget renderTargets[13];D3DFORMAT backBufferFormat; } dx;
struct dvar_t { union { int integer;bool enabled; } current; } renderer,feather;
const dvar_t *r_rendererInUse=&renderer,*r_zFeather=&feather;
struct { void (*Printf)(int,const char *,...); } ri;
void Printf(int channel,const char *fmt,...) {
 assert(!channel);
 assert(!std::strcmp(fmt,prints?"DirectX returned a frame buffer that is %s\n":"Requested frame buffer to be %s\n"));
 ++prints;
}
std::vector<int> allocations,events;
struct Allocation { int id,w,h,format; };
std::vector<Allocation> textures;
GfxImage *Image_AllocProg(int id,int category) {
 assert(category==6 && id>=0 && id<13);allocations.push_back(id);events.push_back(1);return &images[id];
}
void Image_Create2DTexture(GfxImage *im,int w,int h,int levels,int usage,int format,int pool) {
 assert(levels==1 && usage==1 && pool==0);textures.push_back({im->id,w,h,format});events.push_back(2);
}
void Image_TrackTexture(GfxImage *im,int flags,int format,int w,int h,int d) {
 auto a=textures.back();assert(flags==3 && d==1 && im->id==a.id && format==a.format);
 assert(w==(unsigned short)a.w && h==(unsigned short)a.h);events.push_back(3);
}
Surface *Image_GetSurface(GfxImage *im) { assert(im->id==textures.back().id);events.push_back(4);return &color; }
Surface *R_GetOrCreateDepthStencil() { ++depthCalls;events.push_back(5);return &depth; }
void Image_TrackFullscreenTexture(GfxImage *im,int picmip,int format) {
 auto a=textures.back();assert(im->id==a.id && format==a.format && (picmip==0 || picmip==2));events.push_back(6);
}
void R_InitFrameBuffer(GfxRenderTarget *rt) { assert(rt==&dx.renderTargets[0]);rt->colorSurface=&color; }
void R_InitShadowCookieRenderTarget(GfxRenderTarget *rt) { assert(rt==&dx.renderTargets[4]);allocations.push_back(1); }
void R_InitShadowCookieBlurRenderTarget(GfxRenderTarget *rt) { assert(rt==&dx.renderTargets[5]);allocations.push_back(2); }
'''
program += '\n'.join(body(n) for n in ['R_DescribeFormat', 'R_InitFullscreenRenderTargetImage', 'R_InitRenderTargets'])
program += r'''
int main() {
 const int formats[]={21,32,23,25,75,73,70,80,77};
 const char *names[]={"24-bit color with 8-bit alpha","24-bit color with 8-bit alpha","16-bit color",
  "15-bit color with 1-bit alpha","24-bit depth with 8-bit stencil","15-bit depth with 1-bit stencil",
  "16-bit depth without stencil","16-bit depth without stencil","24-bit depth without stencil"};
 for(int f=-8;f<256;++f) {
  const char *expected=nullptr;for(int i=0;i<9;++i)if(f==formats[i])expected=names[i];
  char unknown[64];std::sprintf(unknown,"unknown format 0x%08x",f);
  assert(!std::strcmp(R_DescribeFormat(f),expected?expected:unknown));
 }
 for(int i=0;i<13;++i)images[i].id=i;
 ri.Printf=Printf;
 for(int w:{-9,0,1,3,640,1920,65536,70000})for(int h:{-7,0,1,3,480,1080,65536,80000})
 for(int technology:{0,1,2})for(bool enabled:{false,true})for(int fmt:{21,23,25}) {
  vidConfig.width=w;vidConfig.height=h;renderer.current.integer=technology;feather.current.enabled=enabled;
  actualFormat=fmt;descCalls=prints=depthCalls=0;allocations.clear();textures.clear();events.clear();
  for(auto &rt:dx.renderTargets)rt={nullptr,nullptr,&untouched,0,0};
  R_InitRenderTargets();
  bool useFloat=technology!=2 && enabled;
  std::vector<int> order;if(useFloat)order.push_back(3);
  order.insert(order.end(),{0,9,10,11,1,2,4,5,6,7,8});
  assert(allocations==order && descCalls==1 && prints==2 && dx.backBufferFormat==fmt);
  assert(depthCalls==6+useFloat && textures.size()==static_cast<unsigned>(9+useFloat));
  std::vector<int> expectedEvents;
  for(auto a:textures) {
   bool quarter=a.id>=4 && a.id<=8;
   bool assign=a.id<9;
   int rtIndex=a.id==3?6:a.id==0?3:a.id==9?1:a.id==10?2:a.id==11?7:a.id+4;
   auto rt=dx.renderTargets[rtIndex];int shift=quarter?2:0;
   assert(a.w==std::max(1,w>>shift) && a.h==std::max(1,h>>shift));
   assert(a.format==(a.id==3?114:fmt) && rt.image==&images[a.id] && rt.colorSurface==&color);
   assert(rt.width==(unsigned short)a.w && rt.height==(unsigned short)a.h);
   assert(rt.depthStencilSurface==(assign?&depth:&untouched));
   expectedEvents.insert(expectedEvents.end(),{1,2,3,4});if(assign)expectedEvents.push_back(5);expectedEvents.push_back(6);
  }
  assert(events==expectedEvents);
  if(!useFloat)assert(!dx.renderTargets[6].image);
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_fullscreen_targets_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual PC format switch/fullscreen/init bodies, 1152 allocation cases, signed clamps/ushort sizes, z-feather/DX7, depth and call order')
