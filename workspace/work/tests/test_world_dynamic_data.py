"""Run the actual world arrays and outlined model-LOD helper as native32 C++."""
from pathlib import Path
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1] / 'src/gfx_d3d'


def body(file, signature):
    text = (root / file).read_text()
    start = text.index(signature)
    return text[start:text.index('\n}', start) + 2] + '\n'


program = r'''
#include <cassert>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <algorithm>
struct XSurface {} surface;
struct XModel { int lodCount,counts[8]; } models[6];
struct GfxStaticSurface { void *lods[4]; };
struct GfxStaticModelDynamic { int viewCount;GfxStaticSurface *staticSurfs; };
struct GfxSurfaceDynamic { int viewCount; };
struct GfxCullGroupDynamic { int viewCount; };
struct GfxStaticModelInstance { XModel *model; } instances[6];
struct GfxWorld {
 int smodelCount,surfaceCount,cullGroupCount;GfxStaticModelInstance *smodelInsts;
} world;
struct {
 GfxStaticModelDynamic *smodelDyncs;GfxSurfaceDynamic *surfaces;GfxCullGroupDynamic *cullGroups;
} rg;
struct { GfxWorld *world; } rgp={&world};
struct Block { unsigned char *raw;int size,align; };
std::vector<Block> blocks;
std::vector<int> lodCalls,modelCalls;
int lodCounts,scratchBits;
XSurface *surfaceList[1]={&surface};
int getLods(const XModel *model) { ++lodCounts;return model->lodCount; }
int getSurfaces(const XModel *model,XSurface ***out,int lod,int **bits) {
 assert(lod>=0&&lod<model->lodCount);*out=surfaceList;*bits=&scratchBits;
 lodCalls.push_back(lod);modelCalls.push_back(model-models);return model->counts[lod];
}
void *allocate(int size,int align) {
 assert(size>=0);auto raw=(unsigned char*)std::malloc(size+32);assert(raw);
 std::memset(raw,0xa5,size+32);blocks.push_back({raw,size,align});return raw+16;
}
void *allocatePlain(int size) { return allocate(size,0); }
void *allocateAligned(int size,int align) { assert(align==4);return allocate(size,align); }
struct {
 int (*XModelGetNumLods)(const XModel *);
 int (*XModelGetSurfaces)(const XModel *,XSurface ***,int,int **);
 void *(*Hunk_AllocInternal)(int);void *(*Hunk_AllocAlignInternal)(int,int);
} ri={getLods,getSurfaces,allocatePlain,allocateAligned};
static_assert(sizeof(GfxStaticModelDynamic)==8&&sizeof(GfxStaticSurface)==16,"PC strides");
'''
program += body('r_staticmodel_load_obj.cpp', 'int R_GetMaxModelSurfaceCount(')
program += body('r_bsp.cpp', 'void R_InitWorldDynamicData()')
program += r'''
int main() {
 for(int lods=-2;lods<=8;++lods) {
  models[0].lodCount=lods;int expected=0;
  for(int i=0;i<8;++i)models[0].counts[i]=(i*7)%13-2;
  for(int i=0;i<lods;++i)expected=std::max(expected,models[0].counts[i]);
  lodCounts=0;lodCalls.clear();modelCalls.clear();
  assert(R_GetMaxModelSurfaceCount(models)==expected&&lodCounts==1);
  assert(lodCalls.size()==(unsigned)std::max(lods,0));
 }
 int cases=0;
 for(int count=0;count<=6;++count)for(int pattern=0;pattern<16;++pattern) {
  world={count,pattern%8,pattern%6,instances};int expected[6];
  for(int i=0;i<count;++i) {
   instances[i].model=&models[i];models[i].lodCount=(pattern+i)%9;expected[i]=0;
   for(int j=0;j<8;++j)models[i].counts[j]=(pattern+3*i+j)%11-2;
   for(int j=0;j<models[i].lodCount;++j)expected[i]=std::max(expected[i],models[i].counts[j]);
  }
  lodCounts=0;lodCalls.clear();modelCalls.clear();R_InitWorldDynamicData();
  assert(blocks.size()==unsigned(3+count)&&lodCounts==count);
  assert(blocks[0].size==8*count&&blocks[1].size==4*world.surfaceCount
      &&blocks[2].size==4*world.cullGroupCount);
  assert((void*)rg.smodelDyncs==blocks[0].raw+16&&(void*)rg.surfaces==blocks[1].raw+16
      &&(void*)rg.cullGroups==blocks[2].raw+16);
  unsigned call=0;
  for(int i=0;i<count;++i) {
   assert(blocks[i+3].size==16*expected[i]&&blocks[i+3].align==4);
   assert((unsigned)rg.smodelDyncs[i].viewCount==0xa5a5a5a5u);
   assert((void*)rg.smodelDyncs[i].staticSurfs==blocks[i+3].raw+16);
   for(int j=0;j<blocks[i+3].size;++j)assert(blocks[i+3].raw[16+j]==0);
   for(int j=0;j<models[i].lodCount;++j,++call)assert(modelCalls[call]==i&&lodCalls[call]==j);
  }
  assert(call==lodCalls.size());
  for(unsigned i=0;i<blocks.size();++i) {
   auto &b=blocks[i];for(int j=0;j<16;++j)assert(b.raw[j]==0xa5&&b.raw[16+b.size+j]==0xa5);
   if(i==1||i==2)for(int j=0;j<b.size;++j)assert(b.raw[16+j]==0xa5);
   std::free(b.raw);
  }
  blocks.clear();++cases;
 }
 assert(cases==112);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_world_dynamic_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 112 world-array initializations, 11 LOD bounds, allocation order/strides, untouched fields and guards')
