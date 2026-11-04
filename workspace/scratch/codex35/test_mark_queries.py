"""Execute the real mark surface walkers with a small world fixture."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_marks.cpp').read_text()
source = source[source.index('void R_AABBTreeSurfaces_r'):source.index('int R_MarkFragments')]
program = r'''
#include <cassert>
#include <limits>
#define __declspec(x)
struct Material { struct { unsigned gameFlags; } info; };
struct srfTriangles_t { float bounds[2][3]; };
struct GfxSurface { Material *material; srfTriangles_t *tris; };
struct GfxAabbTree {
    float mins[3], maxs[3]; int childCount, startSurfIndex, surfaceCount;
    GfxAabbTree *children;
};
struct GfxCullGroup { float mins[3], maxs[3]; int startSurfIndex, surfaceCount; };
struct GfxCell {
    struct { int markCount; } writable; int cullGroupCount; int *cullGroups;
    GfxAabbTree *aabbTree;
};
struct GfxWorld { GfxSurface *surfaces; GfxCullGroup *cullGroups; GfxCell *cells; };
struct { GfxWorld *world; } rgp;
struct { int markCount; } rg;
struct mnode_t {
    int cellIndex;
    union { struct { int *plane; mnode_t *children[2]; } node; } u;
};
int BoxOnPlaneSide(float *,float *,int *side) { return *side; }
''' + source + r'''
int main() {
    Material materials[2]={};materials[1].info.gameFlags=4;
    srfTriangles_t triangles[4]={};GfxSurface surfaces[4];
    for(int i=0;i<4;++i) {
        for(int j=0;j<3;++j) { triangles[i].bounds[0][j]=-1;triangles[i].bounds[1][j]=1; }
        surfaces[i].material=&materials[i==2];surfaces[i].tris=&triangles[i];
    }
    GfxAabbTree leaves[2]={};
    for(int i=0;i<2;++i) {
        for(int j=0;j<3;++j) { leaves[i].mins[j]=-1;leaves[i].maxs[j]=1; }
        leaves[i].startSurfIndex=2*i;leaves[i].surfaceCount=2;
    }
    GfxAabbTree root=leaves[0];root.childCount=2;root.children=leaves;
    GfxCullGroup groups[2]={};
    for(int i=0;i<2;++i) {
        for(int j=0;j<3;++j) { groups[i].mins[j]=-1;groups[i].maxs[j]=1; }
        groups[i].startSurfIndex=0;groups[i].surfaceCount=2;
    }
    int ids[2]={0,1};GfxCell cells[2]={};
    for(auto &cell:cells) { cell.cullGroupCount=2;cell.cullGroups=ids;cell.aabbTree=&leaves[1]; }
    GfxWorld world={surfaces,groups,cells};rgp.world=&world;rg.markCount=1;
    float mins[3]={-1,-1,-1}, maxs[3]={1,1,1};GfxSurface *out[6];
    for(int limit=0;limit<=4;++limit) {
        for(auto &p:out)p=nullptr;int count=0;
        R_AABBTreeSurfaces_r(&root,mins,maxs,out+1,limit,&count);
        assert(count==(limit<3 ? limit : 3));assert(out[0]==nullptr && out[count+1]==nullptr);
        if(count>0)assert(out[1]==surfaces);
        if(count>1)assert(out[2]==surfaces+1);
        if(count>2)assert(out[3]==surfaces+3);
    }
    int count=0;R_CellSurfaces(cells,mins,maxs,out,6,&count);
    assert(count==3 && out[0]==surfaces && out[1]==surfaces+1 && out[2]==surfaces+3);
    R_CellSurfaces(cells,mins,maxs,out,6,&count);assert(count==3);
    mnode_t nodes[3]={};nodes[0].cellIndex=-2;nodes[1].cellIndex=0;nodes[2].cellIndex=1;
    nodes[0].u.node.children[0]=nodes+1;nodes[0].u.node.children[1]=nodes+2;
    for(int side=1;side<=3;++side) {
        nodes[0].u.node.plane=&side;++rg.markCount;count=0;
        R_BoxSurfaces_r(nodes,mins,maxs,out,6,&count);
        assert(count==(side==3 ? 4 : 3));
    }
    nodes[1].cellIndex=-1;count=0;R_BoxSurfaces_r(nodes+1,mins,maxs,out,6,&count);assert(!count);
    mins[0]=2;count=0;R_AABBTreeSurfaces_r(&root,mins,maxs,out,6,&count);assert(!count);
    mins[0]=std::numeric_limits<float>::quiet_NaN();count=0;
    R_AABBTreeSurfaces_r(&root,mins,maxs,out,6,&count);assert(count==3);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_mark_queries_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-O2', '-std=c++11', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual mark world queries, recursion, capacities, duplicates, visit stamps, material flags and NaNs')
