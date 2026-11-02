"""Actual normal/depth/point-light/shadow scene graph with recorded engine boundaries."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_scene.cpp').read_text();h=(w/'src/gfx_d3d/r_shadowcookie.cpp').read_text()
source=s[s.index('// PINNED 10024920/156:'):s.index('typedef char normalScenePayloadCheck[')]+s[s.index('// PINNED 100247f0/296:'):s.index('// Outer scene driver and API59 rendering callback.')]
shadow=h[h.index('// PINNED 10027930/839:'):h.index('// Shadow selection and cookie creation.')]
program=r'''
#include <cassert>
#include <cstring>
#include <vector>
#include <cstdio>
#include <initializer_list>
typedef unsigned char Bool;
struct Material {int id;}materials[2];typedef Material *MaterialHandle;
struct GfxLight {int id;}lights[4];struct GfxDrawSurf {unsigned sort,payload;}surfs[2][12];
struct GfxViewParms {int id;}view={8},shadowView={9};struct GfxSceneDef {int id;};struct GfxLodParms {int id;};
struct World {GfxLight sunLight;}worlds[2];struct {World *world;Material *clearAlphaStencilMaterial,*shadowClearMaterial;}rgp;
struct {int viewCount;GfxSceneDef def;GfxDrawSurf *drawSurfs;}scene;
struct {int width,height;}vidConfig;
struct {unsigned multiSampleQuality;struct {void *colorSurface;}renderTargets[13];}dx;
struct Fog {struct {unsigned char array[4];}color;bool registered;};struct {Fog fogSettings[5];GfxLodParms lodParms;}rg;
struct dvar_t {union {int integer;bool enabled;unsigned char color[4];}current;}values[8];
const dvar_t *r_rendererInUse=values,*r_zFeather=values+1,*r_clearColor=values+2,*r_fullbright=values+3,*r_debugShader=values+4,*sc_debugCasterCount=values+5,*sc_debugReceiverCount=values+6,*sc_blur=values+7;
const float colorWhite[4]={1,1,1,1};typedef float vec_t;
typedef int GfxRenderTargetId;typedef int MaterialTechniqueType;typedef int GfxDrawSurfOrder;
struct PointLightPartition {const GfxLight *light;int firstDrawSurf,drawSurfCount;};
struct D3DMATRIX {float m[4][4];};struct ShadowCookie {int firstCasterDrawSurf,firstReceiverDrawSurf,firstUnusedDrawSurf;D3DMATRIX shadowLookupMatrix;float boxMin[3],boxMax[3];GfxViewParms *shadowViewParms;float fade;};
struct ShadowCookieList {ShadowCookie cookies[24];int cookieCount;};struct RcWords16 {int w[16];};
std::vector<int> events;std::vector<int> techniques,counts;std::vector<GfxDrawSurf*> pointers;int oldGroups,oldEnds,shadowsEmitted,blurCommands,mutation,quadCount;float lateBlur;PointLightPartition *mutableParts;RcWords16 matrixCaptured;int fadeCaptured;
int R_BeginDrawGroupSection(int g){events.push_back(2000+g);return (oldGroups>>g)&1;}
void R_BeginDrawGroupLoop(int g,int i){assert(i==2);events.push_back(2100+g);}
int R_EndDrawGroupLoop(int g,int i){assert(i==2);events.push_back(2200+g);return (oldEnds>>g)&1;}
void R_EndDrawGroupSection(int g){events.push_back(2300+g);}
void R_AddCmdSetRenderTarget(int id){events.push_back(1000+id);}
void R_AddCmdSetViewport(int x,int y,int width,int height){assert((x==0&&y==0&&width==1280&&height==720)||(x==1&&y==1&&width==126&&height==126)||(x==0&&y==0&&width==128&&height==128));events.push_back(1600+width);}
void R_AddCmdClearScreen(int flags,const float *color,float depth,int stencil){assert(!stencil);assert(flags==1||flags==6||flags==7);assert(depth==0||depth==1);if(depth==0||flags==6)assert(!memcmp(color,colorWhite,16));events.push_back(1100+flags);}
void R_AddCmdBeginView(int count,const GfxSceneDef *s,const GfxViewParms *v,const GfxLodParms *l){assert(count==scene.viewCount&&s==&scene.def&&l==&rg.lodParms);assert(v==&view||v==&shadowView);events.push_back(1200+v->id);}
void R_AddCmdDrawSurfs(GfxDrawSurf *p,int count,int tech,int order){assert(!order);pointers.push_back(p);counts.push_back(count);techniques.push_back(tech);events.push_back(1300+tech);}
void R_AddCmdLightProperties(int index,const GfxLight *light){assert(!index&&light);events.push_back(1700+light->id);}
void R_AddCmdDrawSun(int index){assert(index==2);events.push_back(1402);}
void R_AddCmdDrawFullScreenColoredQuad(float s0,float t0,float s1,float t1,const vec_t *c,MaterialHandle m){assert(s0==0&&t0==0&&s1==1&&t1==1&&c==colorWhite);assert(m==rgp.clearAlphaStencilMaterial||m==rgp.shadowClearMaterial);events.push_back(1500+m->id);++quadCount;if(mutation&&mutableParts){mutableParts[0].light=0;mutableParts[0].firstDrawSurf=11;mutableParts[0].drawSurfCount=777;scene.drawSurfs=surfs[1];}}
void R_AddCmdApplyEarlyPostEffects(){events.push_back(1800);}
void R_AddCmdApplyLatePostEffects(float blur){lateBlur=blur;events.push_back(1801);}
void R_AddCmdDrawSunPostEffects(int i){assert(i==2);events.push_back(1802);}
void R_AddCmdId9(const RcWords16 *words,int fade){matrixCaptured=*words;fadeCaptured=fade;++shadowsEmitted;events.push_back(1900);}
void R_AddCmdHeaderOnly1C(){++blurCommands;events.push_back(1901);}
void qsortDrawSurfs(GfxDrawSurf *p,int n){assert(n>0);events.push_back(1950);}
void R_DrawShadowCookies(int,const GfxViewParms*,const ShadowCookieList*);
'''+source+shadow+r'''
void reset(){events.clear();techniques.clear();counts.clear();pointers.clear();oldGroups=oldEnds=shadowsEmitted=blurCommands=mutation=quadCount=0;mutableParts=0;lateBlur=-1;memset(values,0,sizeof(values));values[0].current.integer=1;values[5].current.integer=values[6].current.integer=24;dx.multiSampleQuality=0;dx.renderTargets[6].colorSurface=0;rg.fogSettings[2].registered=0;scene.viewCount=7;scene.drawSurfs=surfs[0];rgp.world=&worlds[0];rgp.clearAlphaStencilMaterial=materials;rgp.shadowClearMaterial=materials+1;materials[0].id=0;materials[1].id=1;vidConfig.width=1280;vidConfig.height=720;}
int occurrences(int value){int n=0;for(int e:events)n+=e==value;return n;}
int main(){int cases=0;ShadowCookieList shadows={};GfxSceneRenderOptions options={2.75f,1};
 for(int renderer=1;renderer<=2;++renderer)for(int feather=0;feather<2;++feather)for(int surface=0;surface<2;++surface)for(int shadowType=0;shadowType<2;++shadowType)for(int prior=0;prior<2;++prior){
  reset();values[0].current.integer=renderer;values[1].current.enabled=feather;dx.renderTargets[6].colorSurface=surface?&view:0;oldGroups=oldEnds=prior?31:0;
  R_RenderSceneDepth(2,&view,surfs[0],-7,shadowType);bool floating=renderer!=2&&feather&&surface;
  if(floating||shadowType){assert(techniques==std::vector<int>{floating?2:0});assert(counts[0]==-7);assert(occurrences(2000)==1&&occurrences(2100)==1&&occurrences(2200)==1&&occurrences(2300)==1);assert(occurrences(1000+(floating?6:3))==!prior);if(floating)assert(quadCount==!prior);}else assert(events.empty());++cases;
 }
 for(int count:{-3,0,1,2})for(int mut=0;mut<2;++mut){reset();PointLightPartition p[2]={{lights,1,-3},{lights+1,5,6}};lights[0].id=4;lights[1].id=5;mutableParts=p;mutation=mut;R_DrawPointLightSurfs(count,p);if(count>0){assert(techniques.size()==(unsigned)count&&counts[0]==-3&&pointers[0]==surfs[0]+1);assert(occurrences(1704)==1);if(count==2)assert(pointers[1]==surfs[mut?1:0]+5&&counts[1]==6);}else assert(events.empty());++cases;}
 for(int n=0;n<2;++n)for(int eligible=0;eligible<2;++eligible)for(int receiver=0;receiver<2;++receiver)for(int prior=0;prior<2;++prior)for(int feather=0;feather<2;++feather)for(int blur=0;blur<2;++blur){
  reset();memset(&shadows,0,sizeof(shadows));shadows.cookieCount=n;auto &c=shadows.cookies[0];c.firstCasterDrawSurf=1;c.firstReceiverDrawSurf=3;c.firstUnusedDrawSurf=7;c.shadowViewParms=&shadowView;c.fade=.375f;for(int i=0;i<16;++i)c.shadowLookupMatrix.m[i/4][i%4]=(float)i;unsigned nanBits=0x7fc01234u;memcpy(&c.fade,&nanBits,4);memcpy(&c.shadowLookupMatrix.m[0][0],&nanBits,4);
  values[5].current.integer=eligible?24:0;values[6].current.integer=receiver?24:0;values[7].current.integer=blur;values[1].current.enabled=feather;dx.renderTargets[6].colorSurface=&view;oldGroups=prior?2:0;
  R_DrawShadowCookies(2,&view,&shadows);bool draw=n&&eligible;assert(shadowsEmitted==draw&&blurCommands==(draw&&blur));assert(occurrences(2101)==1&&occurrences(2201)==1&&occurrences(2301)==1);
  assert(occurrences(1101)==(!prior&&feather));assert(occurrences(1004)==draw);if(draw){assert(techniques[0]==31&&counts[0]==2);assert(!memcmp(&matrixCaptured,&c.shadowLookupMatrix,64));assert(!memcmp(&fadeCaptured,&c.fade,4));assert(occurrences(1332)==receiver);}++cases;
 }
 for(int fullscreen=0;fullscreen<2;++fullscreen)for(int prior=0;prior<2;++prior)for(int shadowType=0;shadowType<2;++shadowType){reset();shadows.cookieCount=0;options.fullScreen=fullscreen;oldGroups=oldEnds=prior?31:0;R_RenderSceneNormal(2,&view,&options,surfs[0],4,shadowType,&shadows,0,0);assert(occurrences(1800)==(fullscreen&&!prior));assert(occurrences(1801)==fullscreen&&occurrences(1802)==1);assert(occurrences(2304)==0&&occurrences(2104)==1);if(fullscreen)assert(lateBlur==2.75f);assert(occurrences(1301)==1&&occurrences(1306)==1&&occurrences(1321)==1);++cases;}
 for(int full=0;full<2;++full)for(int renderer=1;renderer<=2;++renderer)for(int debug=0;debug<2;++debug){reset();values[3].current.enabled=full;values[0].current.integer=renderer;values[4].current.integer=debug;shadows.cookieCount=0;R_RenderSceneMode(2,&view,&options,surfs[0],3,0,&shadows,0,0);if(full)assert(occurrences(1303)==1);else if(renderer==2)assert(occurrences(1301)==1&&occurrences(1802)==0);else if(debug)assert(occurrences(1333)==1);else assert(occurrences(1802)==1);++cases;}
 printf("PASS: %d actual normal/depth/shadow/light/dispatch paths, payload capture, group lifecycle and priorities\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_normal_scene_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
