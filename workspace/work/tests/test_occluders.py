"""Actual occluder source: culling, silhouette planes, limits and debug lines."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

packet = Path(__file__).resolve().parent.parent / 'src'
source = fragment('gfx_d3d/r_dpvs_occluders.cpp')
source = source[source.index('extern const dvar_t *r_showPortals;'):]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <stdexcept>
typedef unsigned char byte;typedef float vec3_t[3];typedef float vec4_t[4];
struct DpvsPlane { vec4_t coeffs;byte side[3];union {byte frontal;} u; };
struct GfxOccluderEdge { DpvsPlane *plane[2];vec3_t *vertex[2]; };
struct GfxOccluder { int planeCount;DpvsPlane *planes;int edgeCount;GfxOccluderEdge *edges;int vertexCount;vec3_t *vertices;int ignoreStackLevel,viewPlaneCount;DpvsPlane *viewPlanes; };
struct GfxCell { int occluderCount;GfxOccluder **occluders; };
struct ActiveOccluders { int count;GfxOccluder **list; };
extern ActiveOccluders activeOccluders;
struct trDebugLine_t { vec3_t start,end;vec4_t color;int depthTest; };
struct DebugGlobals { trDebugLine_t *lines;int lineCount,lineLimit; };
struct GfxBackEndData { DebugGlobals debugGlobals; };
struct dvar_t { struct { int integer; } current; };
dvar_t show={};const dvar_t *r_showPortals=&show;
GfxBackEndData data={};GfxBackEndData *frontEndDataOut=&data;
vec4_t dpvsViewOrg={0,0,2,1};const DpvsPlane *portalNearPlane=0;
vec4_t colorMagenta={1,0,1,1};
struct { void *(*Z_MallocInternal)(int); } ri;
const int ERR_DROP=1;
void R_Error(int,const char *message,...) { throw std::runtime_error(message); }
int FloatAsInt(float v) { int bits;std::memcpy(&bits,&v,4);return bits; }
void VectorCopy(const float *a,float *b) { b[0]=a[0];b[1]=a[1];b[2]=a[2]; }
void VectorCopy4(const float *a,float *b) { VectorCopy(a,b);b[3]=a[3]; }
void VectorSubtract(const float *a,const float *b,float *o) { o[0]=a[0]-b[0];o[1]=a[1]-b[1];o[2]=a[2]-b[2]; }
void Vec3Cross(const float *a,const float *b,float *o) { o[0]=a[1]*b[2]-a[2]*b[1];o[1]=a[2]*b[0]-a[0]*b[2];o[2]=a[0]*b[1]-a[1]*b[0]; }
float DotProduct(const float *a,const float *b) { return a[0]*b[0]+a[1]*b[1]+a[2]*b[2]; }
float DotProduct4(const float *a,const float *b) { return DotProduct(a,b)+a[3]*b[3]; }
float Vec3Normalize(float *v) { float n=std::sqrt(DotProduct(v,v));if(n!=0){v[0]/=n;v[1]/=n;v[2]/=n;}return n; }
'''
program += source
program += r'''
ActiveOccluders activeOccluders;
int allocations=0;
void *allocate(int n) {++allocations;return std::calloc(1,n);}
int main() {
    ri.Z_MallocInternal=allocate;
    DpvsPlane faces[2]={{{0,0,1,-1}},{{0,0,-1,-1}}};
    vec3_t vertices[2]={{-1,0,1},{1,0,1}};
    GfxOccluderEdge edge={{faces,faces+1},{vertices,vertices+1}};
    GfxOccluder occluder={2,faces,1,&edge,2,vertices};
    GfxOccluder *items[1025];for(int i=0;i<1025;++i)items[i]=&occluder;
    GfxCell cell={1,items};GfxOccluder *active[1024];DpvsPlane planes[6145]={};
    activeOccluders.list=active;activeOccluderPlanes.planes=planes;
    R_SetupOccludersForCell(&cell,0,0);
    assert(activeOccluders.count==1 && activeOccluders.list[0]==&occluder);
    assert(activeOccluderPlanes.count==2 && occluder.viewPlaneCount==2);
    assert(occluder.viewPlanes==planes && occluder.ignoreStackLevel==0x7fffffff);
    assert(faces[0].u.frontal==1 && faces[1].u.frontal==0 && planes[1].u.frontal==255);
    assert(std::fabs(DotProduct(planes[1].coeffs,planes[1].coeffs)-1)<0.00001f);
    for(int i=0;i<2;++i)assert(std::fabs(DotProduct(planes[1].coeffs,vertices[i])+planes[1].coeffs[3])<0.00001f);
    assert(std::fabs(DotProduct(planes[1].coeffs,dpvsViewOrg)+planes[1].coeffs[3])<0.00001f);
    DpvsPlane back={{0,0,-1,0}}, front={{0,0,1,0}},nan={{NAN,0,0,0}};
    assert(R_OccluderBehindPlane(&occluder,&back));
    assert(!R_OccluderBehindPlane(&occluder,&front));
    assert(R_IsOccluderOutsideView(&occluder,&back,1));
    assert(R_IsOccluderOutsideView(&occluder,&nan,1));
    portalNearPlane=&back;R_SetupOccludersForCell(&cell,0,0);assert(activeOccluders.count==0);
    portalNearPlane=0;show.current.integer=1;data.debugGlobals.lineLimit=1;
    R_SetupOccludersForCell(&cell,0,0);
    assert(allocations==1 && data.debugGlobals.lineCount==1);
    assert(data.debugGlobals.lines[0].color[0]==1 && data.debugGlobals.lines[0].color[1]==0 && data.debugGlobals.lines[0].depthTest==0);
    R_SetupOccludersForCell(&cell,0,0);assert(allocations==1 && data.debugGlobals.lineCount==1);
    std::free(data.debugGlobals.lines);data.debugGlobals.lines=0;show.current.integer=0;
    cell.occluderCount=1025;occluder.planeCount=occluder.edgeCount=0;
    bool rejected=false;
    try {R_SetupOccludersForCell(&cell,0,0);}catch(const std::runtime_error &e){rejected=std::strstr(e.what(),"brushes")!=0;}
    assert(rejected && activeOccluders.count==1024);
    cell.occluderCount=1;occluder.planeCount=6145;occluder.planes=planes;
    for(int i=0;i<6145;++i)planes[i]=front;
    rejected=false;
    try {R_SetupOccludersForCell(&cell,0,0);}catch(const std::runtime_error &e){rejected=std::strstr(e.what(),"faces")!=0;}
    assert(rejected && activeOccluderPlanes.count==6144);
    // Direction views produce an edge plane parallel to the view direction.
    dpvsViewOrg[0]=0;dpvsViewOrg[1]=0;dpvsViewOrg[2]=1;dpvsViewOrg[3]=0;
    DpvsPlane out={};R_CreateOccluderEdgePlane(vertices[0],vertices[1],&out);
    assert(std::fabs(DotProduct(out.coeffs,dpvsViewOrg))<0.00001f);
    float bounds[6]={-2,-3,-4,2,3,4};
    activeOccluders.count=0;
    assert(!R_IsBoundsOutsideViewNoStack(0,0,bounds));
    for(int axis=0;axis<3;++axis)for(int upper=0;upper<2;++upper) {
        DpvsPlane p={};p.side[0]=0;p.side[1]=4;p.side[2]=8;
        p.side[axis]=(axis+3*upper)*4;p.coeffs[axis]=1;
        float chosen=bounds[axis+3*upper];
        for(int bias=-1;bias<=1;++bias) {
            p.coeffs[3]=-chosen+bias;p.u.frontal=0;
            // PINNED1000641f: TEST AH,41h / JNP accepts less or equal, not NaN.
            assert(R_IsBoundsOutsideViewNoStack(&p,1,bounds)==(bias<=0));
            assert(p.u.frontal==255);
        }
        p.coeffs[axis]=NAN;
        assert(!R_IsBoundsOutsideViewNoStack(&p,1,bounds));
    }
    DpvsPlane view[2]={};
    for(int i=0;i<2;++i){view[i].side[0]=0;view[i].side[1]=4;view[i].side[2]=8;}
    occluder.viewPlanes=view;occluder.viewPlaneCount=2;
    occluder.ignoreStackLevel=-1;activeOccluders.count=1;active[0]=&occluder;
    assert(R_IsBoundsOutsideViewNoStack(0,0,bounds));
    assert(view[0].u.frontal==255 && view[1].u.frontal==255);
    view[1].coeffs[3]=1;assert(!R_IsBoundsOutsideViewNoStack(0,0,bounds));
    view[1].coeffs[3]=NAN;assert(R_IsBoundsOutsideViewNoStack(0,0,bounds));
    occluder.viewPlaneCount=0;assert(R_IsBoundsOutsideViewNoStack(0,0,bounds));
    occluder.viewPlaneCount=-1;assert(R_IsBoundsOutsideViewNoStack(0,0,bounds));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_occluders_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual occluder culling, silhouette planes, NaN, debug allocation and brush/face limits')
