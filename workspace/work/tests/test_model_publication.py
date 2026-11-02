"""Actual model caller publication, atomic state, capacities and command payloads."""
from pathlib import Path
import subprocess,tempfile
work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_model.cpp').read_text()
source=text[text.index('extern const dvar_t *r_xdebug;'):]
program=r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdint>
#include <initializer_list>
typedef unsigned char byte;typedef int surfaceType_t;typedef int qboolean;
struct DObj {int id;};struct XModel {int id;};struct XSurface {int id;};struct Material {int id;};
struct DObjAnimMat {float data[8];};
struct GfxEntity {int reType;float origin[3],scale;};
struct GfxSceneEntity {union {const DObj *obj;const XModel *model;} u;int cullState,surfCount;
 const Material **materials;surfaceType_t *surfs;};
struct DSurface_s {short modelIndex,subMatIndex;};
struct SkinRigidXModelCmd {surfaceType_t *surfs;int surfCount;GfxEntity *e;DObjAnimMat mat;};
struct SkinXModelCmd {surfaceType_t *surfs;GfxEntity *e;const DObjAnimMat *mat;int surfacePartBits[4];
 byte surfCount,boneCount,matOffset[64];};
struct {int sceneEntMaterialCount;const Material *sceneMaterials[4096];} scene;
struct GfxBackEndData {int frameCount,surfPos;byte surfsBuffer[0x20000];} frame;
GfxBackEndData *frontEndDataOut=&frame;
struct dvar_t {struct {int integer;} current;};
dvar_t dev={},debug={};const dvar_t *developer=&dev,*r_xdebug=&debug;
DObj object={3},defaultObject={4};XModel model={7};XSurface surfaces[64],*surfacePtrs[64];
DObjAnimMat matrices[4];Material material={6};
struct {DObj *modelDObj;} rg={&defaultObject};
int bitWords[4]={0x12345678,0x13579bdf,0x2468ace0,0x76543210};
int count,bones,lod,bad,failIndex,stride,allCached,noBones,expectedSmodel;
int atomicCalls,preCalls,boxes,axes,warnings,setModelCalls,dispatchCalls,rigidCalls,lastType;
GfxSceneEntity entityState;GfxEntity entity;
bool expectStatic;
long InterlockedCompareExchange(long volatile *p,long exchange,long expected){
 assert(exchange==3&&expected==2);++atomicCalls;long old=*p;
 if(old==expected)*p=exchange;else *p=4;return old;
}
long InterlockedExchangeAdd(long *p,long n){long old=*p;*p+=n;return old;}
int getBadDObj(const DObj *p){assert(p==&object);return bad;}
int getBadModel(const XModel *p){assert(p==&model);return bad;}
int getDObjBones(const DObj *p){assert(p==&object);return bones;}
int getModelBones(const XModel *p){assert(p==&model);return bones;}
DObjAnimMat *getBones(const DObj *p){assert(p==&object);return noBones?0:matrices;}
const DObjAnimMat *getBasePose(const XModel *p){assert(p==&model);return matrices;}
int getOffset(const DObj *p,int i){assert(p==&object&&i>=0&&i<3);return 0x102+i;}
void setModel(DObj *p,const XModel *m){assert(p==&defaultObject&&m==&model);++setModelCalls;}
int getLod(const XModel *m,float distance){assert(m==&model&&distance==5);return lod;}
int getSurfaces(const XModel *m,XSurface ***out,int l,int **bits){
 assert(m==&model&&l==lod);*out=surfacePtrs;*bits=bitWords;return count;
}
void print(int channel,const char *fmt,...){assert(channel==2);
 assert(!strcmp(fmt,"MAX_SCENE_MATERIALS exceeded - not drawing surface\n")||!strcmp(fmt,"MAX_SCENE_SURFS_SIZE exceeded - not drawing surface\n"));++warnings;}
struct {int (*DObjBad)(const DObj *);int (*XModelBad)(const XModel *);
 int (*DObjNumBones)(const DObj *);int (*XModelNumBones)(const XModel *);
 DObjAnimMat *(*DObjGetRotTransArray)(const DObj *);const DObjAnimMat *(*XModelGetBasePose)(const XModel *);
 int (*DObjGetMatOffset)(const DObj *,int);void (*DObjSetModel)(DObj *,const XModel *);
 int (*XModelGetLodForDist)(const XModel *,float);int (*XModelGetSurfaces)(const XModel *,XSurface ***,int,int **);
 void (*Printf)(int,const char *,...);} ri={getBadDObj,getBadModel,getDObjBones,getModelBones,getBones,getBasePose,getOffset,setModel,getLod,getSurfaces,print};
float R_GetModelLodDistance(const float *origin,float scale){assert(origin==entity.origin&&scale==entity.scale);return 5;}
int R_GetSurfaceData(const GfxEntity *e,const DObj *o,DSurface_s *out,int *bits,char *lods){
 assert(e==&entity&&o==&object);memcpy(bits,bitWords,16);memset(lods,2,8);
 for(int i=0;i<count;++i){out[i].modelIndex=i%3;out[i].subMatIndex=i;}return count;
}
void R_XModelDebugBoxes(const GfxSceneEntity *s,const GfxEntity *e,const DObj *o){
 assert(o==(expectStatic?&defaultObject:&object)&&e==&entity&&s==&entityState);++boxes;
}
void R_XModelDebugAxes(const GfxSceneEntity *s,const GfxEntity *e,const DObj *o){
 assert(o==(expectStatic?&defaultObject:&object)&&e==&entity&&s==&entityState);++axes;
}
int emit(GfxSceneEntity *s,int index,byte *out){
 assert(s==&entityState&&s->cullState==3&&s->materials==scene.sceneMaterials+5);
 assert(index==preCalls++);if(index==failIndex)return 0;
 memset(out,0x20+index,stride);s->materials[index]=&material;return stride;
}
int R_PreSkinXSurface(GfxSceneEntity *s,const DObj *o,const DSurface_s *d,int index,const char *lods,byte *out){
 assert(!expectStatic&&o==&object&&d->modelIndex==index%3&&d->subMatIndex==index&&lods[index%3]==2);return emit(s,index,out);
}
int R_PreSkinStaticSurface(GfxSceneEntity *s,GfxEntity *e,int smodel,const XModel *m,XSurface *x,int index,int l,qboolean *need,byte *out){
 assert(expectStatic&&e==&entity&&smodel==expectedSmodel&&m==&model&&x==&surfaces[index]&&l==lod);
 int bytes=emit(s,index,out);if(bytes&&!allCached)*need=1;return bytes;
}
void checkPublication(){
 assert(entityState.cullState==3&&entityState.surfCount==count);
 assert((byte *)entityState.surfs==frame.surfsBuffer+16);
 for(int i=0;i<count;++i)for(int b=0;b<stride;++b)assert(frame.surfsBuffer[16+i*stride+b]==0x20+i);
}
void R_SkinRigidXModelCmd(SkinRigidXModelCmd *c){
 ++rigidCalls;checkPublication();assert(c->surfs==entityState.surfs&&c->surfCount==count&&c->e==&entity);
 assert(!memcmp(&c->mat,matrices,32));
}
void R_AddFrontendCmd(int type,void *data){
 ++dispatchCalls;lastType=type;checkPublication();
 if(type==2){R_SkinRigidXModelCmd((SkinRigidXModelCmd *)data);return;}
 assert(type==(count>10?7:6));auto *c=(SkinXModelCmd *)data;
 assert(c->surfs==entityState.surfs&&c->e==&entity&&c->mat==matrices&&c->surfCount==count&&c->boneCount==bones);
 assert(!memcmp(c->surfacePartBits,bitWords,16));
 for(int i=0;i<count;++i)assert(c->matOffset[i]==(expectStatic?0:(byte)(0x102+i%3)));
}
'''+source+r'''
int cases=0;
void reset(bool stat){
 expectStatic=stat;memset(&scene,0,sizeof(scene));scene.sceneEntMaterialCount=5;
 memset(frame.surfsBuffer,0xcc,sizeof(frame.surfsBuffer));frame.surfPos=16;++frame.frameCount;
 memset(&entityState,0,sizeof(entityState));entityState.cullState=2;
 if(stat)entityState.u.model=&model;else entityState.u.obj=&object;
 entity.scale=1;atomicCalls=preCalls=boxes=axes=warnings=setModelCalls=dispatchCalls=rigidCalls=0;
 expectedSmodel=9;count=3;bones=3;lod=2;bad=allCached=noBones=0;failIndex=-1;stride=16;
 dev.current.integer=debug.current.integer=0;
}
void run(){++cases;if(expectStatic)R_SkinStaticModel(&entityState,&entity,9);else R_SkinSceneDObj(&entityState,&entity);}
int main(){
 assert(sizeof(void *)==4&&sizeof(long)==4);
 for(int i=0;i<64;++i){surfaces[i].id=i;surfacePtrs[i]=surfaces+i;}
 for(int i=0;i<32;++i)((byte *)matrices)[i]=(byte)(i+11);
 for(bool stat:{false,true}){
  for(int n:{1,10,11,64})for(int boneCount:{1,3})for(int bytes:{16,56})for(int flags:{0,1,2,3}){
   reset(stat);count=n;bones=boneCount;stride=bytes;debug.current.integer=flags;run();
   assert(entityState.cullState==4&&preCalls==count&&scene.sceneEntMaterialCount==5+count);
   assert(frame.surfPos==16+count*stride&&boxes==!!(flags&1)&&axes==!!(flags&2));
   assert(dispatchCalls==(stat&&bones==1?0:1)&&rigidCalls==(bones==1));
   assert(setModelCalls==(stat&&flags?1:0));
   assert(frame.surfsBuffer[15]==0xcc&&frame.surfsBuffer[16+count*stride]==0xcc);
  }
  reset(stat);entityState.cullState=4;run();assert(!atomicCalls&&!preCalls&&!dispatchCalls);
  reset(stat);entityState.cullState=3;run();assert(atomicCalls==1&&!preCalls&&!dispatchCalls);
  for(int developerValue:{0,1}){reset(stat);bad=1;dev.current.integer=developerValue;run();
   assert(entityState.cullState==4&&!preCalls&&!dispatchCalls&&boxes==developerValue&&axes==developerValue);}
  reset(stat);count=0;run();assert(entityState.cullState==4&&!preCalls&&!dispatchCalls);
  reset(stat);scene.sceneEntMaterialCount=4095;run();assert(entityState.cullState==4&&scene.sceneEntMaterialCount==4096&&warnings==1&&!preCalls);
  entityState.cullState=2;run();assert(warnings==1);++frame.frameCount;entityState.cullState=2;run();assert(warnings==2);
  reset(stat);frame.surfPos=0x20000-16;run();assert(entityState.cullState==4&&frame.surfPos==0x20000&&warnings==1&&!dispatchCalls);
  for(int fail:{0,2}){reset(stat);failIndex=fail;run();assert(entityState.cullState==4&&frame.surfPos==16&&!dispatchCalls&&preCalls==fail+1);}
 }
 reset(false);noBones=1;run();assert(entityState.cullState==4&&!preCalls&&!dispatchCalls);
 reset(true);lod=-1;run();assert(entityState.cullState==4&&!preCalls&&!dispatchCalls);
 reset(true);allCached=1;run();assert(entityState.cullState==4&&entityState.surfCount==3&&!dispatchCalls&&!rigidCalls);
 reset(true);entity.reType=1;expectedSmodel=-1;R_SkinSceneEnt(&entityState,&entity);++cases;
 assert(entityState.cullState==4&&preCalls==3&&dispatchCalls==1);
 reset(false);entity.reType=0;R_SkinSceneEnt(&entityState,&entity);++cases;
 assert(entityState.cullState==4&&preCalls==3&&dispatchCalls==1);
 printf("PASS: %d model caller routes, atomic state, materials, capacities, packed publication, debug and command payloads\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    p=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';p.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(p),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
