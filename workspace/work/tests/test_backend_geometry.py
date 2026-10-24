"""Actual stencil/triangle packets, surface transitions, overflow and late publication."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend stencil-plane and triangle geometry.'):text.index('// Backend presentation.')]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
overflow = (work / 'src/gfx_d3d/rb_2d.cpp').read_text()
a = overflow.index('void RB_TessOverflow()')
overflow = overflow[a:overflow.index('// PINNED 1002e850:',a)].replace('void RB_TessOverflow()','void actualOverflow()')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef unsigned GfxColor;typedef int GfxRenderTargetId;
struct GfxViewport {int x,y,width,height;};struct Material {int id;} matA={0},matB={1},matC={2};
''' + header + tess + r'''
GfxTess tess;struct {byte projection2D;} backEnd;struct {const Material *stencilPlaneMaterial;} rgp;
alignas(16) byte originalBytes[4096],alternateBytes[4096],finalBytes[4096];
GfxCmdStencilPlanes *stencil=(GfxCmdStencilPlanes *)originalBytes;
GfxCmdDrawTriangles *triangles=(GfxCmdDrawTriangles *)originalBytes;
float (*positions)[4],(*normals)[3],(*uvs)[2];GfxColor *colors;unsigned short *inputIndices;
unsigned short firstBuffer[0x100080],secondBuffer[0x100080];
GfxRenderCommandExecState *live;const void *cursorBase;
int kind,mutation,endStyle,wantV,wantI,preEnds,ends,begins,overflows,sets,calls,nv,ni;
bool inOverflow,pendingPlane,indexCaptured,changedIndices;int corner;float planeD,planeZ;
unsigned short *planeBuffer,*triangleBuffer;int planeStart,planeBase,triangleStart,triangleBase;
unsigned short planeLow,planeHigh,triangleLow,triangleHigh;
struct Counts {int v,i;};std::vector<Counts> submissions;
void cursor(const void *p){live->cmd=p;cursorBase=p;}
void prepare(){for(int k=-1;k<32;++k)if(wantI+k>=0){firstBuffer[wantI+k]=0x6b6b;secondBuffer[wantI+k]=0x6b6b;}}
void planeDone(){if(!pendingPlane)return;
    const int offsets[]={0,1,2,2,3,0};for(int i=0;i<6;++i)assert(planeBuffer[planeStart+i]==(unsigned short)(planeBase+offsets[i]));
    assert((!planeStart||planeBuffer[planeStart-1]==planeLow)&&planeBuffer[planeStart+6]==planeHigh);
    wantV+=4;wantI+=6;assert(tess.vertexCount==wantV&&tess.indexCount==wantI);pendingPlane=false;prepare();
}
void triangleIndices(){
    if(!indexCaptured){triangleBuffer=tess.indices;triangleStart=wantI;triangleBase=wantV;triangleLow=triangleStart?triangleBuffer[triangleStart-1]:0;triangleHigh=triangleBuffer[triangleStart+(ni>0?ni:0)];assert((!triangleStart||triangleLow==0x6b6b)&&triangleHigh==0x6b6b);indexCaptured=true;}
    for(int i=0;i<ni;++i)assert(triangleBuffer[triangleStart+i]==(unsigned short)(triangleBase+inputIndices[i]));
    assert((!triangleStart||triangleBuffer[triangleStart-1]==triangleLow)&&triangleBuffer[triangleStart+(ni>0?ni:0)]==triangleHigh);
}
void RB_EndSurface(){
    if(!kind)planeDone();++ends;
    bool setup=inOverflow||preEnds>0;if(!inOverflow&&preEnds>0)--preEnds;
    if(!setup){if(kind){triangleIndices();assert(tess.vertexCount==wantV+nv&&tess.indexCount==wantI+ni);
        if(changedIndices)for(int i=0;i<6;++i)assert(secondBuffer[wantI+i]==0x6b6b);
    }else assert(tess.vertexCount==wantV&&tess.indexCount==wantI);submissions.push_back({tess.vertexCount,tess.indexCount});}
    else assert(tess.vertexCount==wantV&&tess.indexCount==wantI);
    if(!endStyle||tess.indexCount)tess.vertexCount=0;tess.indexCount=tess.optimizedIndexCount=0;wantV=tess.vertexCount;wantI=0;prepare();
    if(mutation==1&&setup&&!inOverflow){cursor(alternateBytes);rgp.stencilPlaneMaterial=&matB;
        if(kind){triangles->material=&matB;triangles->techType=7;triangles->vertexCount=0;triangles->indexCount=0;if(nv>0)positions[0][0]=111;}
        else {stencil->nearDist=.75f;for(int i=0;i<3;++i)stencil->planeDists[i]=i+11;}
    }
    if(mutation==3&&inOverflow){tess.material=&matC;tess.techType=9;tess.lmapIndex=2;cursor(alternateBytes);
        if(kind){if(nv>0)positions[0][0]=123;}else {stencil->nearDist=.25f;for(int i=0;i<3;++i)stencil->planeDists[i]=i+21;}
    }
}
void RB_BeginSurface(const Material *material,int technique,int lightmap){
    if(inOverflow&&mutation==3)assert(material==&matC&&technique==9&&lightmap==2);
    else assert(material==&matA&&technique==3&&lightmap==31);
    ++begins;tess.material=material;tess.techType=technique;tess.lmapIndex=lightmap;tess.declType=0;tess.vertexCount=tess.indexCount=0;wantV=wantI=0;prepare();if(inOverflow&&mutation==3){tess.vertexCount=wantV=2;tess.indexCount=wantI=1;tess.optimizedIndexCount=1;prepare();}
}
void RB_Set3D(){assert(kind&&backEnd.projection2D);++sets;backEnd.projection2D=0;
    if(mutation==2){tess.material=&matB;tess.techType=7;tess.vertexCount=wantV=5;tess.indexCount=wantI=2;prepare();cursor(alternateBytes);}
}
''' + overflow + r'''
void RB_TessOverflow(){if(!kind)planeDone();++overflows;int declaration=tess.declType;inOverflow=true;actualOverflow();inOverflow=false;assert(tess.declType==declaration);prepare();}
void changeVertexState(){if(mutation==4&&calls==1){tess.vertexCount+=7;tess.indexCount+=11;wantV+=7;wantI+=11;tess.indices=secondBuffer;changedIndices=true;prepare();cursor(finalBytes);
    if(!kind){stencil->planeDists[0]=91;stencil->nearDist=17;stencil->planeCount=1;}else if(nv>1)colors[1]=0xfedcba98;
}}
void RB_SetVertex4D(int index,float x,float y,float z,float w,float s,float t,const GfxColor *color){
    planeDone();corner=calls%4;
    assert(!kind&&tess.vertexCount==wantV&&tess.indexCount==wantI&&index==wantV+corner);
    if(!corner){int plane=calls/4;planeD=stencil->planeDists[plane];planeZ=planeD-stencil->nearDist;planeLow=wantI?tess.indices[wantI-1]:0;planeHigh=tess.indices[wantI+6];}
    assert(x==((corner==0||corner==1)?-planeD:planeD)&&y==((corner==0||corner==3)?-planeD:planeD)&&z==planeZ&&w==planeD&&!s&&!t&&*color==0xffffffff);
    for(int i=0;i<6;++i)assert(tess.indices[wantI+i]==0x6b6b);
    ++calls;changeVertexState();
    if(corner==3){planeBuffer=tess.indices;planeStart=wantI;planeBase=wantV;planeLow=wantI?tess.indices[wantI-1]:0;planeHigh=tess.indices[wantI+6];pendingPlane=true;}
}
void RB_SetLitVertex4D(int index,float x,float y,float z,float w,float nx,float ny,float nz,float s,float t,const GfxColor *color){
    assert(kind&&calls<nv&&tess.vertexCount==wantV&&tess.indexCount==wantI&&index==wantV+calls);triangleIndices();int i=calls;
    assert(x==positions[i][0]&&y==positions[i][1]&&z==positions[i][2]&&w==positions[i][3]&&nx==normals[i][0]&&ny==normals[i][1]&&nz==normals[i][2]&&s==uvs[i][0]&&t==uvs[i][1]&&color==colors+i);
    ++calls;changeVertexState();
}
''' + source + r'''
void reset(int mode,int change,int style,int vertexBase,int indexBase,int optimized,int match,int projected,GfxRenderCommandExecState &state){
    kind=mode;mutation=change;endStyle=style;wantV=vertexBase;wantI=indexBase;inOverflow=pendingPlane=indexCaptured=changedIndices=false;
    ends=begins=overflows=sets=calls=0;submissions.clear();memset(originalBytes,0,4096);memset(alternateBytes,0,4096);memset(finalBytes,0,4096);
    ((GfxCmdHeader *)originalBytes)->byteCount=512;((GfxCmdHeader *)alternateBytes)->byteCount=768;((GfxCmdHeader *)finalBytes)->byteCount=1024;
    state={originalBytes,1,{originalBytes,alternateBytes}};live=&state;cursorBase=originalBytes;
    tess.material=match==1?&matB:&matA;tess.techType=match==2?7:3;tess.lmapIndex=31;tess.declType=9;tess.indices=firstBuffer;
    tess.vertexCount=vertexBase;tess.indexCount=indexBase;tess.optimizedIndexCount=optimized?6:0;backEnd.projection2D=projected;rgp.stencilPlaneMaterial=&matA;prepare();
    preEnds=kind?int(indexBase||optimized)+int(projected&&change==2):int(match&&(indexBase||optimized));
}
void advanced(const GfxRenderCommandExecState &state,bool wrapper){assert(state.cmd==(wrapper?(const byte *)cursorBase+((const GfxCmdHeader *)cursorBase)->byteCount:cursorBase)&&state.stackPos==1&&state.retCmd[0]==originalBytes&&state.retCmd[1]==alternateBytes);}
int main(){
    int planes=0,triCases=0;GfxRenderCommandExecState state;
    for(int count:{0,1,2,3})for(int base:{0,5446,5447})for(int first:{0,0x100000-6,0x100000-5})for(int opt=0;opt<2;++opt)for(int match=0;match<3;++match)for(int change=0;change<5;++change)for(int style=0;style<2;++style){
        reset(0,change,style,base,first,opt,match,0,state);stencil->planeCount=count;stencil->nearDist=.5f;for(int i=0;i<3;++i)stencil->planeDists[i]=i+2;
        RB_StencilPlanesCmd(&state);assert(calls==(change==4&&count>0?1:count)*4&&submissions.size()==1&&!sets&&!preEnds&&!pendingPlane);advanced(state,true);++planes;
    }
    for(int vertices:{0,1,3,9})for(int indices:{0,1,6})for(int base:{0,5449,5450})for(int first:{0,0x100000-6})for(int opt=0;opt<2;++opt)for(int match=0;match<3;++match)
    for(int projected=0;projected<2;++projected)for(int change=0;change<5;++change)for(int wrapper=0;wrapper<2;++wrapper){
        reset(1,change,0,base,first,opt,match,projected,state);nv=vertices;ni=indices;
        triangles->material=&matA;triangles->techType=3;triangles->vertexCount=vertices;triangles->indexCount=indices;
        positions=(float (*)[4])(originalBytes+16);normals=(float (*)[3])(originalBytes+16+vertices*16);colors=(GfxColor *)(originalBytes+16+vertices*28);uvs=(float (*)[2])(originalBytes+16+vertices*32);inputIndices=(unsigned short *)(originalBytes+16+vertices*40);
        for(int i=0;i<vertices;++i){for(int j=0;j<4;++j)positions[i][j]=i*4+j+.5f;for(int j=0;j<3;++j)normals[i][j]=i*3+j+20.0f;colors[i]=0x81234567+i;uvs[i][0]=i+.25f;uvs[i][1]=i+.75f;}
        const unsigned short offsets[]={0,65535,2,32768,1,17};for(int i=0;i<indices;++i)inputIndices[i]=offsets[i];
        if(wrapper)RB_DrawTrianglesCmd(&state);else RB_DrawTriangles(&matA,3,indices,inputIndices,vertices,positions,normals,colors,uvs);
        assert(calls==vertices&&submissions.size()==1&&sets==projected&&!preEnds);advanced(state,wrapper);++triCases;
    }
    printf("PASS: %d actual stencil packets and %d direct/packed triangles; signed-short layouts, five arrays, captures/live counts, late publication, indices/guards, real overflow declaration restore and final flush\n",planes,triCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_geometry_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
