"""Exercise the actual connected portal clipping/culling/traversal source."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_dpvs.cpp').read_text()
start = source.index('static const vec3_t *R_ChopPortalWinding')
end = source.index('\nvoid R_PortalQueuePush', start)
math = (packet / 'src/universal/com_math.h').read_text()
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#define __declspec(x)
typedef unsigned char byte;
typedef float vec3_t[3];
typedef float vec4_t[4];
struct DpvsPlane { float coeffs[4]; byte side[3]; union { byte frontal; } u; };
struct GfxViewParms { vec3_t origin; vec3_t axis[3]; };
DpvsPlane portalViewPlane;
float R_GetFarPlaneDist() { return 0; }
struct GfxCell;
struct GfxPortalWritable { byte isQueued, isAncestor; };
struct GfxPortal {
    GfxPortalWritable writable;
    DpvsPlane plane;
    GfxCell *cell;
    vec3_t *vertices;
    byte vertexCount;
};
struct GfxCell { int portalCount; GfxPortal *portals; };
struct GfxOccluder { int viewPlaneCount; DpvsPlane *viewPlanes; };
float dpvsViewOrg[4];
void R_AddVertToPortalHullPoints(GfxPortal *, const float *) {}
'''
for name, result in (('DotProduct','float'),('DotProduct4','float'),('VectorCopy','void'),('VectorNegate','void'),('FloatAsInt','int')):
    st = math.index('TU_STATIC ' + result + ' ' + name + '(')
    en = math.index('\n}', st) + 2
    program += math[st:en].replace('TU_STATIC', 'static') + '\n'
program += source[start:end]
program += r'''
int main() {
    vec3_t square[4] = {{-1,-1,0},{1,-1,0},{1,1,0},{-1,1,0}};
    DpvsPlane front = {{0,0,1,1},{}}, back = {{0,0,1,-1},{}};
    GfxCell a = {}, b = {};
    GfxPortal ab = {{}, {}, &b, square, 4}, ba = {{}, {}, &a, square, 4};
    a.portalCount = b.portalCount = 1; a.portals = &ab; b.portals = &ba;
    const GfxCell *list[4] = {&a}; vec3_t buffers[2][128];
    assert(R_GetFurtherCellList_r(&a,&front,&front,1,buffers,list,1) == 2);
    assert(list[0] == &a && list[1] == &b);
    assert(R_GetFurtherCellList_r(&b,&front,&front,1,buffers,list,2) == 2);
    ab.writable.isAncestor = 1;
    assert(R_GetFurtherCellList_r(&a,&front,&front,1,buffers,list,1) == 1);
    ab.writable.isAncestor = 0;
    dpvsViewOrg[3] = 1; ab.plane.coeffs[3] = 1;
    assert(R_GetFurtherCellList_r(&a,&front,&front,1,buffers,list,1) == 1);
    ab.plane.coeffs[3] = 0;
    assert(R_GetFurtherCellList_r(&a,&front,&back,1,buffers,list,1) == 1);
    assert(R_GetFurtherCellList_r(&a,&back,&front,1,buffers,list,1) == 1);
    assert(!R_PortalBehindAnyPlane(&ab,0,0));
    assert(R_PortalBehindAllPlanes(&ab,0,0));
    assert(R_PortalBehindAnyPlane(&ab,&back,1));
    assert(!R_PortalBehindAllPlanes(&ab,&front,1));
    GfxOccluder occluder = {1,&back}; GfxOccluder *occluders[1] = {&occluder};
    activeOccluders.count = 1; activeOccluders.list = occluders;
    assert(R_IsPortalOccluded(&ab));
    assert(R_GetFurtherCellList_r(&a,&front,&front,1,buffers,list,1) == 1);
    occluder.viewPlanes = &front;
    assert(!R_IsPortalOccluded(&ab));
    assert(R_GetFurtherCellList_r(&a,&front,&front,1,buffers,list,1) == 2);
    ab.vertexCount = 0;
    assert(R_PortalBehindAnyPlane(&ab,&front,1));
    ab.vertexCount = 4;
    DpvsPlane unordered = {{NAN,0,0,0},{}};
    assert(R_PortalBehindAnyPlane(&ab,&unordered,1));
    assert(R_PortalBehindAllPlanes(&ab,&unordered,1));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_portal_traversal_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual portal traversal, cycle suppression, ancestor/view/plane/occluder culling and NaN planes')
