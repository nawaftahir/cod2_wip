"""Actual scene command producers: PC payloads, allocator accounting and copies."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_rendercmds.cpp').read_text()
source=s[s.index('static GfxCmdHeader *R_GetCommandBuffer'):s.index('void R_AddCmdTouchAllImages')]+s[s.index('// Scene command producers.') :]
program=r'''
#include <cassert>
#include <cstring>
#include <cstdio>
struct GfxCmdHeader {unsigned short id,byteCount;};
struct GfxCmdArray {unsigned char cmds[0x30000];int usedTotal,usedCritical;GfxCmdHeader *lastCmd;}array;
GfxCmdArray *s_cmdList=&array;
struct GfxLightDef {int value;};
struct GfxLight {GfxLightDef *def;float position[4],color[3];union {struct {float ambientColor[3];}dir;}u;};
struct GfxCmdSetLightProperties {GfxCmdHeader header;int lightIndex;float position[4],ambient[4],color[4],specular[4];GfxLightDef *lightDef;};
struct GfxSceneDef {int time;float floatTime;int entityCount;void *entities;};
struct GfxViewParms {int value;};
struct GfxLodParms {float origin[3],scale,bias;};
struct GfxCmdBeginView {GfxCmdHeader header;GfxSceneDef sceneDef;const GfxViewParms *viewParms;GfxLodParms lodParms;int viewCount;};
typedef int GfxRenderTargetId;
struct GfxCmdSetRenderTarget {GfxCmdHeader header;GfxRenderTargetId renderTargetId;};
struct GfxCmdDrawSunPostEffects {GfxCmdHeader header;int viewIndex;};
struct dvar_t {struct {float value;}current;}scale;
const dvar_t *r_specularColorScale=&scale;
#define RC_FIRST_NONCRITICAL 0xf
'''+source+r'''
void reset(int size,int used,int critical){memset(&array,0xa5,sizeof(array));array.usedTotal=used;array.usedCritical=critical;array.lastCmd=0;assert(used+size<=0x30000);}
void check(int used,int prior,int n,int id){assert(array.usedTotal==used+n&&array.usedCritical==prior+(id<0xf?n:0));assert(array.lastCmd==(GfxCmdHeader*)(array.cmds+used));assert(array.lastCmd->id==id&&array.lastCmd->byteCount==n);if(used)assert(array.cmds[used-1]==0xa5);if(used+n<0x30000)assert(array.cmds[used+n]==0xa5);}
int main(){
 static_assert(sizeof(void*)==4&&sizeof(GfxCmdBeginView)==48&&sizeof(GfxCmdSetLightProperties)==76,"PC records");
 GfxLightDef def={37};GfxLight light={};light.def=&def;
 for(int i=0;i<4;++i)light.position[i]=(i-2)*1.25f;
 for(int i=0;i<3;++i){light.color[i]=(i-1)*2.0f;light.u.dir.ambientColor[i]=(i+1)*.125f;}
 int count=0;
 for(float factor: {0.0f,.5f,1.0f,100.0f})for(int base: {0,17,0x30000-76}){
  scale.current.value=factor;reset(76,base,31);R_AddCmdLightProperties(-7,&light);check(base,31,76,5);
  auto *p=(GfxCmdSetLightProperties*)(array.cmds+base);assert(p->lightIndex==-7&&p->lightDef==&def);
  for(int i=0;i<4;++i){assert(p->position[i]==light.position[i]);assert(p->ambient[i]==(i==3?1.0f:light.u.dir.ambientColor[i]));assert(p->color[i]==(i==3?1.0f:light.color[i]));assert(p->specular[i]==p->color[i]*factor);}++count;
 }
 for(int base: {0,20,0x30000-48}){
  GfxSceneDef scene={123,4.5f,27,&def};GfxViewParms view={67};GfxLodParms lod={{1,2,3},4,5};
  reset(48,base,8);R_AddCmdBeginView(9,&scene,&view,&lod);check(base,8,48,12);
  auto *p=(GfxCmdBeginView*)(array.cmds+base);assert(!memcmp(&p->sceneDef,&scene,sizeof(scene))&&!memcmp(&p->lodParms,&lod,sizeof(lod)));assert(p->viewCount==9&&p->viewParms==&view);scene.time=0;lod.bias=0;assert(p->sceneDef.time==123&&p->lodParms.bias==5);++count;
 }
 for(int value: {-3,0,7})for(int base: {0,32,0x30000-8}){
  reset(8,base,33);R_AddCmdSetRenderTarget(value);check(base,33,8,14);assert(((GfxCmdSetRenderTarget*)array.lastCmd)->renderTargetId==value);++count;
  int prior=base==0x30000-8?0x2000:0;reset(8,base,prior);R_AddCmdDrawSun(value);check(base,prior,8,24);assert(((GfxCmdDrawSunPostEffects*)array.lastCmd)->viewIndex==value);++count;
 }
 printf("PASS: %d actual producer cases,32-bit layouts, critical reservation and value/pointer copies\n",count);
}
'''
program=program.replace('#include <cstdio>','#include <cstdio>\n#include <initializer_list>')
with tempfile.TemporaryDirectory(prefix='gfx_scene_producers_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
