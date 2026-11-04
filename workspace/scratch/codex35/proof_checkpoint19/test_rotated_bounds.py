"""Actual reused TransformBounds and its triangle/culling callers."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/universal/com_math.cpp').read_text()
start = source.index('void TransformBounds(')
end = source.index('\n}', start) + 2
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
#include <algorithm>
typedef float vec_t;
typedef float vec3_t[3];
typedef unsigned char byte;
int I_sel(int x,int y,int z) { return x>=0?y:z; }
int FloatAsInt(float v) {int bits;std::memcpy(&bits,&v,4);return bits;}
'''
program += source[start:end]
surfbounds = (packet / 'src/gfx_d3d/r_surfbounds.cpp').read_text()
program += r'''
struct DpvsPlane {};
struct GfxBrushModel {vec3_t bounds[2];};
struct GfxEntity {vec3_t origin,axis[3];};
struct GfxSceneEntity {struct {GfxBrushModel *bmodel;} u;};
struct GfxScene {struct {GfxEntity *entities;} def;GfxSceneEntity sceneEnts[2];} scene;
struct GfxDrawSurf {unsigned int sort;const int *surface;};
struct srfTriangles_t {int type;vec3_t bounds[2];};
struct TestWorld {void *nodes;};struct {TestWorld *world;} rgp;
static vec3_t surfBoundsGlob[2];
bool culled=false;int filterResult=-1,cullCalls=0,filterCalls=0,drawCalls=0;
bool R_IsBoundsOutsideViewNoStack(DpvsPlane *p,int n,const float *b) {
 assert(!p && n==0 && b[0]==16 && b[1]==18 && b[2]==22);++cullCalls;return culled;
}
int R_FilterEntityIntoCells_r(void *node,int index,const float *mins,const float *maxs) {
 assert(node==rgp.world->nodes && index==1 && mins[0]==16 && maxs[0]==30);++filterCalls;return filterResult;
}
void R_AddBModelSurfaces(GfxSceneEntity *ent,int index) {
 assert(ent==scene.sceneEnts+1 && index==1);++drawCalls;
}
void VectorCopy(const float *a,float *b) {std::memcpy(b,a,12);}
void VectorMA(const float *a,float s,const float *b,float *o) {
 for(int i=0;i<3;++i)o[i]=a[i]+s*b[i];
}
'''
program += surfbounds[surfbounds.index('static void R_TransformBoundsCorners'):surfbounds.index('const vec_t *R_BoundsForSurf_ModelInst(', surfbounds.index('static void R_TransformBoundsCorners'))]
program += r'''
int callbackIndex=-1,callbackCount=0;
const float *record(const GfxDrawSurf *,int index){callbackIndex=index;++callbackCount;return surfBoundsGlob[0];}
const float *(*R_BoundsForDrawSurfTable[8])(const GfxDrawSurf *,int)={0,0,0,record,record,record,R_BoundsForSurf_Triangles,0};
'''
program += surfbounds[surfbounds.index('const vec_t *R_BoundsForDrawSurf(const'):]
program += r'''
void check(vec3_t *b,const vec_t *o,vec3_t *a) {
 vec3_t got[2],want[2];TransformBounds(b,o,a,got);
 for(int i=0;i<3;++i) {
  want[0][i]=want[1][i]=o[i];
  for(int j=0;j<3;++j) {
   int side=std::signbit(a[j][i])?1:0;
   want[0][i]+=b[side][j]*a[j][i];want[1][i]+=b[1-side][j]*a[j][i];
  }
  for(int k=0;k<2;++k)assert(std::isnan(want[k][i])?std::isnan(got[k][i]):got[k][i]==want[k][i]);
 }
}
int main() {
 vec3_t bounds[2]={{-3,-5,-7},{11,13,17}},origin={19,23,29},axis[3];
 for(unsigned seed=0;seed<256;++seed) {
  unsigned state=seed+1;
  for(auto &row:axis)for(float &v:row){state=state*1664525u+1013904223u;v=(int((state>>16)%17)-8)*0.5f;}
  check(bounds,origin,axis);
  vec3_t got[2],want[2]={{INFINITY,INFINITY,INFINITY},{-INFINITY,-INFINITY,-INFINITY}};
  TransformBounds(bounds,origin,axis,got);
  for(int corner=0;corner<8;++corner)for(int i=0;i<3;++i) {
   float p=origin[i];for(int j=0;j<3;++j)p+=bounds[(corner>>j)&1][j]*axis[j][i];
   want[0][i]=std::min(want[0][i],p);want[1][i]=std::max(want[1][i],p);
  }
  for(int k=0;k<2;++k)for(int i=0;i<3;++i)assert(got[k][i]==want[k][i]);
 }
 unsigned patterns[]={0u,0x80000000u,0x7f800000u,0xff800000u,0x7fc12345u,0xffc12345u,0x3f800000u,0xbf800000u};
 for(unsigned bits:patterns)for(int j=0;j<3;++j)for(int i=0;i<3;++i) {
  for(auto &row:axis)for(float &v:row)v=0.5f;
  std::memcpy(&axis[j][i],&bits,4);check(bounds,origin,axis);
 }
 GfxEntity entities[2]={};scene.def.entities=entities;
 for(int i=0;i<3;++i){entities[1].origin[i]=origin[i];entities[1].axis[i][i]=1;}
 GfxBrushModel model;std::memcpy(model.bounds,bounds,sizeof(bounds));scene.sceneEnts[1].u.bmodel=&model;
 TestWorld world={};world.nodes=&world;rgp.world=&world;
 srfTriangles_t tri;std::memcpy(tri.bounds,bounds,sizeof(bounds));GfxDrawSurf draw={0,&tri.type};
 const float *unchanged=R_BoundsForSurf_Triangles(&draw,0x7fe);assert(unchanged==tri.bounds[0]);
 const float *transformed=R_BoundsForSurf_Triangles(&draw,1);assert(transformed==surfBoundsGlob[0]);
 for(int i=0;i<3;++i){assert(surfBoundsGlob[0][i]==bounds[0][i]+origin[i]);assert(surfBoundsGlob[1][i]==bounds[1][i]+origin[i]);}
 R_CullBrushEntity(1,0,0);assert(cullCalls==1 && filterCalls==1 && drawCalls==1);
 filterResult=0;R_CullBrushEntity(1,0,0);assert(filterCalls==2 && drawCalls==1);
 filterResult=-2;R_CullBrushEntity(1,0,0);assert(filterCalls==3 && drawCalls==1);
 culled=true;R_CullBrushEntity(1,0,0);assert(cullCalls==4 && filterCalls==3 && drawCalls==1);
 for(int type=0;type<8;++type)if(type!=6)for(unsigned int bits=0;bits<4096;bits+=17)for(int high=0;high<2;++high) {
  tri.type=type;draw.sort=high?(0x80000000u|(bits<<19)):(bits<<4);
  callbackCount=0;const float *result=R_BoundsForDrawSurf(&draw);
  if(type>=3 && type<=5) {
   unsigned int wanted=(draw.sort>>(high?19:4))&0xfff;
   assert(result==surfBoundsGlob[0] && callbackCount==1 && callbackIndex==(wanted>=0x800?0x7fe:int(wanted)));
  } else assert(!result && !callbackCount);
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_rotated_bounds_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-fno-strict-aliasing', '-ffp-contract=off',
                    '-Wall', '-Wextra', '-Werror', str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual bounds, 256 corner/scalar cases, signed NaNs/zero, culling dispatch and both packed-key formats')
