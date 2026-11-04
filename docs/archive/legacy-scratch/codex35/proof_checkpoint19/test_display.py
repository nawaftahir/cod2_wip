#!/usr/bin/env python3
"""Host behavior checks of the actual display enumeration and initialization source."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / "src/gfx_d3d/r_display_modes.cpp").read_text().replace('#include "r_local.h"', '')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
typedef unsigned int UINT;
const int D3DFMT_X8R8G8B8=22,D3D_SDK_VERSION=32;
struct D3DDISPLAYMODE { UINT Width,Height,RefreshRate,Format; } modes[300];
int fixtureCount,failIndex=-1,fatalCalls,registration,capsCalls,enumCalls;
int defaults[2]; bool failCreate;
struct Device {
    UINT GetAdapterModeCount(UINT a,int f) { assert(a==3 && f==22);return fixtureCount; }
    int EnumAdapterModes(UINT a,int f,UINT i,D3DDISPLAYMODE *out) {
        assert(a==3 && f==22);++enumCalls;if(int(i)==failIndex)return -1;*out=modes[i];return 0;
    }
} device;
Device *Direct3DCreate9(int version) { assert(version==32);return failCreate?0:&device; }
struct DxGlobals {
    Device *d3d9; UINT adapterIndex;int displayModeCount;
    D3DDISPLAYMODE displayModes[256];
    const char *resolutionNameTable[257],*refreshRateNameTable[257];char modeText[5120];
} dx;
struct dvar_t {} dvar;
const char *va(const char *s,...) { return s; }
void R_FatalInitError(const char *) { ++fatalCalls; }
void R_StoreDirect3DCaps(UINT a) { assert(a==3);++capsCalls; }
unsigned int R_ChooseAdapter() { return 3; }
void print(int,const char *,...) {}
const dvar_t *reg(const char *name,const char **values,int index,int flags) {
    assert(flags==0x2021 && values && (strcmp(name,"r_mode")==0 || strcmp(name,"r_displayRefresh")==0));
    defaults[registration++%2]=index;return &dvar;
}
struct Imports { void(*Printf)(int,const char *,...);const dvar_t *(*Dvar_RegisterEnum)(const char *,const char **,int,int); } ri={print,reg};
'''
program += source
program += r'''
int main() {
    modes[0]={1920,1080,144,22};modes[1]={800,600,0,22};modes[2]={800,600,75,22};
    modes[3]={320,200,50,22};modes[4]={640,480,60,22};fixtureCount=5;
    assert(R_CreateDirect3D() && capsCalls==1 && dx.adapterIndex==3);
    assert(dx.displayModeCount==5 && registration==2 && !fatalCalls && defaults[0]==0 && defaults[1]==1);
    assert(!strcmp(dx.resolutionNameTable[0],"640x480") && !strcmp(dx.resolutionNameTable[1],"800x600"));
    assert(!strcmp(dx.resolutionNameTable[2],"1920x1080") && !dx.resolutionNameTable[3]);
    assert(!strcmp(dx.refreshRateNameTable[0],"50 Hz") && !strcmp(dx.refreshRateNameTable[1],"60 Hz"));
    assert(!strcmp(dx.refreshRateNameTable[2],"75 Hz") && !strcmp(dx.refreshRateNameTable[3],"144 Hz") && !dx.refreshRateNameTable[4]);
    failIndex=0;R_EnumerateDisplayModes(3);assert(dx.displayModeCount==4 && !dx.resolutionNameTable[2]);
    failIndex=-1;fixtureCount=300;
    for(int i=0;i<300;++i)modes[i]={640,480,60,22};
    R_EnumerateDisplayModes(3);assert(dx.displayModeCount==256 && !dx.resolutionNameTable[1]);
    dx.d3d9=0;failCreate=true;assert(!R_CreateDirect3D() && capsCalls==1);
}
'''
with tempfile.TemporaryDirectory(prefix="codex35_display_") as directory:
    binary = str(Path(directory) / "test")
    subprocess.run(["g++", "-std=c++11", "-O2", "-x", "c++", "-", "-o", binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print("PASS: actual enumeration/init, sorting, duplicates, defaults, failure, 256-mode cap")
