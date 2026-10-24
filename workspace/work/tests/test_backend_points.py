"""Actual point packets: projection math, capacity, callback timing and live cursor."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend point geometry.'):text.index('// Backend line geometry.')]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once', '')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once', '')
overflow = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
a = overflow.index('void RB_TessOverflow()')
overflow = overflow[a:overflow.index('// PINNED 1002e850:', a)].replace('void RB_TessOverflow()', 'void actualOverflow()')
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <initializer_list>
typedef unsigned char byte;typedef unsigned GfxColor;typedef int GfxRenderTargetId;
struct GfxViewport {int x,y,width,height;};struct Material {int id;} white={1},pointMat={2},changed={3};
''' + header + tess + r'''
struct D3DMATRIX {float m[4][4];};
struct GfxViewParms {D3DMATRIX viewProjectionMatrix;};
struct Matrix {D3DMATRIX matrix[4];};struct Stack {Matrix world,projection;};
struct {Stack codeMatrixStack[2];int codeMatrixStackLevel;GfxViewParms *viewParms;byte projection2D;} backEnd;
struct {int renderTargetWidth,renderTargetHeight;} dxState;
struct {const Material *whiteMaterial,*pointMaterial;} rgp;GfxTess tess;
alignas(16) byte packet[128],other[128],last[128];
GfxCmdDrawPoints *cmd=(GfxCmdDrawPoints *)packet;GfxRenderCommandExecState *live;
GfxViewParms views[3];const D3DMATRIX *captured;const void *cursorBase;
unsigned short indices[0x100080];int mode,mutation,calls,ends,begins,overflows,projections,viewSets,restores;
int wantV,wantI,phase,quadBase,quadFirst,cachedPoint;bool overflowing;float size,sx,sy,clip[4];
void cursor(const void *p){live->cmd=p;cursorBase=p;}
bool close(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||std::fabs(a-b)<=1e-5f*(1+std::fabs(b));}
void identity(float m[4][4]){for(int i=0;i<4;++i)for(int j=0;j<4;++j)m[i][j]=i==j?1.0f:0.0f;}
void MatrixIdentity44(float m[4][4]){identity(m);}
void checkIdentity(const D3DMATRIX &m){for(int i=0;i<4;++i)for(int j=0;j<4;++j)assert(m.m[i][j]==(i==j?1.0f:0.0f));}
void mutateGeometry(){for(int i=0;i<3;++i){cmd->verts[i].xyz[0]+=8;cmd->verts[i].xyz[1]-=4;cmd->verts[i].xyz[2]+=2;}}
void geometry(int i){
    const float *v=cmd->verts[i].xyz;
    for(int c=0;c<4;++c)clip[c]=v[2]*captured->m[2][c]+v[1]*captured->m[1][c]+v[0]*captured->m[0][c]+captured->m[3][c];
    clip[2]-=clip[3]*.001f;
}
void RB_EndSurface(){
    ++ends;assert(tess.vertexCount==wantV&&tess.indexCount==wantI);
    tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;wantV=wantI=0;
    if(mutation==1&&phase==0){rgp.whiteMaterial=rgp.pointMaterial=&changed;cmd->size=10;cursor(other);}
    if(phase==1&&overflowing&&mutation==3){mutateGeometry();views[1].viewProjectionMatrix.m[3][0]+=7;backEnd.viewParms=&views[2];cmd->size=300;cursor(other);}
    if(phase==1&&!overflowing&&mode==3){phase=2;if(mutation==5){backEnd.viewParms=&views[2];cursor(last);}}
}
void RB_BeginSurface(const Material *material,int technique,int lightmap){
    assert(technique==3&&lightmap==31);
    if(!overflowing)assert(material==(mode==2?&white:&pointMat));
    ++begins;tess.material=material;tess.techType=technique;tess.lmapIndex=lightmap;tess.declType=0;
    tess.vertexCount=tess.indexCount=0;wantV=wantI=0;
}
void RB_ProjectionMatrixChanged(){assert(mode==3&&phase==0);++projections;checkIdentity(backEnd.codeMatrixStack[1].projection.matrix[0]);}
void RB_SetViewMatrix(const D3DMATRIX *m){
    assert(mode==3&&phase==0);++viewSets;checkIdentity(*m);
    if(mutation==2){cmd->size=12;backEnd.viewParms=&views[1];cursor(other);}
    captured=&backEnd.viewParms->viewProjectionMatrix;size=(float)cmd->size;sx=size/dxState.renderTargetWidth;sy=size/dxState.renderTargetHeight;phase=1;
}
void RB_SetMatricesForView(const GfxViewParms *v){assert(mode==3&&phase==2&&v==backEnd.viewParms);++restores;}
''' + overflow + r'''
void RB_TessOverflow(){
    phase=1;assert(tess.vertexCount+4>5450||tess.indexCount+6>0x100000);++overflows;
    if(mode==3){geometry(calls/4);cachedPoint=calls/4;}
    int declaration=tess.declType;overflowing=true;actualOverflow();overflowing=false;assert(tess.declType==declaration);
}
void RB_SetVertex4D(int index,float x,float y,float z,float w,float s,float t,const GfxColor *color){
    int corner=calls%4,point=calls/4;phase=1;
    if(!corner){
        quadBase=wantV;quadFirst=wantI;wantI+=6;
        const int order2[]={1,0,2,2,0,3},order3[]={3,0,2,2,0,1};const int *order=mode==2?order2:order3;
        for(int i=0;i<6;++i)assert(indices[quadFirst+i]==(unsigned short)(quadBase+order[i]));
        if(mode==3&&cachedPoint!=point)geometry(point);
    }
    assert(index==wantV+corner&&tess.vertexCount==wantV&&tess.indexCount==wantI);
    assert(color==(const GfxColor *)cmd->verts[point].color);
    assert(s==(corner<2?0:1)&&t==(corner==1||corner==2?1:0));
    float signX=corner<2?-1:1,signY=corner==0||corner==3?-1:1;
    if(mode==2){assert(close(x,cmd->verts[point].xyz[0]+signX*size*.5f));assert(close(y,cmd->verts[point].xyz[1]+signY*size*.5f));assert(z==cmd->verts[point].xyz[2]&&w==1);}
    else {assert(close(x,clip[0]+signX*clip[3]*sx)&&close(y,clip[1]+signY*clip[3]*sy)&&close(z,clip[2])&&close(w,clip[3]));}
    ++calls;
    if(mutation==4&&calls==1){mutateGeometry();cmd->size=300;cmd->pointCount=1;tess.vertexCount+=7;tess.indexCount+=11;wantV+=7;wantI+=11;cursor(last);}
    if(corner==3)wantV+=4;
}
''' + source + r'''
int main(){
    int cases=0;GfxRenderCommandExecState state;
    for(mode=2;mode<=3;++mode)for(int count:{-1,0,1,3})for(int pointSize:{-4,0,6})for(int base:{0,5446,5447})
    for(int first:{0,0x100000-6,0x100000-5})for(int match=0;match<3;++match)for(mutation=0;mutation<6;++mutation)for(int width:{-320,320}){
        memset(packet,0,sizeof(packet));memset(other,0,sizeof(other));memset(last,0,sizeof(last));memset(indices,0x6b,sizeof(indices));
        calls=ends=begins=overflows=projections=viewSets=restores=0;phase=0;cachedPoint=-1;overflowing=false;
        for(int i=0;i<3;++i){identity(views[i].viewProjectionMatrix.m);views[i].viewProjectionMatrix.m[0][1]=.25f;views[i].viewProjectionMatrix.m[3][0]=i+2;
            views[i].viewProjectionMatrix.m[3][3]=i==0?.5f:i==1?-2.0f:0.0f;}
        backEnd.viewParms=&views[0];backEnd.codeMatrixStackLevel=1;backEnd.projection2D=mode==2;dxState.renderTargetWidth=width;dxState.renderTargetHeight=200;
        rgp.whiteMaterial=&white;rgp.pointMaterial=&pointMat;state={packet,1,{packet,other}};live=&state;cursorBase=packet;
        cmd->header.byteCount=64;((GfxCmdHeader *)other)->byteCount=80;((GfxCmdHeader *)last)->byteCount=96;cmd->pointCount=count;cmd->size=pointSize;
        for(int i=0;i<3;++i){cmd->verts[i].xyz[0]=i+1;cmd->verts[i].xyz[1]=i+2;cmd->verts[i].xyz[2]=i+3;memset(cmd->verts[i].color,0x80+i,4);}
        tess.indices=indices;tess.vertexCount=wantV=base;tess.indexCount=wantI=first;tess.optimizedIndexCount=first?6:0;tess.declType=9;
        tess.material=match==1?&changed:mode==2?&white:&pointMat;tess.techType=match==2?7:3;tess.lmapIndex=31;
        size=mutation==1&&match&&first?10:pointSize;captured=&views[0].viewProjectionMatrix;
        RB_DrawPointsCmd(&state);
        int expected=count>0?(mutation==4?1:count):0;assert(calls==expected*4);
        assert(tess.vertexCount==wantV&&tess.indexCount==wantI);
        assert(projections==(mode==3)&&viewSets==(mode==3)&&restores==(mode==3));
        assert(state.cmd==(const byte *)cursorBase+((const GfxCmdHeader *)cursorBase)->byteCount&&state.stackPos==1&&state.retCmd[0]==packet&&state.retCmd[1]==other);
        if(mode==2)assert(ends==int(match&&first!=0)+overflows);else assert(phase==2);
        assert(overflows==((!match&&expected>0&&(base+4*expected>5450||first+6*expected>0x100000))?1:0));++cases;
    }
    printf("PASS: %d actual 2D/3D point commands; signed packets, capacity, captured matrices/size, live geometry/cursor, index publication and restoration\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_points_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-I', str(work / 'src/gfx_d3d'), '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
