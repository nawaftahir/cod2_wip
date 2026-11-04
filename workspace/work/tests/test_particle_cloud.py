"""Actual particle-cloud geometry, RNG order, buffer ownership and retail failure behavior."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
from fragment import fragment
import subprocess
import tempfile
import struct
import pefile

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(retail_anchor()))
for address, value in [(0x1019be48,1.0/32767),(0x1019bdc8,.25),(0x1019bdac,.125),(0x1019bc78,1.0)]:
    assert retail.get_data(address-0x10000000,4) == struct.pack('<f',value)
text = fragment('gfx_d3d/r_dxbuffers.cpp')
source = text[text.index('struct ParticleCloudVertex'):text.index('// PINNED 10011e60:')]
buffers = (work / 'src/gfx_d3d/r_buffers.cpp').read_text()
start = buffers.index('void *R_AllocStaticIndexBuffer(')
allocator = buffers[start:buffers.index('\n}', start) + 2]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <csignal>
#include <sys/resource.h>
#include <sys/wait.h>
#include <unistd.h>
typedef long HRESULT;
enum {D3DUSAGE_WRITEONLY=8,D3DFMT_INDEX16=101,D3DPOOL_DEFAULT=0};
int phase,randomCalls,failure,released,pattern;
struct IDirect3DVertexBuffer9 {} vertexBuffer;
struct Vertex {float xyz[3],uv[2];};
struct {unsigned int before;Vertex data[4096];unsigned int after;} vertexStorage;
struct {unsigned int before;unsigned short data[6144];unsigned int after;} indexStorage;
struct IDirect3DIndexBuffer9 {
    HRESULT Lock(int offset,int size,void **data,int flags) {
        assert(phase++==2&&!offset&&!size&&!flags);
        if(failure==2)return -7;*data=indexStorage.data;return 7;
    }
    unsigned long Release() {assert(failure==2&&phase++==3);++released;return 0;}
} indexBuffer;
struct Device {
    HRESULT CreateIndexBuffer(int size,int usage,int format,int pool,IDirect3DIndexBuffer9 **out,void *shared);
} device;
struct {Device *device;IDirect3DVertexBuffer9 *particleCloudVertexBuffer;IDirect3DIndexBuffer9 *particleCloudIndexBuffer;} dx;
HRESULT Device::CreateIndexBuffer(int size,int usage,int format,int pool,IDirect3DIndexBuffer9 **out,void *shared) {
    assert(phase++==1&&size==12288&&usage==8&&format==101&&!pool&&!shared);
    assert(out==&dx.particleCloudIndexBuffer);
    if(failure==1)return -5;*out=&indexBuffer;return 7;
}
void *R_AllocStaticVertexBuffer(void **out,int size) {
    assert(phase++==0&&size==81920&&out==(void **)&dx.particleCloudVertexBuffer);
    *out=&vertexBuffer;return vertexStorage.data;
}
void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *buffer) {
    assert(!failure&&phase++==3&&randomCalls==3072&&buffer==&indexBuffer);
}
void R_FinishStaticVertexBuffer(void *buffer) {assert(!failure&&phase++==4&&buffer==&vertexBuffer);}
int randomValue(int call) {return pattern==0?0:pattern==1?32767:(call*97+31)&32767;}
int FakeRand() {return randomValue(randomCalls++);}
#define rand FakeRand
'''+allocator+'\n'+source+r'''
void reset() {
    phase=randomCalls=released=0;dx.device=&device;
    dx.particleCloudVertexBuffer=0;dx.particleCloudIndexBuffer=0;
    memset(&vertexStorage,0x5a,sizeof(vertexStorage));memset(&indexStorage,0x6b,sizeof(indexStorage));
}
int main() {
    static_assert(sizeof(Vertex)==20&&sizeof(ParticleCloudVertex)==20,"primary vertex stride");
    failure=0;
    for(pattern=0;pattern<3;++pattern) {
        reset();R_CreateParticleCloudBuffer();assert(phase==5&&randomCalls==3072&&!released);
        const float uv[4][2]={{0,0},{0,1},{1,0},{1,1}};const int idx[6]={0,1,2,2,1,3};
        for(int particle=0;particle<1024;++particle) {
            int coords[3]={particle/128,particle/16%8,particle%16};
            for(int corner=0;corner<4;++corner) {
                auto &vertex=vertexStorage.data[particle*4+corner];
                for(int axis=0;axis<3;++axis) {
                    double expected=(coords[axis]+randomValue(particle*3+axis)/32767.0)*(axis==2?.125:.25)-1;
                    assert(fabs(vertex.xyz[axis]-expected)<2e-7);
                }
                assert(!memcmp(vertex.uv,uv[corner],sizeof(vertex.uv)));
            }
            for(int index=0;index<6;++index)assert(indexStorage.data[particle*6+index]==particle*4+idx[index]);
        }
        assert(vertexStorage.before==0x5a5a5a5a&&vertexStorage.after==0x5a5a5a5a);
        assert(indexStorage.before==0x6b6b6b6b&&indexStorage.after==0x6b6b6b6b);
    }
    rlimit limits={0,0};assert(!setrlimit(RLIMIT_CORE,&limits));
    for(failure=1;failure<=2;++failure) {
        pid_t child=fork();assert(child>=0);
        if(!child){reset();R_CreateParticleCloudBuffer();_exit(99);}
        int status;assert(waitpid(child,&status,0)==child);
        assert(WIFSIGNALED(status)&&WTERMSIG(status)==SIGSEGV);
    }
    puts("PASS: three full 1024-particle buffers, all vertices/UVs/indices, RNG order, guards and two preserved retail failure faults");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_particle_cloud_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
