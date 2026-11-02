"""Actual frame executor: recovery, dispatch, cleanup, retries and live settings."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];text=(w/'src/gfx_d3d/rb_backend.cpp').read_text();source=text[text.index('// Render-command execution.'):]
controls=text[text.index('static void RB_GotoCmd('):text.index('// PINNED 10031f10:')]
program=r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef int HRESULT;typedef int IDirect3DIndexBuffer9;
const int D3DERR_DEVICELOST=(int)0x88760868,D3DERR_DEVICENOTRESET=(int)0x88760869,D3DCLEAR_TARGET=1;
struct GfxCmdHeader {unsigned short id,byteCount;};struct GfxRenderCommandExecState {const void *cmd;int stackPos;const void *retCmd[2];};struct GfxCmdJump {GfxCmdHeader header;const void *next;};
struct GfxViewParms {int id;} view;
struct GfxBackEndData {byte before[0x219d0c];byte commands[128];} frames[2];GfxBackEndData *backEndData;
struct dvar_t {union {Bool enabled;int integer;}current;} vars[5];const dvar_t *r_skipBackEnd=vars,*developer=vars+1,*r_testFill=vars+2,*r_testTransform=vars+3;
struct {bool viewportIsDirty;GfxViewParms *viewParms;}backEnd;
struct {int indexCount,optimizedIndexCount;}tess;
struct {IDirect3DIndexBuffer9 *indexBuffer;struct {bool vb;int offset,stride;}streams[1];}dxState;
struct Device {int TestCooperativeLevel();int Clear(int,const void*,int,int,float,int);int EndScene();}device;
struct {Device *device;Bool deviceLost,inScene;int gpuSync;}dx;
std::vector<int>events;int cooperative,recovery,mutation,dispatches,alwaysfails,clears,ends,mode;
int Device::TestCooperativeLevel(){events.push_back(1);return cooperative;}
int Device::Clear(int n,const void *r,int flags,int color,float z,int stencil){assert(n==0&&!r&&flags==1&&color==0&&z==0&&stencil==0);assert(dx.inScene);++clears;events.push_back(6);if(clears==2)alwaysfails=0;return -1;}
int Device::EndScene(){assert(dx.inScene);++ends;events.push_back(10);if(ends==2)alwaysfails=0;return -1;}
Bool R_RecoverLostDevice(){events.push_back(2);if(recovery)dx.deviceLost=0;return (Bool)recovery;}
void RB_UpdateBackendDvars(){events.push_back(3);if(mutation==1)backEndData=frames+1;}
void RB_BeginScene(){events.push_back(4);dx.inScene=1;}
void RB_TouchAllImages(){events.push_back(5);}
void RB_UpdateViewport(){events.push_back(7);backEnd.viewportIsDirty=0;}
void RB_EndSurface(){events.push_back(8);tess.indexCount=tess.optimizedIndexCount=0;}
void RB_DrawDebug(const GfxViewParms *v){assert(v==&view);events.push_back(9);}
void RB_ChangeIndices(IDirect3DIndexBuffer9 *i){assert(!i);events.push_back(11);dxState.indexBuffer=0;}
void RB_ClearAllStreamSources(){if(dxState.streams[0].vb||dxState.streams[0].offset||dxState.streams[0].stride){events.push_back(12);memset(dxState.streams,0,sizeof(dxState.streams));}}
void RB_TestFill(){events.push_back(13);if(mutation==2)r_testFill=vars+4;}
void RB_TestTransform(){events.push_back(14);}
void set(const dvar_t *v,int value){assert(value==0&&(v==r_testFill||v==r_testTransform));events.push_back(15);const_cast<dvar_t*>(v)->current.integer=0;}
struct {void(*Dvar_SetInt)(const dvar_t*,int);}ri={set};
void R_FinishGpuFence(){events.push_back(16);}void R_InsertGpuFence(){events.push_back(17);}
#define R_DX_CALL(call) do {call;} while(alwaysfails)
'''+controls+r'''
void probe(GfxRenderCommandExecState *state){assert(state->stackPos==0||state->stackPos==1);++dispatches;events.push_back(20+state->stackPos);const byte *p=(const byte*)state->cmd;state->cmd=p+((const GfxCmdHeader*)p)->byteCount;}
typedef void (*GfxRenderCommandFunction)(GfxRenderCommandExecState*);
GfxRenderCommandFunction const RB_RenderCommandTable[34]={0,RB_GotoCmd,RB_CallCmd,RB_ReturnCmd,probe};
'''+source+r'''
void reset(){events.clear();memset(frames,0,sizeof(frames));memset(vars,0,sizeof(vars));memset(&backEnd,0,sizeof(backEnd));memset(&dxState,0,sizeof(dxState));memset(&tess,0,sizeof(tess));dx.device=&device;dx.deviceLost=dx.inScene=0;dx.gpuSync=0;backEndData=frames+1;g_disableRendering=0;cooperative=0;recovery=1;mutation=dispatches=alwaysfails=clears=ends=0;r_testFill=vars+2;
 byte *p=frames[0].commands;GfxCmdJump *call=(GfxCmdJump*)p;call->header={2,12};call->next=p+32;*(GfxCmdHeader*)(p+12)={4,12};*(GfxCmdHeader*)(p+24)={0,4};*(GfxCmdHeader*)(p+32)={4,8};*(GfxCmdHeader*)(p+40)={3,4};}
int main(){int cases=0;
 for(int disabled:{0,1})for(int lost:{0,1})for(int result:{0,D3DERR_DEVICELOST,D3DERR_DEVICENOTRESET,-4})for(int recover:{0,1})for(int skip:{0,1}){
  reset();g_disableRendering=disabled;dx.deviceLost=lost;cooperative=result;recovery=recover;vars[0].current.enabled=skip;backEnd.viewportIsDirty=true;
  RB_ExecuteRenderCommands(frames);bool need=lost||result==D3DERR_DEVICELOST||result==D3DERR_DEVICENOTRESET;bool go=!disabled&&(!need||recover);
  assert(backEndData==(go?frames:nullptr));if(disabled)assert(events.empty());else if(!go)assert(events.back()==2);
  if(go){assert(dispatches==(skip?0:2)&&clears==skip&&ends==1&&!dx.inScene);assert(backEnd.viewportIsDirty==!skip);int touch=0;for(int e:events)touch+=e==5;assert(touch==need);}++cases;
 }
 for(int sync:{0,1,2,3})for(int fill:{0,1})for(int transform:{0,1}){
  reset();dx.gpuSync=sync;vars[1].current.integer=1;vars[2].current.integer=fill;vars[3].current.integer=transform;backEnd.viewParms=&view;tess.optimizedIndexCount=3;dxState.indexBuffer=(int*)1;dxState.streams[0].stride=16;
  RB_ExecuteRenderCommands(frames);std::vector<int>want={1,3,4,21,20,8,9,11,12,10};if(fill){want.push_back(13);want.push_back(15);}if(transform){want.push_back(14);want.push_back(15);}if(sync==2)want.push_back(16);if(sync==2||sync==3)want.push_back(17);assert(events==want);++cases;
 }
 reset();mutation=1;RB_ExecuteRenderCommands(frames);assert(backEndData==frames+1&&dispatches==0);++cases;
 reset();mutation=2;vars[2].current.integer=1;vars[4].current.integer=7;RB_ExecuteRenderCommands(frames);assert(r_testFill==vars+4&&vars[4].current.integer==0&&vars[2].current.integer==1);++cases;
 reset();vars[0].current.enabled=1;alwaysfails=1;RB_ExecuteRenderCommands(frames);assert(clears==2&&ends==1);++cases;
 reset();alwaysfails=1;RB_ExecuteRenderCommands(frames);assert(ends==2);++cases;
 printf("PASS: %d actual executor cases, device/recovery gates, real call/return dispatch, skip-only clear, debug/binding cleanup, retry loops and live benchmark/fence state\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_executor_') as d:
 b=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True);subprocess.run([b],check=True)
