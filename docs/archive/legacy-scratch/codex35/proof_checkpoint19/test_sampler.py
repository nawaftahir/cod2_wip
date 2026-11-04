#!/usr/bin/env python3
"""Behavior checks of the actual sampler candidate; not byte-match proof."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_state.cpp').read_text()
source = source[source.index('static const DWORD s_filterTable'):source.index('static const DWORD s_blendTable')]
program = r'''
#include <cassert>
#include <cstring>
#include <initializer_list>
typedef unsigned int DWORD;
#define __declspec(x)
#define R_DX_CALL(x) do { x; } while (0)
const int D3DTEXF_ANISOTROPIC=3,D3DTEXF_LINEAR=2;
const int D3DTADDRESS_CLAMP=3,D3DTADDRESS_WRAP=1;
const int D3DSAMP_ADDRESSU=1,D3DSAMP_ADDRESSV=2,D3DSAMP_ADDRESSW=3;
const int D3DSAMP_MAGFILTER=5,D3DSAMP_MINFILTER=6,D3DSAMP_MIPFILTER=7;
struct GfxImage { const char *name; struct { void *basemap; } texture; } a,b;
struct Device {
    int textures,states; void *bound[16]; DWORD values[16][8];
    int SetTexture(int i,void *p) { ++textures;bound[i]=p;return 0; }
    int SetSamplerState(int i,int key,DWORD v) { ++states;values[i][key]=v;return 0; }
} device;
struct { Device *device;int anisotropy;bool deviceLost; } dx={&device,1,false};
struct { const GfxImage *samplerImage[16];unsigned char samplerState[16]; } dxState;
struct { unsigned char defaultSamplerState; } backEnd={2};
struct { int maxTextureMaps; } vidConfig={4};
struct { GfxImage *whiteImage; } rgp={&a};
struct Dvar { struct { int integer; } current; } logDvar;
Dvar *r_logFile=&logDvar;
const char *va(const char *s,...) { return s; }
void RB_LogPrint(const char *) {}
'''
program += source
program += r'''
int main() {
    a.name="a";a.texture.basemap=&a;b.name="b";b.texture.basemap=&b;
    RB_SetSampler(0,0,&a);
    assert(device.textures==1 && device.bound[0]==&a && dxState.samplerState[0]==2);
    assert(device.values[0][D3DSAMP_MINFILTER]==2 && device.values[0][D3DSAMP_MAGFILTER]==2);
    int states=device.states;RB_SetSampler(0,0,&a);
    assert(device.textures==1 && device.states==states);
    RB_SetSampler(0,0x77,&b);
    assert(device.textures==2 && device.values[0][D3DSAMP_MINFILTER]==3);
    assert(device.values[0][D3DSAMP_MAGFILTER]==2 && device.values[0][D3DSAMP_MIPFILTER]==1);
    for(int i=1;i<=3;++i)assert(device.values[0][i]==3);
    dx.anisotropy=0;RB_SetSampler(1,3,&a);
    assert(device.values[1][D3DSAMP_MINFILTER]==2 && device.values[1][D3DSAMP_MAGFILTER]==2);
    RB_SetSampler(0,1,&b);
    for(int i=1;i<=3;++i)assert(device.values[0][i]==1);
    states=device.states;RB_SetSampler(0,0,0);
    assert(!device.bound[0] && !dxState.samplerImage[0] && device.states==states);
    RB_UnbindImage(&a);assert(!dxState.samplerImage[1]);
    RB_SetSampler(0,1,&a);dx.deviceLost=true;
    int textures=device.textures;RB_InitImages();assert(device.textures==textures && device.bound[0]==&a);
    dx.deviceLost=false;RB_InitImages();
    for(int i=0;i<vidConfig.maxTextureMaps;++i)assert(!device.bound[i] && !dxState.samplerImage[i]);
    // All byte transitions, including reserved bit7 and default-filter substitution.
    for(int aniso: {0,4})for(int old=0;old<256;++old)for(int requested=0;requested<256;++requested) {
        dx.anisotropy=aniso;backEnd.defaultSamplerState=2;
        dxState.samplerImage[0]=&a;dxState.samplerState[0]=(unsigned char)old;
        for(int key=0;key<8;++key)device.values[0][key]=99;
        device.states=device.textures=0;
        RB_SetSampler(0,requested,&a);
        int wanted=(requested&15)?requested:(requested|2);
        int diff=old^wanted,calls=0;
        int oldMin=old&3,newMin=wanted&3,oldMag=oldMin,newMag=newMin;
        if(oldMin==3){oldMin=aniso?3:2;oldMag=2;}
        if(newMin==3){newMin=aniso?3:2;newMag=2;}
        if((diff&3) && oldMin!=newMin){assert(device.values[0][6]==unsigned(newMin));++calls;}
        else assert(device.values[0][6]==99);
        if((diff&3) && oldMag!=newMag){assert(device.values[0][5]==unsigned(newMag));++calls;}
        else assert(device.values[0][5]==99);
        if(diff&12){assert(device.values[0][7]==unsigned((wanted>>2)&3));++calls;}
        else assert(device.values[0][7]==99);
        for(int axis=0;axis<3;++axis) {
            int bit=16<<axis;
            if(diff&bit){assert(device.values[0][axis+1]==unsigned((wanted&bit)?3:1));++calls;}
            else assert(device.values[0][axis+1]==99);
        }
        assert(device.states==calls && !device.textures && dxState.samplerState[0]==wanted);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_sampler_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: sampler caching, defaults, anisotropy, address modes, null/unbind, initialization')
