"""Retail surface sort and BSP camera-cell traversal from the real source."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
a=(w/'src/gfx_d3d/r_scene.cpp').read_text();b=(w/'src/gfx_d3d/r_dpvs.cpp').read_text()
source=a[a.index('// PINNED 10024460/70:'):a.index('// Scene rendering modes;')]+b[b.index('// PINNED 10007d60/93:'):b.index('// PINNED 1000a840/129:')]
program=r'''
#include <cassert>
#include <vector>
#include <algorithm>
#include <limits>
#include <cstring>
#include <cstdio>
typedef float vec_t;
struct GfxDrawSurf { unsigned int sort,surface; };
struct cplane_t { float normal[3],dist; };
struct mnode_t { int contents,parent,cellIndex; struct { struct { cplane_t *plane;mnode_t *children[2]; }node; }u; };
struct World { mnode_t *nodes; }world;
struct { World *world; }rgp;
const int ERR_DROP=1;
int errors;
void R_Error(int level,const char *text){assert(level==ERR_DROP&&!strcmp(text,"\x15R_CellForCamera: bad model"));++errors;rgp.world=&world;}
'''+source+r'''
unsigned int seed=31;
unsigned int next(){seed=seed*1664525u+1013904223u;return seed;}
int main(){
    int count=0;
    for(int n: {-7,0,1,2,7,8,9,63,64,65,127,1024,8192})for(int mode=0;mode<6;++mode){
        int size=n>0?n:0;std::vector<GfxDrawSurf> v(size+2);v.front()={0xdeadbeefu,0x11223344u};v.back()={0xcafebabeu,0x55667788u};
        for(int i=0;i<size;++i){unsigned key=mode==0?i:mode==1?size-i:mode==2?9:mode==3?next()%7:mode==4?next():((i&1)?0xffffffffu:0);v[i+1]={key,(unsigned)i};}
        std::vector<GfxDrawSurf> before=v;
        qsortDrawSurfs(v.data()+1,n);
        assert(!memcmp(v.data(),before.data(),sizeof(GfxDrawSurf))&&!memcmp(&v.back(),&before.back(),sizeof(GfxDrawSurf)));
        for(int i=0;i<size;++i){const GfxDrawSurf &p=v[i+1];assert(p.surface<(unsigned)size);assert(before[p.surface+1].sort==p.sort);if(i)assert(v[i].sort<=p.sort);}
        std::vector<unsigned> payload;for(int i=0;i<size;++i)payload.push_back(v[i+1].surface);std::sort(payload.begin(),payload.end());for(int i=0;i<size;++i)assert(payload[i]==(unsigned)i);
        ++count;
    }
    mnode_t root={},left={},right={};cplane_t plane={{1,0,0},0};root.contents=-1;root.u.node.plane=&plane;root.u.node.children[0]=&left;root.u.node.children[1]=&right;left.contents=0;right.contents=99;left.cellIndex=17;right.cellIndex=-4;world.nodes=&root;
    for(float x: {-1.0f,0.0f,1.0f,std::numeric_limits<float>::quiet_NaN(),std::numeric_limits<float>::infinity()}){float p[]={x,0,0};rgp.world=&world;assert(R_CellForPoint(p)==(x>0?17:-4));++count;}
    float p[]={1,0,0};rgp.world=0;assert(R_CellForPoint(p)==17&&errors==1);++count;
    plane.normal[0]=1;plane.normal[1]=1;plane.normal[2]=1;
    float cancellation[]={1.0f,1.0e20f,-1.0e20f};assert(R_CellForPoint(cancellation)==17);++count;
    world.nodes=&right;assert(R_CellForPoint(p)==-4);++count;
    printf("PASS: %d sort/cell cases, payload preservation, guards, boundary/NaN and callback reload\n",count);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_scene_sort_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
