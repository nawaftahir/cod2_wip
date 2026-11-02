"""Actual cache allocation/publication, packed indices, eviction and LRU ownership."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_staticmodelcache.cpp').read_text()
types=(work.parents[0]/'src/opencod2/headers/common_types.h').read_text()
def declaration(name):
    start=types.index(('union ' if name=='static_model_leaf_t' else 'struct ')+name+' {')
    return types[start:types.index('\n};',start)+3]+'\n'
def function(name):
    start=text.index('void '+name+'(');brace=text.index('{',start);end=brace+1;depth=1
    while depth:
        depth+=(text[end]=='{')-(text[end]=='}');end+=1
    return text[start:end]+'\n'
source=text[text.index('static void SMC_FreeCachedSurface_r('):text.index('typedef HRESULT (__stdcall *CacheCreateVertexBufferFn)')]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <vector>
#include <set>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;
struct Material {int marker;};
struct XSurface {byte tileMode;short vertCount,triCount,boneOffset;int (*triIndices)[4];};
struct GfxStaticSurface;
'''+''.join(declaration(name) for name in ['GfxStaticModelSurfaceCached','GfxStaticSurface','static_model_node_list_t','static_model_leaf_t','static_model_node_t','static_model_tree_list_t','static_model_tree_t','static_model_cache_t','SkinStaticModelCachedCmd'])+r'''
struct SkinBuffers {int marker;}g_skinBuffers[1];
static static_model_cache_t s_cache;
struct Frame {int frameCount;}frame;
Frame *frontEndDataOut=&frame;
static unsigned short indexStorage[0x60000+32];
struct {Bool deviceLost;unsigned short *smodelCacheIndices;}dx;
int uploads,expectedModel;
const Material *expectedMaterial;
GfxStaticSurface *expectedSurface;
const XSurface *expectedXsurf;
void R_SkinStaticModelCachedCmd(SkinStaticModelCachedCmd *cmd,SkinBuffers *buffers){
 assert(buffers==&g_skinBuffers[0]&&cmd->smodelIndex==expectedModel&&cmd->material==expectedMaterial);
 assert(cmd->cached->smodelIndex==expectedModel&&cmd->cached->surface==expectedSurface&&cmd->cached->xsurf==expectedXsurf);
 assert(s_cache.stats.allocatedVerts>=32&&s_cache.stats.usedVerts>=cmd->cached->xsurf->vertCount);++uploads;
}
'''+source+function('SMC_ClearCache')+function('R_FlushStaticModelCache')+r'''
void reset(){
 SMC_ClearCache();frame.frameCount=10;dx.deviceLost=0;uploads=0;
 for(auto &index:indexStorage)index=0xdead;
 dx.smodelCacheIndices=indexStorage+16;
 for(unsigned i=0;i<0x60000;++i)dx.smodelCacheIndices[i]=0xcccc;
}
void guards(){for(int i=0;i<16;++i){assert(indexStorage[i]==0xdead);assert(indexStorage[0x60010+i]==0xdead);}}
int main(){
 static_assert(sizeof(static_model_tree_t)==392&&sizeof(static_model_cache_t)==0xc438,"actual PC cache");
 alignas(4) unsigned short triangles[48];for(int i=0;i<48;++i)triangles[i]=(i*7+3)%31;
 XSurface xsurf={};xsurf.triIndices=(int(*)[4])triangles;
 int cases=0;
 for(int base:{0,32,65504})for(int count:{2,3,4,16}){
  reset();xsurf.triCount=count;GfxStaticModelSurfaceCached cached={base,0,&xsurf,0};
  R_CopyCachedSurfaceIndices(&cached);
  unsigned copied=(count/2)*6,start=base*6;
  for(unsigned i=0;i<copied;++i)assert(dx.smodelCacheIndices[start+i]==base+triangles[i]);
  assert(dx.smodelCacheIndices[start+copied]==0xcccc);if(start)assert(dx.smodelCacheIndices[start-1]==0xcccc);
  guards();++cases;
 }
 Material material={37};expectedMaterial=&material;expectedModel=23;expectedXsurf=&xsurf;
 for(int vertices:{1,31,32,33,63,64,65,127,128,129,255,256,257,511,512}){
  reset();GfxStaticSurface surface={};expectedSurface=&surface;xsurf.vertCount=vertices;xsurf.triCount=2;
  auto *cached=R_CacheStaticModelSurface(&surface,&xsurf,expectedModel,&material);assert(cached&&uploads==1);
  int block=32;while(block<vertices)block*=2;
  assert(cached->baseVertIndex%block==0&&cached->baseVertIndex>=0&&cached->baseVertIndex+block<=65536);
  assert(s_cache.stats.allocatedVerts==block&&s_cache.stats.usedVerts==vertices);
  auto *tree=&s_cache.trees[((byte*)cached-(byte*)&s_cache)/392];assert(tree->nodes[0].usedVerts==block);
  assert(tree->frameCount==0);R_UsedCachedStaticModelSurface(cached);
  assert(tree->frameCount==10&&s_cache.usedlist.next==(intptr_t)tree&&tree->usedlist.prev==(intptr_t)&s_cache.usedlist);
  assert(((static_model_tree_list_t*)tree->usedlist.next)->prev==(intptr_t)tree);
  guards();++cases;
 }
 for(int lost:{0,1}){
  reset();dx.deviceLost=lost;xsurf.vertCount=lost?32:513;xsurf.triCount=2;GfxStaticSurface surface={};expectedSurface=&surface;
  static_model_cache_t before=s_cache;
  assert(!R_CacheStaticModelSurface(&surface,&xsurf,23,&material)&&!uploads&&!memcmp(&before,&s_cache,sizeof(before)));
  ++cases;
 }
 reset();GfxStaticSurface surfaces[129]={};GfxStaticModelSurfaceCached *cached[129]={};
 xsurf.vertCount=512;xsurf.triCount=2;std::set<int> bases;
 for(int i=0;i<128;++i){
  expectedSurface=&surfaces[i];cached[i]=R_CacheStaticModelSurface(&surfaces[i],&xsurf,23,&material);
  assert(cached[i]&&bases.insert(cached[i]->baseVertIndex).second);
  surfaces[i].cachedLods[0]=cached[i];R_UsedCachedStaticModelSurface(cached[i]);
 }
 assert(uploads==128&&s_cache.stats.allocatedVerts==65536&&s_cache.stats.usedVerts==65536);
 expectedSurface=&surfaces[128];
 assert(!R_CacheStaticModelSurface(expectedSurface,&xsurf,23,&material));frame.frameCount=12;
 assert(!R_CacheStaticModelSurface(expectedSurface,&xsurf,23,&material)&&uploads==128);
 frame.frameCount=13;cached[128]=R_CacheStaticModelSurface(expectedSurface,&xsurf,23,&material);
 assert(cached[128]==cached[0]&&!surfaces[0].cachedLods[0]&&uploads==129);
 surfaces[128].cachedLods[0]=cached[128];R_UsedCachedStaticModelSurface(cached[128]);
 assert(s_cache.stats.allocatedVerts==65536&&s_cache.stats.usedVerts==65536);
 auto *tree=&s_cache.trees[((byte*)cached[128]-(byte*)&s_cache)/392];assert(tree->frameCount==13&&s_cache.usedlist.next==(intptr_t)tree);
 R_FlushStaticModelCache();assert(!s_cache.stats.allocatedVerts&&!s_cache.stats.usedVerts);
 for(auto &surface:surfaces)assert(!surface.cachedLods[0]);guards();
 assert(cases==29);
 puts("PASS: actual cache allocation/publication, 29 size/index/failure routes, 128-tree capacity, frame-age eviction, back references, LRU and buffer guards");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cache_publication_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
