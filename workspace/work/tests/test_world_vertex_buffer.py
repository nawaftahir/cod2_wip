"""Exercise the actual world-buffer uploader with recording buffer services."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_bsp.cpp').read_text()
start = text.index('IDirect3DVertexBuffer9 *R_CreateWorldVertexBuffer(')
source = text[start:text.index('\n}', start) + 2]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <vector>
typedef unsigned char byte;
typedef float vec3_t[3],vec2_t[2];
union GfxColor { unsigned packed;byte array[4]; };
struct GfxWorldVertex {
 vec3_t xyz,normal;GfxColor color;vec2_t texCoord,lmapCoord;vec3_t binormal,tangent;
};
struct GfxWorldVertexDx7 { vec3_t xyz;GfxColor color;vec2_t texCoord,lmapCoord; };
static_assert(sizeof(GfxWorldVertex)==68&&sizeof(GfxWorldVertexDx7)==32,"PC strides");
static_assert(offsetof(GfxWorldVertex,color)==24&&offsetof(GfxWorldVertex,lmapCoord)==36,"PC fields");
struct IDirect3DVertexBuffer9 {} buffer;
struct { struct { int integer; } current; } renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
std::vector<byte> storage;int requested,allocations,unlocks,copies;
void VectorCopy(const float *a,float *b) { for(int i=0;i<3;++i)b[i]=a[i]; }
void Vector2Copy(const float *a,float *b) { for(int i=0;i<2;++i)b[i]=a[i]; }
void Com_Memcpy(void *dst,const void *src,int count) {
 ++copies;assert(dst==storage.data()+16&&count==requested);std::memcpy(dst,src,count);
}
void *R_AllocStaticVertexBuffer(IDirect3DVertexBuffer9 **out,int size) {
 ++allocations;requested=size;storage.assign(size+32,0xa5);*out=&buffer;return storage.data()+16;
}
void R_FinishStaticVertexBuffer(void *vb) { assert(vb==&buffer);++unlocks; }
''' + source + r'''
int main() {
 for(int mode=0;mode<4;++mode)for(int count=0;count<=17;++count) {
  renderer.current.integer=mode;allocations=unlocks=copies=0;
  std::vector<GfxWorldVertex> input(count+1);
  for(int v=0;v<=count;++v) {
   auto &s=input[v];for(int i=0;i<3;++i) {
    s.xyz[i]=v*100+i+.25f;s.normal[i]=-v-i-.5f;
    s.binormal[i]=v+i+11.f;s.tangent[i]=v+i+21.f;
   }
   s.color.packed=0x12345600u+v;
   for(int i=0;i<2;++i) {s.texCoord[i]=v+i+.5f;s.lmapCoord[i]=-v-i-.75f;}
  }
  auto before=input;
  assert(R_CreateWorldVertexBuffer(input.data(),count)==&buffer);
  assert(allocations==1&&unlocks==1&&requested==count*(mode==2?32:68));
  assert(copies==(mode!=2));
  assert(!std::memcmp(before.data(),input.data(),input.size()*sizeof(input[0])));
  for(int i=0;i<16;++i)assert(storage[i]==0xa5&&storage[16+requested+i]==0xa5);
  if(mode!=2)assert(!std::memcmp(storage.data()+16,input.data(),requested));
  else for(int v=0;v<count;++v) {
   GfxWorldVertexDx7 expected;auto &s=input[v];
   std::memcpy(expected.xyz,s.xyz,12);expected.color=s.color;
   std::memcpy(expected.texCoord,s.texCoord,8);std::memcpy(expected.lmapCoord,s.lmapCoord,8);
   assert(!std::memcmp(storage.data()+16+v*32,&expected,32));
  }
 }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_world_buffer_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 72 actual world uploads, PC layouts, DX7 conversion, full DX9 copies and guards')
