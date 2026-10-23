"""Actual AA/presentation/device source with target-pinned retry and format rules."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic, i.op_str) for i in decoder.disasm(retail.get_data(0x126d0, 113), 0x100126d0)]
for pair in [('cmp', 'edi, 0x14'), ('push', '0x64'), ('mov', 'dword ptr [0x101d1bfc], 0')]:
    assert pair in ops, pair
assert ops[-1] == ('ret', '')
assert retail.get_string_at_rva(0x193c40) == b'Creating Direct3D device...\n'
assert retail.get_string_at_rva(0x192b74) == b'r_swapInterval'
header = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once', '')
text = (work / 'src/gfx_d3d/r_device.cpp').read_text()
source = text[text.index('void R_SetupAntiAliasing('):]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <initializer_list>
typedef unsigned char Bool;
typedef unsigned long DWORD;
typedef unsigned int UINT;
typedef long HRESULT;
typedef void *HWND;
typedef int D3DMULTISAMPLE_TYPE;
enum {D3DDEVTYPE_HAL=1,D3DFMT_A8R8G8B8=21,D3DFMT_D24S8=75,D3DMULTISAMPLE_NONE=0,D3DSWAPEFFECT_DISCARD=1};
const DWORD D3DPRESENT_INTERVAL_ONE=1,D3DPRESENT_INTERVAL_IMMEDIATE=0x80000000UL;
struct D3DPRESENT_PARAMETERS {
    UINT BackBufferWidth,BackBufferHeight;int BackBufferFormat;UINT BackBufferCount;
    int MultiSampleType;DWORD MultiSampleQuality;int SwapEffect;HWND hDeviceWindow;
    int Windowed,EnableAutoDepthStencil,AutoDepthStencilFormat;
    DWORD Flags;UINT FullScreen_RefreshRateInHz;DWORD PresentationInterval;
};
'''+header+r'''
struct Device {} device;
struct Adapter;
struct {Adapter *d3d9;UINT adapterIndex;Device *device;int multiSampleType;DWORD multiSampleQuality;} dx;
int supportedSamples,aaCalls,previousSamples;
DWORD quality;
Bool fullscreen;
int createCalls,sleeps,messages,successAt;
UINT initialAdapter;
D3DPRESENT_PARAMETERS *expectedPresent;
struct Adapter {
    HRESULT CheckDeviceMultiSampleType(UINT adapter,int type,int format,int windowed,int samples,DWORD *levels) {
        assert(adapter==0&&type==1&&format==21&&windowed==!fullscreen);
        assert(samples==previousSamples-1&&samples>1&&dx.multiSampleType==samples);
        previousSamples=samples;++aaCalls;
        if(samples==supportedSamples){*levels=quality;return 7;}return -5;
    }
    HRESULT CreateDevice(UINT adapter,int type,HWND window,DWORD behavior,D3DPRESENT_PARAMETERS *present,Device **out) {
        assert(type==1&&window==(HWND)0x1234&&behavior==0x40&&present==expectedPresent&&out==&dx.device);
        assert(adapter==(createCalls<20?initialAdapter:0));
        assert(sleeps==createCalls);++createCalls;
        if(createCalls==successAt){*out=&device;return 7;}
        return -100-createCalls;
    }
} adapter;
struct dvar_t {struct {Bool enabled;} current;} swapDvar;
const dvar_t *r_swapInterval=&swapDvar;
void Print(int channel,const char *format,...) {
    assert(channel==0&&!strcmp(format,"Creating Direct3D device...\n"));
    assert(createCalls==messages*20);++messages;
}
struct {void (*Printf)(int,const char*,...);} ri={Print};
void Sleep(DWORD milliseconds) {assert(milliseconds==100&&sleeps+1==createCalls);++sleeps;}
'''+source+r'''
int main() {
    static_assert(sizeof(D3DPRESENT_PARAMETERS)==56,"primary presentation extent");
    dx.d3d9=&adapter;int cases=0;
    for(int requested:{-1,0,1,2,4,8,16})for(supportedSamples=0;supportedSamples<=requested+1;++supportedSamples)
    for(int full:{0,1,128})for(int enabled:{0,1,128})for(DWORD levels:{0UL,1UL,7UL}) {
        GfxWindowParms parms={(HWND)0x1234,144,(Bool)full,-50,22,800,600,99,requested};
        fullscreen=parms.fullscreen;swapDvar.current.enabled=enabled;quality=levels;
        aaCalls=0;previousSamples=requested+1;dx.adapterIndex=7;
        dx.multiSampleType=99;dx.multiSampleQuality=123;
        D3DPRESENT_PARAMETERS present;memset(&present,0x5a,sizeof(present));
        R_SetD3DPresentParameters(&present,&parms);
        bool selected=requested>1&&supportedSamples>1&&supportedSamples<=requested;
        int expectedSamples=selected?supportedSamples:0;
        DWORD expectedQuality=selected?levels-1:0;
        assert(aaCalls==(selected?requested-supportedSamples+1:(requested>1?requested-1:0)));
        D3DPRESENT_PARAMETERS expected={800,600,21,1,expectedSamples,expectedQuality,1,(HWND)0x1234,
            !full,0,75,0,full?144U:0U,enabled?1UL:0x80000000UL};
        assert(!memcmp(&present,&expected,sizeof(present)));
        assert(dx.multiSampleType==expectedSamples&&dx.multiSampleQuality==expectedQuality&&dx.adapterIndex==7);
        assert(parms.tileCount==99&&parms.width==800&&parms.aaSamples==requested);++cases;
    }
    for(UINT selectedAdapter:{0U,7U})for(int success:{0,1,19,20,21,39,40,41}) {
        initialAdapter=selectedAdapter;
        createCalls=sleeps=messages=0;successAt=success;dx.adapterIndex=initialAdapter;dx.device=0;
        D3DPRESENT_PARAMETERS present={};expectedPresent=&present;
        HRESULT result=R_CreateDeviceInternal((HWND)0x1234,0x40,&present);
        int limit=initialAdapter?40:20;
        bool succeeded=success>0&&success<=limit;
        int attempts=succeeded?success:limit;
        assert(createCalls==attempts&&sleeps==attempts-(succeeded?1:0));
        assert(messages==(attempts>20?2:1));
        assert(result==(succeeded?7:-100-attempts));
        assert(dx.device==(succeeded?&device:0));
        assert(dx.adapterIndex==(attempts>20||(!succeeded&&initialAdapter)?0:initialAdapter));++cases;
    }
    printf("PASS: %d actual AA/presentation/device routes, unsigned quality, twenty-try retries and adapter fallback\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_device_creation_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
