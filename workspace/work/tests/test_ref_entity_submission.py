"""Actual ref-entity callback, allocator, packed draw key and publication helpers."""
from pathlib import Path
import subprocess
import tempfile
import struct
import pefile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_scene.cpp').read_text()
types=(work.parents[0]/'src/opencod2/headers/common_types.h').read_text()
def declaration(name,kind='struct'):
    start=types.index(kind+' '+name+' {')
    return types[start:types.index('\n};',start)+3]+'\n'
records=declaration('GfxModel','union')+declaration('GfxEntity')+declaration('GfxSceneEntity')+declaration('GfxSceneDef')
allocator=text[text.index('static int R_AllocSceneEntity('):text.index('int R_AddStaticModelToScene(')]
draw=text[text.index('__declspec(noinline) void R_AddDrawSurf('):text.index('// PINNED 10023ed0/')]
token=text[text.index('// PINNED 101a5a2c:'):text.index('// PINNED 101a5a30:')]
source=text[text.index('extern const dvar_t *com_statmon;'):text.index('// PINNED 10024460/70:')]
anchor=pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert anchor.get_data(0x1a5a2c,4)==struct.pack('<I',2)
assert anchor.get_section_by_rva(0x1a5a2c).Name.rstrip(b'\0')==b'.data'
linked=pefile.PE(str(work/'build/gfx.dll'))
map_rows=[line.split() for line in (work/'build/gfx.map').read_text().splitlines()]
addresses={}
for name in ['s_entitySurface','s_XModelSurfaceSize']:
    matches=[r for r in map_rows if len(r)>3 and '?'+name+'@@' in r[1]]
    assert len(matches)==1 and matches[0][-1]=='r_scene.obj'
    addresses[name]=int(matches[0][2],16)-linked.OPTIONAL_HEADER.ImageBase
assert addresses['s_XModelSurfaceSize']==addresses['s_entitySurface']+4
assert linked.get_section_by_rva(addresses['s_entitySurface']).Name.rstrip(b'\0')==b'.data'
assert linked.get_data(addresses['s_entitySurface'],12)==struct.pack('<I',2)+bytes([0,0,0,16,56,16,0,0])

for rva,expected in [(0x196cd0,b'refEntity buffer exceeded - not drawing model\n'),(0x196d00,b'\x15R_AddRefEntityToScene: bad reType %i'),(0x196d28,b'gfx/2d/warning@models.jpg')]:
    assert anchor.get_data(rva,len(expected)+1)==expected+b'\0'
program=r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <vector>
#include <initializer_list>
#define __declspec(x) __attribute__((x))
typedef unsigned char byte;
typedef float vec3_t[3];typedef float vec2_t[2];
typedef int surfaceType_t;typedef int refEntityType_t;
struct FxMemMgr_Emitter;struct DObj_s;struct XModel;struct GfxBrushModel;
struct centity_s {int id;};
struct Material {struct {unsigned short sortedIndex;} info;};
typedef Material *MaterialHandle;
'''+records+r'''
struct GfxDrawSurf {unsigned sort;const surfaceType_t *surface;};
struct {GfxSceneDef def;GfxSceneEntity sceneEnts[2046];int drawSurfCount;} scene;
struct GfxBackEndData {int frameCount,entityCount,drawSurfCount;GfxDrawSurf drawSurfs[65536];} frame;
GfxBackEndData *frontEndDataOut=&frame;
struct dvar_t {struct {bool enabled;} current;};
dvar_t drawEntities={},sortDvar={},statDvar={};
const dvar_t *r_drawEntities=&drawEntities,*fx_sort=&sortDvar,*com_statmon=&statDvar;
enum errorParm_t {ERR_FATAL,ERR_DROP};struct Failure {};
GfxEntity entities[2048],input;
centity_s cent={17};int modelTag;GfxModel model;
Material material;
int frameSerial=0,statCalls,refWarnings,sceneWarnings,visibleWarnings,errors,drawCalls,lastError;
int mutation=-99,backendMutation=-99;
bool throwError;
std::vector<int> callOrder;
void print(int channel,const char *fmt,...){
 assert(channel==2);callOrder.push_back(30);
 va_list args;va_start(args,fmt);
 if(!strcmp(fmt,"refEntity buffer exceeded - not drawing model\n"))++refWarnings;
 else if(!strcmp(fmt,"too many visible models (more than %i)\n")){assert(va_arg(args,int)==8184);++visibleWarnings;}
 else {assert(!strcmp(fmt,"too many scene entities (more than %i)\n"));assert(va_arg(args,int)==2046);++sceneWarnings;}
 va_end(args);
}
void statWarning(int type,int duration,const char *name){
 assert(type==5&&duration==3000&&!strcmp(name,"gfx/2d/warning@models.jpg"));
 assert((unsigned)frame.entityCount>=7365);++statCalls;callOrder.push_back(10);
 if(mutation!=-99)input.reType=mutation;
 if(backendMutation!=-99)frame.entityCount=backendMutation;
}
struct {void (*Printf)(int,const char *,...);void (*StatMon_Warning)(int,int,const char *);} ri={print,statWarning};
void R_Error(errorParm_t code,const char *fmt,...){
 assert(code==ERR_DROP&&!strcmp(fmt,"\x15R_AddRefEntityToScene: bad reType %i"));
 va_list args;va_start(args,fmt);lastError=va_arg(args,int);va_end(args);
 ++errors;callOrder.push_back(20);if(throwError)throw Failure();
}
void R_DrawModel(int index){
 ++drawCalls;callOrder.push_back(50);assert(index>=0&&index<2046);
 auto &s=scene.sceneEnts[index];assert(s.u.data==model.data&&s.cent==&cent&&s.cullState==0);
 assert(scene.def.entities[index].reType==1&&scene.def.entityCount==index+1);
}
'''+token+draw+allocator+source+r'''
int cases=0;
void bits(float &x,unsigned value){memcpy(&x,&value,4);}
unsigned bits(const float &x){unsigned value;memcpy(&value,&x,4);return value;}
void reset(int type,int sceneCount,int backendCount,bool enabled,unsigned scale){
 memset(&scene,0,sizeof(scene));memset(&frame,0,sizeof(frame));
 memset(entities,0x55,sizeof(entities));memset(scene.sceneEnts,0x39,sizeof(scene.sceneEnts));
 memset(&input,0x7b,sizeof(input));input.reType=type;input.customMaterial=&material;bits(input.scale,scale);
 scene.def.entities=entities+1;scene.def.entityCount=sceneCount;scene.drawSurfCount=17;
 frame.frameCount=++frameSerial;frame.entityCount=backendCount;
 drawEntities.current.enabled=enabled;statDvar.current.enabled=true;sortDvar.current.enabled=false;
 statCalls=refWarnings=sceneWarnings=visibleWarnings=errors=drawCalls=0;throwError=false;
 mutation=backendMutation=-99;callOrder.clear();model.data=&modelTag;material.info.sortedIndex=0x21;
}
GfxEntity *run(){++cases;return R_AddRefEntityToScene(&input,model,&cent);}
void checkPublished(int index,bool modelPath,int type,unsigned scale){
 GfxEntity expected=input;if(!(scale&0x7fffffff))bits(expected.scale,0x3f800000);
 assert(!memcmp(&scene.def.entities[index],&expected,116));
 GfxSceneEntity record={};record.u=model;
 if(modelPath)record.cent=&cent;
 else if(type>=4)record.u.data=0;
 assert(!memcmp(&scene.sceneEnts[index],&record,52));
 if(index>0)for(unsigned i=0;i<sizeof(GfxEntity);++i)assert(((byte *)&scene.def.entities[index-1])[i]==0x55);
 for(unsigned i=0;i<sizeof(GfxEntity);++i)assert(((byte *)&scene.def.entities[index+1])[i]==0x55);
 if(index>0)for(unsigned i=0;i<sizeof(GfxSceneEntity);++i)assert(((byte *)&scene.sceneEnts[index-1])[i]==0x39);
 if(index+1<2046)for(unsigned i=0;i<sizeof(GfxSceneEntity);++i)assert(((byte *)&scene.sceneEnts[index+1])[i]==0x39);
}
int main(){
 assert(sizeof(void *)==4&&sizeof(GfxEntity)==116&&sizeof(GfxSceneEntity)==52&&sizeof(GfxModel)==4);
 assert(offsetof(GfxEntity,scale)==0x38&&offsetof(GfxEntity,customMaterial)==0x54);
 reset(2,0,8184,true,0);frame.frameCount=0;assert(!run()&&!refWarnings);
 reset(0,2046,0,true,0);frame.frameCount=0;assert(!run()&&!sceneWarnings);
 for(int type:{-2,-1,0,1,2,3,4,5,6,7,8,9,10,20})
 for(unsigned scale:{0u,0x80000000u,0x3fc00000u,0x7fc12345u})
 for(bool enabled:{false,true})for(int sceneCount:{0,2045,2046,-1})
 for(int backendCount:{0,7364,7365,8183,8184,-1}){
  reset(type,sceneCount,backendCount,enabled,scale);GfxEntity original=input;
  GfxEntity *out=run();bool fast=type<=1;
  bool success=enabled&&(unsigned)sceneCount<2046&&(unsigned)backendCount<8184;
  assert(statCalls==(!fast&&(unsigned)backendCount>=7365));
  assert(errors==(!fast&&(type<0||type>=10)));
  assert(drawCalls==(success&&type==1));
  assert(scene.def.entityCount==sceneCount+(success?1:0)&&frame.entityCount==backendCount+(success?1:0));
  if(success){
   assert(out==scene.def.entities+sceneCount);checkPublished(sceneCount,fast,type,scale);
   bool draw=!fast&&type>=4;assert(frame.drawSurfCount==draw&&scene.drawSurfCount==17+draw);
   if(draw){unsigned key=(((material.info.sortedIndex*32u+31)<<12)+sceneCount)*16+2;
    assert(frame.drawSurfs[0].sort==key&&frame.drawSurfs[0].surface==&s_entitySurface);}
  }else{
   assert(!out&&!frame.drawSurfCount&&scene.drawSurfCount==17);
   if(!fast&&(unsigned)backendCount>=8184)assert(refWarnings==1&&!sceneWarnings&&!visibleWarnings);
   else if(enabled&&(unsigned)sceneCount>=2046)assert(sceneWarnings==1&&!visibleWarnings&&!refWarnings);
   else if(enabled&&(unsigned)backendCount>=8184)assert(visibleWarnings==1&&!sceneWarnings&&!refWarnings);
   else assert(!sceneWarnings&&!visibleWarnings&&!refWarnings);
   for(unsigned i=0;i<sizeof(entities);++i)assert(((byte *)entities)[i]==0x55);
   for(unsigned i=0;i<sizeof(scene.sceneEnts);++i)assert(((byte *)scene.sceneEnts)[i]==0x39);
  }
  assert(!memcmp(&input,&original,116));
 }
 for(int changed:{-3,1,5,12}){
  reset(2,1,7365,true,0x80000000);mutation=changed;
  assert(run()==scene.def.entities+1&&statCalls==1&&drawCalls==0);
  assert(errors==(changed<0||changed>=10));if(errors)assert(lastError==changed&&callOrder[0]==10&&callOrder[1]==20);
  checkPublished(1,false,changed,0x80000000);
 }
 reset(2,0,7365,true,0);backendMutation=8184;
 assert(!run()&&statCalls==1&&refWarnings==1&&scene.def.entityCount==0);
 reset(10,0,1,true,0);throwError=true;
 try{run();assert(false);}catch(const Failure &){}
 assert(errors==1&&scene.def.entityCount==0&&frame.entityCount==1&&!frame.drawSurfCount);
 reset(4,0,0,true,0);sortDvar.current.enabled=true;assert(run());
 unsigned key=((((unsigned)-4096<<10)+material.info.sortedIndex)*32+31)*16+2;
 assert(frame.drawSurfs[0].sort==key);
 reset(4,0,0,true,0);frame.drawSurfCount=65536;assert(run()&&frame.drawSurfCount==65536&&scene.drawSurfCount==17);
 reset(0,0,8184,true,0);assert(!run()&&visibleWarnings==1);
 input.reType=2;assert(!run()&&refWarnings==1&&visibleWarnings==1);
 assert(!run()&&refWarnings==1);++frame.frameCount;assert(!run()&&refWarnings==2);
 reset(0,2046,0,true,0);assert(!run()&&sceneWarnings==1);
 scene.def.entityCount=0;frame.entityCount=8184;assert(!run()&&visibleWarnings==0);
 for(int type:{0,1,3,4}){
  reset(type,2,0,true,0);scene.def.entities[2]=input;
  auto *out=R_AddRefEntityToScene(scene.def.entities+2,model,&cent);++cases;
  assert(out==scene.def.entities+2&&bits(out->scale)==0x3f800000&&scene.def.entityCount==3);
 }
 printf("PASS: %d actual ref-entity routes, signed types, PC warnings/errors, import mutation, limits, copy116/clear52, NaNs, aliasing and packed draw keys\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
