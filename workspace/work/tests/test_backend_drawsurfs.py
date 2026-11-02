"""Actual sorted surface driver: run batching, filtering, transforms and packet order."""
from pathlib import Path
import subprocess
import tempfile
work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_backend.cpp').read_text()
source=text[text.index('// Backend draw-surface dispatch.'):text.index('// Backend sun commands.')]
backend=(work/'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
commands=(work/'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
entity=(work/'src/gfx_d3d/r_entity.h').read_text().replace('#pragma once','')
program=r'''
#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef float vec_t;typedef float vec3_t[3];typedef float vec2_t[2];typedef unsigned GfxColor;typedef int GfxRenderTargetId;typedef int surfaceType_t;
struct D3DMATRIX {union {float m[4][4];struct {float _11,_12,_13,_14,_21,_22,_23,_24,_31,_32,_33,_34,_41,_42,_43,_44;};};};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};struct GfxImage;
struct Material {alignas(4) byte data[68];} materials[2];
'''+entity+backend+commands+r'''
r_backEndGlobals_t backEnd;
struct {const Material *material;int techType,lmapIndex,indexCount,optimizedIndexCount;} tess;
struct {Material *sortedMaterials[1024];} rgp;
struct {bool viewportIsNull;} dxState;
struct dvar_t {union {int integer;bool enabled;} current;} depthvar,decalsvar,renderer;
const dvar_t *r_depthPrepassModels=&depthvar,*r_drawDecals=&decalsvar,*r_rendererInUse=&renderer;
std::vector<int> events,types,entityIds;GfxEntity entities[2050];GfxViewParms view;int fog,begins,ends,overflows,draws,mutation;float lastNear,lastFar;GfxRenderCommandExecState *live;GfxCmdHeader alternate={0,44};
void RB_EndSurface(){events.push_back(2);++ends;tess.indexCount=tess.optimizedIndexCount=0;}
void RB_BeginSurface(const Material *m,int technique,int lightmap){events.push_back(1);++begins;tess.material=m;tess.techType=technique;tess.lmapIndex=lightmap;}
void RB_ChangedWorldMatrix(float scale){events.push_back(4);assert(scale==backEnd.currentEntity->scale);}
void RB_PushMatrixStack(){events.push_back(3);++backEnd.codeMatrixStackLevel;}
void RB_PopMatrixStack(){events.push_back(5);--backEnd.codeMatrixStackLevel;}
void RB_SetDepthRange(float a,float b){events.push_back(6);assert(a==0);lastNear=a;lastFar=b;}
void RB_SetDepthHackNearClip(float z){events.push_back(7);assert(z==view.depthHackNearClip);}
void RB_ProjectionMatrixChanged(){events.push_back(8);assert(backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0]._43==view.projectionMatrix._43);}
void MatrixSet44(float out[4][4],const vec3_t origin,const vec3_t axis[3],float scale){events.push_back(9);assert(origin==backEnd.currentEntity->origin&&axis==backEnd.currentEntity->axis);out[0][0]=scale;}
void RB_TessOverflow(){++overflows;events.push_back(10);tess.indexCount=tess.optimizedIndexCount=0;}
void FastSinCos(float x,float *s,float *c){*s=sinf(x);*c=cosf(x);}
void RB_Set3D(){events.push_back(11);backEnd.projection2D=0;if(mutation)live->cmd=&alternate;}
void RB_UpdateViewport(){events.push_back(12);backEnd.viewportIsDirty=0;}
void draw(const surfaceType_t *p){assert(backEnd.currentEntity);++draws;events.push_back(20+*p);types.push_back(*p);int id=-1;for(int i=0;i<4;++i)if(backEnd.currentEntity==entities+i)id=i;entityIds.push_back(id);tess.indexCount+=3;}
typedef void (*GfxTessSurfaceFunction)(const surfaceType_t *);
GfxTessSurfaceFunction const rb_tessTable[8]={draw,draw,draw,draw,draw,draw,draw,0};
'''+source+r'''
GfxFogOffset RB_FogOffset(){return (GfxFogOffset)fog;}
GfxDrawMaterialView::TechniqueSet techniqueSets[2];
unsigned key(int ent,int mat=0,int lm=31,bool extended=false){return extended?0x80000000u|(ent<<19)|(mat<<9)|(lm<<4):(ent<<4)|(mat<<21)|(lm<<16);}
void reset(){memset(&backEnd,0,sizeof(backEnd));memset(&tess,0,sizeof(tess));memset(entities,0,sizeof(entities));memset(materials,0,sizeof(materials));memset(&view,0,sizeof(view));
 for(int i=0;i<2;++i){for(int t=0;t<34;++t)techniqueSets[i].techniques[t]=&materials[i];((GfxDrawMaterialView *)&materials[i])->techniqueSet=&techniqueSets[i];rgp.sortedMaterials[i]=&materials[i];}
 for(int i=0;i<4;++i){entities[i].reType=RT_XMODEL;entities[i].scale=2;entities[i].origin[0]=i;for(int c=0;c<3;++c)entities[i].axis[c][c]=1;}
 backEnd.sceneDef.entities=entities;backEnd.sceneDef.floatTime=7.25f;backEnd.viewParms=&view;view.depthHackNearClip=.125f;view.projectionMatrix._43=-.5f;
 depthvar.current.enabled=true;decalsvar.current.enabled=true;renderer.current.integer=3;fog=0;begins=ends=overflows=draws=mutation=0;events.clear();types.clear();entityIds.clear();dxState.viewportIsNull=false;
}
void clean(){assert(!backEnd.currentEntity&&!backEnd.currentEntityLighting&&backEnd.codeMatrixStackLevel==0);}
int main(){int cases=0;surfaceType_t a=1,b=2,c=3;
 for(int reverse:{0,1})for(bool extended:{false,true}){
  reset();GfxDrawSurf s[]={{key(2046,0,31,extended),&a},{key(2046,0,31,extended),&b},{key(2046,0,31,extended),&c}};
  RB_RenderDrawSurfList(s,3,3,reverse);assert(begins==1&&ends==1&&draws==3&&overflows==0);assert(types==(reverse?std::vector<int>{3,2,1}:std::vector<int>{1,2,3}));assert(backEnd.codeConsts[2][2]==.25f&&backEnd.codeConsts[2][3]==7.25f);clean();++cases;
 }
 for(int sentinel:{2046,2047,2048,4095})for(bool extended:{false,true}){
  reset();GfxDrawSurf s={key(sentinel,0,31,extended),&a};RB_RenderDrawSurfList(&s,1,6,0);
  assert(draws==1&&begins==1&&entityIds[0]==-1&&tess.techType==(sentinel==2047?15:9));clean();++cases;
 }
 reset();GfxDrawSurf sameInitial={0xffffffffu,&a};RB_RenderDrawSurfList(&sameInitial,1,3,0);assert(draws==1&&begins==0);clean();++cases;
 for(int flags:{0,8,16,24}){
  reset();entities[0].renderFxFlags=flags;GfxDrawSurf s={key(0),&a};RB_RenderDrawSurfList(&s,1,3,0);
  assert(begins==1&&ends==1&&draws==1&&entityIds[0]==0);assert(lastFar==float(flags?1:0));
  std::vector<int> expected={1,3,9,4};if(flags){if(flags==8)expected.push_back(7);expected.push_back(6);}expected.push_back(21);expected.push_back(2);
  if(flags){expected.push_back(6);if(flags==8)expected.push_back(8);}expected.push_back(5);assert(events==expected);clean();++cases;
 }
 for(bool world:{false,true})for(bool timesDiffer:{false,true}){
  reset();entities[0].reType=entities[1].reType=world?RT_SPRITE:RT_XMODEL;entities[1].materialTime=timesDiffer?2:0;
  GfxDrawSurf s[]={{key(0),&a},{key(1),&b}};RB_RenderDrawSurfList(s,2,3,0);
  assert(begins==int(world&&!timesDiffer?1:2));assert(draws==2&&ends==begins&&entityIds==std::vector<int>({0,1}));clean();++cases;
 }
 for(int why:{0,1,2}){
  reset();int technique=3;if(why==0){decalsvar.current.enabled=false;((GfxDrawMaterialView *)&materials[0])->stateBits[1]=0x30;}
  if(why==1){techniqueSets[0].techniques[3]=0;}if(why==2){depthvar.current.enabled=false;technique=0;}
  GfxDrawSurf s[]={{key(0),&a},{key(0),&b}};RB_RenderDrawSurfList(s,2,technique,0);assert(draws==0&&begins==0&&ends==0);clean();++cases;
 }
 reset();entities[0].materialTime=NAN;GfxDrawSurf nanSurfs[]={{key(0),&a},{key(1),&b}};RB_RenderDrawSurfList(nanSurfs,2,3,0);assert(begins==2&&draws==2);clean();++cases;
 for(int technique:{0,2,3,6,26,27})for(int ent:{0,1,2,2046,2047})for(int lightmap:{0,31})for(int f:{0,1,2})for(bool depth:{false,true})for(bool shadow:{false,true}){
  reset();fog=f;depthvar.current.enabled=depth;entities[0].reType=RT_STATICMODEL;entities[1].reType=RT_SPRITE;entities[2].reType=RT_XMODEL;for(int i=0;i<3;++i)entities[i].renderFxFlags=shadow?256:0;
  int expected=technique;
  if(technique==6&&lightmap==31)expected=(ent==2047?15:ent==0?12:9)+f;
  else if(!depth&&(technique==0||technique==2)&&(ent==2047||(ent<2046&&ent!=1&&!shadow)))expected=-1;
  else if(technique>=3&&technique<=26)expected+=f;
  assert(RB_DrawSurfTechnique(technique,ent,lightmap)==expected);++cases;
 }
 for(int skip:{0,1})for(mutation=0;mutation<2;++mutation){
  int savedMutation=mutation;reset();mutation=savedMutation;GfxDrawSurf s={key(2046),&a};GfxCmdDrawSurfs cmd={{23,28},0,&s,1,3};GfxRenderCommandExecState state={&cmd,0,{0,0}};live=&state;
  backEnd.projection2D=1;backEnd.viewportIsDirty=1;tess.indexCount=3;dxState.viewportIsNull=skip;
  RB_DrawSurfsCmd(&state);assert(events[0]==2&&events[1]==11&&events[2]==12&&draws==!skip);assert(state.cmd==(mutation?(const void *)&alternate:(const byte *)&cmd+28));if(!skip)clean();++cases;
 }
 reset();GfxDrawSurf empty={key(2046),&a};RB_RenderDrawSurfList(&empty,0,3,0);clean();++cases;
 printf("PASS: %d actual sorted-surface/technique/packet cases, both sort layouts and directions, batching, filtering, entity transforms, depth cleanup and cursor timing\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_drawsurfs_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-I',str(work/'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
