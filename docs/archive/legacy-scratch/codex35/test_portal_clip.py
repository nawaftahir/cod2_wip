"""Exercise actual clipping leaf, ping-pong buffers and portal caller."""
from pathlib import Path
import subprocess
import tempfile

packet=Path(__file__).resolve().parent
source=(packet/'src/gfx_d3d/r_dpvs.cpp').read_text()
start=source.index('static const vec3_t *R_ChopPortalWinding')
end=source.index('// PINNED 10007dc0/',start)
math=(packet/'src/universal/com_math.h').read_text()
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#define __declspec(x)
typedef unsigned char byte;
typedef float vec3_t[3];
typedef float vec4_t[4];
struct DpvsPlane { float coeffs[4];byte side[3];union { byte frontal; } u; };
struct GfxViewParms { vec3_t origin; vec3_t axis[3]; };
DpvsPlane portalViewPlane; float dpvsViewOrg[4]; float farDistance;
float R_GetFarPlaneDist() { return farDistance; }
struct GfxPortal { byte vertexCount;vec3_t *vertices; };
int appended;
void R_AddVertToPortalHullPoints(GfxPortal *,const float *v) { assert(v[0]>=0);++appended; }
'''
for name, result in (('DotProduct','float'),('DotProduct4','float'),('VectorCopy','void'),('VectorNegate','void'),('FloatAsInt','int')):
    st=math.index('TU_STATIC '+result+' '+name+'(')
    en=math.index('\n}',st)+2
    program+=math[st:en].replace('TU_STATIC','static')+'\n'
program+=source[start:end]
program+=r'''
int main() {
    GfxViewParms view={{2,3,4},{{-1,0,0},{0,1,0},{0,0,1}}};
    farDistance=100; R_SetupDpvsForPoint(&view);
    assert(dpvsViewOrg[3]==1 && portalNearPlane==&portalViewPlane && portalFarPlane==&portalFogPlane);
    assert(std::fabs(portalViewPlane.coeffs[3]-2.1f)<0.00001f && portalFogPlane.coeffs[3]==98);
    assert(portalViewPlane.side[0]==0 && portalFogPlane.side[0]==12 && portalFogPlane.u.frontal==255);
    farDistance=NAN; R_SetupDpvsForPoint(&view);
    assert(portalFarPlane==&portalFogPlane && std::isnan(portalFogPlane.coeffs[3]));
    farDistance=0; R_SetupDpvsForPoint(&view); assert(!portalFarPlane);
    R_SetupDpvsForDir(&view);
    assert(!portalNearPlane && !portalFarPlane && dpvsViewOrg[0]==1 && !dpvsViewOrg[3]);
    assert(portalViewPlane.coeffs[3]==262145);
    vec3_t square[4]={{-1,-1,0},{1,-1,0},{1,1,0},{-1,1,0}},out[129];
    DpvsPlane x={{1,0,0,0},{}},far={{0,1,0,0},{}},all={{0,0,1,2},{}};
    int count=4;const vec3_t *w=R_ChopPortalWinding(square,&count,&x,out);
    assert(w==out && count==4);
    for(int i=0;i<count;++i) assert(out[i][0]>=0 && out[i][0]<=1 && std::fabs(out[i][2])<0.00001f);
    assert(std::fabs(out[0][0]-0.001f)<0.00001f);
    count=4;memset(out,0xa5,sizeof(out));w=R_ChopPortalWinding(square,&count,&all,out);
    assert(w==square && count==4);
    for(unsigned char c:reinterpret_cast<unsigned char (&)[sizeof(out)]>(out))assert(c==0xa5);
    vec3_t border[3]={{0,0,0},{0,1,0},{0,0,1}};
    count=3;assert(!R_ChopPortalWinding(border,&count,&x,out) && count==0);
    GfxPortal portal={4,square};vec3_t buffers[2][128];const vec3_t *final=0;
    portalFarPlane=&far;
    count=R_ChopPortal(&portal,&x,&all,1,buffers,&final);
    assert(count==4 && final==buffers[1]);
    for(int i=0;i<count;++i) assert(final[i][0]>=0 && final[i][1]>=0);
    assert(R_ChopPortal(&portal,&x,&all,1,buffers,0)==4);
    assert(R_ChopPortalAndAddHullPoints(&portal,&x,&all,1) && appended==4);
    portal.vertices=border;portal.vertexCount=3;appended=0;
    assert(!R_ChopPortalAndAddHullPoints(&portal,&x,&all,1) && !appended);
    count=0;assert(!R_ChopPortalWinding(square,&count,&x,out));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_portal_clip_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual portal clipping, epsilon boundary, empty/all-front, far-plane buffers and append dispatch')
