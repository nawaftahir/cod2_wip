"""Real reset/recovery order with shared PC owners and returning/throwing fatal callbacks."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_device.cpp')
source = text[text.index('// Role name; PINNED 10013690:'):]
local = (work / 'src/gfx_d3d/r_local.h').read_text()
types = local[local.index('struct GfxRenderTarget\n'):local.index('extern DxGlobals dx;')]
video = local[local.index('struct vidConfig_t\n'):local.index('extern vidConfig_t vidConfig;')]
window = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once','')
permanent = (work / 'src/gfx_d3d/r_permanent.h').read_text().replace('#pragma once','')
model = (work / 'src/gfx_d3d/r_model.cpp').read_text()
finish = model[model.index('void R_FinishLoadingModels()'):model.index('static void R_ReleaseModel(')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef long HRESULT;
typedef unsigned UINT;typedef unsigned DWORD;
typedef void *HWND;typedef void *HINSTANCE;
typedef int D3DFORMAT;typedef int D3DMULTISAMPLE_TYPE;
struct D3DDISPLAYMODE {unsigned width,height,hz,format;};
struct GfxImage;struct GfxWorld {int marker;};
struct D3DPRESENT_PARAMETERS {int snapshot[14];};
struct Device {HRESULT TestCooperativeLevel();HRESULT Reset(D3DPRESENT_PARAMETERS *);};
typedef Device IDirect3DDevice9;
struct Ref {};
typedef Ref IDirect3DSurface9;typedef Ref IDirect3DSwapChain9;typedef Ref IDirect3D9;
typedef Ref IDirect3DIndexBuffer9;typedef Ref IDirect3DVertexBuffer9;typedef Ref IDirect3DQuery9;
const HRESULT D3DERR_DEVICELOST=(HRESULT)0x88760868u;
''' + types + video + window + permanent + r'''
DxGlobals dx;vidConfig_t vidConfig;r_global_permanent_t rgp;Device first,second;
GfxWorld world={1},alternate={2};
struct dvar_t {struct {int integer;} current;} aa,optimization;
const dvar_t *r_aaSamples=&aa,*r_optimizeXModels=&optimization;
union XAssetHeader {void *ptr;};
void R_OptimizeModel(XAssetHeader,void *){assert(false);}
std::vector<int> events,expected;std::vector<std::string> errors;
HRESULT cooperative,resetResult;
int controlCalls,worldMode,switchDevice,resourceResult,throwFatal,sampleValue;
struct Failure {};
HRESULT Device::TestCooperativeLevel(){assert(this==&first);events.push_back(0);return cooperative;}
void R_SetD3DPresentParameters(D3DPRESENT_PARAMETERS *out,const GfxWindowParms *parms) {
    events.push_back(7);assert(parms->hwnd==(void *)77&&parms->hz==144&&parms->fullscreen==(vidConfig.isFullscreen!=0));
    assert(!parms->x&&!parms->y&&parms->width==1280&&parms->height==720&&parms->aaSamples==4);
    memset(out,0,sizeof(*out));out->snapshot[0]=1280;out->snapshot[1]=720;out->snapshot[2]=144;out->snapshot[3]=parms->fullscreen;
}
void R_ReleaseForShutdownOrReset(){events.push_back(8);dx.windows[0].width=42;dx.windows[0].height=43;if(switchDevice)dx.device=&second;}
HRESULT Device::Reset(D3DPRESENT_PARAMETERS *present) {
    assert(this==(switchDevice?&second:&first)&&dx.deviceLost==1);
    assert(present->snapshot[0]==1280&&present->snapshot[1]==720&&present->snapshot[2]==144&&present->snapshot[3]==(vidConfig.isFullscreen!=0));
    events.push_back(9);return resetResult;
}
unsigned _controlfp(unsigned value,unsigned mask){assert(value==(controlCalls?0x8001fu:0x20000u)&&mask==(controlCalls?0x8001fu:0x30000u)&&controlCalls<2);events.push_back(10+controlCalls++);return 0;}
const char *DXGetErrorDescription9(HRESULT result){assert(result==resetResult&&result<0&&controlCalls==2);return "reset_error";}
char *va(const char *format,...){static char buffer[1024];va_list args;va_start(args,format);vsnprintf(buffer,sizeof(buffer),format,args);va_end(args);return buffer;}
void R_FatalInitError(const char *message){events.push_back(13);errors.push_back(message);if(throwFatal)throw Failure();}
Bool R_CreateDeviceResources(){assert(!dx.deviceLost&&controlCalls==2);events.push_back(12);if(worldMode==2)rgp.world=&alternate;if(worldMode==3)rgp.world=0;return resourceResult;}
void Print(int level,const char *message,...){assert(!level);if(!strcmp(message,"Recovering lost device...\n"))events.push_back(1);else{assert(!strcmp(message,"Finished recovering lost device.\n")&&dx.sunSpriteSamples==sampleValue);events.push_back(20);}}
void Enum(int type,void (*callback)(XAssetHeader,void *),void *data,int overrides){assert(type==1&&callback==R_OptimizeModel&&!data&&overrides==1);events.push_back(18);}
struct {void (*Printf)(int,const char *,...);void (*DB_EnumXAssets)(int,void (*)(XAssetHeader,void *),void *,int);} ri={Print,Enum};
void R_ReleaseAllModels(){events.push_back(2);}void R_ReleaseLostImages(){events.push_back(3);}
void Material_ReleaseVertexDecls(){events.push_back(4);}void Material_ReleaseShaders(){events.push_back(5);}
void R_ReleaseWorld(){assert(rgp.world==&world);events.push_back(6);}
void R_ReloadWorld(){assert(rgp.world==(worldMode==2?&alternate:&world));events.push_back(14);}
void Material_ReloadAll(){events.push_back(15);}void Material_ReloadShaders(){events.push_back(16);}
void R_ReloadLostImages(){events.push_back(17);}
int RB_CalcSunSpriteSamples(){assert(dx.sunSpriteSamples==31337);events.push_back(19);return sampleValue;}
''' + finish + source + r'''
int main() {
    static_assert(sizeof(GfxWindowParms)==36&&sizeof(D3DPRESENT_PARAMETERS)==56&&sizeof(vidConfig_t)==44,"PC reset records");
    int cases=0;
    for(HRESULT coop:{D3DERR_DEVICELOST,(HRESULT)0x88760869u,(HRESULT)0,(HRESULT)-1})
    for(HRESULT reset:{(HRESULT)0,(HRESULT)1,(HRESULT)0x8876086cu})
    for(resourceResult=0;resourceResult<2;++resourceResult)for(throwFatal=0;throwFatal<2;++throwFatal)
    for(worldMode=0;worldMode<4;++worldMode)for(switchDevice=0;switchDevice<2;++switchDevice)
    for(int fullscreen:{0,1,-1})for(int optimize=0;optimize<2;++optimize) {
        memset(&dx,0,sizeof(dx));memset(&vidConfig,0,sizeof(vidConfig));memset(&rgp,0,sizeof(rgp));
        dx.device=&first;dx.deviceLost=1;dx.sunSpriteSamples=31337;dx.gpuSync=97;
        dx.windows[0].hwnd=(void *)77;dx.windows[0].width=1280;dx.windows[0].height=720;
        vidConfig.width=640;vidConfig.height=480;vidConfig.displayFrequency=144;vidConfig.isFullscreen=fullscreen;
        aa.current.integer=4;optimization.current.integer=optimize;rgp.world=worldMode==1||worldMode==3?&world:0;
        cooperative=coop;resetResult=reset;sampleValue=fullscreen?-1:1234;controlCalls=0;events.clear();errors.clear();expected={0};
        bool expectedThrow=false;
        if(coop!=D3DERR_DEVICELOST) {
            for(int i=1;i<=5;++i)expected.push_back(i);if(rgp.world)expected.push_back(6);
            for(int i=7;i<=11;++i)expected.push_back(i);
            if(reset<0){expected.push_back(13);expectedThrow=throwFatal;}
            if(!expectedThrow){expected.push_back(12);if(!resourceResult){expected.push_back(13);expectedThrow=throwFatal;}}
            if(!expectedThrow) {
                if(worldMode==1||worldMode==2)expected.push_back(14);
                for(int i=15;i<=17;++i)expected.push_back(i);if(optimize)expected.push_back(18);
                expected.push_back(19);expected.push_back(20);
            }
        }
        Bool result=99;bool threw=false;try{result=R_RecoverLostDevice();}catch(Failure &){threw=true;}
        assert(threw==expectedThrow&&events==expected&&dx.gpuSync==97);
        if(!threw)assert(result==(coop!=D3DERR_DEVICELOST));
        assert(dx.sunSpriteSamples==(coop!=D3DERR_DEVICELOST&&!threw?sampleValue:31337));
        if(coop==D3DERR_DEVICELOST)assert(controlCalls==0&&dx.deviceLost==1&&dx.device==&first&&errors.empty());
        else {
            assert(controlCalls==2&&dx.deviceLost==(reset<0&&throwFatal?1:0));
            if(reset<0){char msg[512];snprintf(msg,sizeof(msg),"Couldn't reset a lost Direct3D device - IDirect3DDevice9::Reset returned 0x%08x (reset_error)",(unsigned)reset);assert(errors[0]==msg);}
            if(!resourceResult&&!(reset<0&&throwFatal))assert(errors.back()=="Couldn't reinitialize after a lost Direct3D device");
        }
        ++cases;
    }
    printf("PASS: %d actual reset/recovery routes; shared PC owners, exact lost-only deferral, pre-release snapshots, FPU restoration, returning/throwing fatal callbacks, live world/device and final calibration publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_device_recovery_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
