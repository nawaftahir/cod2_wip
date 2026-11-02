"""Actual sun command cursor and flush ordering."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/rb_backend.cpp').read_text()
source=s[s.index('// Backend sun commands.'):s.index('// Backend late-post effects.')]
program=r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <initializer_list>
typedef unsigned char byte;
struct GfxCmdHeader {unsigned short id,byteCount;};
struct GfxRenderCommandExecState {const void *cmd;int stackPos;const void *retCmd[2];};
struct {int indexCount,optimizedIndexCount;} tess;
void mutate();int calls,ends,seen,mutation;GfxRenderCommandExecState *live;
void RB_EndSurface(){++ends;if(mutation==1)mutate();}
void RB_DrawSun(int index){++calls;seen=index;if(mutation==2)mutate();}
void RB_DrawSunPostEffects(int index){++calls;seen=index;if(mutation==2)mutate();}
'''+source+r'''
GfxCmdSunView packet,other;
void mutate(){packet.viewIndex=3;live->cmd=&other;}
int main(){int cases=0;
 for(int post:{0,1})for(int counts:{0,1,2,3})for(mutation=0;mutation<3;++mutation){
  packet={{24,12},1};other={{27,20},2};GfxRenderCommandExecState state={&packet,1,{&packet,&other}};live=&state;tess.indexCount=counts&1;tess.optimizedIndexCount=counts&2;calls=ends=seen=0;
  if(post)RB_DrawSunPostEffectsCmd(&state);else RB_DrawSunCmd(&state);
  assert(calls==1&&ends==int(post&&counts));assert(seen==int(post&&counts&&mutation==1?3:1));bool changed=mutation==2||(post&&counts&&mutation==1);
  const byte *cursor=(const byte *)(changed?&other:&packet);assert(state.cmd==cursor+((const GfxCmdHeader*)cursor)->byteCount);
  assert(state.stackPos==1&&state.retCmd[0]==&packet&&state.retCmd[1]==&other);++cases;
 }
 printf("PASS: %d actual sun commands, captured packet/live fields, post flush and live cursor publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sun_commands_') as d:
    b=str(Path(d)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True)
    subprocess.run([b],check=True)
