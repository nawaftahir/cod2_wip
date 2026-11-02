"""Actual higher device startup, shared viewport and resource/system ordering."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_device.cpp')
source = text[text.index('Bool R_CreateDevice(const GfxWindowParms *parms)'):text.index('void R_SetupWindowParms(')]
header = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once', '')
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic, i.op_str) for i in decoder.disasm(retail.get_data(0x128b0,271),0x100128b0)]
assert ops[-1] == ('ret', '')
for pair in [('push','0x30000'),('push','0x20000'),('push','0x8001f'),('call','0x10012040'),('call','dword ptr [0x101d4a60]'),
             ('mov','dword ptr [0x1072dde8], eax'),('mov','dword ptr [0x1072ddec], ecx')]:
    assert pair in ops, pair
assert retail.get_string_at_rva(0x193bd0) == b"Couldn't create a Direct3D device: %s\n"
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <vector>
#include <string>
#include <initializer_list>
typedef unsigned char Bool;typedef void *HWND;typedef unsigned long DWORD;typedef long HRESULT;
enum {D3DCREATE_HARDWARE_VERTEXPROCESSING=0x40,_PC_24=0x20000,_MCW_PC=0x30000,_MCW_EM=0x8001f};
struct D3DPRESENT_PARAMETERS {unsigned fields[14];};
''' + header + r'''
struct dvar_t {struct {Bool enabled;int integer;} current;} gamma,multi,sync;
const dvar_t *r_gamma=&gamma,*r_multiGpu=&multi,*r_gpuSync=&sync;
struct Window {HWND hwnd;void *swapChain;int width,height;};
struct {Bool deviceLost;int gpuSync,windowCount;Window windows[1];} dx;
struct {struct {int x,y,width,height;} sceneViewport;int guard;} backEnd;
struct {int width,height;} vidConfig;
std::vector<std::string> events;
int failure,controls;bool mutate;
GfxWindowParms parms;
void R_SetD3DPresentParameters(D3DPRESENT_PARAMETERS *out,const GfxWindowParms *in) {
    assert(in==&parms&&events.empty());events.push_back("present");memset(out,0x37,sizeof(*out));
    if(mutate)parms.hwnd=(HWND)0x4321;
}
HRESULT R_CreateDeviceInternal(HWND hwnd,DWORD behavior,D3DPRESENT_PARAMETERS *present) {
    assert(events.size()==1&&hwnd==(HWND)0x1234&&behavior==0x40);
    assert(present->fields[0]==0x37373737);events.push_back("create");return failure==1?-17:0;
}
unsigned _controlfp(unsigned value,unsigned mask) {
    assert(events.size()==size_t(2+controls));
    assert(value==(controls?0x8001fu:0x20000u)&&mask==(controls?0x8001fu:0x30000u));
    ++controls;events.push_back("fp");return 0;
}
const char *DXGetErrorDescription9(HRESULT result) {assert(result==-17&&controls==2);return "failure";}
void print(int channel,const char *format,...) {
    assert(channel==0&&!strcmp(format,"Couldn't create a Direct3D device: %s\n"));
    va_list args;va_start(args,format);assert(!strcmp(va_arg(args,const char*),"failure"));va_end(args);events.push_back("error");
}
void R_StoreWindowSettings(const GfxWindowParms *in) {
    assert(in==&parms&&events.size()==4&&controls==2&&!dx.deviceLost);
    assert(dx.gpuSync==(multi.current.enabled?0:sync.current.integer));
    vidConfig.width=parms.width+7;vidConfig.height=parms.height+11;events.push_back("video");
}
Bool R_CreateDeviceResources() {
    assert(events.back()=="video"&&backEnd.sceneViewport.width==vidConfig.width&&backEnd.sceneViewport.height==vidConfig.height);
    events.push_back("resources");return failure!=2;
}
void setModified(const dvar_t *value) {assert(value==r_gamma&&events.back()=="resources");events.push_back("gamma");}
struct {void (*Printf)(int,const char*,...);void (*Dvar_SetModified)(const dvar_t*);} ri={print,setModified};
void R_InitSystems() {
    assert(events.back()=="gamma"&&dx.windows[0].width==-1&&dx.windowCount==0);events.push_back("systems");
    if(mutate){parms.width=1024;parms.height=768;}
}
''' + source + r'''
int main() {
    int cases=0;
    for(failure=0;failure<3;++failure)for(int multiGpu:{0,1})for(int gpuSync=0;gpuSync<4;++gpuSync)for(int change:{0,1}) {
        mutate=change;parms={};parms.hwnd=(HWND)0x1234;parms.width=640;parms.height=480;
        dx.deviceLost=0x5a;dx.gpuSync=99;dx.windowCount=0;dx.windows[0]={(HWND)0x7890,(void*)0xabcd,-1,-2};
        backEnd.sceneViewport={31,37,41,43};backEnd.guard=47;vidConfig={53,59};
        multi.current.enabled=multiGpu;sync.current.integer=gpuSync;events.clear();controls=0;
        Bool result=R_CreateDevice(&parms);assert(result==int(!failure)&&controls==2);
        assert(dx.windows[0].swapChain==(void*)0xabcd&&backEnd.sceneViewport.x==31&&backEnd.sceneViewport.y==37&&backEnd.guard==47);
        if(failure==1) {
            assert(events.size()==5&&events.back()=="error"&&dx.deviceLost==0x5a&&dx.gpuSync==99);
            assert(vidConfig.width==53&&vidConfig.height==59&&backEnd.sceneViewport.width==41&&backEnd.sceneViewport.height==43);
        } else {
            assert(!dx.deviceLost&&dx.gpuSync==(multiGpu?0:gpuSync));
            assert(backEnd.sceneViewport.width==647&&backEnd.sceneViewport.height==491);
        }
        if(failure)assert(!dx.windowCount&&dx.windows[0].hwnd==(HWND)0x7890&&dx.windows[0].width==-1&&dx.windows[0].height==-2);
        else {
            assert(events.size()==8&&events.back()=="systems"&&dx.windowCount==1);
            assert(dx.windows[0].hwnd==parms.hwnd&&dx.windows[0].width==parms.width&&dx.windows[0].height==parms.height);
        }
        if(failure==2)assert(events.size()==6&&events.back()=="resources");
        ++cases;
    }
    printf("PASS: %d actual higher-device startup routes, FP controls on failure, shared viewport, multi-GPU, resources/gamma/systems order and late window publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_device_startup_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
