"""Exercise the real portal-plane draft with host matrix/device-independent data."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent.parent / 'src'
source = (packet / 'gfx_d3d/r_dpvs_clipplanes.cpp').read_text().replace('#include "gfx.h"', '')
dpvs = (packet / 'gfx_d3d/r_dpvs.cpp').read_text()
start = dpvs.index('void R_GetSidePlaneNormals(')
end = dpvs.index('// PINNED 10007ef0', start)
header = (packet / 'universal/com_math.h').read_text()
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <algorithm>
#define __forceinline inline
typedef unsigned char byte;
typedef float vec2_t[2]; typedef float vec3_t[3]; typedef float vec4_t[4];
struct DpvsPlane { float coeffs[4]; byte side[3]; union { byte frontal; } u; };
struct D3DMATRIX { float m[4][4]; };
struct dvar_t { union { float value; int integer; bool enabled; } current; };
enum DpvsClipChildren { DPVS_DONT_CLIP_CHILDREN, DPVS_CLIP_CHILDREN };
enum DpvsForceBevels { DPVS_DONT_FORCE_BEVELS, DPVS_FORCE_BEVELS };
struct trDebugLine_t { vec3_t start,end; vec4_t color; int depthTest; };
struct DebugGlobals { trDebugLine_t *lines; int lineCount,lineLimit; };
struct GfxBackEndData { DebugGlobals debugGlobals; };
GfxBackEndData backend = {}; GfxBackEndData *frontEndDataOut = &backend;
int allocations;
void *allocate(int size) { ++allocations; return std::malloc(size); }
struct { void *(*Z_MallocInternal)(int); } ri = {allocate};
dvar_t bevel = {}, only = {}, minimum = {}, show = {};
const dvar_t *r_portalBevels=&bevel, *r_portalBevelsOnly=&only;
const dvar_t *r_portalMinClipArea=&minimum, *r_showPortals=&show;
const DpvsPlane *portalNearPlane=0, *portalFarPlane=0;
vec4_t dpvsViewOrg = {0,0,2,1};
void Vec3Cross(const float *a,const float *b,float *out) {
    out[0]=a[1]*b[2]-a[2]*b[1]; out[1]=a[2]*b[0]-a[0]*b[2]; out[2]=a[0]*b[1]-a[1]*b[0];
}
float Vec3Normalize(float *v) {
    float n=std::sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
    if(n)for(int i=0;i<3;++i)v[i]/=n;
    return n;
}
'''
for name, result in (('VectorCopy','void'), ('VectorScale','void'), ('VectorSubtract','void'),
                     ('Vector2Copy','void'), ('Vector4Set','void'),
                     ('DotProduct','float'), ('FloatAsInt','int')):
    st = header.index('TU_STATIC '+result+' '+name+'(')
    en = header.index('\n}', st)+2
    program += header[st:en].replace('TU_STATIC','static inline')+'\n'
program += dpvs[start:end] + source
program += 'extern "C" {\n' + (packet / 'gfx_d3d/r_dpvs_winding.c').read_text() + '\n}\n'
program += r'''
int main() {
    D3DMATRIX matrix = {}; for(int i=0;i<4;++i)matrix.m[i][i]=1;
    portalViewProjectionMatrix=portalInverseViewProjectionMatrix=&matrix;
    vec3_t square[4]={{-0.5f,-0.5f,0},{0.5f,-0.5f,0},{0.5f,0.5f,0},{-0.5f,0.5f,0}};
    vec2_t mins,maxs; DpvsClipChildren clipping;
    minimum.current.value=0.1f;
    R_ProjectPortal(4,square,mins,maxs,&clipping);
    assert(mins[0]==-0.5f && mins[1]==-0.5f && maxs[0]==0.5f && maxs[1]==0.5f && clipping==1);
    minimum.current.value=0.3f;
    R_ProjectPortal(4,square,mins,maxs,&clipping); assert(clipping==0);
    matrix.m[3][3]=0.124f;
    R_ProjectPortal(4,square,mins,maxs,&clipping);
    assert(mins[0]==-1 && mins[1]==-1 && maxs[0]==1 && maxs[1]==1 && clipping==1);
    matrix.m[3][3]=NAN;
    R_ProjectPortal(4,square,mins,maxs,&clipping);
    assert(mins[0]==1 && mins[1]==1 && maxs[0]==-1 && maxs[1]==-1 && clipping==1);
    matrix.m[3][3]=1; minimum.current.value=NAN;
    R_ProjectPortal(4,square,mins,maxs,&clipping); assert(clipping==1);
    minimum.current.value=0;
    DpvsPlane planes[132] = {}, near={{0,0,1,3},{12,4,20},{255}}, far={{0,0,-1,20},{0,4,8},{255}};
    portalNearPlane=&near; portalFarPlane=&far;
    int count=R_PortalClipPlanes(planes,4,square,&clipping);
    assert(count==6 && clipping==1);
    assert(planes[4].coeffs[3]==0 && !std::memcmp(&planes[5],&far,sizeof(far)));
    for(int i=0;i<4;++i)assert(planes[i].u.frontal==255 && planes[i].coeffs[3]>0);
    // Compare the actual convex search against a full scan for all cyclic starts.
    for(int rotation=0;rotation<4;++rotation)for(int direction=0;direction<16;++direction) {
        vec3_t rotated[4];for(int i=0;i<4;++i)std::memcpy(rotated[i],square[(i+rotation)%4],sizeof(vec3_t));
        DpvsPlane plane={{std::cos(direction*0.3f),std::sin(direction*0.3f),0,0.5f},{}};
        float expected=1e20f;for(int i=0;i<4;++i)expected=std::min(expected,DotProduct(plane.coeffs,rotated[i])+plane.coeffs[3]);
        assert(std::fabs(R_NearestPointOnWinding(rotated,4,plane.coeffs)-expected)<0.000001f);
    }
    // Larger convex windings exercise every position in the compiler's unrolled search.
    for(int vertices=3;vertices<=128;++vertices)for(int reverse=0;reverse<2;++reverse) {
        vec3_t polygon[128];
        for(int i=0;i<vertices;++i) {
            float angle=(reverse?-1.0f:1.0f)*(i+0.37f)*6.28318530718f/vertices;
            polygon[i][0]=2*std::cos(angle)+0.25f;
            polygon[i][1]=0.75f*std::sin(angle)-0.5f;
            polygon[i][2]=polygon[i][0]*0.3f-polygon[i][1]*0.2f;
        }
        for(int direction=0;direction<16;++direction) {
            DpvsPlane plane={{std::cos(direction*0.43f),std::sin(direction*0.43f),0.7f,0.5f},{}};
            float expected=1e20f;
            for(int i=0;i<vertices;++i)expected=std::min(expected,DotProduct(plane.coeffs,polygon[i])+plane.coeffs[3]);
            assert(std::fabs(R_NearestPointOnWinding(polygon,vertices,plane.coeffs)-expected)<0.00001f);
        }
    }
    vec3_t normals[4];R_GetSidePlaneNormals(square,4,normals);
    trDebugLine_t lines[4] = {};backend.debugGlobals={lines,0,4};
    show.current.integer=1;bevel.current.value=0.7f;
    count=R_AddBevelPlanes(planes,4,normals,mins,maxs,DPVS_FORCE_BEVELS);
    assert(count==4 && backend.debugGlobals.lineCount==4 && !allocations);
    for(int i=0;i<4;++i)assert(lines[i].color[0]==0 && lines[i].color[1]==0.75f && lines[i].color[2]==0.75f && lines[i].color[3]==1 && !lines[i].depthTest);
    R_AddBevelPlanes(planes,4,normals,mins,maxs,DPVS_FORCE_BEVELS);
    assert(backend.debugGlobals.lineCount==4);
    backend.debugGlobals={0,0,4};show.current.integer=2;
    count=R_AddBevelPlanes(planes,4,normals,mins,maxs,DPVS_DONT_FORCE_BEVELS);
    assert(count==0 && backend.debugGlobals.lineCount==4 && allocations==1);
    for(int i=0;i<4;++i)assert(backend.debugGlobals.lines[i].color[1]==0.5f);
    std::free(backend.debugGlobals.lines);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_portal_planes_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual projection, small/near/NaN cases, nearest-plane scan, plane copies and debug-line capacity')
