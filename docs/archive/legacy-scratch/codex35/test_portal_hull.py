"""Exercise the actual portal-point routine with a controlled growth callee."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parent / 'src/gfx_d3d/r_dpvs.cpp').read_text()
start = source.index('union GfxHullPointsPool')
end = source.index('// PINNED caller 0x10009770', start)
program = r'''
#include <cassert>
#include <cstring>
typedef unsigned char byte;
typedef float vec2_t[2];
const int ERR_DROP=1;
struct GfxPortal { byte hullPointCount;vec2_t *hullPoints;float hullAxis[2][3]; };
void R_Error(int code,const char *,...) { assert(code==ERR_DROP);throw code; }
'''
program += source[start:end]
program += r'''
int growthCalls;
int Com_ConvexHull(vec2_t *,int count,vec2_t *hull) {
    assert(count==64);++growthCalls;
    for(int i=0;i<3;++i) { hull[i][0]=(float)i;hull[i][1]=(float)(10+i); }
    return 3;
}
int main() {
    GfxHullPointsPool pool[2];pool[0].nextFree=pool+1;pool[1].nextFree=0;
    nextFreeHullPoints=pool;
    GfxPortal p={0,0,{{1,2,3},{4,5,6}}};float v[3]={2,3,5};
    R_AddVertToPortalHullPoints(&p,v);
    assert(nextFreeHullPoints==pool+1 && p.hullPoints==pool[0].points && p.hullPointCount==1);
    assert(p.hullPoints[0][0]==23 && p.hullPoints[0][1]==53);
    R_AddVertToPortalHullPoints(&p,v);assert(p.hullPointCount==2 && !growthCalls);
    p.hullPointCount=64;R_AddVertToPortalHullPoints(&p,v);
    assert(growthCalls==1 && p.hullPointCount==4 && p.hullPoints[3][0]==23);
    for(int i=0;i<3;++i) assert(p.hullPoints[i][0]==i && p.hullPoints[i][1]==10+i);
    p.hullPointCount=0;p.hullPoints=0;nextFreeHullPoints=0;
    try { R_AddVertToPortalHullPoints(&p,v);assert(false); } catch(int e) { assert(e==ERR_DROP); }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_portal_hull_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-O2','-x','c++','-','-o',binary], input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual portal point routine; pool exhaustion, projection, growth dispatch and copy')
