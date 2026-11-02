"""Actual sprite handler: entity ABI, callbacks, captured packet and live cursor."""
from pathlib import Path
import subprocess
import tempfile
work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_backend.cpp').read_text()
source=text[text.index('// Backend sprite command.'):text.index('// Backend draw-surface dispatch.')]
commands=(work/'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
entity=(work/'src/gfx_d3d/r_entity.h').read_text().replace('#pragma once','')
program=r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef float vec2_t[2];
typedef unsigned int GfxColor;typedef int GfxRenderTargetId;
struct Material {int id;} first={1},second={2},third={3};
struct GfxViewport {int x,y,width,height;};
'''+commands+entity+r'''
struct {int projection2D;} backEnd;
struct {const Material *material;int techType,indexCount,optimizedIndexCount;} tess;
GfxCmdDrawSprite packet,other;GfxRenderCommandExecState *live;int mutation,sets,ends,begins,draws;const Material *captured;
void mutate(){packet.material=&third;packet.radius=-9;packet.pos[0]+=10;packet.renderFxFlags^=0x1000;packet.rgbaColor^=0xff0000;live->cmd=&other;}
void RB_Set3D(){++sets;if(mutation==1)mutate();}
void RB_EndSurface(){++ends;if(mutation==2)mutate();}
void RB_BeginSurface(const Material *m,int technique,int lightmap){++begins;assert(m==captured&&technique==3&&lightmap==31);if(mutation==3)mutate();}
void RB_TessEntity(const GfxEntity *e){
 ++draws;GfxEntity want;memset(&want,0,sizeof(want));want.reType=RT_SPRITE;want.renderFxFlags=packet.renderFxFlags;
 memcpy(want.origin,packet.pos,sizeof(want.origin));want.customMaterial=packet.material;
 memcpy(want.materialRGBA,&packet.rgbaColor,4);want.radius[0]=want.radius[1]=packet.radius;want.minScreenRadius=packet.minScreenRadius;
 assert(memcmp(&want,e,sizeof(want))==0);if(mutation==4)mutate();
}
'''+source+r'''
int main(){int cases=0;
 for(int projection:{0,1})for(int match:{0,1,2})for(int counts:{0,1,2,3})for(mutation=0;mutation<5;++mutation){
  memset(&packet,0,sizeof(packet));memset(&other,0,sizeof(other));packet.header.byteCount=44;other.header.byteCount=60;
  packet.material=&first;packet.rgbaColor=0x9f332211;packet.pos[0]=2;packet.pos[1]=-5;packet.pos[2]=9;
  packet.radius=3.5f;packet.minScreenRadius=.25f;packet.renderFxFlags=0x2000;
  GfxRenderCommandExecState state={&packet,1,{&packet,&other}};live=&state;
  backEnd.projection2D=projection;tess.material=match==1?&second:&first;tess.techType=match==2?7:3;
  tess.indexCount=counts&1;tess.optimizedIndexCount=counts&2;sets=ends=begins=draws=0;
  captured=projection&&mutation==1?&third:&first;
  bool change=tess.material!=captured||tess.techType!=3;
  RB_DrawSpriteCmd(&state);
  assert(sets==projection&&begins==int(change)&&ends==int(change&&counts!=0)&&draws==1);
  bool redirected=(projection&&mutation==1)||(change&&counts&&mutation==2)||(change&&mutation==3)||mutation==4;
  const byte *expected=(const byte *)(redirected?&other:&packet);
  assert(state.cmd==expected+((const GfxCmdHeader *)expected)->byteCount);
  assert(state.stackPos==1&&state.retCmd[0]==&packet&&state.retCmd[1]==&other);++cases;
 }
 printf("PASS: %d actual sprite commands, full116-byte entity, projection/material flush, callback mutation, captured packet and live cursor\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sprite_command_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-I',str(work/'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
