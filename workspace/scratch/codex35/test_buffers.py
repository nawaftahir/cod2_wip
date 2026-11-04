#!/usr/bin/env python3
"""Exercise the actual candidate allocation/error paths with host-only COM doubles."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / "src/gfx_d3d/r_xsurface_optimize.cpp").read_text()
source = source.replace('#include "r_local.h"', '')
source = source.replace('typedef char SurfaceLayoutCheck[(sizeof(XSurface) == 24) ? 1 : -1];', '')
program = r'''
#include <cassert>
#include <cstring>
typedef unsigned char byte;
typedef int HRESULT;
const int D3DPOOL_DEFAULT=0, D3DFMT_INDEX16=101;
struct XModel {};
struct XSurface_s;
typedef XSurface_s XSurface;
struct Buffer {
    byte data[512]; int lockResult, released; bool nullData;
    HRESULT Lock(int a,int b,void **out,int flags) {
        assert(!a && !b && !flags); if(lockResult<0) return lockResult;
        *out=nullData ? 0 : data; return 0;
    }
    void Release() { ++released; }
};
struct IDirect3DVertexBuffer9 : Buffer {};
struct IDirect3DIndexBuffer9 : Buffer {};
struct Device {
    IDirect3DVertexBuffer9 vb; IDirect3DIndexBuffer9 ib;
    int result, bytes, calls;
    HRESULT CreateVertexBuffer(int n,int usage,int fvf,int pool,IDirect3DVertexBuffer9 **out,int shared) {
        assert(usage==8 && !fvf && !pool && !shared); ++calls;bytes=n;
        if(result<0) return result; *out=&vb; return 0;
    }
    HRESULT CreateIndexBuffer(int n,int usage,int format,int pool,IDirect3DIndexBuffer9 **out,int shared) {
        assert(usage==8 && format==101 && !pool && !shared); ++calls;bytes=n;
        if(result<0) return result; *out=&ib; return 0;
    }
};
struct DxGlobals { Device *device; };
struct Dvar { struct { int integer; } current; } renderer;
const Dvar *r_rendererInUse=&renderer;
struct Imports {
    int (*XModelGetNumLods)(const XModel *);
    int (*XModelGetSurfaces)(const XModel *,XSurface ***,int,int **);
} ri;
'''
program += source
program += r'''
DxGlobals dx;
int transfers, dx7Transfers, vertexFinished, indexFinished;
void R_FinishStaticVertexBuffer(void *) { ++vertexFinished; }
void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *) { ++indexFinished; }
void XSurfaceTransfer(const XVertexBuffer *, GfxVertex *, int n) { assert(n==3); ++transfers; }
void XSurfaceTransferDx7(const XVertexBuffer *, GfxVertexDx7 *, int n) { assert(n==3); ++dx7Transfers; }
extern "C" void Com_Memcpy(void *d,const void *s,int n) { memcpy(d,s,n); }
XSurface *surfaces[2]; int lodVisits;
int lodCount(const XModel *) { return 2; }
int getSurfaces(const XModel *,XSurface ***out,int lod,int **bits) {
    assert(lod==lodVisits++); *out=surfaces; *bits=0; return 2;
}
int main() {
    Device device={}; dx.device=&device; renderer.current.integer=1;
    XSurface surface={}; surface.vertCount=3; surface.boneOffset=-1;
    device.result=-1;
    XSurfaceOptimizeRigid(0,&surface,0); assert(!surface.surfRigid.vb && device.calls==1);
    device.result=0; device.vb.lockResult=-1;
    XSurfaceOptimizeRigid(0,&surface,0); assert(!surface.surfRigid.vb && device.vb.released==1);
    device.vb.lockResult=0;
    XSurfaceOptimizeRigid(0,&surface,0); assert(device.bytes==192 && transfers==1 && vertexFinished==1);
    int calls=device.calls;
    XSurfaceOptimizeRigid(0,&surface,0); assert(device.calls==calls);
    surface.surfRigid.vb=0; renderer.current.integer=2;
    XSurfaceOptimizeRigid(0,&surface,0); assert(device.bytes==108 && dx7Transfers==1);
    int indices[6]; memset(indices,0x55,sizeof(indices));
    surface.triIndices=(int (*)[4])indices; surface.triCount=3;
    device.result=-1; XSurfaceOptimize(0,&surface); assert(!surface.indexBuffer);
    device.result=0; device.ib.lockResult=-1;
    XSurfaceOptimize(0,&surface); assert(surface.indexBuffer==&device.ib && device.ib.released==1);
    surface.indexBuffer=0; device.ib.lockResult=0; device.ib.nullData=true;
    XSurfaceOptimize(0,&surface); assert(indexFinished==0);
    surface.indexBuffer=0; device.ib.nullData=false; memset(device.ib.data,0x77,sizeof(device.ib.data));
    XSurfaceOptimize(0,&surface); assert(device.bytes==32 && indexFinished==1);
    for(int i=0;i<18;++i) assert(device.ib.data[i]==0x55);
    for(int i=18;i<32;++i) assert(device.ib.data[i]==0);
    ri.XModelGetNumLods=lodCount; ri.XModelGetSurfaces=getSurfaces;
    surfaces[0]=surfaces[1]=&surface;
    calls=device.calls; XModelOptimize(0);
    assert(lodVisits==2 && device.calls==calls && indexFinished==1);
}
'''
with tempfile.TemporaryDirectory(prefix="codex35_buffers_") as directory:
    binary = str(Path(directory) / "test")
    subprocess.run(["g++", "-std=c++11", "-O2", "-x", "c++", "-", "-o", binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print("PASS: actual buffer bodies, early exits, COM failures, DX7/DX9, index copy/padding")
