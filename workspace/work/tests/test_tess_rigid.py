"""Actual rigid submission and stack push, with recording buffer/draw boundaries."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('extern DxState dxState;'):text.index('// PINNED PC skinned-model submission, 10041140..100413b5.')]
state=(work/'src/gfx_d3d/rb_state.cpp').read_text()
a=state.index('void RB_PushMatrixStack()');push=state[a:state.index('void RB_PopMatrixStack()',a)]
header=(work/'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct GfxCodeMatrix','struct alignas(16) GfxCodeMatrix')
header=header.replace('#include "r_scene_records.h"','#include "'+str(work/'src/gfx_d3d/r_scene_records.h')+'"')
program=r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <vector>
#include <string>
#include <initializer_list>
typedef unsigned char Bool;typedef int surfaceType_t;
struct GfxImage;
struct D3DMATRIX {float m[4][4];};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
struct GfxEntity {unsigned char before[56];float scale;unsigned char after[56];} entity;
'''+header+r'''
r_backEndGlobals_t backEnd;
struct IDirect3DIndexBuffer9 {int id;} ib={1},oldIb={2};
struct IDirect3DVertexBuffer9 {int id;} vb={1},oldVb={2},alternateVb={3};
struct DxState {unsigned char before[0x20cc];IDirect3DIndexBuffer9 *indexBuffer;struct {IDirect3DVertexBuffer9 *vb;int offset,stride;} streams[1];} dxState;
struct XSurface {unsigned char tile;short vertCount,triCount,boneOffset;void *triIndices,*verts;struct {IDirect3DVertexBuffer9 *vb;} surfRigid;IDirect3DIndexBuffer9 *indexBuffer;};
struct GfxModelSurface {int surfType;XSurface *xsurf;};
struct GfxModelRigidSurface {GfxModelSurface surf;float boneAxis[4][3];} surface;
struct Material {struct {const char *name;} info;} material={{"rigid/test"}};
struct {const Material *material;int indexCount,optimizedIndexCount;} tess;
struct dvar_t {struct {int integer;} current;} renderer,logging;
const dvar_t *r_rendererInUse=&renderer,*r_logFile=&logging;
struct GfxDrawPrimArgs {int firstVertexFromBase,vertexCount,primCount;union {struct {int baseVertex,baseIndex;} buf;} u;};
int ends,formats,logs,indexBinds,vertexBinds,changes,draws,pops,mutation,drawLevel;
float changedScale;GfxDrawPrimArgs drawn;D3DMATRIX drawnMatrix;
std::vector<int> events;std::string logText;
void RB_EndSurface(){++ends;events.push_back(1);tess.indexCount=tess.optimizedIndexCount=0;}
char *va(const char *format,...){static char text[128];++formats;events.push_back(2);va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);if(mutation==1)logging.current.integer=0;return text;}
void RB_LogPrint(const char *text){if(logging.current.integer){++logs;logText=text;}}
void RB_ChangeIndices(IDirect3DIndexBuffer9 *buffer){assert(buffer==&ib);++indexBinds;events.push_back(3);dxState.indexBuffer=buffer;
 if(mutation==2){surface.surf.xsurf->surfRigid.vb=&alternateVb;renderer.current.integer=2;}}
void RB_ChangeStreamSource(int stream,IDirect3DVertexBuffer9 *buffer,int offset,int stride){assert(stream==0&&!offset&&stride==(renderer.current.integer==2?36:64));
 assert(buffer==(mutation==2?&alternateVb:&vb));++vertexBinds;events.push_back(4);dxState.streams[0]={buffer,offset,stride};}
void RB_ChangedWorldMatrix(float scale){++changes;events.push_back(5);changedScale=scale;backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].worldScale=scale;}
void RB_DrawTechnique(int declaration,const GfxDrawPrimArgs *args){assert(declaration==0);++draws;events.push_back(6);drawn=*args;
 drawLevel=backEnd.codeMatrixStackLevel;drawnMatrix=backEnd.codeMatrixStack[drawLevel].world.matrix[0];}
void RB_PopMatrixStack(){++pops;events.push_back(7);--backEnd.codeMatrixStackLevel;}
'''+push+source+r'''
XSurface xs;
void reset(){
 memset(&backEnd,0x5a,sizeof(backEnd));memset(&entity,0x5a,sizeof(entity));entity.scale=2.5f;backEnd.currentEntity=&entity;
 xs={0,27,13,0,0,0,{&vb},&ib};surface.surf={4,&xs};
 for(int i=0;i<12;++i)((float *)surface.boneAxis)[i]=(float)(i*3-7);
 tess.material=&material;tess.indexCount=tess.optimizedIndexCount=0;
 dxState.indexBuffer=&ib;dxState.streams[0]={&vb,0,64};
 ends=formats=logs=indexBinds=vertexBinds=changes=draws=pops=mutation=0;logText.clear();events.clear();renderer.current.integer=1;logging.current.integer=0;
}
int main(){
 int cases=0;
 for(int mode:{1,2,3})for(int level:{0,1})for(int ordinary:{0,3})for(int optimized:{0,6})for(int enabled:{0,1})
 for(int indexChanged:{0,1})for(int vertexChanged:{0,1,2,3}){
  reset();renderer.current.integer=mode;backEnd.codeMatrixStackLevel=level;tess.indexCount=ordinary;tess.optimizedIndexCount=optimized;logging.current.integer=enabled;
  dxState.indexBuffer=indexChanged?&oldIb:&ib;dxState.streams[0]={vertexChanged==1?&oldVb:&vb,vertexChanged==2?4:0,(mode==2?36:64)+(vertexChanged==3?4:0)};
  GfxCodeMatrices before=backEnd.codeMatrixStack[level];RB_TessXModelRigid((surfaceType_t *)&surface);
  assert(ends==(ordinary!=0||optimized!=0)&&formats==enabled&&logs==enabled&&indexBinds==indexChanged&&vertexBinds==(vertexChanged!=0));
  if(enabled)assert(logText=="--- RB_TessXModelRigid( rigid/test ) ---\n");
  assert(draws==1&&changes==1&&pops==1&&drawLevel==level+1&&backEnd.codeMatrixStackLevel==level&&changedScale==2.5f);
  assert(!memcmp(&backEnd.codeMatrixStack[level],&before,sizeof(before)));
  for(int row=0;row<4;++row){assert(!memcmp(drawnMatrix.m[row],surface.boneAxis[row],12));assert(drawnMatrix.m[row][3]==(row==3?1:0));}
  assert(drawn.firstVertexFromBase==0&&drawn.vertexCount==27&&drawn.primCount==13&&drawn.u.buf.baseVertex==0&&drawn.u.buf.baseIndex==0);
  assert(events[events.size()-3]==5&&events[events.size()-2]==6&&events.back()==7);++cases;
 }
 reset();backEnd.codeMatrixStackLevel=0;logging.current.integer=1;mutation=1;RB_TessXModelRigid((surfaceType_t *)&surface);assert(formats==1&&!logs&&draws==1);++cases;
 reset();backEnd.codeMatrixStackLevel=0;mutation=2;dxState.indexBuffer=&oldIb;RB_TessXModelRigid((surfaceType_t *)&surface);
 assert(indexBinds==1&&vertexBinds==1&&dxState.streams[0].vb==&alternateVb&&dxState.streams[0].stride==36);++cases;
 printf("PASS: %d actual rigid routes, conditional buffer binds, captured args, 0xcd0-byte stack copy, bone matrix, scale, logging and live renderer changes\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
