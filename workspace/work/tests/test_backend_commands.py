"""Real command jumps/returns and captured-payload versus live-advance behavior."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// PINNED 1002eb60:'):text.index('// Backend presentation.')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <initializer_list>
typedef unsigned char byte;typedef int GfxRenderTargetId;
struct GfxViewport {int x,y,width,height;};
''' + header + tess + r'''
GfxTess tess;
struct {float codeConsts[59][4];GfxViewport sceneViewport;byte viewportIsDirty;int untouched;} backEnd;
union Command {GfxCmdSetMaterialColor color;GfxCmdSetViewport viewport;GfxCmdSetRenderTarget target;byte storage[64];} original,alternate,finalCommand;
GfxRenderCommandExecState *live;
int kind,mutation,flushes,setters;
uint32_t expectedColor[4];GfxViewport expectedViewport;int expectedTarget;
void changePayload() {
    if(kind==0){for(int i=0;i<4;++i)expectedColor[i]=0x7f801234u+i;memcpy(original.color.color,expectedColor,16);}
    if(kind==1){expectedTarget=6;original.target.renderTargetId=6;}
    if(kind==2){expectedViewport={-17,29,640,480};original.viewport.viewport=expectedViewport;}
}
void RB_EndSurface(){++flushes;if(mutation&1){changePayload();live->cmd=&alternate;}}
void RB_SetRenderTarget(GfxRenderTargetId target){assert(kind==1&&target==expectedTarget);++setters;if(mutation&2)live->cmd=&finalCommand;}
void RB_UpdateViewportConstants(){assert(kind==2&&backEnd.viewportIsDirty&&!memcmp(&backEnd.sceneViewport,&expectedViewport,16));++setters;original.viewport.viewport.x=99999;if(mutation&2)live->cmd=&finalCommand;}
''' + source + r'''
int main() {
    alignas(4) byte bytes[65544]={};GfxCmdJump *jump=(GfxCmdJump *)bytes;
    int controls=0,states=0;
    for(int size:{0,4,8,12,65535})for(int depth=0;depth<2;++depth)for(int target=0;target<3;++target) {
        jump->header.byteCount=size;jump->next=target==0?0:target==1?bytes+32:bytes;
        GfxRenderCommandExecState state={jump,depth,{bytes+48,bytes+64}},before=state;
        RB_GotoCmd(&state);assert(state.cmd==jump->next&&state.stackPos==depth&&!memcmp(state.retCmd,before.retCmd,sizeof(state.retCmd)));
        state=before;RB_CallCmd(&state);assert(state.cmd==jump->next&&state.stackPos==depth+1&&state.retCmd[depth]==bytes+size&&state.retCmd[1-depth]==before.retCmd[1-depth]);
        RB_ReturnCmd(&state);assert(state.stackPos==depth&&state.cmd==bytes+size);++controls;
    }
    for(kind=0;kind<3;++kind)for(mutation=0;mutation<4;++mutation)for(int pending=0;pending<4;++pending)for(int length:{20,48}) {
        memset(&original,0,sizeof(original));memset(&alternate,0x5a,sizeof(alternate));memset(&finalCommand,0x6b,sizeof(finalCommand));
        ((GfxCmdHeader *)&original)->byteCount=length;((GfxCmdHeader *)&alternate)->byteCount=36;((GfxCmdHeader *)&finalCommand)->byteCount=44;
        for(int i=0;i<4;++i)expectedColor[i]=0x80000000u+i;memcpy(original.color.color,expectedColor,16);
        if(kind==1){expectedTarget=14;original.target.renderTargetId=14;}
        if(kind==2){expectedViewport={1,2,800,600};original.viewport.viewport=expectedViewport;}
        memset(&backEnd,0xa5,sizeof(backEnd));decltype(backEnd) expected;memcpy(&expected,&backEnd,sizeof(expected));
        tess.indexCount=pending&1?3:0;tess.optimizedIndexCount=pending&2?6:0;tess.vertexCount=77;
        GfxRenderCommandExecState state={&original,1,{bytes+48,bytes+64}};live=&state;flushes=setters=0;
        if(kind==0)RB_SetMaterialColorCmd(&state);if(kind==1)RB_SetRenderTargetCmd(&state);if(kind==2)RB_SetViewportCmd(&state);
        const void *base=kind!=0&&(mutation&2)?(void *)&finalCommand:pending&&(mutation&1)?(void *)&alternate:(void *)&original;
        assert(state.cmd==(const byte *)base+((const GfxCmdHeader *)base)->byteCount&&state.stackPos==1&&state.retCmd[0]==bytes+48&&state.retCmd[1]==bytes+64);
        assert(flushes==(pending!=0)&&setters==(kind!=0)&&tess.vertexCount==77);
        if(kind==0)memcpy(expected.codeConsts[27],expectedColor,16);
        if(kind==2){expected.sceneViewport=expectedViewport;expected.viewportIsDirty=1;}
        assert(!memcmp(&backEnd,&expected,sizeof(backEnd)));++states;
    }
    printf("PASS: %d actual jump/call/return cases and%d state handlers;16-byte execution state, two return slots, raw color payload, pre-flush capture and live advancement\n",controls,states);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_commands_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
