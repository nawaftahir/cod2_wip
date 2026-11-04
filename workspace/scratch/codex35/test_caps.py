#!/usr/bin/env python3
"""Host behavior checks of actual capability source; SDK layout is checked by the build."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / "src/gfx_d3d/r_caps_device.cpp").read_text()
source = source.replace('#include "r_local.h"', '').replace('#include <dxerr9.h>', '')
source = source.replace('#include "universal/com_math.h"', '')
program = r'''
#include <cassert>
typedef int HRESULT; typedef unsigned int UINT;
typedef unsigned char byte;
int I_min(int x,int y) { return x-y<0 ? x : y; }
const int D3DDEVTYPE_HAL=1, D3DFMT_A8R8G8B8=21, D3DRTYPE_SURFACE=1, ERR_FATAL=0;
typedef unsigned int D3DFORMAT;
#define MAKEFOURCC(a,b,c,d) ((a)|((b)<<8)|((c)<<16)|((d)<<24))
struct D3DCAPS9 {
    UINT PixelShaderVersion, VertexShaderVersion, MaxTextureWidth, MaxTextureHeight,
    MaxSimultaneousTextures, MaxTextureBlendStages, MaxActiveLights, Caps2,
    MaxUserClipPlanes, MaxAnisotropy, StencilCaps, RasterCaps, TextureCaps, PrimitiveMiscCaps;
} fixture;
int sleeps, fatalCalls, failures, attempts, allowed=6, selected, errorCalls, formatCalls, formatResult;
void Sleep(int delay) { assert(delay==100); ++sleeps; }
const char *DXGetErrorDescription9(HRESULT) { return "error"; }
const char *va(const char *s, ...) { return s; }
void R_FatalInitError(const char *) { ++fatalCalls; }
int R_CheckDxCaps(const D3DCAPS9 *) { return allowed; }
struct Device {
    HRESULT GetDeviceCaps(UINT adapter,int type,D3DCAPS9 *caps) {
        assert(adapter==3 && type==1); if(++attempts<=failures) return -1; *caps=fixture;return 0;
    }
    HRESULT CheckDeviceFormat(UINT adapter,int type,int format,int usage,int resource,D3DFORMAT check) {
        assert(adapter==3 && type==1 && format==21 && !usage && resource==1 && check==0x41415353);
        ++formatCalls;return formatResult;
    }
} device;
struct DxGlobals {
    Device *d3d9; UINT adapterIndex;
    int maxClipPlanes,maxAnisotropy;
    unsigned char stencilTwoSided,stencilWrap,slopeScaleDepthBias,canMipCubemaps,
        hasBlendOp,hasSeparateAlphaBlend,hasTransparencyMsaa;
} dx;
struct Config { int maxTextureSize,maxTextureMaps,maxTextureCoords,maxActiveLights;unsigned char deviceSupportsGamma; } vidConfig;
struct dvar_t { struct { int integer; } current; } preference,renderer,alpha,samples;
const dvar_t *r_rendererPreference=&preference, *r_rendererInUse=&renderer,
    *r_aaAlpha=&alpha,*r_aaSamples=&samples;
void print(int,const char *,...) {}
void error(int code,const char *) { assert(code==0);++errorCalls; }
const char *enumString(dvar_t *p) { assert(p==&preference);return "dx7"; }
void setInt(const dvar_t *p,int value) { assert(p==&renderer); selected=value; }
struct Imports {
    void (*Printf)(int,const char *,...);
    void (*Error)(int,const char *);
    const char *(*Dvar_EnumToString)(dvar_t *);
    void (*Dvar_SetInt)(const dvar_t *,int);
} ri={print,error,enumString,setInt};
'''
program += source
program += r'''
int main() {
    dx.d3d9=&device; dx.adapterIndex=3; D3DCAPS9 caps;
    failures=19;R_GetDeviceCaps(3,&caps); assert(attempts==20 && sleeps==19 && !fatalCalls);
    attempts=sleeps=0;failures=20;R_GetDeviceCaps(3,&caps);
    assert(attempts==20 && sleeps==20 && fatalCalls==1);
    R_ChooseRenderer(&caps);assert(selected==1);
    preference.current.integer=2;R_ChooseRenderer(&caps);assert(selected==2);
    allowed=4;preference.current.integer=1;R_ChooseRenderer(&caps);assert(selected==2);
    preference.current.integer=0;R_ChooseRenderer(&caps);assert(selected==2);
    allowed=0;R_ChooseRenderer(&caps);assert(errorCalls==1);
    allowed=6;failures=0; fixture.MaxTextureWidth=64;fixture.MaxTextureHeight=32;
    fixture.MaxUserClipPlanes=12;fixture.MaxAnisotropy=16;fixture.Caps2=1<<17;
    fixture.StencilCaps=0x1c0;fixture.RasterCaps=1<<25;fixture.TextureCaps=1<<16;
    fixture.PrimitiveMiscCaps=(1<<11)|(1<<17);
    samples.current.integer=1; alpha.current.integer=0; R_StoreDirect3DCaps(3);
    assert(vidConfig.maxTextureSize==32 && dx.maxClipPlanes==6 && dx.maxAnisotropy==16);
    assert(vidConfig.deviceSupportsGamma && dx.stencilWrap && dx.stencilTwoSided && dx.slopeScaleDepthBias);
    assert(dx.canMipCubemaps && dx.hasBlendOp && dx.hasSeparateAlphaBlend && !dx.hasTransparencyMsaa && !formatCalls);
    fixture.MaxTextureHeight=128; fixture.MaxUserClipPlanes=2;
    samples.current.integer=0; alpha.current.integer=1;
    R_StoreDirect3DCaps(3);assert(vidConfig.maxTextureSize==64 && dx.maxClipPlanes==2 && dx.hasTransparencyMsaa && formatCalls==1);
    formatResult=1;R_StoreDirect3DCaps(3);assert(!dx.hasTransparencyMsaa);
}
'''
with tempfile.TemporaryDirectory(prefix="codex35_caps_") as directory:
    binary = str(Path(directory) / "test")
    subprocess.run(["g++", "-std=c++11", "-O2", "-x", "c++", "-", "-o", binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print("PASS: actual caps bodies, retries, fatal path, renderer preferences, flags, format check")
