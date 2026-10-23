"""Actual optimized/ordinary submission and EndSurface gates, with live callbacks."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
source=(work/'src/gfx_d3d/rb_surface.cpp').read_text()
source=source[source.index('/* Read-only views'):]
args=(work/'src/gfx_d3d/rb_drawargs.h').read_text()
args=args[args.index('struct GfxDrawPrimArgs'):]
tess=(work/'src/gfx_d3d/rb_tess.h').read_text()
tess=tess[tess.index('struct Material;'):tess.index('#ifdef _MSC_VER')]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <string>
#include <vector>
typedef unsigned char byte;
struct IDirect3DVertexBuffer9 {int id;};
struct dvar_t {struct {int integer;} current;} renderer;
const dvar_t *r_rendererInUse=&renderer;
struct VertexState {int used,total;IDirect3DVertexBuffer9 *buffer;} vertexState,alternateState;
struct {VertexState *dynamicVertexBuffer;IDirect3DVertexBuffer9 *smodelCacheVb;} dx;
struct {struct {IDirect3DVertexBuffer9 *vb;int offset,stride;} streams[1];bool viewportIsNull;} dxState;
struct {bool viewportIsDirty;int resolvedPostSunTarget,resolvedSceneTarget;} backEnd;
''' + args + tess + r'''
GfxTess tess;
int RB_SetIndexData(const unsigned short *,int);
void RB_SetVertexData(unsigned,const void *,int,int);
void RB_ChangeStreamSource(int,IDirect3DVertexBuffer9 *,int,int);
void RB_DrawTechnique(int,const GfxDrawPrimArgs *);
void RB_UpdateViewport();void RB_LogPrint(const char *);
''' + source + r'''
struct r_global_permanent_t {byte beforeWorld[0x109c];const SurfaceWorldView *world;} rgp;
SurfaceTechniqueView technique,otherTechnique;
SurfaceTechniqueSetView techniqueSet;
SurfaceMaterialView material;
SurfaceWorldView world;
IDirect3DVertexBuffer9 worldBuffer,cacheBuffer,otherBuffer;
unsigned short primaryIndices[16],secondaryIndices[16];
std::vector<std::string> events;
struct Draw {int declaration;GfxDrawPrimArgs args;};std::vector<Draw> draws;
int vertexCount,strideAtUpload,usedAtUpload,bindCount,viewportCount,logCount;
bool mutateIndex,mutateVertex,mutateOptimizedDraw,swapTechnique,activeOptimized;
int RB_SetIndexData(const unsigned short *indices,int count) {
    activeOptimized=indices==secondaryIndices;
    assert(indices==(activeOptimized?secondaryIndices:primaryIndices));events.push_back(activeOptimized?"optimized indices":"indices");
    assert(count==(activeOptimized?tess.optimizedIndexCount:tess.indexCount));
    if(mutateIndex) {
        renderer.current.integer=renderer.current.integer==2?1:2;
        if(activeOptimized){tess.optimizedVertexSource=tess.optimizedVertexSource==1?2:1;tess.optimizedVertexCount+=3;tess.firstOptimizedVertex+=4;}
        else {tess.vertexCount=3;tess.declType=1;dx.dynamicVertexBuffer=&alternateState;}
    }
    return activeOptimized?59:47;
}
void RB_SetVertexData(unsigned stream,const void *data,int count,int stride) {
    assert(stream==0&&data==tess.vertexData);events.push_back("vertices");vertexCount=count;strideAtUpload=stride;usedAtUpload=dx.dynamicVertexBuffer->used;
    dx.dynamicVertexBuffer->used+=count*stride;
    if(mutateVertex){tess.declType=3;tess.indexCount=17;tess.vertexCount=9;}
}
void RB_ChangeStreamSource(int stream,IDirect3DVertexBuffer9 *buffer,int offset,int stride) {
    assert(stream==0&&offset==0);events.push_back("bind");++bindCount;dxState.streams[0]={buffer,offset,stride};
}
void RB_DrawTechnique(int declaration,const GfxDrawPrimArgs *args) {
    events.push_back("draw");draws.push_back({declaration,*args});
    if(activeOptimized&&mutateOptimizedDraw){tess.indexCount=6;tess.vertexCount=4;dxState.viewportIsNull=true;}
}
void RB_UpdateViewport() {
    ++viewportCount;events.push_back("viewport");backEnd.viewportIsDirty=false;
    if(swapTechnique)techniqueSet.techniques[tess.techType]=&otherTechnique;
}
void RB_LogPrint(const char *text) {assert(!strcmp(text,"---------- RB_EndSurface\n"));++logCount;events.push_back("log");}
void reset() {
    memset(&tess,0,sizeof(tess));memset(&dxState,0,sizeof(dxState));memset(&backEnd,0,sizeof(backEnd));
    technique.flags=0;otherTechnique.flags=3;for(auto &p:techniqueSet.techniques)p=&technique;
    material.techniqueSet=&techniqueSet;tess.material=(const Material *)&material;tess.techType=7;
    tess.indices=primaryIndices;tess.secondaryIndices=secondaryIndices;tess.indexCount=6;tess.vertexCount=4;
    tess.optimizedVertexSource=1;tess.optimizedIndexCount=9;tess.optimizedVertexCount=7;tess.firstOptimizedVertex=13;
    world.vertexBuffer=&worldBuffer;rgp.world=&world;dx.smodelCacheVb=&cacheBuffer;
    vertexState={7,10000,&otherBuffer};alternateState={11,10000,&otherBuffer};dx.dynamicVertexBuffer=&vertexState;
    renderer.current.integer=1;events.clear();draws.clear();
    vertexCount=strideAtUpload=usedAtUpload=bindCount=viewportCount=logCount=0;
    mutateIndex=mutateVertex=mutateOptimizedDraw=swapTechnique=false;
}
int main() {
    int ordinaryCases=0,optimizedCases=0,endCases=0;
    for(int mode:{1,2})for(int declaration:{0,1,2,3})for(int count:{0,4})for(int capacity:{-1,0,1})for(int mutation:{0,1}) {
        reset();renderer.current.integer=mode;tess.declType=declaration;tess.vertexCount=count;mutateIndex=mutateVertex=mutation;
        int stride=declaration==1?(mode==2?32:68):(mode==2?36:64),liveCount=mutation?3:count;
        VertexState *live=mutation?&alternateState:&vertexState;int start=live->used;
        live->total=start+liveCount*stride+capacity;
        RB_DrawTessSurface();
        assert(draws.size()==1&&draws[0].declaration==(mutation?3:declaration));
        const auto &a=draws[0].args;assert(a.firstVertexFromBase==0&&a.vertexCount==count&&a.primCount==2&&a.u.buf.baseVertex==0&&a.u.buf.baseIndex==47);
        assert(vertexCount==liveCount&&strideAtUpload==stride&&usedAtUpload==(capacity<0?0:start));
        assert(tess.indexCount==0&&tess.vertexCount==0&&tess.optimizedIndexCount==9&&tess.optimizedVertexSource==1);
        assert((events==std::vector<std::string>{"indices","vertices","draw"}));++ordinaryCases;
    }
    for(int mode:{1,2})for(int source:{0,1,2})for(int cache:{0,1,2,3})for(int mutation:{0,1}) {
        reset();renderer.current.integer=mode;tess.optimizedVertexSource=source;mutateIndex=mutation;
        int selected=mutation?(source==1?2:1):source,selectedMode=mutation?(mode==2?1:2):mode;
        auto *buffer=selected==1?&worldBuffer:&cacheBuffer;
        int stride=selected==1?(selectedMode==2?32:68):(selectedMode==2?24:64);
        dxState.streams[0]={cache==0?&otherBuffer:buffer,cache==2?4:0,stride+(cache==3)};
        RB_DrawOptimizedTessSurface();
        assert(bindCount==(cache!=1)&&dxState.streams[0].vb==buffer&&dxState.streams[0].offset==0&&dxState.streams[0].stride==stride);
        assert(draws.size()==1&&draws[0].declaration==(selected==1?1:3));const auto &a=draws[0].args;
        assert(a.firstVertexFromBase==0&&a.vertexCount==7&&a.primCount==3&&a.u.buf.baseVertex==13&&a.u.buf.baseIndex==59);
        assert(tess.optimizedIndexCount==0&&tess.optimizedVertexSource==0&&tess.indexCount==6&&tess.vertexCount==4);
        assert(tess.optimizedVertexCount==7+(mutation?3:0)&&tess.firstOptimizedVertex==13+(mutation?4:0));
        std::vector<std::string> expected={"optimized indices"};if(cache!=1)expected.push_back("bind");expected.push_back("draw");assert(events==expected);++optimizedCases;
    }
    for(int present:{0,1})for(int dirty:{0,1})for(int emptyViewport:{0,1})for(int flags=0;flags<4;++flags)
    for(int post:{0,14})for(int scene:{0,14})for(int optimized:{0,3})for(int ordinary:{0,6})for(int mutation:{0,1}) {
        reset();if(!present)techniqueSet.techniques[7]=0;technique.flags=flags;backEnd.viewportIsDirty=dirty;dxState.viewportIsNull=emptyViewport;
        backEnd.resolvedPostSunTarget=post;backEnd.resolvedSceneTarget=scene;tess.optimizedIndexCount=optimized;tess.indexCount=ordinary;
        swapTechnique=mutation;mutateOptimizedDraw=mutation;
        bool allowed=present&&!emptyViewport&&(!(flags&1)||post!=14)&&(!(flags&2)||scene!=14);
        bool drawOrdinary=allowed&&(ordinary||(optimized&&mutation));
        RB_EndSurface();
        assert(viewportCount==(present&&dirty)&&logCount==allowed);
        assert(draws.size()==unsigned((allowed&&optimized?1:0)+drawOrdinary));
        assert(tess.optimizedIndexCount==0&&tess.indexCount==0&&tess.vertexCount==(!allowed||drawOrdinary?0:4));
        assert(tess.optimizedVertexSource==(allowed&&optimized?0:1));
        std::vector<std::string> expected;if(present&&dirty)expected.push_back("viewport");
        if(allowed){if(optimized){expected.push_back("optimized indices");expected.push_back("bind");expected.push_back("draw");}if(drawOrdinary){expected.push_back("indices");expected.push_back("vertices");expected.push_back("draw");}expected.push_back("log");}
        assert(events==expected);++endCases;
    }
    printf("PASS: %d ordinary drivers, %d optimized drivers and %d EndSurface routes; exact args, capacity boundary, cache, captured technique and live callback state\n",ordinaryCases,optimizedCases,endCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_surface_drivers_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
