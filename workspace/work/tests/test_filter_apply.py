"""Actual filter generators and application: targets, feedback, constants and glow ordering."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/rb_imagefilter.cpp').read_text()
source=s[s.index('static int RB_GaussianFilterPoints1D'):]
common=(w.parent/'src/opencod2/headers/cod2_defs.h').read_text();a=common.index('struct GfxImageFilterPass {');record=common[a:common.index('\n};',a)+3]
mac=(w.parent/'src/opencod2/headers/Mac/mac_types.h').read_text();a=mac.index('struct GfxImageFilter {');filter_record=mac[a:mac.index('\n};',a)+3]
program=r'''
#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef float vec4_t[4];typedef int GfxRenderTargetId;
const int R_RENDERTARGET_RESOLVED_SCENE=2,R_RENDERTARGET_GLOW_0=9,R_RENDERTARGET_PINGPONG_0=11,R_RENDERTARGET_PINGPONG_1=12;
struct Material {int id;} material,setup;struct GfxImage {int id;} images[13];
'''+record+filter_record+r'''
struct {float codeConsts[59][4];struct View {struct {unsigned Height;}viewport;} *viewParms;GfxImage *currentFeedbackImage,*glowImage[2];int resolvedSceneTarget,glowCount;} backEnd;
struct {struct Target {GfxImage *image;int width,height;}renderTargets[13];}dx;
struct {int width,height;float aspectRatioPixel;}vidConfig;
struct {Material *glowSetupMaterial,*symmetricFilterMaterial[8];}rgp;
struct Draw {int target;GfxImage *source;float w,h,s,t;};std::vector<Draw> draws;int target,ends;bool shorten;
void RB_SetRenderTarget(int t){target=t;}
void RB_EndSurface(){++ends;}
void RB_DrawStretchPic(const Material*,float x,float y,float w,float h,float s0,float t0,float s1,float t1,unsigned color){assert(x==0&&y==0&&s0==0&&t0==0&&color==0xffffffff);assert(backEnd.currentFeedbackImage);draws.push_back({target,backEnd.currentFeedbackImage,w,h,s1,t1});}
int I_fround(float x){return (int)lrintl((long double)x+1.0L/(1u<<30));}
float I_fmin(float a,float b){return a<b?a:b;}float I_fabs(float a){return fabsf(a);}
#define Vector4Set(v,a,b,c,d) ((v)[0]=a,(v)[1]=b,(v)[2]=c,(v)[3]=d)
'''+source+r'''
void reset(){static decltype(backEnd)::View view;memset(&backEnd,0,sizeof(backEnd));view.viewport.Height=480;backEnd.viewParms=&view;backEnd.resolvedSceneTarget=2;vidConfig.width=640;vidConfig.height=480;vidConfig.aspectRatioPixel=1.25f;
 for(int i=0;i<13;++i){images[i].id=i;dx.renderTargets[i]={images+i,320,240};}dx.renderTargets[2].width=640;dx.renderTargets[2].height=480;rgp.glowSetupMaterial=&setup;for(int i=0;i<8;++i)rgp.symmetricFilterMaterial[i]=&material;draws.clear();ends=0;}
int main(){int cases=0;
 for(int count:{0,1,2,3,16})for(int taps:{-1,0,1,8}){
  reset();GfxImageFilter f;memset(&f,0,sizeof(f));f.passCount=count;f.sourceImage=images+2;f.finalTarget=8;f.pingPongTargets[0]=11;f.pingPongTargets[1]=12;
  for(int i=0;i<count;++i){auto &p=f.passes[i];p.material=&material;p.srcWidth=.75f;p.srcHeight=.5f;p.dstWidth=100+i;p.dstHeight=50+i;p.tapHalfCount=taps;for(int j=0;j<8;++j)for(int c=0;c<4;++c)p.tapOffsetsAndWeights[j][c]=i*100+j*4+c;}
  for(auto &row:backEnd.codeConsts)for(float &x:row)x=-77;
  RB_ApplyFilterPasses(&f);assert(draws.size()==(unsigned)count&&ends==count);
  for(int i=0;i<count;++i){const Draw &d=draws[i];assert(d.target==(i==count-1?8:11+(i&1)));assert(d.source==(i?images+11+(1-(i&1)):images+2));assert(d.w==100+i&&d.h==50+i&&d.s==.75f&&d.t==.5f);}
  for(int j=0;j<59;++j)for(int c=0;c<4;++c){float want=count&&j>=33&&j<33+taps?(count-1)*100+(j-33)*4+c:-77;assert(backEnd.codeConsts[j][c]==want);}++cases;
 }
 for(float radius:{3.0f,5.0f,12.0f}){
  reset();RB_GaussianFilterImage(radius,8);assert(!draws.empty()&&draws.front().source==images+2&&draws.back().target==8&&ends==(int)draws.size());for(const Draw &d:draws)assert(d.w==320&&d.h==240);++cases;
 }
 reset();assert(RB_ApplyGlowFilter(2,9,0)==2&&draws.empty());++cases;
 reset();assert(RB_ApplyGlowFilter(11,9,.01f)==11&&draws.empty());++cases;
 for(float radius:{.01f,3.0f,12.0f}){reset();assert(RB_ApplyGlowFilter(2,9,radius)==9);assert(!draws.empty()&&draws.front().source==images+2&&draws.back().target==9&&draws.front().s==1&&draws.front().t==1);++cases;}
 for(float first:{0.0f,3.0f})for(float second:{0.0f,3.0f,5.0f}){
  reset();backEnd.glowCount=7;float r[2]={first,second};RB_GlowFilterImage(r);
  if(!first)assert(backEnd.glowCount==7&&draws.empty()&&r[1]==second);
  else{assert(backEnd.glowCount==(second?2:1)&&backEnd.glowImage[0]==images+9);assert(fabsf(r[0]-first*.5f)<1e-6f);if(second){assert(backEnd.glowImage[1]==images+9);assert(fabsf(r[1]-sqrtf((second*second-first*first)*.25f))<1e-6f);}}++cases;
 }
 printf("PASS: %d real filter application/generator/glow cases, slot33 constants/guards, ping-pong targets, source-return shortcuts and variance composition\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_filter_apply_') as d:
 b=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True);subprocess.run([b],check=True)
