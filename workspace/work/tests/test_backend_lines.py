"""Actual line packets and direct debug path, with original normalization/overflow."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend line geometry.'):text.index('// Backend presentation.')]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once', '')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once', '')
overflow = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
a = overflow.index('void RB_TessOverflow()')
overflow = overflow[a:overflow.index('// PINNED 1002e850:', a)].replace('void RB_TessOverflow()', 'void actualOverflow()')
math = (work / 'src/universal/com_math.cpp').read_text()
a = math.index('vec_t Vec2Normalize(')
normalize = math[a:math.index('\n/*', a)].replace('Vec2Normalize(', 'actualNormalize(')
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <limits>
#include <initializer_list>
typedef unsigned char byte;typedef unsigned GfxColor;typedef int GfxRenderTargetId;typedef float vec_t;
typedef float vec3_t[3];float I_sqrt(float v){return std::sqrt(v);}
struct GfxViewport {int x,y,width,height;};struct Material {byte pad[0x2c];unsigned bits[2];} materials[3];
''' + header + tess + normalize + r'''
struct D3DMATRIX {float m[4][4];};struct GfxViewParms {D3DMATRIX viewProjectionMatrix;} views[3];
struct Matrix {D3DMATRIX matrix[4];};struct Stack {Matrix world,projection;};
struct {Stack codeMatrixStack[2];int codeMatrixStackLevel;GfxViewParms *viewParms;byte projection2D;} backEnd;
struct {int renderTargetWidth,renderTargetHeight;} dxState;
struct {Material *whiteMaterial,*lineMaterial;} rgp;GfxTess tess;
alignas(16) byte packet[256],other[128],last[128];GfxCmdDrawLines *cmd=(GfxCmdDrawLines *)packet;
GfxRenderCommandExecState *live;const void *cursorBase;unsigned short indices[0x100080];
const D3DMATRIX *captured;float from[4],to[4],dx,dy,sx,sy;
int mode,mutation,depth,expectedCount,passedWidth,calls,normalizes,ends,begins,overflows,projections,viewSets,restores,wantV,wantI,phase;
bool overflowing,matched;Material *initialMaterial;unsigned originalBits[3];
void cursor(const void *p){live->cmd=p;cursorBase=p;}
bool close(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||std::fabs(a-b)<=1e-5f*(1+std::fabs(b));}
void identity(float m[4][4]){for(int i=0;i<4;++i)for(int j=0;j<4;++j)m[i][j]=i==j?1.0f:0.0f;}
void MatrixIdentity44(float m[4][4]){identity(m);}
void checkIdentity(const D3DMATRIX &m){for(int i=0;i<4;++i)for(int j=0;j<4;++j)assert(m.m[i][j]==(i==j?1.0f:0.0f));}
void mutate(){for(int i=0;i<4;++i){cmd->verts[i].xyz[0]+=8;cmd->verts[i].xyz[1]-=4;cmd->verts[i].xyz[2]+=2;}}
void project(const GfxPointVertex &v,float out[4]){
    for(int c=0;c<4;++c)out[c]=(float)((double)v.xyz[0]*captured->m[0][c]+(double)v.xyz[1]*captured->m[1][c]+(double)v.xyz[2]*captured->m[2][c]+captured->m[3][c]);
}
float Vec2Normalize(float *v){
    int pair=normalizes;assert(pair<expectedCount);float wantX,wantY;
    if(mode==2){wantX=cmd->verts[2*pair+1].xyz[1]-cmd->verts[2*pair].xyz[1];wantY=cmd->verts[2*pair].xyz[0]-cmd->verts[2*pair+1].xyz[0];}
    else {project(cmd->verts[2*pair],from);project(cmd->verts[2*pair+1],to);wantX=from[3]*to[1]-from[1]*to[3];wantY=from[0]*to[3]-from[3]*to[0];}
    assert(close(v[0],wantX)&&close(v[1],wantY));float len=actualNormalize(v);dx=v[0]*(mode==2?.5f:sx);dy=v[1]*(mode==2?.5f:sy);++normalizes;phase=1;return len;
}
void RB_EndSurface(){
    ++ends;assert(tess.vertexCount==wantV&&tess.indexCount==wantI);tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;wantV=wantI=0;
    if(phase==0&&mutation==1){rgp.whiteMaterial=rgp.lineMaterial=&materials[1];cmd->lineCount=0;cmd->width=99;mutate();cursor(other);}
    if(phase==1&&overflowing&&mutation==2){mutate();views[1].viewProjectionMatrix.m[3][0]+=8;backEnd.viewParms=&views[2];cmd->lineCount=0;cmd->width=77;cursor(other);}
    if(phase==1&&!overflowing&&mode==3){phase=2;if(mutation==4){backEnd.viewParms=&views[2];rgp.lineMaterial=&materials[2];cursor(last);}}
}
void RB_BeginSurface(const Material *m,int technique,int lightmap){
    assert(technique==3&&lightmap==31);if(!overflowing)assert(m==initialMaterial);++begins;
    tess.material=m;tess.techType=3;tess.lmapIndex=31;tess.declType=0;tess.vertexCount=tess.indexCount=0;wantV=wantI=0;
}
void RB_ProjectionMatrixChanged(){assert(mode==3&&phase==0);++projections;checkIdentity(backEnd.codeMatrixStack[1].projection.matrix[0]);
    unsigned bits=rgp.lineMaterial->bits[1];assert(bits==(depth?originalBits[rgp.lineMaterial-materials]:(originalBits[rgp.lineMaterial-materials]&~0xeu)|2));
}
void RB_SetViewMatrix(const D3DMATRIX *m){assert(mode==3&&phase==0);++viewSets;checkIdentity(*m);
    if(mutation==3){backEnd.viewParms=&views[1];cmd->width=55;cursor(other);}
    captured=&backEnd.viewParms->viewProjectionMatrix;sx=(float)passedWidth/dxState.renderTargetWidth;sy=(float)passedWidth/dxState.renderTargetHeight;phase=1;
}
void RB_SetMatricesForView(const GfxViewParms *v){assert(mode==3&&phase==2&&v==backEnd.viewParms);++restores;}
''' + overflow + r'''
void RB_TessOverflow(){assert(tess.vertexCount+4>5450||tess.indexCount+6>0x100000);++overflows;
    int declaration=tess.declType;overflowing=true;actualOverflow();overflowing=false;assert(tess.declType==declaration);
}
void vertex(int index,float x,float y,float z,float w,float s,float t,const GfxColor *color){
    int corner=calls%4,pair=calls/4,endpoint=corner==1||corner==2;assert(normalizes==pair+1);
    if(!corner){const int order2[]={1,0,2,2,0,3},order3[]={3,0,2,2,0,1};const int *order=mode==2?order2:order3;
        for(int i=0;i<6;++i)assert(indices[wantI+i]==(unsigned short)(wantV+order[i]));wantI+=6;}
    assert(index==wantV+corner&&tess.vertexCount==wantV&&tess.indexCount==wantI);
    assert(color==(const GfxColor *)cmd->verts[2*pair+endpoint].color&&s==(corner<2?0:1)&&t==endpoint);
    float sign=corner<2?-1:1;
    if(mode==2){const float *p=cmd->verts[2*pair+endpoint].xyz;assert(close(x,p[0]+sign*dx)&&close(y,p[1]+sign*dy)&&close(z,p[2])&&w==1);}
    else {const float *p=endpoint?to:from;assert(close(x,p[0]+sign*p[3]*dx)&&close(y,p[1]+sign*p[3]*dy)&&close(z,p[2])&&close(w,p[3]));}
    ++calls;
    if(mutation==3&&calls==1){mutate();cmd->lineCount=0;cmd->width=88;tess.vertexCount+=7;tess.indexCount+=11;wantV+=7;wantI+=11;cursor(last);}
    if(corner==3)wantV+=4;
}
void RB_SetVertex3D(int index,float x,float y,float z,float s,float t,const GfxColor *c){assert(mode==2);vertex(index,x,y,z,1,s,t,c);}
void RB_SetVertex4D(int index,float x,float y,float z,float w,float s,float t,const GfxColor *c){assert(mode==3);vertex(index,x,y,z,w,s,t,c);}
''' + source + r'''
int main(){
    int cases=0;GfxRenderCommandExecState state;
    for(mode=2;mode<=3;++mode)for(int count:{-1,0,1,2})for(int width:{-4,0,3})for(int capacity=0;capacity<3;++capacity)
    for(int match=0;match<3;++match)for(int wrapper=0;wrapper<2;++wrapper)for(int testDepth=0;testDepth<2;++testDepth)for(mutation=0;mutation<5;++mutation)for(int shape=0;shape<4;++shape){
        memset(packet,0,sizeof(packet));memset(other,0,sizeof(other));memset(last,0,sizeof(last));calls=normalizes=ends=begins=overflows=projections=viewSets=restores=0;phase=0;overflowing=false;expectedCount=count;passedWidth=width;depth=wrapper?1:testDepth;
        for(int i=0;i<3;++i){materials[i].bits[1]=originalBits[i]=0x81234567u+i*16;identity(views[i].viewProjectionMatrix.m);views[i].viewProjectionMatrix.m[0][1]=.25f;views[i].viewProjectionMatrix.m[3][0]=i+2;views[i].viewProjectionMatrix.m[0][3]=.125f;views[i].viewProjectionMatrix.m[3][3]=i?-.5f:1.0f;}
        backEnd.viewParms=&views[0];backEnd.codeMatrixStackLevel=1;backEnd.projection2D=mode==2;dxState.renderTargetWidth=320;dxState.renderTargetHeight=-200;
        rgp.whiteMaterial=rgp.lineMaterial=initialMaterial=&materials[0];state={packet,1,{packet,other}};live=&state;cursorBase=packet;
        cmd->header.byteCount=96;((GfxCmdHeader *)other)->byteCount=64;((GfxCmdHeader *)last)->byteCount=80;cmd->lineCount=count;cmd->width=width;
        for(int i=0;i<4;++i){cmd->verts[i].xyz[0]=i+1;cmd->verts[i].xyz[1]=2*i+2;cmd->verts[i].xyz[2]=i+3;memset(cmd->verts[i].color,0x80+i,4);}
        if(shape==1)for(int i=0;i<2;++i)memcpy(cmd->verts[2*i+1].xyz,cmd->verts[2*i].xyz,12);
        if(shape>=2)cmd->verts[0].xyz[0]=shape==2?std::numeric_limits<float>::quiet_NaN():std::numeric_limits<float>::infinity();
        tess.indices=indices;tess.vertexCount=wantV=capacity==0?0:capacity==1?5446:5447;tess.indexCount=wantI=capacity==0?0:0x100000-6;tess.optimizedIndexCount=capacity?6:0;tess.declType=9;
        tess.material=match==1?&materials[1]:initialMaterial;tess.techType=match==2?7:3;tess.lmapIndex=31;captured=&views[0].viewProjectionMatrix;
        if(wrapper)RB_DrawLinesCmd(&state);else if(mode==2)RB_DrawLines2D(count,cmd->verts);else RB_DrawLines3D(count,width,cmd->verts,depth);
        assert(calls==(count>0?count:0)*4&&normalizes==(count>0?count:0));assert(tess.vertexCount==wantV&&tess.indexCount==wantI);
        assert(projections==(mode==3)&&viewSets==(mode==3)&&restores==(mode==3));
        assert(state.cmd==(wrapper?(const byte *)cursorBase+((const GfxCmdHeader *)cursorBase)->byteCount:cursorBase)&&state.stackPos==1&&state.retCmd[0]==packet&&state.retCmd[1]==other);
        if(mode==2)assert(ends==int(match&&capacity!=0)+overflows);else{assert(phase==2);if(!depth)assert((rgp.lineMaterial->bits[1]&0xe)==4);}
        ++cases;
    }
    printf("PASS: %d actual 2D/3D lines and command packets; original normalization/overflow, signed widths/counts, NaNs/degeneracy, frozen offsets, live geometry/cursor and depth/view restoration\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_lines_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-I', str(work / 'src/gfx_d3d'), '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
