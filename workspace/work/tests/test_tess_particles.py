"""Actual particle constants and draw driver, including PC-only behavior."""
from pathlib import Path
import subprocess
import tempfile
import struct
import pefile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('// PINNED PC particle-cloud submission, 10040ca0..10041024.'):text.index('// Sprite geometry and projection.')]
source=source.replace('static void RB_SetParticleCloudConstants(', 'static int testOriginsMatch(const float *a,const float *b){++compares;return RB_ParticleCloudOriginsMatch(a,b);}\nstatic void RB_SetParticleCloudConstants(')
source=source.replace('|| RB_ParticleCloudOriginsMatch(ent->origin, ent->endpos)', '|| testOriginsMatch(ent->origin, ent->endpos)')
header=(work/'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct GfxCodeMatrix','struct alignas(16) GfxCodeMatrix')
header=header.replace('#include "r_scene_records.h"','#include "'+str(work/'src/gfx_d3d/r_scene_records.h')+'"')
math=(work/'src/universal/com_math.cpp').read_text()
def body(decl):
    a=math.index(decl);i=math.index('{',a);depth=1;j=i+1
    while depth:
        depth+=(math[j]=='{')-(math[j]=='}');j+=1
    return math[a:j].replace('__declspec(noinline) ','')
normalize=body('__declspec(noinline) vec_t Vec3Normalize(').replace('Vec3Normalize','actualNormalize')
retail=pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert retail.get_data(0x19bd54,4)==struct.pack('<f',1/255)
assert retail.get_data(0x19bd50,4)==bytes.fromhex('be378635')
assert retail.get_data(0x19bde4,4)==struct.pack('<f',.001)
program=r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cmath>
#include <cstdio>
#include <cstdarg>
#include <limits>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef float vec_t;typedef float vec3_t[3];
#define __declspec(x)
struct GfxImage;
struct D3DMATRIX {float m[4][4];};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
struct Material {struct {const char *name;} info;} material={{"particle/test"}};
struct GfxEntity {
 int type,flags;float lighting[3],axis[3][3],scale,origin[3],endpos[3];Material *customMaterial;
 byte materialRGBA[4];float materialTime;int materialSubimageIndex;float radius[2],rotation,minScreenRadius;
} entity;
'''+header+r'''
r_backEndGlobals_t backEnd;
GfxViewParms view;
struct IDirect3DIndexBuffer9 {int id;} ib={1},oldIb={2};
struct IDirect3DVertexBuffer9 {int id;} vb={1},oldVb={2},alternateVb={3};
struct DxGlobals {byte before[0x2db8];IDirect3DVertexBuffer9 *particleCloudVertexBuffer;IDirect3DIndexBuffer9 *particleCloudIndexBuffer;} dx;
struct {IDirect3DIndexBuffer9 *indexBuffer;struct {IDirect3DVertexBuffer9 *vb;int offset,stride;} streams[1];} dxState;
struct {const Material *material;int indexCount,optimizedIndexCount;} tess;
struct dvar_t {struct {int integer;} current;} renderer,logging;
const dvar_t *r_rendererInUse=&renderer,*r_logFile=&logging;
struct GfxDrawPrimArgs {int firstVertexFromBase,vertexCount,primCount;union {struct {int baseVertex,baseIndex;} buf;} u;};
int ends,formats,logs,indexBinds,vertexBinds,draws,compares,normalizes,mutation;
GfxDrawPrimArgs drawn;std::vector<int> events;std::string logText;
float I_sqrt(float value){return sqrtf(value);}
'''+normalize+r'''
float Vec3Normalize(float *v){++normalizes;return actualNormalize(v);}
void RB_EndSurface(){++ends;events.push_back(1);tess.indexCount=tess.optimizedIndexCount=0;}
char *va(const char *format,...){static char text[128];++formats;events.push_back(2);va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);if(mutation==1)logging.current.integer=0;return text;}
void RB_LogPrint(const char *text){if(logging.current.integer){++logs;logText=text;}}
void RB_ChangeIndices(IDirect3DIndexBuffer9 *buffer){assert(buffer==&ib);++indexBinds;events.push_back(3);dxState.indexBuffer=buffer;if(mutation==2)dx.particleCloudVertexBuffer=&alternateVb;}
void RB_ChangeStreamSource(int stream,IDirect3DVertexBuffer9 *buffer,int offset,int stride){assert(!stream&&!offset&&stride==20&&buffer==(mutation==2?&alternateVb:&vb));++vertexBinds;events.push_back(4);dxState.streams[0]={buffer,offset,stride};}
void RB_DrawTechnique(int decl,const GfxDrawPrimArgs *args){assert(decl==2);++draws;events.push_back(5);drawn=*args;}
'''+source+r'''
void reset(){
 memset(&backEnd,0x5a,sizeof(backEnd));memset(&view,0,sizeof(view));memset(&entity,0,sizeof(entity));
 backEnd.viewParms=&view;for(int i=0;i<4;++i)view.viewMatrix.m[i][i]=1;
 entity.radius[0]=2;entity.radius[1]=2;entity.materialRGBA[0]=3;entity.materialRGBA[1]=37;entity.materialRGBA[2]=129;entity.materialRGBA[3]=255;
 tess.material=&material;tess.indexCount=tess.optimizedIndexCount=0;dx.particleCloudIndexBuffer=&ib;dx.particleCloudVertexBuffer=&vb;
 dxState.indexBuffer=&ib;dxState.streams[0]={&vb,0,20};renderer.current.integer=1;logging.current.integer=0;
 ends=formats=logs=indexBinds=vertexBinds=draws=compares=normalizes=mutation=0;events.clear();logText.clear();
}
bool close(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||fabsf(a-b)<=2e-6f*(1+fabsf(b));}
void axis(float a,float b,float c,float d){float want[4]={a,b,c,d};for(int i=0;i<4;++i)assert(close(backEnd.codeConsts[49][i],want[i]));}
void guards(){for(int row=0;row<59;++row)if(row!=48&&row!=49)for(int col=0;col<4;++col){unsigned bits;memcpy(&bits,&backEnd.codeConsts[row][col],4);assert(bits==0x5a5a5a5a);}}
int main(){
 static_assert(sizeof(GfxEntity)==116&&sizeof(GfxCodeMatrices)==0xcd0,"PC records");
 int cases=0;
 for(float radius:{-3.f,-0.f,0.f,2.f,100.f,std::numeric_limits<float>::infinity()}){
  reset();entity.radius[0]=entity.radius[1]=radius;entity.endpos[0]=99;
  RB_SetParticleCloudConstants(&entity);axis(radius,0,0,radius);assert(!compares&&!normalizes);guards();++cases;
 }
 reset();entity.radius[0]=5;entity.radius[1]=10;for(float &v:entity.endpos)v=.0009f;
 RB_SetParticleCloudConstants(&entity);axis(5,0,0,10);assert(compares==1&&!normalizes);guards();++cases;
 for(float radius:{-5.f,5.f,20.f})for(float other:{-10.f,0.f,10.f}){
  reset();entity.radius[0]=radius;entity.radius[1]=other;entity.endpos[0]=3;entity.endpos[1]=4;
  RB_SetParticleCloudConstants(&entity);assert(compares==1&&normalizes==1);
  if(other<=0)axis(radius,0,0,other);
  else if(radius>10)axis(16,-12,12,16);
  else axis(radius*.8f,-radius*.6f,6,8);
  guards();++cases;
 }
 for(float x:{-10.f,0.f,.0009f,.001f,3.f})for(float y:{-20.f,0.f,.0009f,.001f,4.f}){
  reset();entity.radius[0]=5;entity.radius[1]=7;float up[3]={x,y,99},out[4];RB_ProjectParticleCloudAxis(&entity,up,out);
  if(x<.001f&&y<.001f)assert(out[0]==5&&out[1]==0&&out[2]==0&&out[3]==7);
  else{double len=hypot((double)x,y),s=5/len;assert(close(out[0],(float)(y*s))&&close(out[1],(float)(-x*s)));assert(close(out[2],(float)(x*(len<5?s:1)))&&close(out[3],(float)(y*(len<5?s:1))));}
  ++cases;
 }
 reset();float in[3]={1,1,1},out[3];view.viewMatrix.m[0][0]=1048576;view.viewMatrix.m[1][0]=-1048576;view.viewMatrix.m[2][0]=ldexpf(1.f,-64);
 RB_RotateParticleCloudDirection(in,out);assert(out[0]==0);++cases;
 reset();for(int r=0;r<3;++r)for(int c=0;c<3;++c)view.viewMatrix.m[r][c]=(float)(r*3+c+1);
 RB_RotateParticleCloudDirection(in,&view.viewMatrix.m[0][1]);
 assert(view.viewMatrix.m[0][1]==12&&view.viewMatrix.m[0][2]==15&&view.viewMatrix.m[0][3]==18);++cases;

 for(int n=0;n<256;++n){
  reset();for(int i=0;i<4;++i)entity.materialRGBA[i]=(byte)(n+i*61);RB_SetParticleCloudConstants(&entity);
  for(int i=0;i<4;++i){float want=(float)((long double)entity.materialRGBA[i]*(float)(1.f/255.f));if(memcmp(&want,&backEnd.codeConsts[48][i],4)){unsigned a,b;memcpy(&a,&want,4);memcpy(&b,&backEnd.codeConsts[48][i],4);fprintf(stderr,"color byte=%u want=%08x got=%08x\n",entity.materialRGBA[i],a,b);assert(false);}}guards();++cases;
 }
 reset();entity.radius[0]=std::numeric_limits<float>::quiet_NaN();entity.radius[1]=3;entity.endpos[0]=std::numeric_limits<float>::quiet_NaN();
 RB_SetParticleCloudConstants(&entity);axis(entity.radius[0],0,0,3);assert(compares==1&&!normalizes);++cases;
 for(int mode:{1,2,3})for(int ordinary:{0,3})for(int optimized:{0,6})for(int enabled:{0,1})for(int ibChanged:{0,1})for(int vbChanged:{0,1,2,3}){
  reset();renderer.current.integer=mode;tess.indexCount=ordinary;tess.optimizedIndexCount=optimized;logging.current.integer=enabled;
  dxState.indexBuffer=ibChanged?&oldIb:&ib;dxState.streams[0]={vbChanged==1?&oldVb:&vb,vbChanged==2?4:0,vbChanged==3?24:20};
  RB_TessParticleCloud(&entity);assert(ends==(ordinary!=0||optimized!=0)&&formats==enabled&&logs==enabled&&indexBinds==ibChanged&&vertexBinds==(vbChanged!=0)&&draws==1);
  if(enabled)assert(logText=="--- RB_TessParticleCloud( particle/test ) ---\n");
  assert(drawn.firstVertexFromBase==0&&drawn.vertexCount==4096&&drawn.primCount==2048&&drawn.u.buf.baseVertex==0&&drawn.u.buf.baseIndex==0);
  axis(2,0,0,2);guards();assert(events.back()==5);++cases;
 }
 reset();mutation=2;dxState.indexBuffer=&oldIb;RB_TessParticleCloud(&entity);assert(indexBinds==1&&vertexBinds==1&&dxState.streams[0].vb==&alternateVb);++cases;
 reset();mutation=1;logging.current.integer=1;RB_TessParticleCloud(&entity);assert(formats==1&&!logs&&draws==1);++cases;
 printf("PASS: %d actual particle routes, shader constant/neighbor guards, signed fallback, epsilon, rotation order, RGBA bits, DX7 execution, live buffers and PC draw counts\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
