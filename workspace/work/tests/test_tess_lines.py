"""Actual line/rail family with original vector helpers and overflow timing."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
a=text.index('static void RB_GetEntityAtlasCoords(')
atlas=text[a:text.index('// PINNED 1003f6c0:',a)]
source=atlas+text[text.index('// Line and rail geometry.'):text.index('// Cylinder geometry and entity dispatch.')]
math=(work/'src/universal/com_math.cpp').read_text()
def body(decl):
    a=math.index(decl);i=math.index('{',a);depth=1;j=i+1
    while depth:
        depth+=(math[j]=='{')-(math[j]=='}');j+=1
    return math[a:j].replace('__declspec(noinline) ','')
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <limits>
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];
float I_sqrt(float v){return sqrtf(v);}
union GfxColor {unsigned packed;byte array[4];};
struct GfxVertex {float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3];};
struct GfxVertexDx7 {float xyz[3],normal[3];GfxColor color;float texCoord[2];};
struct Material {struct {byte textureAtlasRowCount,textureAtlasColumnCount;} info;} material;
struct GfxEntity {float origin[3],endpos[3],radius[2];int materialSubimageIndex;byte materialRGBA[4];Material *customMaterial;} entity;
struct {float origin[3];} view;struct {decltype(view) *viewParms;} backEnd;
struct dvar_t {union {int integer;float value;} current;} renderer,rail;
const dvar_t *r_rendererInUse=&renderer,*r_railCoreWidth=&rail;
struct {alignas(16) byte vertexData[0x5a7b0];unsigned short *indices;int vertexCount,indexCount;} tess;
unsigned short indices[0x100010];int overflows,mutation;
void RB_TessOverflow(){++overflows;tess.vertexCount=tess.indexCount=0;
 if(mutation){entity.origin[0]+=7;entity.endpos[1]-=3;view.origin[2]=9;entity.radius[0]=99;entity.materialRGBA[0]=255;material.info.textureAtlasColumnCount=7;rail.current.value=88;}
 if(mutation==2){tess.vertexCount=2;tess.indexCount=3;}}
bool close(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||std::fabs(a-b)<=2e-5f*(1+std::fabs(b));}
'''+body('void Vec3Cross(')+body('__declspec(noinline) vec_t Vec3Normalize(')+source+r'''
void normalize(float *v){long double sq=0;for(int c=0;c<3;++c)sq+=(long double)v[c]*v[c];float length=(float)std::sqrt(sq);if(length!=0){float inverse=1/length;for(int c=0;c<3;++c)v[c]*=inverse;}}
void frame(float *t,float *b,float *n){float from[3],to[3];for(int c=0;c<3;++c){from[c]=entity.origin[c]-view.origin[c];to[c]=entity.endpos[c]-view.origin[c];b[c]=entity.endpos[c]-entity.origin[c];}
 for(int c=0;c<3;++c){int a=(c+1)%3,z=(c+2)%3;t[c]=from[a]*to[z]-from[z]*to[a];}normalize(t);normalize(b);
 for(int c=0;c<3;++c)n[c]=t[(c+1)%3]*b[(c+2)%3]-t[(c+2)%3]*b[(c+1)%3];}
int main(){
 int cases=0;
 for(int mode:{1,2,3})for(int kind=0;kind<3;++kind)for(int shape=0;shape<4;++shape)for(float width:{-2.0f,0.0f,.25f,3.0f})for(int base:{0,5446,5447})for(int first:{0,0x100000-6,0x100000-5})for(mutation=0;mutation<3;++mutation){
  memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indices,0x5a,sizeof(indices));tess.indices=indices;tess.vertexCount=base;tess.indexCount=first;overflows=0;backEnd.viewParms=&view;view.origin[0]=view.origin[1]=view.origin[2]=0;
  material.info={2,3};memset(&entity,0,sizeof(entity));entity.customMaterial=&material;entity.origin[0]=1;entity.origin[1]=2;entity.origin[2]=3;entity.endpos[0]=-2;entity.endpos[1]=4;entity.endpos[2]=5;entity.radius[0]=width;entity.materialSubimageIndex=-2;
  byte rgba[]={17,63,129,193};memcpy(entity.materialRGBA,rgba,4);renderer.current.integer=mode;rail.current.value=width;
  if(shape==1)memcpy(entity.endpos,entity.origin,12);if(shape==2)for(int c=0;c<3;++c)entity.endpos[c]=2*entity.origin[c];if(shape==3)entity.endpos[0]=std::numeric_limits<float>::quiet_NaN();
  float t[3],b[3],n[3];frame(t,b,n);float uv[]={.125f,.25f,.75f,1.25f};
  if(kind==1){uv[0]=-2*(1.0f/3);uv[1]=0;uv[2]=uv[0]+1.0f/3;uv[3]=.5f;}
  if(kind==2){float delta[3];for(int c=0;c<3;++c)delta[c]=entity.endpos[c]-entity.origin[c];uv[0]=uv[1]=0;uv[2]=1;uv[3]=(float)(sqrt(delta[2]*delta[2]+delta[1]*delta[1]+delta[0]*delta[0])*.00390625f);}
  if(kind==1)RB_TessLine(&entity);else if(kind==2)RB_TessRailCore(&entity);else if(mode==2)RB_AddLineDx7(entity.origin,entity.endpos,width,0xc1113f81,uv[0],uv[1],uv[2],uv[3]);else RB_AddLine(entity.origin,entity.endpos,width,0xc1113f81,uv[0],uv[1],uv[2],uv[3]);
  bool overflow=base>5446||first>0x100000-6;assert(overflows==overflow);int v=overflow?(mutation==2?2:0):base,ic=overflow?(mutation==2?3:0):first,stride=mode==2?36:64;
  const int order[]={0,1,2,2,1,3};for(int i=0;i<6;++i)assert(indices[ic+i]==(unsigned short)(v+order[i]));if(ic)assert(indices[ic-1]==0x5a5a);assert(indices[ic+6]==0x5a5a);
  for(int i=0;i<v*stride;++i)assert(tess.vertexData[i]==0x5a);for(unsigned i=(v+4)*stride;i<sizeof(tess.vertexData);++i)assert(tess.vertexData[i]==0x5a);
  for(int corner=0;corner<4;++corner){GfxVertex *out=(GfxVertex *)tess.vertexData+v+corner;GfxVertexDx7 *out7=(GfxVertexDx7 *)tess.vertexData+v+corner;float *p=mode==2?out7->xyz:out->xyzw,*normal=mode==2?out7->normal:out->normal,*coords=mode==2?out7->texCoord:out->texCoord;const float *endpoint=corner>=2?entity.endpos:entity.origin;
   for(int c=0;c<3;++c){float offset=t[c]*width;assert(close(p[c],corner&1?endpoint[c]-offset:offset+endpoint[c]));assert(close(normal[c],n[c]));if(mode!=2)assert(close(out->binormal[c],b[c])&&close(out->tangent[c],t[c]));}
   assert((mode==2?out7->color.packed:out->color.packed)==0xc1113f81);if(mode!=2)assert(out->xyzw[3]==1);
   assert(close(coords[0],uv[corner&1?2:0])&&close(coords[1],uv[corner>=2?3:1]));
  }
  assert(tess.vertexCount==v+4&&tess.indexCount==ic+6);++cases;
 }
 printf("PASS: %d actual direct/line/rail routes, original vector math, full buffer guards, BGRA/UV, degeneracy/NaNs, negative widths, capacity and pre-frame/post-endpoint overflow timing\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_tess_lines_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
