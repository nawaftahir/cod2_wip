"""Run actual pre-skin source across material, cache, rigid and fallback paths."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work/'src/gfx_d3d/r_model.cpp').read_text()
source = text[text.index('static int R_PreSkinXSurface('):text.index('// PINNED PC model scene publication, 1001f6f0/1001fa70.')]
program = r'''
#include <cassert>
#include <cstdint>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <vector>
typedef unsigned char byte;
typedef int qboolean;
typedef int surfaceType_t;
struct MaterialPassDx7 { void *stateMap;byte gridLighting; };
struct MaterialTechnique { const char *name;unsigned short flags,passCount;
 union { MaterialPassDx7 dx7[1]; } passArray; };
struct MaterialTechniqueSet { const char *name;MaterialTechnique *techniques[34]; };
struct Material { int id;MaterialTechniqueSet *techniqueSet; };
typedef const Material *MaterialHandle;
struct trXSkin_t {};
struct XModel {int id;};
struct DObj {int id;};
struct DSurface_s {short modelIndex,subMatIndex;};
struct XSurface {byte tileMode;short vertCount,triCount,boneOffset;void *indices,*verts;
 struct {void *vb;} surfRigid;void *indexBuffer;};
struct GfxEntity {int reType;};
struct GfxSceneEntity {const Material **materials;};
struct GfxModelSurface {surfaceType_t surfType;XSurface *xsurf;};
struct GfxModelRigidSurface {GfxModelSurface surf;float boneAxis[4][3];};
struct GfxModelSkinnedSurface {GfxModelSurface surf;int skinnedCachedOffset;
 union {void *variant;} skinnedVert;};
struct GfxStaticModelSurfaceCached {int marker;};
struct GfxStaticSurface {GfxStaticModelSurfaceCached *cachedLods[4];};
struct GfxStaticModelCachedSurface {GfxModelSurface surf;GfxStaticModelSurfaceCached *surface;GfxEntity *ent;};
struct GfxStaticModelDynamic {int viewCount;GfxStaticSurface *staticSurfs;};
struct {GfxStaticModelDynamic *smodelDyncs;} rg;
struct {byte *skinnedCacheLockAddr,*tempSkinBuf;int tempSkinPos;} dx;
struct CacheVb {int used;};
struct GfxBackEndData {int frameCount;CacheVb *skinnedCacheVb;} frame;
GfxBackEndData *frontEndDataOut=&frame;
struct dvar_t {union {int integer;bool enabled;} current;};
dvar_t renderer={},skincache={},smc={};
const dvar_t *r_rendererInUse=&renderer,*r_skinCache=&skincache,*r_smc_enable=&smc;
XModel models[3]={{0},{1},{2}};
DObj obj={9};
Material materials[3][4][3];
const Material *skinRows[3][4][3],**skinTables[3][4];
XSurface surface;
bool skinsMissing,cacheFails;
int getModelCalls,getSurfaceCalls,allocCalls,commitCalls,warnings,cacheCalls,usedCalls;
int allocResult,expectedModel,expectedSub,expectedLod,lastSize,lastVertices;
void *lastCommit;
GfxStaticModelSurfaceCached cacheRecord={7};
XModel *getModel(const DObj *o,int index){assert(o==&obj&&index==expectedModel);++getModelCalls;return &models[index];}
const trXSkin_t *getSkins(const XModel *m){return skinsMissing?0:(const trXSkin_t *)skinTables[m->id];}
XSurface *getSurface(const DObj *o,int model,int sub,int lod){
 assert(o==&obj&&model==expectedModel&&sub==expectedSub&&lod==expectedLod);
 ++getSurfaceCalls;return &surface;
}
void commit(void *p,int n){++commitCalls;lastCommit=p;lastSize=n;}
void print(int channel,const char *fmt,...){assert(channel==2);assert(!strcmp(fmt,"TEMP_SKIN_BUF_SIZE exceeded - not skinning surface\n"));++warnings;}
struct {XModel *(*DObjGetModel)(const DObj *,int);const trXSkin_t *(*XModelGetSkins)(const XModel *);
 XSurface *(*DObjGetSurface)(const DObj *,int,int,int);void (*Z_VirtualCommitInternal)(void *,int);
 void (*Printf)(int,const char *,...);} ri={getModel,getSkins,getSurface,commit,print};
int R_AllocSkinnedCachedVerts(int count){++allocCalls;lastVertices=count;return allocResult;}
GfxStaticModelSurfaceCached *R_CacheStaticModelSurface(GfxStaticSurface *s,const XSurface *x,int index,const Material *mat){
 assert(index==1&&s==rg.smodelDyncs[1].staticSurfs+expectedSub&&x==&surface);
 assert(mat==skinRows[1][expectedLod][expectedSub]);++cacheCalls;return cacheFails?0:&cacheRecord;
}
void R_UsedCachedStaticModelSurface(GfxStaticModelSurfaceCached *s){assert(s==&cacheRecord);++usedCalls;}
'''+source+r'''
std::vector<byte> temp(0xa00000);
GfxStaticSurface staticSurfaces[3][3];
GfxStaticModelDynamic dynamics[3];
MaterialTechnique technique;
MaterialTechniqueSet techniqueSet;
const Material *outMaterials[5];
GfxSceneEntity scene={outMaterials};
GfxEntity entity;
DSurface_s descriptor={1,2};
char lods[3]={0,3,0};
byte output[64];
int cases=0;
void reset(){
 memset(output,0xcc,sizeof(output));memset(outMaterials,0,sizeof(outMaterials));
 memset(staticSurfaces,0,sizeof(staticSurfaces));
 memset(&surface,0,sizeof(surface));surface.vertCount=7;surface.boneOffset=0;
 dx.tempSkinBuf=temp.data();dx.tempSkinPos=32;dx.skinnedCacheLockAddr=temp.data();
 static CacheVb vb={64};vb.used=64;frame.skinnedCacheVb=&vb;
 ++frame.frameCount;skincache.current.integer=smc.current.integer=0;
 renderer.current.integer=0;skinsMissing=cacheFails=false;
 getModelCalls=getSurfaceCalls=allocCalls=commitCalls=warnings=cacheCalls=usedCalls=0;
 allocResult=64;expectedModel=1;expectedSub=2;expectedLod=3;
 entity.reType=2;memset(&techniqueSet,0,sizeof(techniqueSet));
 memset(&technique,0,sizeof(technique));technique.passCount=1;
 technique.passArray.dx7[0].gridLighting=1;techniqueSet.techniques[12]=&technique;
}
int run(bool stat,qboolean &need){
 ++cases;
 return stat?R_PreSkinStaticSurface(&scene,&entity,1,&models[1],&surface,2,3,&need,output)
 :R_PreSkinXSurface(&scene,&obj,&descriptor,2,lods,output);
}
void guards(int count){for(int i=count;i<64;++i)assert(output[i]==0xcc);}
int main(){
 assert(sizeof(void *)==4&&sizeof(GfxModelRigidSurface)==56&&sizeof(GfxModelSkinnedSurface)==16);
 rg.smodelDyncs=dynamics;
 for(int m=0;m<3;++m){dynamics[m].staticSurfs=staticSurfaces[m];
  for(int l=0;l<4;++l){skinTables[m][l]=skinRows[m][l];
   for(int s=0;s<3;++s){materials[m][l][s].id=m*12+l*3+s;
    materials[m][l][s].techniqueSet=&techniqueSet;skinRows[m][l][s]=&materials[m][l][s];}}}
 for(bool stat:{false,true}){
  qboolean need=0;
  reset();skinsMissing=true;assert(run(stat,need)==0&&need==0);guards(0);
  assert(outMaterials[2]==0&&getSurfaceCalls==0&&commitCalls==0);
  reset();surface.surfRigid.vb=&surface;assert(run(stat,need)==56);
  auto *o=(GfxModelSkinnedSurface *)output;
  assert(o->surf.surfType==4&&o->surf.xsurf==&surface&&need==(stat?1:0));guards(8);
  assert(outMaterials[2]==skinRows[1][3][2]&&!allocCalls&&!commitCalls);
  for(int rendererId:{0,1,2})for(int cacheEnabled:{0,1})for(int indexed:{0,1})for(int offset:{-1,64}){
   reset();need=0;renderer.current.integer=rendererId;skincache.current.enabled=cacheEnabled;
   surface.indexBuffer=indexed?&surface:0;allocResult=offset;
   bool cached=cacheEnabled&&indexed&&offset>=0;
   assert(run(stat,need)==16&&need==(stat?1:0));o=(GfxModelSkinnedSurface *)output;
   int bytes=7*(rendererId==2?36:64);
   assert(o->surf.surfType==3&&o->surf.xsurf==&surface);
   assert(allocCalls==(cacheEnabled&&indexed)&&commitCalls==!cached);
   if(cached){assert(o->skinnedCachedOffset==64&&!o->skinnedVert.variant&&dx.tempSkinPos==32);}
   else {assert(o->skinnedCachedOffset==-1&&o->skinnedVert.variant==temp.data()+32);
    assert(lastCommit==temp.data()+32&&lastSize==bytes&&dx.tempSkinPos==32+bytes);}
   guards(16);assert(outMaterials[2]==skinRows[1][3][2]);
  }
  reset();need=0;skincache.current.enabled=true;surface.indexBuffer=&surface;
  dx.skinnedCacheLockAddr=0;frame.skinnedCacheVb->used=0;
  assert(run(stat,need)==16&&allocCalls==1&&commitCalls==1);
  for(int rendererId:{0,2}){
   reset();need=0;renderer.current.integer=rendererId;int bytes=7*(rendererId==2?36:64);
   dx.tempSkinPos=0xa00000-bytes;assert(run(stat,need)==16&&dx.tempSkinPos==0xa00000);
   reset();need=0;renderer.current.integer=rendererId;dx.tempSkinPos=0xa00000-bytes+1;
   assert(run(stat,need)==0&&!commitCalls&&!need&&warnings==1);
   assert(dx.tempSkinPos==0xa00000-bytes+1&&outMaterials[2]==skinRows[1][3][2]);
   assert(run(stat,need)==0&&warnings==1);++frame.frameCount;
   assert(run(stat,need)==0&&warnings==2);
  }
 }
 for(int rendererId:{0,2})for(int enabled:{0,1})for(int type:{1,2})for(int bone:{-1,0})
 for(int passState:{0,1,2,3}){
  reset();qboolean need=0;renderer.current.integer=rendererId;smc.current.enabled=enabled;
  entity.reType=type;surface.boneOffset=bone;
  if(passState==0)techniqueSet.techniques[12]=0;
  if(passState==1)technique.passCount=0;
  if(passState==2)technique.passArray.dx7[0].gridLighting=0;
  bool cached=enabled&&type==2&&bone!=-1&&(rendererId!=2||passState==3);
  assert(run(true,need)==16);assert(cacheCalls==cached&&usedCalls==cached&&need==!cached);
  if(cached){auto *o=(GfxStaticModelCachedSurface *)output;
   assert(o->surf.surfType==5&&o->surf.xsurf==&surface&&o->surface==&cacheRecord&&o->ent==&entity);
   assert(staticSurfaces[1][2].cachedLods[3]==&cacheRecord&&!commitCalls);
   assert(run(true,need)==16&&cacheCalls==1&&usedCalls==2&&need==0);
  }else assert(commitCalls==1&&((GfxModelSurface *)output)->surfType==3);
  guards(16);
 }
 reset();qboolean need=0;smc.current.enabled=true;cacheFails=true;
 assert(run(true,need)==16&&cacheCalls==1&&usedCalls==0&&need==1&&commitCalls==1);
 assert(!staticSurfaces[1][2].cachedLods[3]);
 printf("PASS: %d actual pre-skin calls, PC renderer/cache paths, packed outputs, limits and warning frames\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
