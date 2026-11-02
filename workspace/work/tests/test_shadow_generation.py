"""Actual shadow selection/view/cookie/receiver source, with real frustum math."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_shadowcookie.cpp').read_text();d=(w/'src/gfx_d3d/r_dpvs.cpp').read_text();source=s[s.index('// Shadow selection and cookie creation.'):];frustum=d[d.index('// PINNED 10006be0/446:'):d.index('// PINNED 1000a8d0/399:')]
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <algorithm>
#include <initializer_list>
typedef unsigned char Bool;typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef float vec4_t[4];typedef int surfaceType_t;
#define VectorNegate(a,b) do{for(int k=0;k<3;++k)(b)[k]=-(a)[k];}while(0)
#define VectorClear(a) memset((a),0,sizeof(vec3_t))
#define VectorCopy(a,b) memcpy((b),(a),sizeof(vec3_t))
#define VectorSubtract(a,b,c) do{for(int k=0;k<3;++k)(c)[k]=(a)[k]-(b)[k];}while(0)
void AxisCopy(const vec3_t *a,vec3_t *b){memcpy(b,a,9*sizeof(float));}
void Vec3Cross(const float*a,const float*b,float*c){float r[3]={a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]};memcpy(c,r,sizeof(r));}
float Vec3Normalize(float *v){float n=std::sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);if(n)for(int i=0;i<3;++i)v[i]/=n;return n;}
struct D3DMATRIX {float m[4][4];};
struct GfxViewParms {float origin[3],axis[3][3];struct {int X,Y,Width,Height;float MinZ,MaxZ;}viewport;D3DMATRIX viewMatrix,projectionMatrix,viewProjectionMatrix,inverseViewProjectionMatrix;float depthHackNearClip;};
struct DpvsPlane {float coeffs[4];byte side[3];union {byte frontal;}u;};
struct MaterialTechnique {int id;};struct MaterialTechniqueSet {const char *name;MaterialTechnique *techniques[34];};struct Material {MaterialTechniqueSet *techniqueSet;};typedef Material*MaterialHandle;
struct GfxLight {float position[4];};struct World {GfxLight sunLight;}world;
struct {World *world;Material *sortedMaterials[1024],*shadowCookieOverlayMaterial;}rgp;
struct centity_s{int id;};struct GfxEntity {int reType;unsigned renderFxFlags;};struct GfxSceneEntity {const centity_s *cent;float curMins[3],curMaxs[3];};
struct GfxDrawSurf {unsigned sort;const surfaceType_t *surface;};struct srfTriangles_t {int type;float bounds[2][3];};
struct {int drawSurfCount;struct {int time;GfxEntity *entities;}def;GfxSceneEntity sceneEnts[24];GfxDrawSurf *drawSurfs;}scene;
struct GfxBackEndData {int viewParmCount,drawSurfCount;GfxViewParms viewParms[24];}frame,*frontEndDataOut=&frame;
struct {const GfxViewParms *debugViewParms;}rg;
struct ShadowCandidate {int entIndex;float weight;};struct ShadowCookie {int firstCasterDrawSurf,firstReceiverDrawSurf,firstUnusedDrawSurf;D3DMATRIX shadowLookupMatrix;float boxMin[3],boxMax[3];GfxViewParms *shadowViewParms;float fade;};struct ShadowCookieList {ShadowCookie cookies[24];int cookieCount;};
struct {float weightCap;int lastTime;}shadowCookieGlob;
struct dvar_t {union {float value;int integer;}current;}values[7];
const dvar_t *sc_length=values,*sc_fadeRange=values+1,*sc_wantCount=values+2,*sc_wantCountMargin=values+3,*sc_shadowInRate=values+4,*sc_shadowOutRate=values+5,*sc_debugCasterCount=values+6;
struct vidConfig_t {int width;};vidConfig_t vidConfig;
const float colorWhite[4]={1,1,1,1};struct RcWords16 {int w[16];};
int FloatAsInt(float f){int i;memcpy(&i,&f,4);return i;}
int poses,cullins,skins,draws,overlay;bool degenerate;GfxDrawSurf output[256];GfxEntity entities[24];srfTriangles_t triangle;RcWords16 overlayMatrix;
void used(const centity_s*){++poses;}void cullin(const centity_s*){++cullins;}struct {void(*CG_UsedDObjCalcPose)(const centity_s*);void(*CG_CullIn)(const centity_s*);}ri={used,cullin};
void R_UpdateXModelBounds(GfxSceneEntity *s,const GfxEntity*){for(int i=0;i<3;++i){s->curMins[i]=-(float)(i+1);s->curMaxs[i]=degenerate?s->curMins[i]:(float)(i+1);}}
void R_SkinSceneEnt(GfxSceneEntity*,GfxEntity*){++skins;}
void R_AddXModelSurfaces(int index){++draws;output[scene.drawSurfCount++]={(unsigned)(index<<4),(surfaceType_t*)&triangle};++frame.drawSurfCount;}
void MatrixMultiply44(const float a[4][4],const float b[4][4],float out[4][4]){float temp[4][4]={};for(int i=0;i<4;++i)for(int j=0;j<4;++j)for(int k=0;k<4;++k)temp[i][j]+=a[i][k]*b[k][j];memcpy(out,temp,sizeof(temp));}
void MatrixInverse44(const float*,float *out){for(int i=0;i<16;++i)out[i]=i%5==0?1.0f:0.0f;}
void MatrixIdentity44(float m[4][4]){memset(m,0,64);for(int i=0;i<4;++i)m[i][i]=1;}
void R_AddCmdId9(const RcWords16 *words,int bits){assert(bits==0x3f800000);overlayMatrix=*words;}
void R_AddCmdDrawStretchPic(float x,float y,float width,float height,float s0,float t0,float s1,float t1,const vec_t*c,MaterialHandle m){assert(x==4&&y==4&&width==vidConfig.width*.25f&&height==width&&s0==0&&t0==0&&s1==1&&t1==1&&c==colorWhite&&m==rgp.shadowCookieOverlayMaterial);++overlay;}
'''+frustum+source+r'''
void reset(){memset(&frame,0,sizeof(frame));memset(&scene,0,sizeof(scene));memset(values,0,sizeof(values));poses=cullins=skins=draws=overlay=0;degenerate=false;scene.def.entities=entities;scene.drawSurfs=output;rgp.world=&world;world.sunLight.position[0]=0;world.sunLight.position[1]=0;world.sunLight.position[2]=-1;values[0].current.value=400;values[1].current.value=.25f;values[2].current.integer=12;values[3].current.integer=1;values[4].current.value=2;values[5].current.value=5;values[6].current.integer=24;shadowCookieGlob.weightCap=10;shadowCookieGlob.lastTime=-1;triangle.type=6;for(int i=0;i<3;++i){triangle.bounds[0][i]=-(i+1);triangle.bounds[1][i]=i+1;}}
int main(){int cases=0;
 reset();ShadowCandidate candidates[24];for(int i=0;i<24;++i)candidates[i]={i,(float)(24-i)};R_SortShadowCandidates(candidates);for(int i=0;i<24;++i)assert(candidates[i].weight==i+1);++cases;
 reset();GfxViewParms view;float mins[3]={-1,-2,-3},maxs[3]={1,2,3};R_SetShadowViewParms(&view,mins,maxs);assert(view.viewport.Width==128&&view.viewport.Height==128&&view.depthHackNearClip==-.5f);assert(view.projectionMatrix.m[0][0]==0.9843749403953552f&&view.projectionMatrix.m[3][2]==.5f);for(int i=0;i<3;++i){float norm=0;for(int j=0;j<3;++j)norm+=view.axis[i][j]*view.axis[i][j];assert(std::fabs(norm-1)<1e-5f);}++cases;
 MaterialTechnique technique;MaterialTechniqueSet set={};set.techniques[32]=&technique;Material material={&set};
 for(int empty=0;empty<2;++empty)for(int cast=0;cast<2;++cast){reset();rgp.sortedMaterials[0]=&material;output[0]={(unsigned)(2046<<4),(surfaceType_t*)&triangle};scene.drawSurfCount=frame.drawSurfCount=1;degenerate=empty;values[6].current.integer=cast?24:0;ShadowCookieList list={};unsigned bits=0x7fc01234u;float fade;memcpy(&fade,&bits,4);R_CreateShadowCookie(&view,1,0,fade,&list);if(empty){assert(!list.cookieCount&&!frame.viewParmCount&&poses==1&&!cullins);}else{assert(list.cookieCount==1&&frame.viewParmCount==1&&poses==1&&cullins==cast&&draws==cast);auto &c=list.cookies[0];assert(c.firstCasterDrawSurf==1&&c.firstReceiverDrawSurf==1+cast&&c.firstUnusedDrawSurf==2+cast);assert(scene.drawSurfCount==2+cast&&frame.drawSurfCount==2+cast);assert(!memcmp(&c.fade,&fade,4));assert(!memcmp(c.boxMin,mins,12)&&!memcmp(c.boxMax,maxs,12));}++cases;}
 for(int sign:{-1,0,1}){reset();for(auto &c:candidates)c={-1,100000000};candidates[0]={0,20};values[2].current.integer=sign<0?-2:sign>0?5:0;values[3].current.integer=0;shadowCookieGlob.lastTime=1000;scene.def.time=2000;ShadowCookieList list={};R_BuildShadowCookieList(&view,candidates,&list);assert(!list.cookieCount);assert(shadowCookieGlob.weightCap==(sign<0?8:sign>0?15:10));assert(shadowCookieGlob.lastTime==2000);++cases;}
 reset();vidConfig.width=800;R_DrawShadowCookieOverlay();assert(overlay==1);float ident[4][4];MatrixIdentity44(ident);assert(!memcmp(&overlayMatrix,ident,64));++cases;
 printf("PASS: %d actual shadow generation paths, STL order, view/lookup geometry, degenerate/capped casters, receiver counters, fade bits and cap rates\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shadow_gen_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
