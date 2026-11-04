"""Check actual model bounds against independent transformed vertex extrema."""
from pathlib import Path
import re
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_staticmodel_load_obj.cpp').read_text()
match = re.search(r'void R_StaticModelBounds\([^;{}]*\)\s*\{', text)
assert match
source = text[match.start():text.index('\n}', match.end()) + 2]
program = r'''
#include <cassert>
#include <cfloat>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <limits>
#include <vector>
#include <algorithm>
typedef float vec3_t[3];
struct DObjSkelMat {float value[16];};
struct DObjAnimMat {float value[8];};
struct XSurface {short vertCount;std::vector<float> points;};
struct XModel {std::vector<XSurface*> surfaces;std::vector<DObjAnimMat> bones;};
alignas(16) DObjSkelMat matrices[128];
float vertices[0xff78/4];int allocations,frees,conversions,reads;XModel *active;
int surfaces(XModel *model,XSurface ***out,int lod,int **bits) {
 assert(model==active&&lod==0);*out=model->surfaces.data();*bits=0;return model->surfaces.size();
}
void *allocate(int bytes) {
 assert(allocations<2&&bytes==(allocations?0xff78:0x2000));
 return allocations++?static_cast<void*>(vertices):static_cast<void*>(matrices);
}
int bones(XModel *model){assert(model==active);return model->bones.size();}
const DObjAnimMat *pose(XModel *model){assert(model==active);return model->bones.data();}
void release(void *ptr){assert(ptr==(frees++?static_cast<void*>(matrices):static_cast<void*>(vertices)));}
struct {int (*XModelGetSurfaces)(XModel*,XSurface***,int,int**);
 void *(*Hunk_AllocateTempMemoryInternal)(int);int (*XModelNumBones)(XModel*);
 const DObjAnimMat *(*XModelGetBasePose)(XModel*);void (*Hunk_FreeTempMemory)(void*);
} ri={surfaces,allocate,bones,pose,release};
void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in,DObjSkelMat *out) {
 assert(in==active->bones.data()+conversions&&out==matrices+conversions);
 out->value[0]=float(++conversions);
}
void XSurfaceGetVerts(const XSurface *surf,DObjSkelMat *mat,float *out,float *uv,float *normal) {
 assert(conversions==int(active->bones.size())&&mat==matrices&&out==vertices&&!uv&&!normal);
 assert(surf==active->surfaces[reads++]);
 for(int i=0;i<conversions;++i)assert(mat[i].value[0]==i+1);
 std::copy(surf->points.begin(),surf->points.end(),out);
}
''' + source + r'''
int main() {
 const float axes[][9]={{1,0,0,0,1,0,0,0,1},{0,-1,0,1,0,0,0,0,-1},{2,1,-1,-1,3,2,4,-2,1}};
 int cases=0;
 for(int count:{0,1,3})for(int points:{0,1,5})for(int boneCount:{0,1,3})
 for(const auto &axis:axes)for(int unusual:{0,1,2,3}) {
  XModel model;std::vector<XSurface> meshes(count);model.bones.resize(boneCount);
  for(int s=0;s<count;++s) {
   meshes[s].vertCount=points;
   for(int v=0;v<points;++v) {
    meshes[s].points.push_back(float((s+1)*10+v));
    meshes[s].points.push_back(float(v-3));meshes[s].points.push_back(float(s-v));
   }
   model.surfaces.push_back(&meshes[s]);
  }
  if(count&&points&&unusual)meshes[0].points[0]=unusual==1
   ?std::numeric_limits<float>::quiet_NaN()
   :(unusual==2?std::numeric_limits<float>::infinity():-std::numeric_limits<float>::infinity());
  active=&model;allocations=frees=conversions=reads=0;
  float mins[5]={123,0,0,0,456},maxs[5]={789,0,0,0,987};
  R_StaticModelBounds(&model,(const vec3_t *)axis,mins+1,maxs+1);
  assert(allocations==2&&frees==2&&conversions==boneCount&&reads==count);
  assert(mins[0]==123&&mins[4]==456&&maxs[0]==789&&maxs[4]==987);
  for(int component=0;component<3;++component) {
   std::vector<double> transformed;
   for(const auto &mesh:meshes)for(int v=0;v<points;++v) {
    double result=0;for(int lane=0;lane<3;++lane)
     result+=double(mesh.points[v*3+lane])*axis[lane*3+component];
    if(!std::isnan(result))transformed.push_back(result);
   }
   float lo=FLT_MAX,hi=-FLT_MAX;
   if(!transformed.empty()) {auto extrema=std::minmax_element(transformed.begin(),transformed.end());lo=std::min(double(FLT_MAX),*extrema.first);hi=std::max(double(-FLT_MAX),*extrema.second);}
   assert(mins[component+1]==lo&&maxs[component+1]==hi);
  }
  ++cases;
 }
 printf("PASS: %d actual bounds cases; independent extrema, empty/multiple meshes, NaNs/infinities, bone strides, allocation/free order and guards\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_static_bounds_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
