"""Real sun geometry/query/post-effect source with deterministic device boundaries."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/rb_sky.cpp').read_text()
types=s[s.index('union GfxColor'):s.index('GfxTess tess;')]
quads=s[s.index('// Sun fade and quads.'):s.index('// Sun rendering and visibility.')]
source=s[s.index('// Sun rendering and visibility.'):].replace('#include "r_permanent.h"','')
backend=(w/'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
sun=(w/'src/gfx_d3d/r_sun_state.h').read_text().replace('#pragma once','')
tess=(w/'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
program=r'''
#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef float vec_t;typedef float vec3_t[3];typedef float vec4_t[4];typedef unsigned DWORD;typedef int HRESULT;
const int S_OK=0,S_FALSE=1;struct Material {int id;} mats[4];struct GfxImage;
struct D3DMATRIX {union {float m[4][4];struct {float _11,_12,_13,_14,_21,_22,_23,_24,_31,_32,_33,_34,_41,_42,_43,_44;};};};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
struct IDirect3DQuery9 {int waits,result,gets;DWORD samples;std::vector<int> issues;HRESULT GetData(void *out,unsigned n,unsigned flags){assert(n==4&&flags==1);++gets;if(waits){--waits;return S_FALSE;}*(DWORD *)out=samples;return result;}HRESULT Issue(unsigned v){issues.push_back(v);return 0;}} query;
'''+types+backend+sun+tess+r'''
r_backEndGlobals_t backEnd;GfxTess tess;SunFlareDynamic sunFlareState[4];
struct r_global_permanent_t {void *world;Material *additiveMaterial,*glareBlindMaterial;} rgp;
struct {int sunSpriteSamples;} dx;struct {int renderTargetWidth,renderTargetHeight;} dxState;
struct dvar_t {union {int integer;Bool enabled;} current;} renderer,drawSun;
const dvar_t *r_rendererInUse=&renderer,*r_drawSun=&drawSun;
int trace(int,const float*,const float*,const float*,const float*,int,int);
struct refimport_t {void *unused[90];int (*CM_BoxSightTrace)(int,const float*,const float*,const float*,const float*,int,int);} ri;
const float identityMatrix44[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};const vec3_t vec3_origin={0,0,0};
int ends,begins,pushes,pops,projections,views,sleeps,traces,traceResult,sets,screenDraws;float coverage;unsigned screenColor;std::vector<float> viewW;unsigned short indices[64];
void Sleep(unsigned n){assert(n==0);++sleeps;}
void RB_EndSurface(){++ends;tess.indexCount=tess.optimizedIndexCount=tess.vertexCount=0;}
void RB_BeginSurface(const Material *m,int t,int l){++begins;tess.material=m;tess.techType=t;tess.lmapIndex=l;}
void RB_PushMatrixStack(){++pushes;++backEnd.codeMatrixStackLevel;}
void RB_PopMatrixStack(){++pops;--backEnd.codeMatrixStackLevel;}
void RB_ProjectionMatrixChanged(){++projections;assert(!memcmp(&backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0],identityMatrix44,64));}
void RB_SetViewMatrix(const D3DMATRIX *m){++views;assert(!memcmp(m,identityMatrix44,64));}
void RB_SetViewMatrixForWDx7(float x){viewW.push_back(x);}
void RB_Set3D(){++sets;backEnd.projection2D=0;}
float RB_SunSpriteScreenFraction(int x,int y){assert(x==16&&y==16);return coverage;}
int I_fround(float x){return (int)lrintl((long double)x+1.0L/(1u<<30));}
void Vec3Cross(const float *a,const float *b,float *o){o[0]=a[1]*b[2]-a[2]*b[1];o[1]=a[2]*b[0]-a[0]*b[2];o[2]=a[0]*b[1]-a[1]*b[0];}
float Vec3Normalize(float *v){float l=sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);if(l)for(int c=0;c<3;++c)v[c]/=l;return l;}
#define VectorSet(v,a,b,c) ((v)[0]=(a),(v)[1]=(b),(v)[2]=(c))
#define Vector2Set(v,a,b) ((v)[0]=(a),(v)[1]=(b))
void RB_DrawStretchPic(const Material *m,float x,float y,float width,float height,float s,float t,float u,float v,unsigned color){assert(m==rgp.glareBlindMaterial&&x==0&&y==0&&width==640&&height==480&&s==0&&t==0&&u==1&&v==1);++screenDraws;screenColor=color;}
'''+quads+source+r'''
GfxSunWorldView world;GfxViewParms view;
int trace(int old,const float *start,const float *end,const float *mins,const float *maxs,int model,int mask){++traces;assert(old==77&&start==view.origin&&mins==vec3_origin&&maxs==vec3_origin&&model==0&&mask==0x2003);for(int c=0;c<3;++c)assert(end[c]==world.sun.sunFxPosition[c]*262144+view.origin[c]);return traceResult;}
bool near(float a,float b){return a==b||fabsf(a-b)<1e-5f;}
void reset(int mode){memset(&backEnd,0,sizeof(backEnd));memset(&tess,0,sizeof(tess));memset(sunFlareState,0,sizeof(sunFlareState));memset(&world,0,sizeof(world));memset(&view,0,sizeof(view));memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indices,0x5a,sizeof(indices));tess.indices=indices;rgp.world=&world;rgp.additiveMaterial=mats;rgp.glareBlindMaterial=mats+1;world.sun.spriteMaterial=mats+2;world.sun.flareMaterial=mats+3;world.sun.hasValidData=1;world.sun.sunFxPosition[0]=1;world.sun.spriteSize=16;
 for(int c=0;c<4;++c){view.viewProjectionMatrix.m[c][c]=1;backEnd.viewProjectionMatrix.m[c][c]=1;}
 view.viewProjectionMatrix._14=2;backEnd.viewProjectionMatrix._11=3;backEnd.viewProjectionMatrix._14=4;view.axis[0][0]=1;view.origin[0]=3;backEnd.viewParms=&view;backEnd.width=640;backEnd.height=480;backEnd.tileCount=1;backEnd.sceneDef.time=100;renderer.current.integer=mode;drawSun.current.enabled=1;dx.sunSpriteSamples=100;dxState.renderTargetWidth=640;dxState.renderTargetHeight=480;
 query.waits=query.result=query.gets=0;query.samples=25;query.issues.clear();ends=begins=pushes=pops=projections=views=sleeps=traces=traceResult=sets=screenDraws=0;coverage=.5f;viewW.clear();ri.CM_BoxSightTrace=trace;
}
int main(){int cases=0;
 for(int mode:{2,3})for(float width:{-.25f,0.0f,.25f})for(float height:{-.5f,.5f}){
  reset(mode);GfxColor color;color.packed=0xff332211;RB_TessSunBillboard(width,height,color);
  assert(tess.vertexCount==4&&tess.indexCount==6&&projections==1&&views==1);
  int sx[]={1,1,-1,-1},sy[]={1,-1,-1,1};for(int i=0;i<4;++i){if(mode==2){GfxVertexDx7 *v=(GfxVertexDx7*)tess.vertexData;assert(near(v[i].xyz[0],.5f+sx[i]*width)&&near(v[i].xyz[1],sy[i]*height)&&near(v[i].xyz[2],-.001f)&&v[i].color.packed==color.packed);}else{GfxVertex *v=(GfxVertex*)tess.vertexData;assert(near(v[i].xyzw[0],3+sx[i]*width*4)&&near(v[i].xyzw[1],sy[i]*height*4)&&near(v[i].xyzw[2],-.004f)&&v[i].xyzw[3]==4&&v[i].color.packed==color.packed);}}
  assert(indices[0]==3&&indices[1]==0&&indices[2]==2&&indices[3]==2&&indices[4]==0&&indices[5]==1);++cases;
 }
 for(int mode:{2,3})for(int axis:{0,1,2}){
  reset(mode);memset(world.sun.sunFxPosition,0,12);world.sun.sunFxPosition[axis]=1;
  if(mode==2)RB_DrawSunSpriteDx7();else RB_DrawSunSprite();assert(begins==1&&ends==1&&tess.techType==1);assert(viewW==(mode==2?std::vector<float>{0,1}:std::vector<float>{}));
  float total[3]={};for(int i=0;i<4;++i)for(int c=0;c<3;++c)total[c]+=mode==2?((GfxVertexDx7*)tess.vertexData)[i].xyz[c]:((GfxVertex*)tess.vertexData)[i].xyzw[c];for(int c=0;c<3;++c)assert(near(total[c],4*world.sun.sunFxPosition[c]));if(mode==3)for(int i=0;i<4;++i)assert(((GfxVertex*)tess.vertexData)[i].xyzw[3]==0);++cases;
 }
 for(int hit:{0,9})for(float fraction:{0.0f,.5f}){reset(3);coverage=fraction;traceResult=hit;sunFlareState[0].hitNum=77;RB_TraceSunVisibility(sunFlareState);assert(traces==int(fraction!=0));assert(sunFlareState[0].lastVisibility==(hit?0:fraction));++cases;}
 for(int mode:{2,3})for(int issued:{0,1})for(int wait:{0,2})for(int error:{0,-1})for(unsigned samples:{0u,25u,150u}){
  reset(mode);query.waits=wait;query.result=error;query.samples=samples;SunFlareDynamic *f=sunFlareState;f->sunQuery[0]=&query;f->sunQueryIssued[0]=issued;f->lastVisibility=.75f;
  RB_QuerySunVisibility(f);float want=issued?(!error&&samples<=100?float(samples)/100:.75f):0;
  assert(f->lastVisibility==want&&f->error==0&&f->sunQueryIssued[0]);assert(query.gets==(issued?wait+1:0)&&sleeps==(issued?wait:0));assert(query.issues==std::vector<int>({2,1}));assert(pushes==1&&pops==1&&backEnd.codeMatrixStackLevel==0);++cases;
 }
 for(int mode:{2,3})for(int frame:{0,10,100,-10}){
  reset(mode);GfxSunParams &sun=world.sun;sun.flareMinDot=.25f;sun.flareMaxDot=1;sun.flareMaxAlpha=.6f;sun.flareMinSize=10;sun.flareMaxSize=90;sun.flareFadeInTime=sun.flareFadeOutTime=100;
  SunFlareDynamic *f=sunFlareState;f->lastDot=.75f;f->lastVisibility=.5f;f->flareIntensity=.25f;
  RB_UpdateSunFlare(f,frame);float want=.25f+frame/100.0f;if(want>.5f)want=.5f;assert(near(f->flareIntensity,want));
  unsigned char channel=(unsigned char)lrintl((long double)(want*.4f*255.0f)+1.0L/(1u<<30));unsigned color=0xff000000u|channel*0x010101u;
  assert((mode==2?((GfxVertexDx7*)tess.vertexData)[0].color.packed:((GfxVertex*)tess.vertexData)[0].color.packed)==color);assert(pushes==1&&pops==1&&ends==1);++cases;
 }
 for(bool enabled:{false,true})for(bool valid:{false,true}){
  reset(3);drawSun.current.enabled=enabled;world.sun.hasValidData=valid;world.sun.sunFxPosition[0]=-1;backEnd.projection2D=1;sunFlareState[0].hitNum=77;
  RB_DrawSun(0);assert(sets==int(enabled&&valid)&&traces==sets);if(sets)assert(sunFlareState[0].lastDot==-1&&sunFlareState[0].lastVisibility==.5f);++cases;
 }
 for(bool enabled:{false,true})for(bool valid:{false,true})for(int last:{0,90,110}){
  reset(3);drawSun.current.enabled=enabled;world.sun.hasValidData=valid;world.sun.flareMaterial=0;SunFlareDynamic *f=sunFlareState;f->lastTime=last;f->lastVisibility=1;
  world.sun.blindMinDot=world.sun.glareMinDot=.25f;world.sun.blindMaxDot=world.sun.glareMaxDot=.75f;world.sun.blindMaxDarken=.5f;world.sun.glareMaxLighten=.25f;
  RB_DrawSunPostEffects(0);assert(f->lastTime==100&&screenDraws==int(enabled&&valid));if(enabled&&valid)assert(screenColor==0x7f3f3f3fu);++cases;
 }
 printf("PASS: %d actual sun geometry/query/post-effect cases, both formats, polar fallback, collision visibility, delayed/error queries, packed colors and disabled-time publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sun_render_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-I',str(w/'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
