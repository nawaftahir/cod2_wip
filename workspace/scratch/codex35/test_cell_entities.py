"""Actual cell-link, BSP filtering and brush draw source against small fixtures."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
dpvs = (packet / 'src/gfx_d3d/r_dpvs.cpp').read_text()
scene = (packet / 'src/gfx_d3d/r_scene.cpp').read_text()
program = r'''
#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <stdexcept>
typedef float vec_t;typedef float vec3_t[3];typedef unsigned char byte;
typedef int surfaceType_t;
struct cplane_t {vec3_t normal;float dist;byte type;};
struct mnode_t {int cellIndex;struct {struct {cplane_t *plane;mnode_t *children[2];} node;} u;};
struct GfxSceneModelCellRef {int entIndex;vec3_t mins,maxs;intptr_t next;};
struct DpvsScene {GfxSceneModelCellRef modelRefs[4096];int modelRefCount;};
struct GfxCell {GfxSceneModelCellRef *modelRefs;};
struct Material {struct {unsigned short sortedIndex;} info;};
struct GfxSurface {const Material *material;unsigned short lightmapIndex;surfaceType_t *data;};
struct GfxBrushModel {vec3_t bounds[2];int surfaceCount,startSurfIndex;};
struct GfxSceneEntity {struct {const GfxBrushModel *bmodel;} u;int cullState;};
struct GfxWorld {GfxCell *cells;GfxSurface *surfaces;};
struct {GfxWorld *world;} rgp;
struct GfxDrawSurf {unsigned int sort;const surfaceType_t *surface;};
struct GfxBackEndData {int drawSurfCount;GfxDrawSurf drawSurfs[65536];};
struct GfxScene {int drawSurfCount;};
struct dvar_t {struct {bool enabled;} current;};
GfxBackEndData backend={};GfxBackEndData *frontEndDataOut=&backend;
GfxScene scene;dvar_t sortDvar={},brushDvar={};
const dvar_t *fx_sort=&sortDvar,*r_drawBModels=&brushDvar;
DpvsScene dpvsScene;
const int ERR_DROP=1;
void R_Error(int,const char *,...) {throw std::runtime_error("limit");}
int warnings=0;
void warn(int level,const char *message,...) {
    assert(level==1 && !std::strcmp(message,"^1Max xmodel refs (%i) exceeded\n"));++warnings;
}
struct {void (*Printf)(int,const char *,...);} ri={warn};
void VectorCopy(const float *in,float *out){std::memcpy(out,in,12);}
void ExpandBounds(const float *mins,const float *maxs,float *a,float *b) {
    for(int i=0;i<3;++i){if(mins[i]<a[i])a[i]=mins[i];if(maxs[i]>b[i])b[i]=maxs[i];}
}
int BoxOnPlaneSide(float *mins,float *maxs,cplane_t *p) {
    if(p->type<3){if(p->dist<=mins[p->type])return 1;if(p->dist>=maxs[p->type])return 2;return 3;}
    float lo=0,hi=0;for(int i=0;i<3;++i){lo+=p->normal[i]*(p->normal[i]<0?maxs[i]:mins[i]);hi+=p->normal[i]*(p->normal[i]<0?mins[i]:maxs[i]);}
    return (hi>=p->dist?1:0)|(lo<p->dist?2:0);
}
'''
program += dpvs[dpvs.index('static void R_LinkEntityToCell'):dpvs.index('// PINNED: free-list')]
program += scene[scene.index('static void R_AddDrawSurf'):scene.index('void R_ClearDpvsScene();')]
program += r'''
int main() {
    GfxCell cells[2]={};GfxWorld world={cells,0};rgp.world=&world;
    vec3_t mins={-2,-3,-4},maxs={2,3,4};
    R_LinkEntityToCell(cells,17,mins,maxs);
    assert(dpvsScene.modelRefCount==1 && cells[0].modelRefs->entIndex==17);
    assert(!cells[0].modelRefs->next);
    mins[0]=-8;maxs[2]=10;R_LinkEntityToCell(cells,17,mins,maxs);
    assert(dpvsScene.modelRefCount==1 && cells[0].modelRefs->mins[0]==-8 && cells[0].modelRefs->maxs[2]==10);
    R_LinkEntityToCell(cells,18,mins,maxs);
    assert(dpvsScene.modelRefCount==2 && cells[0].modelRefs->entIndex==18);
    assert((GfxSceneModelCellRef *)cells[0].modelRefs->next==dpvsScene.modelRefs);
    dpvsScene.modelRefCount=4096;
    R_LinkEntityToCell(cells,17,mins,maxs);
    assert(warnings==1 && dpvsScene.modelRefCount==4096 && cells[0].modelRefs->entIndex==18);
    dpvsScene.modelRefCount=0;cells[0].modelRefs=cells[1].modelRefs=0;
    mnode_t front={},back={},root={};front.cellIndex=0;back.cellIndex=1;root.cellIndex=-2;
    cplane_t p={{1,0,0},0,0};root.u.node.plane=&p;
    root.u.node.children[0]=&front;root.u.node.children[1]=&back;
    assert(R_FilterEntityIntoCells_r(&root,9,mins,maxs)==-2);
    assert(dpvsScene.modelRefCount==2 && cells[0].modelRefs->mins[0]==0 && cells[1].modelRefs->maxs[0]==0);
    front.cellIndex=back.cellIndex=-1;
    assert(R_FilterEntityIntoCells_r(&root,9,mins,maxs)==-1);
    mins[0]=1;assert(R_FilterEntityIntoCells_r(&root,9,mins,maxs)==-1);
    mins[0]=-2;p.type=3;p.normal[1]=1;
    assert(R_FilterEntityIntoCells_r(&root,9,mins,maxs)==-1);
    surfaceType_t kinds[3]={1,2,3};Material materials[3]={{{2}},{{32767}},{{7}}};
    GfxSurface surfaces[3];for(int i=0;i<3;++i)surfaces[i]={materials+i,(unsigned short)(i+5),kinds+i};
    world.surfaces=surfaces;GfxBrushModel model={};model.surfaceCount=3;
    GfxSceneEntity entity={{&model},0};
    R_AddBModelSurfaces(&entity,17);assert(entity.cullState==5 && backend.drawSurfCount==0);
    brushDvar.current.enabled=true;
    for(int sorted=0;sorted<2;++sorted)for(int ent=0;ent<8192;ent+=257) {
        sortDvar.current.enabled=sorted;backend.drawSurfCount=0;scene.drawSurfCount=0;
        R_AddBModelSurfaces(&entity,ent);
        assert(backend.drawSurfCount==3 && scene.drawSurfCount==3);
        for(int i=0;i<3;++i) {
            unsigned int key;
            if(sorted && kinds[i]==2) key=0x80000002u+((unsigned int)ent<<19)
                +((unsigned int)materials[i].info.sortedIndex<<9)+((unsigned int)surfaces[i].lightmapIndex<<4);
            else key=kinds[i]+((unsigned int)ent<<4)
                +((unsigned int)materials[i].info.sortedIndex<<21)+((unsigned int)surfaces[i].lightmapIndex<<16);
            assert(backend.drawSurfs[i].sort==key && backend.drawSurfs[i].surface==kinds+i);
        }
    }
    backend.drawSurfCount=65535;scene.drawSurfCount=0;R_AddBModelSurfaces(&entity,2);
    assert(backend.drawSurfCount==65536 && scene.drawSurfCount==1);
    R_AddBModelSurfaces(&entity,2);assert(backend.drawSurfCount==65536);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_cell_entities_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual cell linking, BSP splits, limit warning and brush draw-key/queue behavior')
