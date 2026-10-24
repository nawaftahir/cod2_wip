"""Actual begin-view/3D source, shared ABI and live matrix/camera ownership."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend view setup.'):text.index('// Backend image residency command.')]
setter = text[text.index('void RB_SetCodeConstant('):text.index('// PINNED 100307e0:')]
frustum = text[text.index('void RB_SetFrustumConstants()'):text.index('extern const dvar_t *r_glow;')]
backend = (work / 'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
commands = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef int GfxRenderTargetId;
struct D3DMATRIX {union {float m[4][4];struct {float _11,_12,_13,_14,_21,_22,_23,_24,_31,_32,_33,_34,_41,_42,_43,_44;};};};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};struct GfxImage;
''' + backend + commands + tess + r'''
r_backEndGlobals_t backEnd;GfxTess tess;
struct {int width,height;} vidConfig;
struct {int viewportBehavior;} dxState;
GfxCmdBeginView original,alternate,finalCommand;GfxViewParms views[3];
GfxRenderCommandExecState *live;int kind,mutation,flushes,viewportCalls,initialLevel;
const GfxViewParms *installed;std::vector<int> events;
void RB_EndSurface() {
    ++flushes;events.push_back(0);tess.indexCount=tess.optimizedIndexCount=0;
    if(mutation==1){original.viewParms=&views[1];original.viewCount=23;memset(&original.sceneDef,0x37,16);memset(&original.lodParms,0x48,20);backEnd.viewParms=&views[1];live->cmd=&alternate;}
}
void MatrixIdentity44(float matrix[4][4]) {
    assert(!backEnd.projection2D&&matrix==backEnd.codeMatrixStack[initialLevel].world.matrix[0].m);events.push_back(2);
    for(int i=0;i<4;++i)for(int j=0;j<4;++j)matrix[i][j]=i==j?1.0f:0.0f;
}
void RB_ChangedWorldMatrix(float scale) {
    assert(scale==1.0f);events.push_back(3);
    if(mutation==2){backEnd.codeMatrixStackLevel=(initialLevel+1)%3;backEnd.viewParms=&views[1];live->cmd=&alternate;}
}
void RB_SetMatricesForView(const GfxViewParms *view) {
    assert(view==backEnd.viewParms);installed=view;events.push_back(4);
    if(mutation==3){backEnd.viewParms=&views[2];live->cmd=&finalCommand;}
}
void RB_UpdateViewportConstants() {
    ++viewportCalls;events.push_back(1);
    assert(backEnd.tileIndex==0&&backEnd.tileCount==1&&backEnd.width==vidConfig.width&&backEnd.height==vidConfig.height);
    assert(backEnd.viewCount==original.viewCount&&!memcmp(&backEnd.sceneDef,&original.sceneDef,16)&&!memcmp(&backEnd.lodParms,&original.lodParms,20));
    if(mutation==4){backEnd.viewParms=&views[1];live->cmd=&alternate;}
}
''' + setter + frustum + source + r'''
int main() {
    int begins=0,restores=0;
    for(kind=0;kind<2;++kind)for(int pending=0;pending<4;++pending)for(initialLevel=0;initialLevel<3;++initialLevel)
    for(int behavior=0;behavior<2;++behavior)for(mutation=0;mutation<5;++mutation)for(int dimensions=0;dimensions<2;++dimensions) {
        memset(&backEnd,0xa5,sizeof(backEnd));backEnd.projection2D=1;backEnd.codeMatrixStackLevel=initialLevel;
        for(int k=0;k<3;++k){memset(&views[k],0,sizeof(views[k]));
            for(int j=0;j<3;++j){views[k].origin[j]=k*10+j+1;for(int i=0;i<3;++i)views[k].axis[i][j]=k*20+i*3+j+5;}
            views[k].viewport={unsigned(k+2),unsigned(k+3),unsigned(k+640),unsigned(k+480),0,1};
            for(int i=0;i<4;++i)for(int j=0;j<4;++j){views[k].viewProjectionMatrix.m[i][j]=k*16+i*4+j+1;views[k].inverseViewProjectionMatrix.m[i][j]=(k+1)*(i*4+j+1);}
        }
        memset(&original,0,sizeof(original));memset(&original.sceneDef,0x16,16);memset(&original.lodParms,0x27,20);original.header.byteCount=48;original.viewParms=&views[0];original.viewCount=17;
        alternate=original;alternate.header.byteCount=64;alternate.viewParms=&views[2];finalCommand=alternate;finalCommand.header.byteCount=96;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;
        backEnd.viewParms=&views[0];tess.indexCount=pending&1?6:0;tess.optimizedIndexCount=pending&2?12:0;
        vidConfig.width=dimensions?600:1024;vidConfig.height=dimensions?350:512;dxState.viewportBehavior=behavior;
        flushes=viewportCalls=0;events.clear();installed=0;
        D3DMATRIX prior[3];for(int k=0;k<3;++k)prior[k]=backEnd.codeMatrixStack[k].world.matrix[0];
        const GfxViewParms *packet=pending&&mutation==1?&views[1]:&views[0];
        if(kind)RB_BeginViewCmd(&state);else RB_Set3D();
        assert(flushes==(pending!=0)&&viewportCalls==(kind&&!behavior));
        std::vector<int> wanted;if(pending)wanted.push_back(0);if(kind&&!behavior)wanted.push_back(1);wanted.push_back(2);wanted.push_back(3);wanted.push_back(4);assert(events==wanted);
        const GfxViewParms *beforeMatrices=mutation==2||kind&&!behavior&&mutation==4?&views[1]:packet;
        const GfxViewParms *camera=mutation==3?&views[2]:beforeMatrices;assert(installed==beforeMatrices&&backEnd.viewParms==camera&&!backEnd.projection2D);
        for(int k=0;k<3;++k)for(int i=0;i<4;++i)for(int j=0;j<4;++j)assert(backEnd.codeMatrixStack[k].world.matrix[0].m[i][j]==(k==initialLevel?(i==j?1.0f:0.0f):prior[k].m[i][j]));
        assert(backEnd.codeMatrixStackLevel==(mutation==2?(initialLevel+1)%3:initialLevel));
        for(int j=0;j<4;++j){assert(backEnd.codeConsts[11][j]==(j==3?1:camera->origin[j]));for(int i=0;i<3;++i)assert(backEnd.codeConsts[12+i][j]==(j==3?0:camera->axis[i][j]));}
        if(kind){
            assert(backEnd.viewCount==original.viewCount&&!memcmp(&backEnd.sceneDef,&original.sceneDef,16)&&!memcmp(&backEnd.lodParms,&original.lodParms,20));
            assert(backEnd.sceneViewport.x==(int)packet->viewport.X&&backEnd.sceneViewport.y==(int)packet->viewport.Y&&backEnd.sceneViewport.width==(int)packet->viewport.Width&&backEnd.sceneViewport.height==(int)packet->viewport.Height);
            assert(!memcmp(&backEnd.viewProjectionMatrix,&packet->viewProjectionMatrix,64));
            const GfxViewParms *fv=!behavior&&mutation==4?&views[1]:packet;double inv=1.0/fv->inverseViewProjectionMatrix._44;
            for(int j=0;j<3;++j){assert(std::fabs(backEnd.codeConsts[15][j]-(inv*fv->inverseViewProjectionMatrix.m[3][j]-fv->origin[j]))<.0001);assert(std::fabs(backEnd.codeConsts[16][j]-2*inv*fv->inverseViewProjectionMatrix.m[0][j])<.0001);assert(std::fabs(backEnd.codeConsts[17][j]+2*inv*fv->inverseViewProjectionMatrix.m[1][j])<.0001);}
            assert(!backEnd.codeConsts[15][3]&&!backEnd.codeConsts[16][3]&&!backEnd.codeConsts[17][3]);
            const void *base=mutation==3?(void *)&finalCommand:mutation==2||pending&&mutation==1||!behavior&&mutation==4?(void *)&alternate:(void *)&original;
            assert(state.cmd==(const byte *)base+((const GfxCmdHeader *)base)->byteCount);++begins;
        }else ++restores;
        assert(state.stackPos==1&&state.retCmd[0]==&original&&state.retCmd[1]==&alternate);
    }
    printf("PASS: %d actual begin-view and %d 3D restore routes; shared48-byte payload, live views, stack identity, raw scene/LOD copies, viewport and unscaled PC frustum constants\n",begins,restores);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_view_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
