"""Actual light/shadow payload ownership and retried stencil/clip device updates."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
path = work / 'src/gfx_d3d/rb_backend.cpp'
text = path.read_text()
source = text[text.index('// Backend light, stencil, shadow and clip commands.'):text.index('// Backend view setup.')]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
backend = (work / 'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <cstdint>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef int GfxRenderTargetId;
struct D3DMATRIX {float m[4][4];};
struct D3DVIEWPORT9 {unsigned x,y,width,height;float minZ,maxZ;};
struct GfxImage;
''' + backend + header + tess + r'''
r_backEndGlobals_t backEnd;GfxTess tess;
struct {int stencilRefValue,clipPlaneCount;} dxState;
enum {D3DRS_STENCILREF=57,D3DRS_CLIPPLANEENABLE=152,R_RENDERTARGET_SHADOWCOOKIE=4};
struct Device {void SetRenderState(int,unsigned);void SetClipPlane(unsigned,const float *);};
struct {Device *device;struct {int width;} renderTargets[13];} dx;
Device first,second;int alwaysfails,kind,mutation,flushes,retries;
union Command {GfxCmdSetLightProperties light;GfxCmdSetStencilRefValue stencil;GfxCmdSetShadowCookie shadow;struct {GfxCmdHeader header;int count;float planes[6][4];} clip;byte bytes[128];} original,alternate,finalCommand;
GfxRenderCommandExecState *live;
struct Call {int kind;unsigned id,value;float plane[4];};std::vector<Call> calls;
void mutate() {
    if(kind==0){original.light.lightIndex=1-original.light.lightIndex;for(int i=0;i<4;++i)original.light.color[i]=27.0f+i;}
    if(kind==1)original.stencil.refValue=91;
}
void RB_EndSurface(){++flushes;if(mutation){live->cmd=&alternate;mutate();}}
void Device::SetRenderState(int id,unsigned value) {
    assert(this==(calls.empty()?&first:&second));calls.push_back({0,(unsigned)id,value,{}});
    if(retries){--retries;alwaysfails=1;dx.device=&second;if(kind==1)original.stencil.refValue=91;else original.clip.count=2;live->cmd=&finalCommand;}
    else {alwaysfails=0;dx.device=&second;if(mutation==2){if(kind==1)original.stencil.refValue=37;else original.clip.count=1;live->cmd=&finalCommand;}}
}
void Device::SetClipPlane(unsigned id,const float *value) {
    assert(this==&first||this==&second);Call c={1,id,0,{}};memcpy(c.plane,value,16);calls.push_back(c);
    if(retries){--retries;alwaysfails=1;dx.device=&second;live->cmd=&finalCommand;}
    else {alwaysfails=0;if(mutation==3){original.clip.count=1;live->cmd=&finalCommand;}}
}
#define R_DX_CALL(call) do {call;} while(alwaysfails)
''' + source + r'''
void reset(int which,int pending,int change) {
    kind=which;mutation=change;flushes=retries=alwaysfails=0;calls.clear();dx.device=&first;
    memset(&backEnd,0xa5,sizeof(backEnd));memset(&original,0,sizeof(original));memset(&alternate,0,sizeof(alternate));memset(&finalCommand,0,sizeof(finalCommand));
    ((GfxCmdHeader *)&original)->byteCount=120;((GfxCmdHeader *)&alternate)->byteCount=104;((GfxCmdHeader *)&finalCommand)->byteCount=112;
    tess.indexCount=pending&1?6:0;tess.optimizedIndexCount=pending&2?6:0;
    original.stencil.refValue=19;alternate.stencil.refValue=-7;
    for(int i=0;i<16;++i){original.shadow.shadowLookupMatrix[i/4][i%4]=i-8.0f;alternate.shadow.shadowLookupMatrix[i/4][i%4]=i+42.0f;}
    original.shadow.fade=-.75f;alternate.shadow.fade=.25f;
}
void advance(const GfxRenderCommandExecState &state,const void *base) {
    assert(state.cmd==(const byte *)base+((const GfxCmdHeader *)base)->byteCount);
    assert(state.stackPos==1&&state.retCmd[0]==&original&&state.retCmd[1]==&alternate);
}
int main() {
    int lights=0,shadows=0,stencils=0,clips=0;
    for(int index=0;index<2;++index)for(int pending=0;pending<4;++pending)for(int change=0;change<2;++change)for(unsigned pattern:{0u,0x80000000u,0x7fc01234u,0x3f000000u}) {
        reset(0,pending,change);original.light.lightIndex=index;
        for(int i=0;i<16;++i){uint32_t value=pattern+i;memcpy(original.bytes+8+i*4,&value,4);}original.light.lightDef=(GfxLightDef *)0x12345678;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;
        r_backEndGlobals_t expected;memcpy(&expected,&backEnd,sizeof(expected));
        GfxCmdSetLightProperties wanted=original.light;if(pending&&change){wanted.lightIndex=1-index;for(int i=0;i<4;++i)wanted.color[i]=27+i;}
        auto &light=expected.light[wanted.lightIndex];memcpy(light.ambient,wanted.ambient,16);memcpy(light.color,wanted.color,16);memcpy(light.specular,wanted.specular,16);light.def=wanted.lightDef;memcpy(light.position,wanted.position,16);
        memcpy(expected.codeConsts[3+wanted.lightIndex],wanted.position,16);memcpy(expected.codeConsts[7+wanted.lightIndex],wanted.ambient,16);memcpy(expected.codeConsts[5+wanted.lightIndex],wanted.color,16);memcpy(expected.codeConsts[9+wanted.lightIndex],wanted.specular,16);
        RB_SetLightPropertiesCmd(&state);assert(!memcmp(&expected,&backEnd,sizeof(expected))&&flushes==(pending!=0)&&calls.empty());advance(state,pending&&change?(void *)&alternate:(void *)&original);++lights;
    }
    for(int pending=0;pending<4;++pending)for(int change=0;change<2;++change)for(int width:{-32,0,1,256,1024})for(int level=0;level<3;++level) {
        reset(2,pending,change);dx.renderTargets[4].width=width;backEnd.codeMatrixStackLevel=level;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;
        auto *cmd=pending&&change?&alternate.shadow:&original.shadow;r_backEndGlobals_t expected;memcpy(&expected,&backEnd,sizeof(expected));
        memcpy(&expected.shadowLookupMatrix,cmd->shadowLookupMatrix,64);memset(expected.codeMatrixStack[0].shadowLookupMatrix.valid,0,4);
        expected.codeConsts[44][0]=expected.codeConsts[44][1]=(float)width;expected.codeConsts[44][2]=expected.codeConsts[44][3]=1.0f/(float)width;
        expected.codeConsts[45][0]=expected.codeConsts[45][1]=expected.codeConsts[45][2]=0;expected.codeConsts[45][3]=cmd->fade;
        RB_SetShadowCookieCmd(&state);assert(!memcmp(&expected,&backEnd,sizeof(expected))&&flushes==(pending!=0)&&calls.empty());advance(state,pending&&change?(void *)&alternate:(void *)&original);++shadows;
    }
    for(int pending=0;pending<4;++pending)for(int change=0;change<3;++change)for(int equal=0;equal<2;++equal)for(int retry=0;retry<3;++retry) {
        reset(1,pending,change);original.stencil.refValue=19;dxState.stencilRefValue=equal?19:-1;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;retries=retry;
        int wanted=pending&&change?91:19;bool issue=dxState.stencilRefValue!=wanted;
        RB_SetStencilRefValueCmd(&state);assert(flushes==(pending!=0)&&calls.size()==(issue?retry+1u:0u));
        for(unsigned i=0;i<calls.size();++i){assert(calls[i].kind==0&&calls[i].id==57&&calls[i].value==(unsigned)(i?91:wanted));}
        assert(dxState.stencilRefValue==(issue?original.stencil.refValue:19));
        advance(state,issue&&(retry||change==2)?(void *)&finalCommand:pending&&change?(void *)&alternate:(void *)&original);++stencils;
    }
    for(int count=0;count<7;++count)for(int equal=0;equal<2;++equal)for(int retry=0;retry<3;++retry)for(int change=0;change<4;++change) {
        reset(3,3,change);original.clip.count=count;dxState.clipPlaneCount=equal?count:-1;
        for(int i=0;i<6;++i)for(int j=0;j<4;++j)original.clip.planes[i][j]=i*4+j+.5f;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;retries=retry;
        RB_SetClipPlanesCmd(&state);assert(flushes==0);
        unsigned states=equal?0:retry+1;assert(calls.size()>=states);
        for(unsigned i=0;i<states;++i){assert(calls[i].kind==0&&calls[i].id==152&&calls[i].value==((1u<<(i?2:count))-1));}
        unsigned idx=0,repeated=0;for(unsigned i=states;i<calls.size();++i){auto &c=calls[i];assert(c.kind==1&&c.id==idx&&!memcmp(c.plane,original.clip.planes[idx],16));if(equal&&repeated<(unsigned)retry)++repeated;else ++idx;}
        int expectedCount=equal?count:change==2?1:retry?2:count;
        assert(dxState.clipPlaneCount==expectedCount);
        if(change==3&&idx)expectedCount=1;
        assert(idx==(unsigned)expectedCount);
        bool moved=(!equal&&(retry||change==2))||(idx&&(change==3||equal&&retry));advance(state,moved?(void *)&finalCommand:(void *)&original);++clips;
    }
    printf("PASS: %d light, %d shadow, %d stencil and %d clip routes; raw bits, shared ABI, original/live payloads, retries, cache publication and stack-zero invalidation\n",lights,shadows,stencils,clips);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_state_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
