"""Actual eight-case frontend dispatcher and scene worker, including call order."""
from pathlib import Path
import struct
import subprocess
import tempfile
import pefile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_rendercmds.cpp').read_text()
source=text[text.index('// PINNED 10020be0/153:'):text.index('// Scene command producers.')]
text=(work/'src/gfx_d3d/r_scene.cpp').read_text()
worker=text[text.index('// PINNED 10023d70/61:'):text.index('// PINNED PC model surface submission, 10024680/286.')]
anchor=pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert struct.unpack('<8I',anchor.get_data(0x20c7c,32))==(0x10020bf8,0x10020c08,0x10020c18,0x10020c6e,0x10020c63,0x10020c40,0x10020c2a,0x10020c2a)
program=r'''
#include <cassert>
#include <cstdio>
#include <vector>
#include <initializer_list>
struct GfxEntity {char bytes[116];} entities[18];
struct GfxSceneEntity {char bytes[52];} sceneEntities[16];
struct {struct {GfxEntity *entities;} def;GfxSceneEntity *sceneEnts;} scene;
struct SkinRigidXModelCmd {int id;};
struct SkinXModelCmd {int id;};
struct SkinStaticModelCachedCmd {int id;};
struct SkinBuffers {char bytes[40960];} g_skinBuffers[1];
std::vector<int> calls;
GfxSceneEntity *expectedScene;
GfxEntity *expectedEntity;
void *expectedCommand;
void R_UpdateXModelBounds(GfxSceneEntity *s,const GfxEntity *e){assert(s==expectedScene&&e==expectedEntity);calls.push_back(10);}
void R_SkinSceneDObj(GfxSceneEntity *s,GfxEntity *e){assert(s==expectedScene&&e==expectedEntity);calls.push_back(11);}
void R_UpdateGfxEntityBounds(GfxEntity *e){assert(e==expectedEntity);calls.push_back(0);}
void R_SkinRigidXModelCmd(SkinRigidXModelCmd *c){assert(c==expectedCommand);calls.push_back(2);}
void R_SkinXModelCmd(SkinXModelCmd *c,int context){assert(c==expectedCommand&&context==0);calls.push_back(6);}
void R_SkinStaticModelCachedCmd(SkinStaticModelCachedCmd *c,SkinBuffers *b){assert(c==expectedCommand&&b==g_skinBuffers);calls.push_back(5);}
void nonBolt(){calls.push_back(3);}void bolt(){calls.push_back(4);}
struct {void (*FX_UpdateNonBolt)();void (*FX_UpdateBolt)();} ri={nonBolt,bolt};
'''+worker+source+r'''
int main(){
 int n=0;
 for(int base=0;base<3;++base)for(int index=0;index<16;++index){
  scene.def.entities=entities+base;scene.sceneEnts=sceneEntities;
  expectedEntity=entities+base+index;expectedScene=sceneEntities+index;
  for(int type=0;type<8;++type){
   SkinXModelCmd command={123};expectedCommand=&command;
   GfxEntity *entity=expectedEntity;void *data=type<2?(void *)&entity:(void *)&command;
   calls.clear();R_ProcessFrontendCmdInternal(type,data,0);++n;
   if(type==1)assert(calls==std::vector<int>({10,11}));
   else assert(calls==std::vector<int>({type==7?6:type}));
   auto expected=calls;calls.clear();R_AddFrontendCmd(type,data);++n;assert(calls==expected);
  }
 }
 for(int type:{-2147483647,-1,8,9,2147483647}){
  calls.clear();R_ProcessFrontendCmdInternal(type,0,0);assert(calls.empty());++n;R_AddFrontendCmd(type,0);assert(calls.empty());++n;
 }
 printf("PASS: %d actual frontend routes, eight PC jump-table cases, context zero, scene indexing and bounds-before-skin order\n",n);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    p=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';p.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2',str(p),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
