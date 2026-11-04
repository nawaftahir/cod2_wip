"""Actual static-model cache allocation: captured size, live device, retries and logs."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_staticmodelcache.cpp').read_text()
source = text[text.index('typedef HRESULT (__stdcall *CacheCreateVertexBufferFn)'):text.index('void SMC_ClearCache()')]
retail = pefile.PE(str(retail_anchor()))
log = retail.get_string_at_rva(0x197480).decode()
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#define __stdcall __attribute__((stdcall))
typedef int HRESULT;typedef unsigned UINT;typedef unsigned DWORD;
struct IDirect3DVertexBuffer9 {} buffer;
struct Device {void **vtable;} devices[2];
struct {Device *device;IDirect3DVertexBuffer9 *smodelCacheVb;int untouched;} dx;
struct {struct {int integer;} current;} renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
int alwaysfails,calls,logs,repeats,initial,failure;
const char *expectedLog=EXPECTED_LOG;
void RB_LogPrint(const char *message) {
    assert(!strcmp(message,expectedLog)&&logs==calls);++logs;
    renderer.current.integer=renderer.current.integer==2?1:2;
    dx.device=&devices[logs&1];
}
HRESULT __stdcall Create(void *self,UINT bytes,DWORD usage,DWORD fvf,int pool,IDirect3DVertexBuffer9 **out,void *shared) {
    assert(self==dx.device&&self==&devices[logs&1]);
    assert(logs==calls+1&&bytes==unsigned((initial==2?36:64)*65536));
    assert(usage==0x208&&!fvf&&!pool&&!shared&&out==&dx.smodelCacheVb);
    *out=&buffer;++calls;alwaysfails=calls<repeats;
    return failure?-7:0;
}
''' .replace('EXPECTED_LOG', __import__('json').dumps(log)) + source + r'''
int main() {
    void *table[27]={};table[26]=(void *)Create;
    for(auto &device:devices)device.vtable=table;
    int cases=0;
    for(initial=0;initial<4;++initial)for(repeats=1;repeats<=3;++repeats)for(failure=0;failure<2;++failure) {
        renderer.current.integer=initial;alwaysfails=calls=logs=0;
        dx.device=&devices[0];dx.smodelCacheVb=0;dx.untouched=79;
        R_CreateSmodelCacheVertexBuffer();
        assert(calls==repeats&&logs==repeats&&dx.smodelCacheVb==&buffer&&dx.untouched==79);++cases;
    }
    printf("PASS: %d cache allocations, original log/slot/flags, captured size, live device, retries and ignored HRESULTs\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cache_vertex_buffer_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
