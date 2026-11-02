"""Actual late-post command: radius ordering, effects, debug priority and callbacks."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/rb_backend.cpp').read_text()
source=s[s.index('// Backend late-post effects.'):s.index('// Complete retail command dispatch.')]
need=s[s.index('unsigned char RB_NeedsSceneCopy('):s.index('void RB_InitSceneViewport();')]
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef int GfxRenderTargetId;
const int R_RENDERTARGET_FRAME_BUFFER=0,R_RENDERTARGET_RESOLVED_SCENE=2,R_RENDERTARGET_DYNAMICSHADOWS=3,R_RENDERTARGET_FLOAT_Z=6,R_RENDERTARGET_BLURRED_SCREEN=8,R_RENDERTARGET_NONE=14;
struct Material {int id;} materials[8];struct GfxImage {int id;} images[13];
struct GfxCmdHeader {unsigned short id,byteCount;};struct GfxRenderCommandExecState {const void *cmd;int stackPos;const void *retCmd[2];};
struct {int indexCount,optimizedIndexCount;} tess;
struct {float codeConsts[59][4];int glowIndexFirst,glowCount;GfxImage *glowImage[2],*currentFeedbackImage;int resolvedSceneTarget;}backEnd;
struct {void *world;Material *colorChannelMixerMaterial,*frameColorDebugMaterial,*frameAlphaDebugMaterial,*glowApplyBloomMaterial,*glowApplySkyBleedMaterial,*feedbackBlendMaterial;}rgp;
struct {bool hasSeparateAlphaBlend;struct {GfxImage *image;void *colorSurface;}renderTargets[13];}dx;
struct {int renderTargetWidth,renderTargetHeight,renderTargetId;}dxState;
struct dvar_t {union {float value;int integer;byte enabled;}current;} vars[20];
const dvar_t *r_rendererInUse=vars,*r_glow=vars+1,*r_fullbright=vars+2,*r_showFbColorDebug=vars+3,*r_blur=vars+4;
const dvar_t *r_glowRadius[2]={vars+5,vars+6},*r_glowSkyBleedIntensity[2]={vars+7,vars+8},*r_glowBloomIntensity[2]={vars+9,vars+10};
const dvar_t *r_glowBloomCutoff=vars+11,*r_glowBloomDesaturation=vars+12,*r_showFloatZDebug=vars+13,*sc_showDebug=vars+14;
float minimum(float x){assert(x==3);return 3;}struct {float (*GetVirtualWidthFromRealWidth)(float);}ri={minimum};
struct Draw {const Material *material;GfxImage *image;unsigned color;float x,y,w,h,s,t,u,v,c27[4],c33[4];};std::vector<Draw>draws;std::vector<int>targets;
int ends,copies,glows,gaussians,mutation;float seenRadius[2],gaussianRadius;GfxRenderCommandExecState *live;GfxCmdHeader alternate={0,24};
void mutate();
void RB_EndSurface(){++ends;tess.indexCount=tess.optimizedIndexCount=0;if(mutation==1&&ends==1)mutate();}
void RB_SetRenderTarget(int t){targets.push_back(t);dxState.renderTargetId=t;}
void RB_CopyBackBufferToSurface(GfxImage *im){assert(im==images+2);++copies;}
void RB_GaussianFilterImage(float radius,int target){assert(target==8);++gaussians;gaussianRadius=radius;}
void RB_GlowFilterImage(float *r){++glows;seenRadius[0]=r[0];seenRadius[1]=r[1];if(r[0]){backEnd.glowCount=r[1]?2:1;backEnd.glowImage[0]=images+9;backEnd.glowImage[1]=images+10;}}
void RB_DrawStretchPic(const Material *m,float x,float y,float w,float h,float s,float t,float u,float v,unsigned color){Draw d={m,backEnd.currentFeedbackImage,color,x,y,w,h,s,t,u,v,{},{}};memcpy(d.c27,backEnd.codeConsts[27],16);memcpy(d.c33,backEnd.codeConsts[33],16);draws.push_back(d);if(mutation==2)live->cmd=&alternate;}
int I_fround(float x){return (int)lrintl((long double)x+1.0L/(1u<<30));}
'''+need+source+r'''
GfxPostWorldView world;GfxCmdLatePost packet;
void mutate(){live->cmd=&alternate;packet.blurRadius=1;dxState.renderTargetId=7;}
void reset(){memset(&backEnd,0,sizeof(backEnd));memset(&world,0,sizeof(world));memset(vars,0,sizeof(vars));memset(&tess,0,sizeof(tess));draws.clear();targets.clear();ends=copies=glows=gaussians=mutation=0;vars[0].current.integer=3;vars[1].current.enabled=1;vars[5].current.value=5;vars[6].current.value=12;vars[9].current.value=vars[10].current.value=1;vars[11].current.value=.5f;vars[12].current.value=.25f;rgp.world=&world;
 rgp.colorChannelMixerMaterial=materials;rgp.frameColorDebugMaterial=materials+1;rgp.frameAlphaDebugMaterial=materials+2;rgp.glowApplyBloomMaterial=materials+3;rgp.glowApplySkyBleedMaterial=materials+4;rgp.feedbackBlendMaterial=materials+5;
 dxState.renderTargetWidth=640;dxState.renderTargetHeight=480;dxState.renderTargetId=5;dx.hasSeparateAlphaBlend=true;for(int i=0;i<13;++i){dx.renderTargets[i].image=images+i;dx.renderTargets[i].colorSurface=(void*)1;}world.skyImage=images;
 for(int c=0;c<4;++c)backEnd.codeConsts[27][c]=c+.25f;
}
int main(){int cases=0;
 for(bool sky:{false,true})for(float a:{0.0f,5.0f,15.0f})for(float b:{0.0f,12.0f})for(bool bloom:{false,true}){
  reset();world.skyImage=sky?images:0;vars[5].current.value=a;vars[6].current.value=b;vars[9].current.value=vars[10].current.value=bloom?1:0;vars[7].current.value=vars[8].current.value=1;
  float r[2];int first=RB_GetGlowRadii(r);float x=sky||bloom?a:0,y=sky||bloom?b:0;bool swap=y!=0&&(x==0||x>y);assert(first==int(swap)&&r[0]==(swap?y:x)&&r[1]==(swap?x:y));++cases;
 }
 for(float radius:{0.5f,1.0f,3.0f,8.0f}){
  reset();RB_DrawBlur(radius);assert(gaussians==1&&gaussianRadius==(radius<3?3:radius));assert(draws.size()==1&&draws[0].image==images+8&&draws[0].material==rgp.feedbackBlendMaterial);unsigned alpha=radius<3?(unsigned)lrintl((long double)(radius/3*255)+1.0L/(1u<<30)):255;assert(draws[0].color==((alpha<<24)|0xffffff));++cases;
 }
 for(int debug:{0,1,2})for(bool dz:{false,true})for(bool shadow:{false,true})for(int mode:{2,3}){
  reset();vars[0].current.integer=mode;vars[3].current.integer=debug;vars[13].current.enabled=dz;vars[14].current.enabled=shadow;float saved[4];memcpy(saved,backEnd.codeConsts[27],16);
  RB_DrawPostDebug();assert(!memcmp(saved,backEnd.codeConsts[27],16));int expected=debug==1?4:mode==2?0:debug==2?4:dz||shadow?1:0;assert(draws.size()==(unsigned)expected);
  if(debug==1){assert(draws[0].color==0xffff0000&&draws[1].color==0xff00ff00&&draws[2].color==0xff0000ff&&draws[3].material==rgp.frameAlphaDebugMaterial);}
  if(mode==3&&debug==2)for(int i=0;i<4;++i){assert(draws[i].image==images+3);for(int c=0;c<4;++c)assert(draws[i].c27[c]==float(i==c));}
  if(mode==3&&debug==0&&dz){unsigned bits;memcpy(&bits,&draws[0].c27[0],4);assert(draws[0].image==images+6&&bits==0x3a83126f);}
  if(mode==3&&debug==0&&!dz&&shadow){unsigned bits;memcpy(&bits,&draws[0].c27[1],4);assert(draws[0].image==images+3&&bits==0x3eab020c);}++cases;
 }
 for(int mode:{2,3})for(bool support:{false,true})for(bool glow:{false,true})for(bool fullbright:{false,true})for(float blur:{0.0f,2.0f})for(float frameBlur:{0.0f,4.0f}){
  reset();vars[0].current.integer=mode;dx.hasSeparateAlphaBlend=support;vars[1].current.enabled=glow;vars[2].current.enabled=fullbright;vars[4].current.value=blur;packet={{26,12},frameBlur};GfxRenderCommandExecState state={&packet,1,{&packet,&alternate}};live=&state;
  RB_ApplyLatePostEffectsCmd(&state);bool wantGlow=mode!=2&&support&&glow&&!fullbright,wantBlur=mode!=2&&(blur>0||frameBlur>0);assert(copies==int(wantGlow||wantBlur)&&glows==int(wantGlow)&&gaussians==int(wantBlur));assert(targets.back()==5&&state.cmd==(const byte*)&packet+12);if(wantGlow){assert(backEnd.glowCount==0&&draws[0].c33[3]==1&&backEnd.codeConsts[32][1]==2&&backEnd.codeConsts[32][3]==.25f);}++cases;
 }
 for(int change:{1,2}){
  reset();mutation=change;packet={{26,12},1};tess.indexCount=3;vars[1].current.enabled=0;GfxRenderCommandExecState state={&packet,1,{&packet,&alternate}};live=&state;
  RB_ApplyLatePostEffectsCmd(&state);assert(state.cmd==(const byte*)&alternate+24);assert(targets.back()==(change==1?7:5)&&state.stackPos==1&&state.retCmd[0]==&packet);++cases;
 }
 reset();dx.renderTargets[6].colorSurface=0;RB_DrawFloatZDebug();assert(draws.empty());++cases;
 printf("PASS: %d real late-post cases, glow ordering, filter/clamp alpha, debug precedence/constant restoration, effect gates and callback/cursor timing\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_late_post_') as d:
 b=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True);subprocess.run([b],check=True)
