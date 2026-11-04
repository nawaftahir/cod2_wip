"""Actual cookie-target helpers: call order, two accounting passes and COM lifetime."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_rendertarget.cpp').read_text()

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
#include <cstdarg>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef int HRESULT;
typedef int D3DFORMAT;
typedef int DWORD;
typedef int D3DPOOL;
enum errorParm_t { ERR_FATAL };
enum { R_RENDERTARGET_FRAME_BUFFER=0,R_RENDERTARGET_SHADOWCOOKIE=4,D3DFMT_D24S8=75,D3DFMT_A8R8G8B8=21,
 D3DMULTISAMPLE_NONE=0,FALSE=0,D3DUSAGE_RENDERTARGET=1,D3DPOOL_DEFAULT=0,D3DBACKBUFFER_TYPE_MONO=0 };
#define FAILED(hr) ((hr)<0)
struct IDirect3DSurface9 { int refs;void AddRef() { ++refs; } } existing,created,color;
struct GfxImage { int id; } images[13];
struct GfxRenderTarget { GfxImage *image;IDirect3DSurface9 *colorSurface,*depthStencilSurface;int width,height; };
struct { int width,height; } vidConfig;
int alwaysfails,logs;
const char *lastLog;
#define R_DX_CALL(x) do { ++logs;lastLog=#x "\n";x; } while(alwaysfails)
struct Device {
 int calls,expectedWidth,expectedHeight,expectedMsaa,expectedQuality,swapCalls,backCalls;
 HRESULT result,swapResult,backResult;
 HRESULT GetSwapChain(int index,void **out) { assert(!index);++swapCalls;*out=this;return swapResult; }
 HRESULT GetBackBuffer(int chain,int index,int type,IDirect3DSurface9 **out) {
  assert(!chain && !index && type==D3DBACKBUFFER_TYPE_MONO);++backCalls;*out=&color;
  if(backCalls==2)alwaysfails=0;
  return backResult;
 }
 HRESULT CreateDepthStencilSurface(int w,int h,int f,int ms,int quality,int discard,
  IDirect3DSurface9 **out,void *shared) {
  assert(w==expectedWidth && h==expectedHeight && f==75 && ms==expectedMsaa && quality==expectedQuality && !discard && !shared);
  ++calls;*out=&created;return result;
 }
} device;
struct { Device *device;GfxRenderTarget renderTargets[13];int multiSampleType,multiSampleQuality;
 IDirect3DSurface9 *singleSampleDepthStencilSurface;struct {void *swapChain;} windows[1]; } dx;
int extentCalls,errorWidth=128,errorHeight=128;
void R_GetFrameBufferExtent(int *w,int *h) { ++extentCalls;*w=640;*h=480; }
std::vector<int> calls;
int expectedId;
GfxImage *Image_AllocProg(int id,int category) {
 assert(id==expectedId && category==6);calls.push_back(1);return &images[id];
}
void Image_Create2DTexture(GfxImage *im,int w,int h,int m,DWORD u,int f,D3DPOOL p) {
 assert(im==&images[expectedId] && w==128 && h==128 && m==1 && u==1 && f==21 && p==0);
 calls.push_back(2);
}
void Image_TrackTexture(GfxImage *im,int flags,int f,int w,int h,int d) {
 assert(im==&images[expectedId] && flags==3 && f==21 && w==128 && h==128 && d==1);
 calls.push_back(3);
}
IDirect3DSurface9 *Image_GetSurface(GfxImage *im) {
 assert(im==&images[expectedId]);calls.push_back(4);return &color;
}
const char *DXGetErrorDescription9(int hr) { assert(hr==-1);return "device failure"; }
void Com_Error(errorParm_t code,const char *fmt,...) {
 assert(code==ERR_FATAL);
 va_list ap;va_start(ap,fmt);
 if(!std::strcmp(fmt,"Couldn't create a %i x %i depth-stencil surface: %s\n")) {
  assert(va_arg(ap,int)==errorWidth && va_arg(ap,int)==errorHeight);
 } else assert(!std::strcmp(fmt,"Couldn't get an interface to the swap chain: %s\n"));
 assert(!std::strcmp(va_arg(ap,const char*),"device failure"));va_end(ap);throw 7;
}
'''
program += '\n'.join(body(n) for n in ['R_InitFrameBuffer', 'R_GetOrCreateDepthStencil', 'R_CreateSmallDepthStencil', 'R_InitCookieRenderTarget',
    'R_InitShadowCookieRenderTarget', 'R_InitShadowCookieBlurRenderTarget'])
program += r'''
int main() {
 dx.device=&device;device.expectedWidth=device.expectedHeight=128;
 for(int id:{1,2})for(bool reuse:{false,true}) {
  GfxRenderTarget target={};expectedId=id;calls.clear();device.calls=0;device.result=0;existing.refs=3;
  dx.renderTargets[4].depthStencilSurface=reuse?&existing:nullptr;
  if(id==1)R_InitShadowCookieRenderTarget(&target);else R_InitShadowCookieBlurRenderTarget(&target);
  assert(calls==std::vector<int>({1,2,3,4,3}));
  assert(target.image==&images[id] && target.colorSurface==&color && target.width==128 && target.height==128);
  assert(target.depthStencilSurface==(reuse?&existing:&created));
  assert(device.calls==(reuse?0:1) && existing.refs==(reuse?4:3));
  assert(dx.renderTargets[4].depthStencilSurface==(reuse?&existing:nullptr));
 }
 dx.renderTargets[4].depthStencilSurface=nullptr;device.result=-1;
 bool fatal=false;try { R_CreateSmallDepthStencil(); }catch(int e){assert(e==7);fatal=true;}
 assert(fatal);
 errorWidth=640;errorHeight=480;
 for(bool swapFail:{false,true})for(bool depthFail:{false,true})for(bool retry:{false,true})for(int samples:{0,2}) {
  GfxRenderTarget target={};vidConfig.width=1920;vidConfig.height=1080;
  device.calls=device.swapCalls=device.backCalls=0;extentCalls=logs=0;lastLog=nullptr;
  device.expectedWidth=640;device.expectedHeight=480;device.expectedMsaa=samples;device.expectedQuality=3;
  dx.multiSampleType=samples;dx.multiSampleQuality=3;
  device.swapResult=swapFail?-1:0;device.result=depthFail?-1:0;device.backResult=-1;
  alwaysfails=retry?1:0;fatal=false;
  try { R_InitFrameBuffer(&target); }catch(int e){assert(e==7);fatal=true;}
  assert(fatal==(swapFail || depthFail));
  assert(target.width==1920 && target.height==1080 && device.swapCalls==1);
  if(swapFail){assert(!device.backCalls && !device.calls && !extentCalls && !logs);continue;}
  assert(device.backCalls==(retry?2:1) && logs==device.backCalls);
  assert(!std::strcmp(lastLog,"dx.device->GetBackBuffer( 0, 0, D3DBACKBUFFER_TYPE_MONO, &renderTarget->colorSurface )\n"));
  assert(device.calls==1 && extentCalls==1 && target.colorSurface==&color && target.depthStencilSurface==&created);
 }
 device.expectedMsaa=device.expectedQuality=0;
 for(bool cached:{false,true})for(bool mainDepth:{false,true})for(int samples:{0,2}) {
  dx.singleSampleDepthStencilSurface=cached?&existing:nullptr;
  dx.renderTargets[0].depthStencilSurface=mainDepth?&existing:nullptr;
  dx.multiSampleType=samples;device.result=0;device.calls=0;extentCalls=0;existing.refs=3;
  device.expectedWidth=640;device.expectedHeight=480;
  bool reused=cached || (!samples && mainDepth);
  auto result=R_GetOrCreateDepthStencil();
  assert(result==(reused?&existing:&created) && dx.singleSampleDepthStencilSurface==result);
  assert(device.calls==(reused?0:1) && extentCalls==(reused?0:1));
  assert(existing.refs==(reused?4:3));
 }
 dx.singleSampleDepthStencilSurface=nullptr;dx.multiSampleType=2;device.result=-1;
 errorWidth=640;errorHeight=480;fatal=false;
 try { R_GetOrCreateDepthStencil(); }catch(int e){assert(e==7);fatal=true;}
 assert(fatal);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_cookie_targets_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual framebuffer/cookie/shared depth bodies, logs/retries, cache/MSAA reuse/AddRef, creation and fatal failures')
