"""Actual DPVS drawing, packed model submission and count-display precedence."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import struct
import subprocess
import tempfile
import pefile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_scene.cpp').read_text()
helper=text[text.index('__declspec(noinline) void R_AddDrawSurf('):text.index('// PINNED 10023ed0/')]
submission=text[text.index('// PINNED PC model surface submission, 10024680/286.'):text.index('// PINNED PC ref-entity submission, 10023db0/209.')]
text=(work/'src/gfx_d3d/r_dpvs.cpp').read_text()
draw=text[text.index('// PINNED PC scene model drawing, 10008330/112.'):text.index('// PINNED 10007d60/93:')]
anchor=pefile.PE(str(retail_anchor()))
assert anchor.get_data(0x1a5a30,8)==bytes([0,0,0,16,56,16,0,0])
assert anchor.get_section_by_rva(0x1a5a30).Name.rstrip(b'\0')==b'.data'
assert struct.unpack('<4f',anchor.get_data(0x191448,16))==(0,1,1,1)
linked=pefile.PE(str(work/'build/gfx.dll'))
rows=[line.split() for line in (work/'build/gfx.map').read_text().splitlines() if 's_XModelSurfaceSize@@' in line]
assert len(rows)==1 and rows[0][-1].endswith('r_scene.obj')
table=int(rows[0][2],16)-linked.OPTIONAL_HEADER.ImageBase
assert linked.get_section_by_rva(table).Name.rstrip(b'\0')==b'.data'
assert linked.get_data(table,8)==bytes([0,0,0,16,56,16,0,0])

program=r'''
#define __declspec(x) __attribute__((x))
#include <cassert>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef int surfaceType_t;
struct Material {struct {unsigned short sortedIndex;} info;};
struct XSurface {short vertCount,triCount;};
struct GfxModelSurface {int surfType;XSurface *xsurf;};
struct GfxEntity {float origin[3];};
struct GfxSceneEntity {int cullState,surfCount;const Material **materials;surfaceType_t *surfs;};
struct GfxDrawSurf {unsigned sort;const surfaceType_t *surface;};
struct DebugGlobals {int id;};struct GfxViewParms {int id;};
struct GfxBackEndData {int drawSurfCount;GfxDrawSurf drawSurfs[65536];DebugGlobals debugGlobals;} frame;
GfxBackEndData *frontEndDataOut=&frame;
struct {struct {GfxEntity *entities;} def;GfxSceneEntity sceneEnts[16];int drawSurfCount;} scene;
struct {GfxViewParms *debugViewParms;} rg;
struct {struct {byte drawXModels;} debug;} dpvsGlob;
struct dvar_t {struct {bool enabled;} current;};
dvar_t sortDvar={},triDvar={},vertDvar={},surfDvar={};
const dvar_t *fx_sort=&sortDvar,*r_showTriCounts=&triDvar,*r_showVertCounts=&vertDvar,*r_showSurfCounts=&surfDvar;
const float colorCyan[4]={0,1,1,1};
int expectedEntity,observedCount,debugCalls;
bool drawing;
std::vector<int> calls;
const char *va(const char *fmt,int count){assert(!strcmp(fmt,"%i"));observedCount=count;return "formatted count";}
void R_AddScaledDebugString(DebugGlobals *d,const GfxViewParms *v,const float *origin,const float *color,const char *s){
 assert(d==&frame.debugGlobals&&v==rg.debugViewParms&&origin==scene.def.entities[expectedEntity].origin);
 assert(color==colorCyan&&!strcmp(s,"formatted count"));
 if(drawing)assert(scene.sceneEnts[expectedEntity].cullState==5);
 ++debugCalls;
}
void R_UpdateXModelBounds(GfxSceneEntity *s,const GfxEntity *e){
 assert(s==&scene.sceneEnts[expectedEntity]&&e==scene.def.entities+expectedEntity);
 calls.push_back(1);s->cullState=2;
}
void R_SkinSceneEnt(GfxSceneEntity *s,GfxEntity *e){
 assert(s==&scene.sceneEnts[expectedEntity]&&e==scene.def.entities+expectedEntity&&s->cullState==2);
 calls.push_back(2);s->cullState=4;
}
'''+helper+submission+draw+r'''
GfxEntity entities[18];GfxViewParms view;
Material materials[64];const Material *materialList[64];XSurface xsurfaces[64];
alignas(4) byte records[64*56+16];
int main(){
 assert(sizeof(void *)==4);rg.debugViewParms=&view;
 int cases=0;
 for(int entityBase:{0,2})for(int entIndex:{0,3,15})for(int count:{0,1,4,64})
 for(int nullPattern:{0,1,2})for(int flags=0;flags<8;++flags)for(int initial:{0,65535,65536}){
  scene.def.entities=entities+entityBase;expectedEntity=entIndex;
  auto &s=scene.sceneEnts[entIndex];s.surfCount=count;s.materials=materialList;s.surfs=(int *)records;
  scene.drawSurfCount=17;frame.drawSurfCount=initial;debugCalls=0;observedCount=-1;drawing=false;
  triDvar.current.enabled=flags&1;vertDvar.current.enabled=flags&2;surfDvar.current.enabled=flags&4;
  memset(records,0xcc,sizeof(records));
  std::vector<GfxModelSurface *> pointers;std::vector<int> sourceIndices;
  int bytes=0,tris=0,verts=0;
  for(int i=0;i<count;++i){
   bool empty=nullPattern==1?i%2==0:nullPattern==2;
   materialList[i]=empty?0:&materials[i];materials[i].info.sortedIndex=(unsigned short)(500+i);
   if(empty)continue;
   auto *p=(GfxModelSurface *)(records+bytes);p->surfType=3+(i%3);p->xsurf=&xsurfaces[i];
   xsurfaces[i].vertCount=(short)(i==63?-2:7+i);xsurfaces[i].triCount=(short)(i==63?-3:3+i);
   tris+=xsurfaces[i].triCount;verts+=xsurfaces[i].vertCount;
   pointers.push_back(p);sourceIndices.push_back(i);bytes+=p->surfType==4?56:16;
  }
  R_AddXModelSurfaces(entIndex);++cases;
  int emitted=(int)pointers.size();if(emitted>65536-initial)emitted=65536-initial;
  assert(frame.drawSurfCount==initial+emitted&&scene.drawSurfCount==17+emitted);
  for(int n=0;n<emitted;++n){auto *p=pointers[n];int i=sourceIndices[n];int index=p->surfType==5?2047:entIndex;
   unsigned key=(((materials[i].info.sortedIndex*32u+31)<<12)+index)*16+p->surfType;
   assert(frame.drawSurfs[initial+n].surface==&p->surfType&&frame.drawSurfs[initial+n].sort==key);
  }
  assert(debugCalls==!!flags);if(flags)assert(observedCount==(flags&1?tris:flags&2?verts:count));
  for(int n=bytes;n<(int)sizeof(records);++n)assert(records[n]==0xcc);
  frame.drawSurfCount=0;scene.drawSurfCount=0;debugCalls=0;calls.clear();drawing=true;
  dpvsGlob.debug.drawXModels=0;s.cullState=99;R_DrawModel(entIndex);++cases;
  assert(calls.empty()&&s.cullState==99&&!frame.drawSurfCount&&!debugCalls);
  dpvsGlob.debug.drawXModels=1;R_DrawModel(entIndex);++cases;
  assert(calls==std::vector<int>({1,2})&&s.cullState==5&&frame.drawSurfCount==(int)pointers.size());
  assert(debugCalls==!!flags);
 }
 printf("PASS: %d actual model submission/draw routes, compact null-material walk, strides, sort keys, caps, count precedence and DPVS flag/state order\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    p=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';p.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(p),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
