"""Exercise real submission bodies, including callback ownership changes."""
from pathlib import Path
import subprocess
import tempfile
w = Path(__file__).resolve().parents[1]
s = (w/'src/gfx_d3d/r_rendercmds.cpp').read_text()
def body(name):
    start = s.index('void '+name+'()')
    return s[start:s.index('\n}\n', start)+3]
allocator = s[s.index('static GfxCmdHeader *R_GetCommandBuffer'):s.index('void R_AddCmdTouchAllImages')]
program = r'''
#include <cassert>
#include <cstring>
#include <vector>
struct GfxCmdHeader { unsigned short id,byteCount; };
struct GfxCmdArray { unsigned char cmds[0x30000]; int usedTotal,usedCritical; GfxCmdHeader *lastCmd; };
struct DebugGlobals { int value; };
struct GfxBackEndData { GfxCmdArray commands; DebugGlobals debugGlobals; } frames[3];
struct { GfxCmdArray *restoreCmdList; GfxBackEndData *restoreFrontEndDataOut; unsigned char restoreSkinnedCache; } s_debugFrameGlob;
struct { bool registered; } rg;
struct { int tempSkinPos; void *tempSkinBuf; } dx;
GfxCmdArray *s_cmdList; GfxBackEndData *frontEndDataOut;
std::vector<int> events;
int mutation, expectedOffset, locks;
void RB_ExecuteRenderCommands(const void *p) {
    events.push_back(5); assert(p==frontEndDataOut);
    assert(!frontEndDataOut->commands.usedTotal && !frontEndDataOut->commands.usedCritical && !frontEndDataOut->commands.lastCmd);
    if(expectedOffset>=0) {
        GfxCmdHeader *h=(GfxCmdHeader*)(s_cmdList->cmds+expectedOffset);
        assert(h->id==0 && h->byteCount==4);
    }
    if(mutation==1) {
        s_debugFrameGlob.restoreCmdList=&frames[2].commands;
        s_debugFrameGlob.restoreFrontEndDataOut=&frames[2];
    }
    frontEndDataOut=&frames[1];
}
void RB_EndFrame(){events.push_back(6);assert(frontEndDataOut==&frames[1]);}
void R_InitFrameBackendData(){events.push_back(7);frontEndDataOut=&frames[0];s_cmdList=&frames[0].commands;dx.tempSkinPos=37;dx.tempSkinBuf=&frames[2];}
void R_LockSkinnedCache(int type){events.push_back(8);assert(type==1 && !s_debugFrameGlob.restoreSkinnedCache);assert(frontEndDataOut==&frames[mutation==1?2:0]);assert(s_cmdList==&frontEndDataOut->commands);++locks;s_debugFrameGlob.restoreCmdList=&frames[1].commands;s_debugFrameGlob.restoreFrontEndDataOut=&frames[1];}
void RB_AdaptiveGpuSyncTarget(){events.push_back(1);}
void R_UnlockSkinnedCache(){events.push_back(2);}
void update(){events.push_back(3);frontEndDataOut=&frames[2];s_cmdList=&frames[2].commands;}
void R_TransferDebugGlobals(DebugGlobals *d){events.push_back(4);assert(d==&frames[2].debugGlobals);}
void decommit(void *p,int n){events.push_back(9);assert(p==&frames[2] && n==37);dx.tempSkinPos=999;}
struct { void (*CL_UpdateDebugData)();void (*Z_VirtualDecommitInternal)(void*,int); }ri={update,decommit};
#define RC_FIRST_NONCRITICAL 0xf
'''+allocator+'\n'+ '\n'.join(body(n) for n in ['R_AddCmdEndOfList','R_IssueRenderCommands','R_EndDebugFrame','R_EndFrame'])+r'''
void reset(int offset) {
    memset(frames,0,sizeof(frames));memset(&s_debugFrameGlob,0,sizeof(s_debugFrameGlob));
    frontEndDataOut=&frames[0];s_cmdList=&frames[0].commands;
    s_cmdList->usedTotal=offset;s_cmdList->usedCritical=12;
    s_cmdList->lastCmd=(GfxCmdHeader*)s_cmdList->cmds;
    events.clear();locks=0;mutation=0;expectedOffset=offset<=0x2fffc?offset:-1;
    rg.registered=true;dx.tempSkinPos=11;dx.tempSkinBuf=&frames[0];
}
int main(){
    for(int offset: {0,8,0x2fffc,0x30000}) {
        reset(offset);R_IssueRenderCommands();assert((events==std::vector<int>{5,6,7}));assert(frontEndDataOut==frames);
        for(int lock=0;lock<2;++lock)for(int change=0;change<2;++change){
            reset(offset);mutation=change;s_debugFrameGlob.restoreSkinnedCache=lock;
            s_debugFrameGlob.restoreCmdList=&frames[0].commands;s_debugFrameGlob.restoreFrontEndDataOut=&frames[0];
            R_EndDebugFrame();assert((events== (lock?std::vector<int>{5,6,8}:std::vector<int>{5,6})));
            assert(!s_debugFrameGlob.restoreCmdList && !s_debugFrameGlob.restoreFrontEndDataOut && !s_debugFrameGlob.restoreSkinnedCache);
            assert(locks==lock);assert(frontEndDataOut==&frames[change?2:0]);
        }
    }
    reset(0);expectedOffset=0;R_EndFrame();assert((events==std::vector<int>{1,2,3,4,5,6,7,9}));assert(!dx.tempSkinPos);
    reset(8);rg.registered=false;R_EndFrame();R_EndDebugFrame();assert(events.empty());assert(frontEndDataOut==frames && s_cmdList->usedTotal==8);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_frame_submit_') as d:
    exe=str(Path(d)/'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True)
    subprocess.run([exe],check=True)
print('PASS: 22 submission routes, real terminators, reset timing, restoration and live cleanup')
