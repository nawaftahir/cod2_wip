"""Actual 2D matrix state, quad boundaries, overflow and occlusion calibration."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
backend=(work/'src/gfx_d3d/rb_backend.cpp').read_text()
sky=(work/'src/gfx_d3d/rb_sky.cpp').read_text()
source=sky[sky.index('// PINNED 101d1b38:'):sky.index('// PINNED 1003a9d0:')]
source+=backend[backend.index('/* Header-style inline helpers.'):backend.index('// Backend frame driver.\n')]
source+=sky[sky.index('// PINNED 1003a9d0:'):sky.index('// Sun fade and quads.')]
header=(work/'src/gfx_d3d/rb_backend.h').read_text().replace('__declspec(align(16)) struct','struct alignas(16)').replace('#pragma once','')
tess=(work/'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
sun=(work/'src/gfx_d3d/r_sun_state.h').read_text().replace('#pragma once','')
program=r'''
#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <limits>
#include <string>
#include <vector>
typedef unsigned char byte;typedef byte Bool;typedef float vec3_t[3];
typedef unsigned int DWORD;typedef int HRESULT;typedef int D3DTRANSFORMSTATETYPE;
const int S_OK=0,S_FALSE=1,D3DTS_VIEW=2,D3DTS_PROJECTION=3;
struct D3DMATRIX {union {struct {float _11,_12,_13,_14,_21,_22,_23,_24,_31,_32,_33,_34,_41,_42,_43,_44;};float m[4][4];};};
struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
struct GfxImage;struct Material {int id;} whiteMaterial,otherMaterial;
struct IDirect3DQuery9 {int issues[3],gets;HRESULT Issue(int);HRESULT GetData(void *,unsigned,unsigned);};
struct IDirect3DDevice9 {int transforms[3],begins,ends;HRESULT SetTransform(int,const D3DMATRIX *);HRESULT BeginScene();HRESULT EndScene();} device;
''' + header + tess + sun + r'''
r_backEndGlobals_t backEnd,expectedBackend,flushBackend;
GfxTess tess;SunFlareDynamic sunFlareState[4];
struct {IDirect3DDevice9 *device;} dx={&device};
struct IDirect3DIndexBuffer9;void RB_ChangeIndices(IDirect3DIndexBuffer9 *){}
struct State {int viewportBehavior,renderTargetWidth,renderTargetHeight;IDirect3DIndexBuffer9 *indexBuffer;} dxState,flushState;
struct dvar_t {struct {int integer;} current;} renderer;
const dvar_t *r_rendererInUse=&renderer;
const float identityMatrix44[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
const float colorWhite[4]={1,1,1,1};
int alwaysfails,route,endCalls,beginCalls,sleeps,clearCalls,retry,pending,terminalResult;
bool mutateFlush,seedOptimized,changeQuery;
unsigned sampleValue;
IDirect3DQuery9 query,otherQuery;
struct Vertex {int index;float x,y,s,t;unsigned color;};std::vector<Vertex> vertices;
struct Transform {int type;D3DMATRIX matrix;};std::vector<Transform> transforms;
std::vector<std::string> events;
void RB_LogPrint(const char *) {}
#define R_DX_CALL(call) do {RB_LogPrint(#call "\n");call;}while(alwaysfails)
void RB_EndSurface();void RB_BeginSurface(const Material *,int,int);
void RB_SetVertex2D(int,float,float,float,float,unsigned);
void RB_ClearScreen(byte,const float *,float,byte);void Sleep(unsigned);
''' + source + r'''
struct r_global_permanent_t {byte prefix[0x1038];const Material *whiteMaterial;} rgp;
unsigned short indexStorage[0x100020];
HRESULT IDirect3DDevice9::SetTransform(int type,const D3DMATRIX *m) {
    int slot=type==256?0:type==2?1:2;assert(type==256||type==2||type==3);
    ::transforms.push_back({type,*m});++this->transforms[slot];alwaysfails=retry&&this->transforms[slot]==1;return -7;
}
HRESULT IDirect3DDevice9::BeginScene(){events.push_back("begin");++begins;alwaysfails=retry&&begins==1;return -7;}
HRESULT IDirect3DDevice9::EndScene(){events.push_back("end");++ends;alwaysfails=retry&&ends==1;return -7;}
HRESULT IDirect3DQuery9::Issue(int flags) {
    assert(this==&query&&(flags==1||flags==2));events.push_back(flags==2?"issue begin":"issue end");
    ++issues[flags];alwaysfails=retry&&issues[flags]==1;if(changeQuery)sunFlareState[0].sunQuery[0]=&otherQuery;return -7;
}
HRESULT IDirect3DQuery9::GetData(void *out,unsigned size,unsigned flags) {
    assert(this==&query&&size==4&&flags==1);events.push_back("get");
    if(gets++<pending)return S_FALSE;*(unsigned *)out=sampleValue;return terminalResult;
}
void Sleep(unsigned ms){assert(ms==0);++sleeps;events.push_back("sleep");}
void RB_ClearScreen(byte which,const float *color,float depth,byte stencil) {
    assert(which==2&&color==colorWhite&&depth==1&&stencil==0);++clearCalls;events.push_back("clear");
}
void RB_EndSurface() {
    ++endCalls;events.push_back("flush");tess.indexCount=tess.vertexCount=tess.optimizedIndexCount=0;
    if(route==0&&mutateFlush){backEnd.codeMatrixStackLevel=(backEnd.codeMatrixStackLevel+1)%3;backEnd.width=777;backEnd.height=555;dxState={1,333,222};renderer.current.integer=2;}
    flushBackend=backEnd;flushState=dxState;
}
void RB_BeginSurface(const Material *material,int type,int lightmap) {
    ++beginCalls;events.push_back("surface");tess.material=material;tess.techType=type;tess.lmapIndex=lightmap;tess.declType=0;tess.indexCount=tess.vertexCount=0;
    if(seedOptimized)tess.optimizedIndexCount=3;
}
void RB_SetVertex2D(int index,float x,float y,float s,float t,unsigned color){vertices.push_back({index,x,y,s,t,color});events.push_back("vertex");}
void reset() {
    memset(&backEnd,0x5a,sizeof(backEnd));memset(&tess,0,sizeof(tess));memset(&device,0,sizeof(device));memset(&query,0,sizeof(query));memset(&otherQuery,0,sizeof(otherQuery));memset(sunFlareState,0,sizeof(sunFlareState));
    backEnd.projection2D=1;backEnd.width=640;backEnd.height=480;backEnd.sceneViewport={17,23,333,199};backEnd.codeMatrixStackLevel=0;
    tess.indices=indexStorage+16;tess.material=&whiteMaterial;tess.techType=3;tess.lmapIndex=31;
    for(int i=0;i<32;++i)indexStorage[i]=0x5a5a;for(int i=0x100000;i<0x100020;++i)indexStorage[i]=0x5a5a;
    dxState={0,320,200};dx.device=&device;renderer.current.integer=1;rgp.whiteMaterial=&whiteMaterial;
    alwaysfails=endCalls=beginCalls=sleeps=clearCalls=retry=pending=terminalResult=route=0;
    mutateFlush=seedOptimized=changeQuery=false;sampleValue=1234;vertices.clear();transforms.clear();events.clear();
}
bool equal(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||fabs(a-b)<0.000002f;}
int main() {
    int matrixCases=0,overflowCases=0,quadCases=0,queryCases=0;
    for(int level=0;level<3;++level)for(int behavior:{0,1,2})for(int width:{0,1,320,1920})for(int mode:{1,2})for(int counts:{0,1,2})for(int mutate:{0,1})for(int repeat:{0,1}) {
        reset();route=0;retry=repeat;mutateFlush=mutate;backEnd.codeMatrixStackLevel=level;dxState={behavior,width,width?width/2+1:0};
        renderer.current.integer=mode;tess.indexCount=counts==1?6:0;tess.optimizedIndexCount=counts==2?3:0;
        expectedBackend=backEnd;State expectedState=dxState;RB_Set2D();
        if(counts){expectedBackend=flushBackend;expectedState=flushState;}
        expectedBackend.projection2D=1;int active=expectedBackend.codeMatrixStackLevel;
        int w=expectedState.viewportBehavior==1?expectedState.renderTargetWidth:expectedBackend.sceneViewport.width;
        int h=expectedState.viewportBehavior==1?expectedState.renderTargetHeight:expectedBackend.sceneViewport.height;
        D3DMATRIX projection={};float invW=1.0f/w;projection._11=invW+invW;projection._22=-2.0f/h;projection._41=-1.0f-invW;projection._42=1.0f+1.0f/h;projection._44=1;
        auto &m=expectedBackend.codeMatrixStack[active];m.projection.matrix[0]=projection;m.projection.valid[0]=1;for(int i=1;i<4;++i)m.projection.valid[i]=0;
        for(int i=0;i<4;++i){memcpy(&m.world.matrix[i],identityMatrix44,64);m.world.valid[i]=1;}
        m.view=m.world;m.worldView=m.world;m.viewProjection=m.projection;m.worldViewProjection=m.projection;m.normalizedWorld=m.world;m.normalizedWorldView=m.world;m.normalizedWorldViewProjection=m.world;
        const float constants[4][4]={{0,0,1,1},{0,0,1,0},{1,0,0,0},{0,1,0,0}};memcpy(expectedBackend.codeConsts[11],constants,64);
        for(int i=0;i<16;++i)assert(equal(((float *)&backEnd.codeMatrixStack[active].projection.matrix[0])[i],((float *)&projection)[i]));
        assert(!memcmp(&backEnd.codeMatrixStack[active].viewProjection.matrix[0],&backEnd.codeMatrixStack[active].projection.matrix[0],64));
        assert(!memcmp(&backEnd.codeMatrixStack[active].worldViewProjection.matrix[0],&backEnd.codeMatrixStack[active].projection.matrix[0],64));
        expectedBackend.codeMatrixStack[active].projection.matrix[0]=backEnd.codeMatrixStack[active].projection.matrix[0];
        expectedBackend.codeMatrixStack[active].viewProjection.matrix[0]=backEnd.codeMatrixStack[active].viewProjection.matrix[0];
        expectedBackend.codeMatrixStack[active].worldViewProjection.matrix[0]=backEnd.codeMatrixStack[active].worldViewProjection.matrix[0];
        assert(!memcmp(&backEnd,&expectedBackend,sizeof(backEnd))&&!memcmp(&dxState,&expectedState,sizeof(dxState)));
        assert(endCalls==(counts!=0));bool hardware=renderer.current.integer==2;assert(transforms.size()==unsigned(hardware?3*(1+repeat):0));
        for(unsigned i=0;i<transforms.size();++i){int slot=i/(1+repeat);assert(transforms[i].type==(slot==0?256:slot==1?2:3));for(int j=0;j<16;++j)assert(equal(((float *)&transforms[i].matrix)[j],slot==2?((float *)&projection)[j]:((const float *)identityMatrix44)[j]));}
        ++matrixCases;
    }
    for(int declaration:{0,1,2,3})for(int seeded:{0,1}) {
        reset();route=1;seedOptimized=seeded;tess.declType=declaration;tess.indexCount=6;
        RB_TessOverflow();assert(endCalls==1+(seeded&&declaration!=0)&&beginCalls==1&&tess.declType==declaration);++overflowCases;
    }
    for(int projection:{0,1})for(int material:{0,1})for(int technique:{3,7})for(int capacity:{0,1,2,3,4})for(int declaration:{0,1})for(unsigned color:{0U,0xffffffffU,0x12345678U}) {
        reset();route=1;backEnd.projection2D=projection;tess.material=material?&whiteMaterial:&otherMaterial;tess.techType=technique;tess.declType=declaration;
        tess.vertexCount=capacity==1?5446:capacity==2?5447:4;tess.indexCount=capacity==3?0xffffa:capacity==4?0xffffb:6;
        int initialV=tess.vertexCount,initialI=tess.indexCount;
        RB_DrawStretchPic(&whiteMaterial,3,4,16,-8,0.125f,0.25f,0.75f,0.875f,color);
        bool resetCounts=!projection||!material||technique!=3||capacity==2||capacity==4;int v=resetCounts?0:initialV,i=resetCounts?0:initialI;
        assert(vertices.size()==4&&tess.vertexCount==v+4&&tess.indexCount==i+6);
        int order[]={3,0,2,2,0,1};for(int j=0;j<6;++j)assert(tess.indices[i+j]==v+order[j]);
        assert(tess.indices[i-1]==0x5a5a&&tess.indices[i+6]==0x5a5a);
        float xy[4][2]={{3,4},{19,4},{19,-4},{3,-4}},uv[4][2]={{0.125f,0.25f},{0.75f,0.25f},{0.75f,0.875f},{0.125f,0.875f}};
        for(int j=0;j<4;++j)assert(vertices[j].index==v+j&&vertices[j].x==xy[j][0]&&vertices[j].y==xy[j][1]&&vertices[j].s==uv[j][0]&&vertices[j].t==uv[j][1]&&vertices[j].color==color);++quadCases;
    }
    reset();events.clear();assert(RB_CalcSunSpriteSamples()==0&&events.empty());++queryCases;
    for(int wait:{0,1,3})for(int status:{0,-1,2})for(int repeat:{0,1})for(int change:{0,1})for(unsigned value:{0U,1234U,0xffffffffU}) {
        reset();route=2;pending=wait;terminalResult=status;retry=repeat;changeQuery=change;sampleValue=value;sunFlareState[0].sunQuery[0]=&query;
        assert(RB_CalcSunSpriteSamples()==(status==0?(int)value:256));
        assert(query.gets==wait+1&&sleeps==wait&&query.issues[1]==1+repeat&&query.issues[2]==1+repeat&&device.begins==1+repeat&&device.ends==1+repeat);
        assert(clearCalls==1&&endCalls==1&&vertices.size()==4&&beginCalls==0&&otherQuery.gets==0);
        for(const auto &vertex:vertices)assert(vertex.color==0xffffffffU&&vertex.x>=0&&vertex.x<=16&&vertex.y>=0&&vertex.y<=16);
        std::vector<std::string> expected;for(int i=0;i<1+repeat;++i)expected.push_back("begin");expected.push_back("clear");for(int i=0;i<1+repeat;++i)expected.push_back("issue begin");for(int i=0;i<4;++i)expected.push_back("vertex");expected.push_back("flush");for(int i=0;i<1+repeat;++i)expected.push_back("issue end");for(int i=0;i<1+repeat;++i)expected.push_back("end");for(int i=0;i<wait;++i){expected.push_back("get");expected.push_back("sleep");}expected.push_back("get");assert(events==expected);++queryCases;
    }
    printf("PASS: %d matrix routes, %d overflows, %d quads and %d calibration queries; shared caches, bounds, D3D retries, captured query and fallback\n",matrixCases,overflowCases,quadCases,queryCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_surface_2d_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
