"""Actual shutdown helpers with the shared PC resource records and release order."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
local = (work / 'src/gfx_d3d/r_local.h').read_text()
types = local[local.index('struct GfxRenderTarget\n'):local.index('extern DxGlobals dx;')]
sun = (work / 'src/gfx_d3d/r_sun_state.h').read_text().replace('#pragma once', '')
buffers = (work / 'src/gfx_d3d/r_dxbuffers.cpp').read_text()
buffers = buffers[buffers.index('// PINNED 10011e60:'):buffers.index('void R_FinishStaticIndexBuffer(')]
targets = (work / 'src/gfx_d3d/r_rendertarget.cpp').read_text()
targets = targets[targets.index('// PINNED 10023560:'):targets.index('// PINNED 0x10022710:')]
device = fragment('gfx_d3d/r_device.cpp')
device = device[device.index('void R_ShutdownRenderTargets();'):device.index('// Role name; PINNED 10013690:')]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic, i.op_str) for i in decoder.disasm(retail.get_data(0x12210,269),0x10012210)]
assert ops[-1] == ('ret', '')
assert [operand for op,operand in ops if op == 'call' and operand.startswith('0x')] == ['0x10023560','0x1002baf0','0x10011e60']
assert not any(op.startswith('mov') and operand.startswith('dword ptr [0x1076a830],') for op,operand in ops), 'Decompiler fabricated a retry-flag store'
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstddef>
#include <vector>
typedef unsigned char byte;typedef byte Bool;
typedef unsigned UINT;typedef unsigned DWORD;
typedef void *HWND;typedef void *HINSTANCE;
typedef int D3DFORMAT;typedef int D3DMULTISAMPLE_TYPE;
struct D3DDISPLAYMODE {unsigned width,height,hz,format;};
struct Ref {int id;unsigned Release();} refs[45];
typedef Ref IDirect3DSurface9;typedef Ref IDirect3DSwapChain9;
typedef Ref IDirect3DIndexBuffer9;typedef Ref IDirect3DVertexBuffer9;
typedef Ref IDirect3DQuery9;typedef Ref IDirect3DDevice9;typedef Ref IDirect3D9;
struct GfxImage {int id;};
''' + types + sun + r'''
DxGlobals dx;SunFlareDynamic sunFlareState[4];
std::vector<int> events,expected;
int alwaysfails,throwId,windowResult,mutateWindow;
struct Failure {};
unsigned Ref::Release(){events.push_back(id);if(id==throwId)throw Failure();return 31337;}
void Image_Release(GfxImage *image){events.push_back(image->id);}
void R_FlushStaticModelCache(){events.push_back(200);}
void Free(void *ptr){assert(ptr==(void *)0x1234&&dx.tempSkinBuf==ptr&&dx.tempSkinPos==123);events.push_back(201);}
struct {void (*Z_VirtualFreeInternal)(void *);} ri={Free};
int IsWindow(HWND hwnd){assert(hwnd==(void *)77&&dx.windowCount==0);events.push_back(300);if(mutateWindow)dx.windows[0].hwnd=(void *)88;return windowResult;}
int DestroyWindow(HWND hwnd){assert(hwnd==(void *)(mutateWindow?88:77));events.push_back(301);return 0;}
''' + buffers + targets + device + r'''
int main() {
    static_assert(sizeof(GfxRenderTarget)==20&&sizeof(GfxWindowTarget)==16,"PC resource records");
    static_assert(offsetof(DxGlobals,renderTargets)==0x2c30&&offsetof(DxGlobals,tempSkinBuf)==0x2dd0,"PC resource owners");
    GfxImage images[13];for(int i=0;i<13;++i)images[i].id=100+i;
    for(int i=0;i<45;++i)refs[i].id=i;
    int cases=0;
    for(unsigned seed=0;seed<2048;++seed)for(int hardware=0;hardware<2;++hardware) {
        unsigned mask=seed*2654435761u;
        memset(&dx,0,sizeof(dx));memset(sunFlareState,0x5a,sizeof(sunFlareState));
        events.clear();expected.clear();throwId=-1;alwaysfails=0;
        dx.windowCount=seed&1;dx.windows[0].hwnd=(void *)77;
        dx.windows[0].swapChain=&refs[0];dx.windows[0].width=800;dx.windows[0].height=600;
        dx.device=&refs[44];dx.d3d9=&refs[43];dx.gpuSync=97;dx.dynamicBufferFrame=98;
        dx.dynamicIndexBuffer=&dx.dynamicIndexBufferPool[0];dx.dynamicVertexBuffer=&dx.dynamicVertexBufferPool[0];
        if(dx.windowCount)expected.push_back(0);
        for(int i=0;i<13;++i) {
            auto &target=dx.renderTargets[i];target.width=800+i;target.height=600+i;
            if(mask&(1u<<(i%32))){target.colorSurface=&refs[1+i*2];expected.push_back(1+i*2);}
            if(mask&(1u<<((i+9)%32))){target.depthStencilSurface=&refs[2+i*2];expected.push_back(2+i*2);}
            if(mask&(1u<<((i+17)%32))){target.image=&images[i];expected.push_back(100+i);}
        }
        dx.singleSampleDepthStencilSurface=&refs[1];expected.push_back(200);
        if(mask&1){dx.smodelCacheVb=&refs[27];expected.push_back(27);}
        Ref **slots[]={&dx.dynamicIndexBufferPool[0].buffer,&dx.dynamicVertexBufferPool[0].buffer,
            &dx.skinnedCacheVbPool[0].buffer,&dx.skinnedCacheVbPool[1].buffer};
        for(int i=0;i<4;++i)if(mask&(2u<<i)){*slots[i]=&refs[28+i];expected.push_back(28+i);}
        dx.dynamicIndexBufferPool[0].used=11;dx.dynamicIndexBufferPool[0].total=12;
        dx.dynamicVertexBufferPool[0].used=13;dx.dynamicVertexBufferPool[0].total=14;
        dx.tempSkinPos=123;if(mask&64){dx.tempSkinBuf=(byte *)0x1234;expected.push_back(201);}
        Ref **tail[]={&dx.particleCloudVertexBuffer,&dx.particleCloudIndexBuffer,&dx.flushGpuQuery};
        for(int i=0;i<3;++i)if(mask&(128u<<i)){*tail[i]=&refs[32+i];expected.push_back(32+i);}
        for(int i=0;i<8;++i) {
            auto &query=sunFlareState[i/2].sunQuery[i%2];query=0;
            if(mask&(1024u<<i)){query=&refs[35+i];expected.push_back(35+i);}
        }
        DxGlobals after=dx;SunFlareDynamic sunAfter[4];memcpy(sunAfter,sunFlareState,sizeof(sunAfter));
        if(dx.windowCount)after.windows[0].swapChain=0;
        memset(after.renderTargets,0,sizeof(after.renderTargets));after.singleSampleDepthStencilSurface=0;
        after.smodelCacheVb=0;after.dynamicIndexBufferPool[0].buffer=0;after.dynamicVertexBufferPool[0].buffer=0;
        for(int i=0;i<2;++i)after.skinnedCacheVbPool[i].buffer=0;
        if(after.tempSkinBuf){after.tempSkinBuf=0;after.tempSkinPos=0;}
        after.particleCloudVertexBuffer=0;after.particleCloudIndexBuffer=0;after.flushGpuQuery=0;
        for(int i=0;i<8;++i)sunAfter[i/2].sunQuery[i%2]=0;
        windowResult=seed%3==0?0:seed%3==1?1:-7;mutateWindow=seed&2;
        if(hardware) {
            if(dx.windowCount){expected.push_back(300);if(windowResult)expected.push_back(301);after.windows[0].hwnd=0;}
            after.windowCount=0;expected.push_back(44);expected.push_back(43);after.device=0;after.d3d9=0;
            R_ShutdownHardware();
        } else R_ReleaseForShutdownOrReset();
        assert(events==expected&&!memcmp(&dx,&after,sizeof(dx))&&!memcmp(sunAfter,sunFlareState,sizeof(sunAfter)));
        assert(!alwaysfails);++cases;
    }
    memset(&dx,0,sizeof(dx));dx.dynamicIndexBufferPool[0].buffer=&refs[28];
    throwId=28;bool threw=false;try{R_ReleaseDynamicBuffers();}catch(Failure &){threw=true;}
    assert(threw&&dx.dynamicIndexBufferPool[0].buffer==&refs[28]);
    printf("PASS: %d actual shutdown/reset routes, shared PC layouts, release order, aliases, optional resources, Win32 reloads and untouched state; normal retry flag only\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_resource_shutdown_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
