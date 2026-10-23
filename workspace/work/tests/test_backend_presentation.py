"""Actual presentation/error/gamma order and state publication across live callbacks."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// PINNED 10033b20:'):]
local = (work / 'src/gfx_d3d/r_local.h').read_text()
types = local[local.index('struct GfxRenderTarget\n'):local.index('extern DxGlobals dx;')]
video = local[local.index('struct vidConfig_t\n'):local.index('extern vidConfig_t vidConfig;')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef long HRESULT;
typedef unsigned UINT;typedef unsigned DWORD;typedef void *HWND;typedef void *HINSTANCE;
typedef int D3DFORMAT;typedef int D3DMULTISAMPLE_TYPE;
struct D3DDISPLAYMODE {unsigned width,height,hz,format;};struct GfxImage;
struct Ref {};
typedef Ref IDirect3DSurface9;typedef Ref IDirect3D9;typedef Ref IDirect3DDevice9;
typedef Ref IDirect3DIndexBuffer9;typedef Ref IDirect3DVertexBuffer9;typedef Ref IDirect3DQuery9;
struct Swap {HRESULT Present(void *,void *,void *,void *,DWORD);};typedef Swap IDirect3DSwapChain9;
const HRESULT D3DERR_DEVICELOST=(HRESULT)0x88760868u;enum {ERR_FATAL=0};
''' + types + video + r'''
DxGlobals dx;vidConfig_t vidConfig;Swap first,second;
struct {Bool projection2D;int untouched;} backEnd;
struct dvar_t {Bool modified;struct {Bool enabled;} current;} gamma,ignore;
const dvar_t *r_gamma=&gamma,*r_ignoreHwGamma=&ignore;
std::vector<int> events,expected;HRESULT result;int mutation,throwError;
r_ib_state_t other;
struct Failure {};
void RB_LogPrint(const char *message){assert(!strcmp(message,"***************** RB_SwapBuffers *****************\n\n\n"));events.push_back(0);if(mutation==1)dx.windows[0].swapChain=&second;}
HRESULT Swap::Present(void *src,void *dst,void *hwnd,void *dirty,DWORD flags){assert(!src&&!dst&&!hwnd&&!dirty&&!flags&&this==(mutation==1?&second:&first));events.push_back(1);return result;}
const char *DXGetErrorDescription9(HRESULT code){assert(code==result);events.push_back(2);return "present_error";}
void R_Error(int code,const char *format,...){assert(code==0&&!strcmp(format,"Direct3DDevice9::Present failed: %s\n"));va_list args;va_start(args,format);assert(!strcmp(va_arg(args,const char *),"present_error"));va_end(args);events.push_back(3);if(throwError)throw Failure();}
void R_FlushStaticModelCache(){assert(dx.deviceLost==1);events.push_back(4);if(mutation==2)dx.dynamicIndexBuffer=&other;}
void RB_UpdateLogging(){assert(!backEnd.projection2D&&!dx.dynamicIndexBuffer->used);events.push_back(5);if(mutation==3)gamma.modified=1;}
void Clear(const dvar_t *dvar){events.push_back(dvar==&gamma?6:7);const_cast<dvar_t *>(dvar)->modified=0;if(dvar==&ignore&&mutation==4){ignore.current.enabled=0;vidConfig.deviceSupportsGamma=1;}}
struct {void (*Dvar_ClearModified)(const dvar_t *);} ri={Clear};
void R_SetColorMappings(){assert(!ignore.current.enabled&&vidConfig.deviceSupportsGamma&&!gamma.modified&&!ignore.modified);events.push_back(8);}
''' + source + r'''
void setup() {
    memset(&dx,0,sizeof(dx));memset(&vidConfig,0,sizeof(vidConfig));memset(&gamma,0,sizeof(gamma));memset(&ignore,0,sizeof(ignore));
    dx.windows[0].swapChain=&first;dx.dynamicIndexBuffer=&dx.dynamicIndexBufferPool[0];
    dx.dynamicIndexBuffer->used=99;dx.dynamicIndexBuffer->total=100;other.used=21;other.total=22;
    backEnd.projection2D=1;backEnd.untouched=31337;events.clear();expected.clear();mutation=0;
}
int main() {
    int cases=0;
    for(HRESULT status:{(HRESULT)0,(HRESULT)1,D3DERR_DEVICELOST,(HRESULT)-1})for(throwError=0;throwError<2;++throwError)
    for(int changed=0;changed<4;++changed)for(int disabled=0;disabled<2;++disabled)for(int supported=0;supported<2;++supported)for(int lost=0;lost<2;++lost) {
        setup();result=status;dx.deviceLost=lost;gamma.modified=changed&1;ignore.modified=(changed>>1)&1;ignore.current.enabled=disabled;vidConfig.deviceSupportsGamma=supported;
        expected={0,1};bool fatal=status<0&&status!=D3DERR_DEVICELOST,threw=false;
        if(fatal){expected.push_back(2);expected.push_back(3);}
        if(!(fatal&&throwError)){if(status<0)expected.push_back(4);expected.push_back(5);if(changed){expected.push_back(6);expected.push_back(7);if(!disabled&&supported)expected.push_back(8);}}
        try{RB_EndFrame();}catch(Failure &){threw=true;}
        assert(threw==(fatal&&throwError)&&events==expected&&backEnd.untouched==31337&&dx.dynamicIndexBuffer->total==100);
        if(threw)assert(dx.deviceLost==lost&&dx.dynamicIndexBuffer->used==99&&backEnd.projection2D==1);
        else assert(dx.deviceLost==(status<0?1:lost)&&!dx.dynamicIndexBuffer->used&&!backEnd.projection2D);
        ++cases;
    }
    for(int mode=1;mode<=4;++mode) {
        setup();mutation=mode;throwError=0;result=mode==2?D3DERR_DEVICELOST:0;
        if(mode==3)vidConfig.deviceSupportsGamma=1;
        if(mode==4){gamma.modified=1;ignore.current.enabled=1;vidConfig.deviceSupportsGamma=0;}
        RB_EndFrame();assert(!backEnd.projection2D);
        if(mode==2)assert(dx.dynamicIndexBuffer==&other&&!other.used&&dx.dynamicIndexBufferPool[0].used==99);
        if(mode==3||mode==4)assert(events.back()==8);
        ++cases;
    }
    printf("PASS: %d actual backend frame routes; Present args, lost/fatal branches, live buffer/logging/gamma state, exact clear order and interrupted publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_frame_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
