"""Actual uploads: rollover, lock modes, copy bounds, cache and callback mutation."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
source = (work/'src/gfx_d3d/rb_buffer_upload.cpp').read_text()
source = source[source.index('// Both retail upload'):]
retail = pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
for rva,size in [(0x386b0,282),(0x387d0,282)]:
    ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(rva,size),0x10000000+rva)]
    for call in ['0x1005eaf0','dword ptr [0x101d4a1c]']:
        assert ('call',call) in ops
    assert ('push','0x10194030') in ops and ('push','0x10194008') in ops
program = r'''
#include <cassert>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
typedef int HRESULT;typedef unsigned int DWORD;
const int D3DLOCK_NOOVERWRITE=0x1000,D3DLOCK_DISCARD=0x2000;
struct Buffer {
    unsigned char storage[512];int locks,unlocks,offset,bytes,flags,hr;
    HRESULT Lock(int,int,void **,DWORD);
    HRESULT Unlock();
} ib,vb,other;
typedef Buffer IDirect3DIndexBuffer9;typedef Buffer IDirect3DVertexBuffer9;
struct BufferState {int used,total;Buffer *buffer;};
struct {BufferState dynamicIndexBufferPool[1],*dynamicIndexBuffer,*dynamicVertexBuffer;int gpuSync;} dx;
struct {Buffer *indexBuffer;struct {Buffer *vb;int offset,stride;} streams[1];} dxState;
BufferState alternate,indexRedirect,vertex,vertexRedirect;
int alwaysfails,copyCalls,bindCalls,logCalls,repeatUnlock,redirectUnlock,redirectBind,errorMode;
std::vector<std::string> events;
Buffer *active;
HRESULT Buffer::Lock(int o,int b,void **dest,DWORD f) {
    assert(active==this&&b>=0&&b<=256);++locks;offset=o;bytes=b;flags=f;
    *dest=storage+32;events.push_back("lock");return hr;
}
HRESULT Buffer::Unlock() {
    assert(copyCalls==1);++unlocks;events.push_back("unlock");
    alwaysfails=repeatUnlock&&unlocks==1;
    if(redirectUnlock) {
        if(this==&ib)dx.dynamicIndexBuffer=&indexRedirect;
        else dx.dynamicVertexBuffer=&vertexRedirect;
    }
    return -7;
}
void RB_LogPrint(const char *s) {
    assert(!strcmp(s,active==&ib?"dxIb->Unlock()\n":"dxVb->Unlock()\n"));
    ++logCalls;events.push_back("log");
}
#define R_DX_CALL(call) do {RB_LogPrint(#call "\n");call;}while(alwaysfails)
void Com_Memcpy(void *dest,const void *src,int bytes) {
    assert(copyCalls++==0&&dest==active->storage+32&&bytes==active->bytes);
    events.push_back("copy");memcpy(dest,src,bytes);
}
void RB_ChangeIndices(Buffer *buffer) {
    assert(buffer==&ib&&copyCalls==1);++bindCalls;events.push_back("bind");dxState.indexBuffer=buffer;
    if(redirectBind)dx.dynamicIndexBuffer=&indexRedirect;
}
void RB_ChangeStreamSource(int stream,Buffer *buffer,int offset,int stride) {
    assert(stream==0&&buffer==&vb&&copyCalls==1);++bindCalls;events.push_back("bind");
    assert(offset==dx.dynamicVertexBuffer->used);
    dxState.streams[0]={buffer,offset,stride};
    if(redirectBind)dx.dynamicVertexBuffer=&vertexRedirect;
}
void Printf(int channel,const char *format,...) {
    assert(channel==0);va_list args;va_start(args,format);
    if(!strcmp(format,"********** error information:  %s\n"))assert(!strcmp(va_arg(args,const char *),"test error"));
    else assert(!strcmp(format,"********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"));
    va_end(args);events.push_back("print");
}
const char *DXGetErrorDescription9(int result) {assert(result<0);events.push_back("describe");return "test error";}
struct Fatal {};
void FatalError() {events.push_back("fatal");if(errorMode==1)throw Fatal();}
struct {void (*Printf)(int,const char *,...);void (*Sys_DirectXFatalError)();} ri={Printf,FatalError};
''' + source + r'''
unsigned char input[256];
void reset() {
    memset(&ib,0,sizeof(ib));memset(&vb,0,sizeof(vb));
    memset(ib.storage,0x5a,sizeof(ib.storage));memset(vb.storage,0x5a,sizeof(vb.storage));
    dx.dynamicIndexBufferPool[0]={0,64,&ib};alternate={16,64,&ib};indexRedirect={12,64,&other};
    vertex={0,64,&vb};vertexRedirect={20,64,&other};
    dx.dynamicIndexBuffer=dx.dynamicIndexBufferPool;dx.dynamicVertexBuffer=&vertex;
    alwaysfails=copyCalls=bindCalls=logCalls=errorMode=0;
    repeatUnlock=redirectUnlock=redirectBind=0;events.clear();
}
void checkCopy(int bytes) {
    assert(copyCalls==1&&active->unlocks==1+repeatUnlock&&logCalls==active->unlocks);
    assert(events[0]=="lock"&&events[1]=="copy");
    assert(!memcmp(active->storage+32,input,bytes));
    for(int i=0;i<512;++i)if(i<32||i>=32+bytes)assert(active->storage[i]==0x5a);
}
int main() {
    for(int i=0;i<256;++i)input[i]=(unsigned char)(i*37);
    int indexCases=0,vertexCases=0,errorCases=0;
    for(int pool:{0,1})for(int used:{0,2,16,64})for(int count:{0,1,8,32})for(int sync:{0,1})
    for(int cached:{0,1})for(int repeat:{0,1})for(int mutation:{0,1,2}) {
        reset();active=&ib;dx.gpuSync=sync;repeatUnlock=repeat;
        redirectUnlock=mutation==1;redirectBind=mutation==2;
        BufferState *initial=pool?dx.dynamicIndexBufferPool:&alternate;initial->used=used;dx.dynamicIndexBuffer=initial;
        dxState.indexBuffer=cached?&ib:&other;
        bool overflow=used+count*2>64;int offset=overflow||used==0?0:used;
        int result=RB_SetIndexData((const unsigned short *)input,count);
        assert(result==(offset>>1)&&ib.offset==offset&&ib.bytes==count*2);
        assert(ib.flags==(!overflow&&(sync||offset)?0x1000:0x2000));
        assert(bindCalls==!cached);
        int finalStart=mutation==1||(mutation==2&&!cached)?12:offset;
        assert(dx.dynamicIndexBuffer->used==finalStart+count*2);
        checkCopy(count*2);++indexCases;
    }
    for(int used:{0,4,64})for(int count:{0,1,3})for(int stride:{20,36,64})for(int sync:{0,1})
    for(int cache:{0,1,2,3})for(int repeat:{0,1})for(int mutation:{0,1,2}) {
        reset();active=&vb;dx.gpuSync=sync;vertex.used=used;repeatUnlock=repeat;
        redirectUnlock=mutation==1;redirectBind=mutation==2;
        int bindOffset=mutation==1?20:used;
        dxState.streams[0]={cache==1?&other:&vb,bindOffset+(cache==2),stride+(cache==3)};
        RB_SetVertexData(0,input,count,stride);
        assert(vb.offset==used&&vb.bytes==count*stride&&vb.flags==(used?0x1000:0x2000));
        assert(bindCalls==(cache!=0));
        int finalStart=mutation==1||(mutation==2&&cache!=0)?20:used;
        assert(dx.dynamicVertexBuffer->used==finalStart+count*stride);
        checkCopy(count*stride);++vertexCases;
    }
    for(int kind:{0,1})for(int fatalMode:{1,2}) {
        reset();active=kind?&vb:&ib;active->hr=-1;errorMode=fatalMode;
        dxState.indexBuffer=&ib;dxState.streams[0]={&vb,0,36};
        bool threw=false;
        try {if(kind)RB_SetVertexData(0,input,1,36);else RB_SetIndexData((const unsigned short *)input,2);}
        catch(Fatal &) {threw=true;}
        assert(threw==(fatalMode==1));
        assert(events[0]=="lock"&&events[1]=="print"&&events[2]=="describe"&&events[3]=="print"&&events[4]=="fatal");
        assert(copyCalls==(fatalMode==2)&&active->unlocks==(fatalMode==2));++errorCases;
    }
    printf("PASS: %d index uploads, %d vertex uploads and %d lock failures; rollover, exact flags, guards, retries, cache skips and live pointer publication\n",indexCases,vertexCases,errorCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_buffer_upload_') as directory:
    binary = str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
