"""Actual retail clear color and DX7/fullbright/debug scene command ordering."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/r_scene.cpp').read_text();source=s[s.index('// PINNED 10024920/156:'):s.index('// Normal scene command generation.')]
program=r'''
#include <cassert>
#include <cstring>
#include <vector>
#include <cstdio>
#define __forceinline inline
struct GfxDrawSurf {unsigned sort;};struct GfxViewParms {int id;};
struct GfxSceneDef {int id;};struct GfxLodParms {int id;};struct GfxLight {int id;};
struct World {GfxLight sunLight;}worlds[2];
struct {World *world;}rgp;
struct Fog {struct {unsigned char array[4];}color;bool registered,clearScreen;};
struct {Fog fogSettings[5];GfxLodParms lodParms;}rg;
struct {int viewCount;GfxSceneDef def;}scene;
struct {int width,height;}vidConfig;
struct {unsigned multiSampleQuality;struct {void *colorSurface;}renderTargets[13];}dx;
struct dvar_t {union {int integer;bool enabled;unsigned char color[4];}current;}clearValue,featherValue,rendererValue;
const dvar_t *r_clearColor=&clearValue,*r_zFeather=&featherValue,*r_rendererInUse=&rendererValue;
typedef int GfxRenderTargetId;typedef int MaterialTechniqueType;typedef int GfxDrawSurfOrder;
std::vector<int> events;
int group3,group4,mutate,expectedFlags,expectedCount,expectedIndex;
float expectedColor[4];
GfxViewParms view;GfxDrawSurf surfaces[5];
void R_AddCmdBeginView(int count,const GfxSceneDef *s,const GfxViewParms *v,const GfxLodParms *l){assert(count==scene.viewCount&&s==&scene.def&&v==&view&&l==&rg.lodParms);events.push_back(10);}
void R_AddCmdSetRenderTarget(int id){assert(id==0);events.push_back(11);}
void R_AddCmdSetViewport(int x,int y,int width,int height){assert(x==0&&y==0&&width==vidConfig.width&&height==vidConfig.height);events.push_back(12);}
void R_AddCmdClearScreen(int flags,const float *color,float depth,int stencil){assert(flags==expectedFlags&&depth==1.0f&&stencil==0);assert(!memcmp(color,expectedColor,sizeof(expectedColor)));events.push_back(13);if(mutate)rgp.world=&worlds[1];}
void R_AddCmdLightProperties(int index,const GfxLight *l){assert(index==0&&l==&worlds[mutate?1:0].sunLight);events.push_back(14);}
void R_AddCmdDrawSurfs(GfxDrawSurf *p,int count,int tech,int order){assert(p==surfaces&&count==expectedCount&&order==0);events.push_back(100+tech);}
void R_AddCmdDrawSun(int index){assert(index==expectedIndex);events.push_back(15);}
int R_BeginDrawGroupSection(int group){events.push_back(20+group);return group==3?group3:group4;}
void R_BeginDrawGroupLoop(int group,int index){assert(index==expectedIndex);events.push_back(30+group);++scene.viewCount;}
int R_EndDrawGroupLoop(int group,int index){assert(group==3&&index==expectedIndex);events.push_back(40+group);return 1;}
void R_EndDrawGroupSection(int group){assert(group==3);events.push_back(50+group);}
'''+source+r'''
void reset(){events.clear();rgp.world=&worlds[0];scene.viewCount=27;vidConfig.width=1280;vidConfig.height=720;}
int main(){
 int cases=0;
 for(int fog=0;fog<2;++fog)for(int byte=0;byte<256;++byte){
  rg.fogSettings[2].registered=fog;rg.fogSettings[2].clearScreen=!fog;
  for(int i=0;i<4;++i){rg.fogSettings[2].color.array[i]=(byte+i*37)&255;clearValue.current.color[i]=(255-byte+i*53)&255;}
  float guard[6]={-4,-3,-2,-1,-5,-6};float *out=guard+1;
  assert(R_GetClearColor(out)==out);assert(guard[0]==-4&&guard[5]==-6);
  for(int i=0;i<3;++i){unsigned char c=fog?rg.fogSettings[2].color.array[2-i]:clearValue.current.color[i];assert(out[i]==c*0.0039215689f);}assert(out[3]==1);++cases;
 }
 for(int fog=0;fog<2;++fog)for(int quality=0;quality<2;++quality)for(int renderer=1;renderer<=2;++renderer)for(int feather=0;feather<2;++feather)for(int surface=0;surface<2;++surface)for(int mutation=0;mutation<2;++mutation){
  rg.fogSettings[2].registered=fog;rg.fogSettings[2].clearScreen=!fog;dx.multiSampleQuality=quality?3:0;rendererValue.current.integer=renderer;featherValue.current.enabled=feather;dx.renderTargets[6].colorSurface=surface?&view:0;mutate=mutation;
  expectedFlags=quality&&renderer!=2&&feather&&surface?1:7;R_GetClearColor(expectedColor);expectedIndex=3;expectedCount=-2;
  for(int shadow: {-1,0,1,2}){reset();int ordinary=expectedFlags;expectedFlags=quality&&(shadow==1||(renderer!=2&&feather&&surface))?1:7;R_AddClearCommandsForFrameBuffer(shadow);assert((events==std::vector<int>{13}));expectedFlags=ordinary;++cases;}
  reset();R_RenderSceneDx7(expectedIndex,&view,surfaces,expectedCount);assert((events==std::vector<int>{10,11,13,14,101,106,15,121}));++cases;
  reset();R_RenderSceneDebugShader(&view,surfaces,expectedCount);assert((events==std::vector<int>{10,11,13,133}));++cases;
  for(group3=0;group3<2;++group3)for(group4=0;group4<2;++group4){
   reset();R_RenderSceneFullbright(expectedIndex,&view,surfaces,expectedCount);
   std::vector<int> e{23};if(!group3){e.push_back(11);e.push_back(12);e.push_back(13);}for(int x:{33,10,103,15,43,53,24})e.push_back(x);if(!group4)e.push_back(12);e.push_back(34);e.push_back(10);assert(events==e);++cases;
  }
 }
 printf("PASS: %d actual clear/mode cases, BGRA/RGBA, flags, signed counts, group branches and live world\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_scene_modes_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
