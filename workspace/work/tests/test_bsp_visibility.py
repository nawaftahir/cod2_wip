"""Check actual BSP routing and AABB queries against the retail x87 predicates."""
from pathlib import Path
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1] / 'src/gfx_d3d'
dpvs = (root / 'r_dpvs.cpp').read_text()
dpvs = dpvs[dpvs.index('int R_FilterEntityIntoCells_r('):dpvs.index('// Brush entity bounds and cell routing.')]
marks = (root / 'r_marks.cpp').read_text()
marks = marks[marks.index('static __declspec(noinline) void R_CellSurfaces('):marks.index('\nvoid R_BoxSurfaces_r(')]
marks = marks.replace('__declspec(noinline) ', '')
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <vector>
typedef float vec_t;
typedef float vec3_t[3];
struct cplane_s { unsigned char type;float dist;int side; };
struct mnode_t { int cellIndex;union { struct { cplane_s *plane;mnode_t *children[2]; } node; } u; };
struct Material { struct { int gameFlags; } info; } material;
struct srfTriangles_t { float bounds[2][3]; } triangles;
struct GfxSurface { Material *material;srfTriangles_t *tris; } surface={&material,&triangles};
struct GfxCullGroup { float mins[3],maxs[3];int surfaceCount,startSurfIndex; } group;
struct GfxCell { struct { int markCount; } writable;int cullGroupCount,*cullGroups;void *aabbTree;int id; } cells[2];
struct World { GfxCell *cells;GfxCullGroup *cullGroups;GfxSurface *surfaces; } world={cells,&group,&surface};
struct { World *world; } rgp={&world};
struct { int markCount; } rg;
struct Link { int id;vec3_t mins,maxs; };
std::vector<Link> links;int treeCalls;
void VectorCopy(const float *in,float *out) { out[0]=in[0];out[1]=in[1];out[2]=in[2]; }
int BoxOnPlaneSide(float *,float *,cplane_s *plane) { return plane->side; }
void R_LinkEntityToCell(GfxCell *cell,int entity,const float *mins,const float *maxs) {
    assert(entity==7);Link link;link.id=cell->id;VectorCopy(mins,link.mins);
    VectorCopy(maxs,link.maxs);links.push_back(link);
}
void R_AddSurfaceToList(GfxSurface *surf,GfxSurface **out,int *count) { assert(surf==&surface);out[(*count)++]=surf; }
void R_AABBTreeSurfaces_r(void *tree,const float *,const float *,GfxSurface **,int,int *) {
    assert(!tree);++treeCalls;
}
'''+dpvs+marks+r'''
// Test oracle only: execute the anchor's x87 relation tests, not reconstructed code.
unsigned short relation(float a,float b) {
    unsigned short status;
    __asm__ volatile("flds %1; fcomps %2; fnstsw %%ax" : "=a"(status) : "m"(a),"m"(b) : "st");
    return status>>8;
}
int main() {
    const float values[]={-INFINITY,-1,-0.0f,0,1,INFINITY,NAN};
    for(float a:values)for(float b:values) {
        unsigned flags=relation(a,b);
        bool jnp=__builtin_parity(flags&5)!=0;
        assert(jnp==(a<b));assert(((flags&0x41)==0)==(a>b));
        assert(!jnp==!(a<b));
    }
    cells[0].id=0;cells[1].id=1;
    cplane_s plane={0,0,3};mnode_t front={},back={},root={};
    front.cellIndex=0;back.cellIndex=1;root.cellIndex=-2;
    root.u.node.plane=&plane;root.u.node.children[0]=&front;root.u.node.children[1]=&back;
    for(int axis=0;axis<3;++axis)for(float upper:values) {
        vec3_t mins={-1,-1,-1},maxs={1,1,1};maxs[axis]=upper;plane.type=axis;
        links.clear();int result=R_FilterEntityIntoCells_r(&root,7,mins,maxs);
        bool visitsFront=0<upper;assert(result==(visitsFront?-2:1));
        assert(links.size()==(visitsFront?2u:1u)&&links[0].id==1);
        assert(links[0].maxs[axis]==0);
        if(visitsFront)assert(links[1].id==0&&links[1].mins[axis]==0);
    }
    vec3_t mins={-1,-1,-1},maxs={1,1,1};
    for(int side=1;side<=2;++side) {
        plane.side=side;links.clear();assert(R_FilterEntityIntoCells_r(&root,7,mins,maxs)==side-1);
        assert(links.size()==1&&links[0].id==side-1);
    }
    plane.side=3;plane.type=3;links.clear();
    assert(R_FilterEntityIntoCells_r(&root,7,mins,maxs)==-2);
    assert(links.size()==2&&links[0].id==0&&links[1].id==1);
    front.cellIndex=1;links.clear();assert(R_FilterEntityIntoCells_r(&root,7,mins,maxs)==1);
    back.cellIndex=-1;links.clear();assert(R_FilterEntityIntoCells_r(&back,7,mins,maxs)==-1&&links.empty());
    int groupIndex=0;GfxCell cell={};cell.cullGroupCount=1;cell.cullGroups=&groupIndex;
    for(int nanSlot=-1;nanSlot<18;++nanSlot) {
        for(int axis=0;axis<3;++axis) {
            group.mins[axis]=triangles.bounds[0][axis]=mins[axis]=-1;
            group.maxs[axis]=triangles.bounds[1][axis]=maxs[axis]=1;
        }
        float *slots[]={group.mins,group.maxs,triangles.bounds[0],triangles.bounds[1],mins,maxs};
        if(nanSlot>=0)slots[nanSlot/3][nanSlot%3]=NAN;
        group.surfaceCount=1;group.startSurfIndex=0;material.info.gameFlags=0;
        GfxSurface *out[2]={nullptr,nullptr};int count=0;treeCalls=0;++rg.markCount;
        R_CellSurfaces(&cell,mins,maxs,out,1,&count);
        assert(count==1&&out[0]==&surface&&!out[1]&&treeCalls==1);
        R_CellSurfaces(&cell,mins,maxs,out,1,&count);assert(count==1&&treeCalls==1);
    }
    for(int axis=0;axis<3;++axis)for(int high=0;high<2;++high) {
        for(int i=0;i<3;++i) { group.mins[i]=triangles.bounds[0][i]=mins[i]=-1;
            group.maxs[i]=triangles.bounds[1][i]=maxs[i]=1; }
        if(high)mins[axis]=2;else maxs[axis]=-2;
        GfxSurface *out=nullptr;int count=0;treeCalls=0;++rg.markCount;
        R_CellSurfaces(&cell,mins,maxs,&out,1,&count);assert(!count&&!out&&treeCalls==1);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_bsp_visibility_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual BSP front/back routing, clamps, early exits, AABB NaNs/mark skips and 49 x87 relation pairs')
