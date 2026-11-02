"""Actual cylinder buffers and the complete entity selector; no GPU dependency."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('// Cylinder geometry and entity dispatch.'):]
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
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef int surfaceType_t;
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
void VectorMA(const float *a,float scale,const float *b,float *out){for(int c=0;c<3;++c)out[c]=a[c]+scale*b[c];}
float I_sqrt(float v){return sqrtf(v);}
int I_fround(float v){return (int)std::lrintl((long double)v+1.0L/(1u<<30));}
void FastSinCos(float v,float *s,float *c){*s=(float)sin(v);*c=(float)cos(v);}
union GfxColor {unsigned packed;byte array[4];};
struct GfxVertex {float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3];};
struct GfxVertexDx7 {float xyz[3],normal[3];GfxColor color;float texCoord[2];};
struct GfxEntity {int reType;float origin[3],endpos[3],radius[2];byte materialRGBA[4];} entity;
struct {struct {float origin[3],scale,bias;} lodParms;void *currentEntity;} backEnd;
struct {struct {int integer;} current;} renderer;const decltype(renderer) *r_rendererInUse=&renderer;
struct {alignas(16) byte vertexData[0x5a7b0];unsigned short *indices;int vertexCount,indexCount;} tess;
unsigned short indices[0x100010];int overflows,mutation,routed;
void RB_TessOverflow(){++overflows;tess.vertexCount=tess.indexCount=0;if(mutation){entity.origin[0]+=17;entity.endpos[1]-=9;entity.radius[0]=4;entity.radius[1]=-2;entity.materialRGBA[0]=255;backEnd.lodParms.bias=99999;}}
void RB_TessSprite(const GfxEntity *e){assert(e==&entity);routed=4;}
void RB_TessRailCore(const GfxEntity *e){assert(e==&entity);routed=5;}
void RB_TessParticleCloud(const GfxEntity *e){assert(e==&entity);routed=6;}
void RB_TessOrientedQuad(const GfxEntity *e){assert(e==&entity);routed=7;}
void RB_TessLine(const GfxEntity *e){assert(e==&entity);routed=8;}
bool close(float a,float b){return a==b||fabsf(a-b)<=5e-5f*(1+fabsf(b));}
'''+body('void Vec3Cross(')+body('__declspec(noinline) vec_t Vec3Normalize(')+body('void MakeNormalVectors(')+source+r'''
void reset(int mode,int base,int first,int change){memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indices,0x5a,sizeof(indices));tess.indices=indices;tess.vertexCount=base;tess.indexCount=first;overflows=routed=0;mutation=change;renderer.current.integer=mode;memset(&entity,0,sizeof(entity));entity.reType=9;entity.origin[0]=1;entity.origin[1]=2;entity.origin[2]=3;entity.endpos[0]=4;entity.endpos[1]=6;entity.endpos[2]=8;entity.radius[0]=2;entity.radius[1]=3;byte color[]={17,63,129,193};memcpy(entity.materialRGBA,color,4);backEnd.currentEntity=&entity;memset(&backEnd.lodParms,0,sizeof(backEnd.lodParms));}
int main(){
 int cases=0;const float pi2=6.2831855f;
 for(int mode:{1,2,3})for(int kind:{0,1})for(float bias:{-1024.0f,0.0f,256.0f,512.0f,768.0f,2000.0f})for(int capacity:{0,1,2})for(int change:{0,1})for(int shape:{0,1}){
  int segments=(int)std::lrintf((1-bias/1024)*32);if(segments<8)segments=8;if(segments>32)segments=32;
  int vc=segments*2+2,ic=segments*6,base=capacity==1?5450-vc+1:capacity==2?5450-vc:0,first=capacity==2?0x100000-ic+1:0;
  reset(mode,base,first,change);backEnd.lodParms.bias=bias;
  if(shape)memcpy(entity.endpos,entity.origin,12);
  if(kind)RB_TessBackEndEntity(0);else RB_TessEntity(&entity);
  bool overflow=capacity!=0;assert(overflows==overflow);if(overflow){base=first=0;}
  assert(tess.vertexCount==base+vc&&tess.indexCount==first+ic);
  float direction[3],right[3],up[3];for(int c=0;c<3;++c)direction[c]=entity.origin[c]-entity.endpos[c];Vec3Normalize(direction);MakeNormalVectors(direction,right,up);
  unsigned color=entity.materialRGBA[2]|(entity.materialRGBA[1]<<8)|(entity.materialRGBA[0]<<16)|(unsigned(entity.materialRGBA[3])<<24);
  int stride=mode==2?36:64;
  for(int i=0;i<base*stride;++i)assert(tess.vertexData[i]==0x5a);for(unsigned i=(base+vc)*stride;i<sizeof(tess.vertexData);++i)assert(tess.vertexData[i]==0x5a);
  for(int i=0;i<ic;++i){const int pattern[]={0,1,3,3,2,0};assert(indices[first+i]==(unsigned short)(base+(i/6)*2+pattern[i%6]));}if(first)assert(indices[first-1]==0x5a5a);assert(indices[first+ic]==0x5a5a);
  for(int ring=0;ring<=segments;++ring)for(int end=0;end<2;++end){
   int index=ring*2+end;GfxVertex *v=(GfxVertex *)tess.vertexData+base+index;GfxVertexDx7 *v7=(GfxVertexDx7 *)tess.vertexData+base+index;
   const float *position=mode==2?v7->xyz:v->xyzw;float sine=ring==segments?0:(float)sin((pi2/segments)*ring),cosine=ring==segments?1:(float)cos((pi2/segments)*ring);float radius=entity.radius[end?0:1];const float *origin=end?entity.endpos:entity.origin;
   for(int c=0;c<3;++c)assert(close(position[c],right[c]*(sine*radius)+origin[c]+up[c]*(cosine*radius)));
   if(mode!=2)assert(v->xyzw[3]==1);assert((mode==2?v7->color.packed:v->color.packed)==color);const float *uv=mode==2?v7->texCoord:v->texCoord;assert(close(uv[0],(float)ring/segments)&&uv[1]==(end?0:1));
   const byte *raw=(const byte *)(mode==2?(const void *)v7:(const void *)v);for(int b=mode==2?12:16;b<(mode==2?24:28);++b)assert(raw[b]==0x5a);if(mode!=2)for(int b=40;b<64;++b)assert(raw[b]==0x5a);
  }
  ++cases;
 }
 for(int mode:{1,2,3})for(int type:{-1,0,1,2,3,4,5,6,7,8,10,99}){reset(mode,0,0,0);entity.reType=type;RB_TessBackEndEntity(0);assert(routed==(type>=4&&type<=8?type:0)&&!overflows&&!tess.vertexCount&&!tess.indexCount);++cases;}
 printf("PASS: %d actual cylinder/entity routes, both formats, clamped LOD rings, seam/indices/guards, untouched normals, post-overflow basis/color, full selector and live backend entity\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cylinders_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
