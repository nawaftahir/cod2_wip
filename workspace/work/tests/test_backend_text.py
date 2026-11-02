"""Actual PC text kernels: packed colors, cursor routing, world quads and live commands."""
from pathlib import Path
import subprocess
import tempfile
import struct
import pefile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_backend.cpp').read_text()
source=text[text.index('// PINNED PC text drawing, 10032370..10032c92.'):text.index('// Backend sprite command.')]
source=source.replace('#include "r_font.h"','#include "'+str(work/'src/gfx_d3d/r_font.h')+'"')
vertex=text[text.index('void RB_SetVertex3D('):text.index('// PINNED 1002e640:')]
font=(work/'src/gfx_d3d/r_font.cpp').read_text()
lookup=font[font.index('Glyph *R_GetCharacterGlyph('):font.index('float R_NormalizedTextScale(')]
retail=pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
colors=retail.get_data(0x197f1c,32)
assert colors==bytes.fromhex('000000ffff0000ff00ff00ffffff00ff0000ffff00ffffffff00ffffffffffff')
program=r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <vector>
#include <string>
#include <initializer_list>
typedef unsigned char byte;typedef unsigned int GfxColor;
struct Material {int id;} material={1},otherMaterial={2};
struct GfxCmdHeader {unsigned short id,byteCount;};
struct GfxRenderCommandExecState {const void *cmd;int stackPos;const void *retCmd[2];};
struct GfxViewParms {int id;} view={1};
struct {unsigned color_axis,color_allies;const GfxViewParms *viewParms;} backEnd;
struct GfxVertex {float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3];};
struct GfxVertexDx7 {float xyz[3],normal[3];GfxColor color;float texCoord[2];};
struct {char vertexData[6000*64];unsigned short *indices;const Material *material;int techType,indexCount,vertexCount,optimizedIndexCount;} tess;
unsigned short indexStore[0x100010];
struct {struct {int integer;} current;} renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
int millis,reads,ends,begins,overflows,matrices,mutate;
GfxRenderCommandExecState *liveState;GfxCmdHeader replacement={0,28};
std::vector<int> events;
struct Draw {const Material *material;float x,y,w,h,uv[4];unsigned color;};
std::vector<Draw> draws;
unsigned readChar(const char **text,int *){++reads;unsigned c=(byte)*(*text)++;if(c==0xc2&& (byte)**text==0xa3){++*text;c=163;}return c;}
int milliseconds(){return millis;}
struct {unsigned (*SEH_ReadCharFromString)(const char **,int *);int (*Milliseconds)();} ri={readChar,milliseconds};
void RB_EndSurface(){++ends;events.push_back(1);tess.indexCount=tess.optimizedIndexCount=tess.vertexCount=0;}
void RB_BeginSurface(const Material *m,int t,int lm){assert(lm==31);++begins;events.push_back(2);tess.material=m;tess.techType=t;}
void RB_TessOverflow(){++overflows;events.push_back(3);tess.indexCount=tess.vertexCount=0;}
void RB_SetMatricesForView(const GfxViewParms *v){assert(v==&view);++matrices;events.push_back(4);}
void RB_DrawStretchPic(const Material *m,float x,float y,float w,float h,float s0,float t0,float s1,float t1,unsigned color){
 Draw d={m,x,y,w,h,{s0,t0,s1,t1},color};draws.push_back(d);
 if(mutate&&liveState)liveState->cmd=&replacement;
}
'''+vertex+source+lookup+r'''
Glyph glyphs[100];Font_s font;
void reset(){
 draws.clear();events.clear();reads=ends=begins=overflows=matrices=mutate=0;millis=0;liveState=0;
 memset(glyphs,0,sizeof(glyphs));
 for(int i=0;i<100;++i){glyphs[i].letter=i<96?i+32:160+i-96;glyphs[i].x0=-2;glyphs[i].y0=-3;
  glyphs[i].dx=9;glyphs[i].pixelWidth=7;glyphs[i].pixelHeight=11;
  glyphs[i].s0=.125f;glyphs[i].t0=.25f;glyphs[i].s1=.75f;glyphs[i].t1=.875f;}
 font={"test",20,100,&material,glyphs};
 backEnd.color_allies=0x51234567;backEnd.color_axis=0x89abcdef;backEnd.viewParms=&view;
 memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indexStore,0x5a,sizeof(indexStore));
 tess.indices=indexStore;tess.material=&material;tess.techType=3;tess.indexCount=tess.vertexCount=tess.optimizedIndexCount=0;
}
void checkDraw(const Draw &d,float x,float y,unsigned color){
 assert(d.material==&material&&d.x==x&&d.y==y&&d.w==14&&d.h==22&&d.color==color);
 assert(d.uv[0]==.125f&&d.uv[1]==.25f&&d.uv[2]==.75f&&d.uv[3]==.875f);
}
int main(){
 static_assert(sizeof(Glyph)==24&&sizeof(Font_s)==20&&sizeof(GfxVertex)==64&&sizeof(GfxVertexDx7)==36,"PC records");
 int cases=0;
 const unsigned rgba[8]={0xff000000,0xff0000ff,0xff00ff00,0xff00ffff,0xffff0000,0xffffff00,0xffff00ff,0xffffffff};
 for(int c=0;c<256;++c){reset();byte result[12];memset(result,0x5a,12);RB_LookupColor((byte)c,result+4);
  unsigned got;memcpy(&got,result+4,4);unsigned want=(byte)(c-'0')<8?rgba[(byte)(c-'0')]:c=='8'?0x51234567:c=='9'?0x89abcdef:0xffffffff;
  assert(got==want);for(int i=0;i<4;++i)assert(result[i]==0x5a&&result[i+8]==0x5a);++cases;}
 for(int style:{0,1,3,6,7})for(int limit:{-1,0,1,3})for(int cursor:{-1,0,1,2})
 for(int time:{-513,-512,-511,-256,-255,-1,0,255,256,511,512}){
  reset();millis=time;RB_DrawTextWithCursor("A",limit,&font,20,40,2,2,0x81234567,style,cursor,(char)163);
  bool glyph=limit!=0,shadow=glyph&&(style==3||style==6),blink=((time/256)&1)==0;
  bool caret=(glyph?(cursor==0||cursor==1):cursor==0)&&blink;
  assert(draws.size()==(unsigned)(glyph+shadow+caret));assert(reads==(int)glyph);
  int k=0;if(shadow){float offset=style==3?1:2;checkDraw(draws[k++],15+offset,33+offset,0x81000000);}
  if(glyph)checkDraw(draws[k++],15,33,0x81234567);
  if(caret)checkDraw(draws[k],glyph?(cursor?33:15):19,33,0x81234567);++cases;
 }
 for(int c=0;c<10;++c){reset();std::string s="^"+std::string(1,(char)('0'+c))+"A";
  RB_DrawTextWithCursor(s.c_str(),1,&font,20,40,2,2,0x81234567,0,-1,0);assert(reads==2&&draws.size()==1);
  unsigned t=c<8?rgba[c]:c==8?0x51234567:0x89abcdef;
  unsigned want=c==7?0x81234567:0x81000000|((t&255)<<16)|(t&0xff00)|((t>>16)&255);
  checkDraw(draws[0],15,33,want);++cases;
 }
 reset();RB_DrawTextWithCursor("A\nB\rC",1,&font,20,40,2,2,0x81234567,0,-1,0);assert(draws.size()==1&&reads==1);++cases;
 reset();RB_DrawTextWithCursor("A\nB\rC",-1,&font,20,40,2,2,0x81234567,0,-1,0);
 assert(reads==5&&draws.size()==3);checkDraw(draws[1],15,73,0x81234567);checkDraw(draws[2],15,73,0x81234567);++cases;
 reset();RB_DrawTextWithCursor("^^A",3,&font,20,40,2,2,0x81234567,0,-1,0);assert(reads==3&&draws.size()==3);++cases;
 reset();RB_DrawTextWithCursor("\xc2\xa3",1,&font,20,40,2,2,0x81234567,0,-1,0);assert(reads==1&&draws.size()==1);++cases;
 for(int mode:{1,2,3})for(int initial:{0,5450})for(int ic:{0,65536,0xffffc})for(int change:{0,1,2}){
  reset();renderer.current.integer=mode;tess.vertexCount=initial;tess.indexCount=ic;
  tess.material=change==1?&otherMaterial:&material;tess.techType=change==2?4:3;
  float org[3]={10,20,30},xs[3]={2,1,-1},ys[3]={-1,3,2};
  RB_DrawTextInSpace("A",&font,org,xs,ys,0x81234567);
  assert(reads==1&&matrices==1&&events[0]==4);
  bool flush=change&&ic!=0,overflow=(!flush&&initial+4>5450)||(!flush&&ic+6>0x100000);
  int vc=flush||overflow?0:initial,ix=flush||overflow?0:ic;
  assert(ends==(int)flush&&begins==(change!=0)&&overflows==(int)overflow);
  assert(tess.vertexCount==vc+4&&tess.indexCount==ix+6);
  const unsigned short want[6]={(unsigned short)(vc+3),(unsigned short)vc,(unsigned short)(vc+2),(unsigned short)(vc+2),(unsigned short)vc,(unsigned short)(vc+1)};
  assert(!memcmp(indexStore+(unsigned short)ix,want,12));
  const float xyz[4][3]={{8.5f,7,25.5f},{22.5f,14,18.5f},{11.5f,47,40.5f},{-2.5f,40,47.5f}};
  for(int i=0;i<4;++i){const char *v=tess.vertexData+(vc+i)*(mode==2?36:64);assert(!memcmp(v,xyz[i],12));
   if(mode==2){const auto &a=*(const GfxVertexDx7 *)v;assert(a.color==0x81234567&&a.normal[2]==1);}
   else{const auto &a=*(const GfxVertex *)v;assert(a.color==0x81234567&&a.xyzw[3]==1&&a.normal[2]==1&&a.tangent[0]==1&&a.binormal[1]==1);}}
  ++cases;
 }
 reset();renderer.current.integer=1;float zero[3]={};RB_DrawTextInSpace("",&font,zero,zero,zero,0);assert(matrices==1&&!reads&&!tess.vertexCount);++cases;
 reset();GfxCmdDrawText cmd={};cmd.header.byteCount=64;cmd.font=&font;cmd.maxChars=1;cmd.text[0]='A';cmd.cursorPos=-1;cmd.xScale=cmd.yScale=2;
 GfxRenderCommandExecState state={&cmd,0,{0,0}};liveState=&state;mutate=1;RB_DrawTextCmd(&state);
 assert(state.cmd==(const byte *)&replacement+28&&draws.size()==1);++cases;
 reset();GfxCmdDrawTextInSpace spatial={};spatial.header.byteCount=52;spatial.font=&font;spatial.text[0]='A';
 state.cmd=&spatial;RB_DrawTextInSpaceCmd(&state);assert(state.cmd==(const byte *)&spatial+52&&tess.vertexCount==4);++cases;
 printf("PASS: %d PC text routes, all256 colors, signed blink, limits/escapes, single-pass shadows, DX7/DX9 quads and live command cursor\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-ffp-contract=off','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
