"""Actual scene/API36 driver: live effects list, cull camera and mode/debug routing."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_scene.cpp').read_text();source=s[s.index('// Outer scene driver and API59 rendering callback.'):]
program=r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <vector>
typedef float vec_t;typedef int MaterialTechniqueType;typedef int GfxDrawSurfOrder;
struct dvar_t{union{int integer;bool enabled;}current;}vars[9];
const dvar_t *sc_enable=vars,*sc_showOverlay=vars+1,*r_dlightLimit=vars+2,*r_showTris=vars+3,*r_norefresh=vars+4,*r_debugEntCounts=vars+5,*r_rendererInUse=vars+6,*r_lockPvs=vars+7;
struct GfxViewParms{float origin[3];}lockPvsViewParms;
struct GfxSceneRenderOptions{float blurRadius;int fullScreen;};
struct ShadowCandidate{int id;};struct ShadowCookieList{int cookieCount;};struct PointLightPartition{int id;};struct GfxDrawSurf{int id;}lists[3][10];
struct refdef_t{int time,width,height,viewIndex;float vieworg[3],viewaxis[3][3],blurRadius;};
struct World{void*cells;}world;
struct{World*world;}rgp;
struct{bool registered;float viewOrg[3],viewDir[3];}rg;
struct{struct{int time;float floatTime;int entityCount;}def;int drawSurfCount;GfxDrawSurf*drawSurfs;}scene;
struct GfxBackEndData{GfxViewParms viewParms[8];int viewParmCount;}frame,*frontEndDataOut=&frame;
struct{int width,height;}vidConfig;
const float colorWhite[4]={1,1,1,1};enum{ERR_DROP=1};
std::vector<int>events;const GfxViewParms*cull,*renderView;int expectedFull,expectedIndex,expectedShadow,expectedLights,drawCount;GfxDrawSurf *captured;bool mutate;
void VectorCopy(const float*a,float*b){memcpy(b,a,12);}
void R_SetViewParmsForScene(GfxViewParms*v,const refdef_t*r){events.push_back(1);VectorCopy(r->vieworg,v->origin);}
int R_CellForPoint(const float*origin){assert(origin==(r_lockPvs->current.enabled?lockPvsViewParms.origin:frame.viewParms[0].origin));events.push_back(3);return 7;}
void R_AddWorldSurfacesDpvs(const GfxViewParms*v,int cell){assert(v==cull&&cell==7);events.push_back(4);}
void marks(){events.push_back(5);scene.drawSurfs=lists[1];scene.drawSurfCount=3;}
void effects(){events.push_back(6);scene.drawSurfs=lists[2];scene.drawSurfCount=5;}
void qsortDrawSurfs(GfxDrawSurf*p,int n){assert(p==lists[2]&&n==5);events.push_back(7);}
void R_PopulateCandidates(const float*p,ShadowCandidate*c){assert(p==cull->origin);events.push_back(8);c[23].id=23;}
void R_SortShadowCandidates(ShadowCandidate*c){assert(c[23].id==23);events.push_back(9);}
void R_BuildShadowCookieList(const GfxViewParms*v,const ShadowCandidate*c,ShadowCookieList*l){assert(v==renderView&&c[23].id==23);events.push_back(10);l->cookieCount=2;if(mutate){scene.drawSurfs=lists[0];scene.drawSurfCount=9;}}
int R_GetPointLightPartitions(const GfxDrawSurf*p,int n,PointLightPartition*l,int max){assert(p==lists[2]&&n==5&&max==256);events.push_back(11);l[0].id=27;return 1;}
void R_RenderSceneMode(int i,const GfxViewParms*v,const GfxSceneRenderOptions*o,GfxDrawSurf*p,int n,int shadow,ShadowCookieList*s,PointLightPartition*l,int count){assert(i==expectedIndex&&v==renderView&&o->fullScreen==expectedFull&&o->blurRadius==.75f);assert(p==lists[2]&&n==5&&shadow==expectedShadow&&count==expectedLights);if(shadow)assert(s->cookieCount==2);if(count)assert(l[0].id==27);events.push_back(12);}
void R_AddCmdClearScreen(int f,const float*c,float d,int stencil){assert(f==6&&c==colorWhite&&d==1&&!stencil);events.push_back(13);}
void R_AddCmdDrawSurfs(GfxDrawSurf*p,int n,int tech,int order){assert(p==lists[2]&&n==5&&tech==29&&!order);events.push_back(14);}
void R_UnlockSkinnedCache(){events.push_back(15);}
void R_DrawShadowCookieOverlay(){assert(events.back()==15);events.push_back(16);}
void RB_LogPrint(const char*s){assert(!strcmp(s,"====== R_RenderScene ======\n"));events.push_back(0);}
void R_UpdateFrameFog(){events.push_back(2);}
void R_Error(int code,const char*s){assert(code==ERR_DROP&&!strcmp(s,"\x15R_RenderScene: NULL worldmodel"));throw 1;}
void R_DumpSceneEntities(){events.push_back(18);}
void setInt(const dvar_t*d,int n){assert(d==r_debugEntCounts&&!n);events.push_back(17);const_cast<dvar_t*>(d)->current.integer=0;}
struct{void(*CG_AddMarks)();void(*FX_UpdateAndDraw)();void(*Dvar_SetInt)(const dvar_t*,int);}ri={marks,effects,setInt};
'''+source+r'''
int seen(int n){int c=0;for(int v:events)c+=v==n;return c;}
void reset(){memset(vars,0,sizeof(vars));memset(&frame,0,sizeof(frame));events.clear();rg.registered=true;rgp.world=&world;world.cells=&world;scene.drawSurfs=lists[0];scene.drawSurfCount=1;scene.def.entityCount=8;vars[6].current.integer=1;vidConfig.width=640;vidConfig.height=480;mutate=true;}
int main(){refdef_t r={};r.time=2000;r.width=640;r.height=480;r.viewIndex=4;r.vieworg[0]=3;r.viewaxis[0][2]=7;r.blurRadius=.75f;int cases=0;
 reset();rg.registered=false;R_RenderScene(&r);assert(events.empty());
 reset();vars[4].current.enabled=true;R_RenderScene(&r);assert(events.size()==1&&events[0]==0&&frame.viewParmCount==0);
 reset();rgp.world=0;try{R_RenderScene(&r);assert(false);}catch(int){}assert(frame.viewParmCount==0);
 for(int renderer=1;renderer<=2;++renderer)for(int shadow=0;shadow<2;++shadow)for(int light=0;light<2;++light)for(int locked=0;locked<2;++locked)for(int tris=0;tris<4;++tris)for(int full=0;full<2;++full){reset();vars[6].current.integer=renderer;vars[0].current.enabled=shadow;vars[1].current.enabled=true;vars[2].current.integer=light;vars[3].current.integer=tris;vars[7].current.enabled=locked;vars[5].current.integer=7;world.cells=full?&world:0;r.height=full?480:479;
 expectedFull=full;expectedIndex=4;expectedShadow=renderer!=2&&shadow;expectedLights=renderer!=2&&light;renderView=&frame.viewParms[0];cull=locked?&lockPvsViewParms:renderView;
 R_RenderScene(&r);assert(frame.viewParmCount==1&&scene.def.time==2000&&scene.def.floatTime==2&&rg.viewOrg[0]==3&&rg.viewDir[2]==7);assert(seen(4)==full&&seen(8)==expectedShadow&&seen(11)==expectedLights&&seen(13)==((tris&2)!=0)&&seen(14)==(tris!=0)&&seen(16)==expectedShadow);assert(events[events.size()-2]==17&&events.back()==18);++cases;}
 printf("PASS: %d actual RenderScene/outer-command routes,early gates,effects snapshot,shadow/light modes and debug ownership\n",cases+3);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_outer_scene_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
