"""Actual dynamic buffer constructors and startup pool ownership."""
from pathlib import Path
from fragment import fragment
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_dxbuffers.cpp')
source = text[text.index('void R_CreateDynamicVertexBuffer('):text.index('void R_FinishStaticIndexBuffer(')]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x11b60,143),0x10011b60)]
assert ('push','0xa00000') in ops
assert ('call','dword ptr [0x101d49e8]') in ops
assert ('mov','ecx, 0x200000') in ops
assert retail.get_string_at_rva(0x193e18) == b"Couldn't create a %i-byte dynamic vertex buffer: %s"
assert retail.get_string_at_rva(0x193de4) == b"Couldn't create a %i-byte dynamic index buffer: %s"
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char byte;
typedef unsigned long DWORD;
typedef long HRESULT;
enum {D3DUSAGE_DYNAMIC=512,D3DUSAGE_WRITEONLY=8,D3DPOOL_DEFAULT=0,D3DFMT_INDEX16=101};
struct VertexBuffer {} vertex;
struct IndexBuffer {} indices;
struct r_vb_state_t {int used,total;VertexBuffer *buffer;};
struct r_ib_state_t {int used,total;IndexBuffer *buffer;};
struct Device;
struct {
    Device *device;r_vb_state_t dynamicVertexBufferPool[1],skinnedCacheVbPool[2];
    r_vb_state_t *dynamicVertexBuffer;
    r_ib_state_t dynamicIndexBufferPool[1],*dynamicIndexBuffer;
    byte *tempSkinBuf;int tempSkinPos;
} dx;
struct dvar_t {struct {int integer;} current;} renderer;
const dvar_t *r_rendererInUse=&renderer;
int calls,reserves,failAt,modeSwitch;
bool integrated;
int expectedBytes;
const char *expectedKind;
struct Device {
    HRESULT CreateVertexBuffer(int size,int usage,int fvf,int pool,VertexBuffer **out,void *shared) {
        assert(usage==0x208&&!fvf&&!pool&&!shared);
        if(integrated) {
            assert(calls<3);
            auto *state=calls?&dx.skinnedCacheVbPool[calls-1]:&dx.dynamicVertexBufferPool[0];
            assert(out==&state->buffer&&!state->used&&state->total==size);
            assert(size==(renderer.current.integer==2?36:64)*(calls?131072:32768));
            if(calls)assert(dx.dynamicVertexBuffer==&dx.dynamicVertexBufferPool[0]);
        } else assert(size==expectedBytes);
        ++calls;
        if(calls==failAt)return -17;
        *out=&vertex;
        if(integrated&&modeSwitch)renderer.current.integer=renderer.current.integer==2?1:2;
        return 7;
    }
    HRESULT CreateIndexBuffer(int size,int usage,int format,int pool,IndexBuffer **out,void *shared) {
        assert(usage==0x208&&format==101&&!pool&&!shared);
        if(integrated) {
            assert(calls==3&&size==2097152&&out==&dx.dynamicIndexBufferPool[0].buffer);
            assert(!dx.dynamicIndexBufferPool[0].used&&dx.dynamicIndexBufferPool[0].total==size);
        } else assert(size==expectedBytes);
        ++calls;if(calls==failAt)return -17;*out=&indices;return 7;
    }
} device;
byte *Reserve(int bytes) {
    assert(integrated&&calls==4&&bytes==10485760);
    assert(dx.dynamicIndexBuffer==&dx.dynamicIndexBufferPool[0]);++reserves;
    return (byte*)0x1234;
}
struct {byte *(*Z_VirtualReserveInternal)(int);} ri={Reserve};
const char *DXGetErrorDescription9(HRESULT result) {assert(result==-17);return "device failure";}
char *va(const char *format,...) {
    static char buffer[256];va_list args;va_start(args,format);
    vsnprintf(buffer,sizeof(buffer),format,args);va_end(args);return buffer;
}
void R_FatalInitError(const char *message) {
    char expected[256];snprintf(expected,sizeof(expected),"Couldn't create a %i-byte dynamic %s buffer: device failure",expectedBytes,expectedKind);
    assert(!strcmp(message,expected));throw std::runtime_error(message);
}
'''+source+r'''
int main() {
    dx.device=&device;int cases=0;
    for(int kind=0;kind<2;++kind)for(int bytes:{0,1,65536,2097152})for(int failure=0;failure<2;++failure) {
        integrated=false;calls=0;failAt=failure?1:0;expectedBytes=bytes;expectedKind=kind?"index":"vertex";
        r_vb_state_t vb={19,23,0};r_ib_state_t ib={29,31,0};bool threw=false;
        try {if(kind)R_CreateDynamicIndexBuffer(&ib,bytes);else R_CreateDynamicVertexBuffer(&vb,bytes);}
        catch(const std::runtime_error&){threw=true;}
        assert(threw==bool(failure)&&calls==1);
        if(kind)assert(!ib.used&&ib.total==bytes&&ib.buffer==(failure?0:&indices));
        else assert(!vb.used&&vb.total==bytes&&vb.buffer==(failure?0:&vertex));++cases;
    }
    for(int initial:{0,1,2,3})for(modeSwitch=0;modeSwitch<2;++modeSwitch) {
        integrated=true;calls=reserves=failAt=0;renderer.current.integer=initial;
        memset(dx.dynamicVertexBufferPool,0x5a,sizeof(dx.dynamicVertexBufferPool));
        memset(dx.skinnedCacheVbPool,0x5a,sizeof(dx.skinnedCacheVbPool));
        memset(dx.dynamicIndexBufferPool,0x5a,sizeof(dx.dynamicIndexBufferPool));
        dx.dynamicVertexBuffer=0;dx.dynamicIndexBuffer=0;dx.tempSkinBuf=0;dx.tempSkinPos=77;
        R_CreateDynamicBuffers();
        assert(calls==4&&reserves==1&&dx.tempSkinBuf==(byte*)0x1234&&dx.tempSkinPos==77);
        for(auto &vb:dx.skinnedCacheVbPool)assert(!vb.used&&vb.buffer==&vertex);
        ++cases;
    }
    printf("PASS: %d actual dynamic buffer routes, errors, sizes, pool ownership, renderer reload and virtual reservation\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_dynamic_buffers_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
