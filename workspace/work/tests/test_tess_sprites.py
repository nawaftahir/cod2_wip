"""Actual sprite family: projection, atlas, BGRA and complete DX7/DX9 quads."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('// Sprite geometry and projection.'):text.index('// Line and rail geometry.')]
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <limits>
#include <initializer_list>
typedef unsigned char byte;typedef float vec3_t[3];
union GfxColor {unsigned packed;byte array[4];};
struct GfxVertex {float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3];};
struct GfxVertexDx7 {float xyz[3],normal[3];GfxColor color;float texCoord[2];};
static_assert(sizeof(GfxVertex)==64&&sizeof(GfxVertexDx7)==36,"PC vertex strides");
struct Material {struct {byte textureAtlasRowCount,textureAtlasColumnCount;} info;} material;
struct GfxEntity {float origin[3],axis[3][3],radius[2],rotation,minScreenRadius;int renderFxFlags,materialSubimageIndex;byte materialRGBA[4];Material *customMaterial;} entity;
struct D3DMATRIX {float m[4][4];};struct GfxViewParms {float origin[3],axis[3][3];D3DMATRIX viewProjectionMatrix,inverseViewProjectionMatrix;} view;
struct {GfxViewParms *viewParms;} backEnd;
struct {struct {int integer;} current;} renderer;const decltype(renderer) *r_rendererInUse=&renderer;
struct {alignas(16) byte vertexData[0x5a7b0];unsigned short *indices;int vertexCount,indexCount;} tess;
unsigned short indices[0x100010];float origin[3],left[3],up[3];int overflows,mutation;
void RB_TessOverflow(){++overflows;tess.vertexCount=tess.indexCount=0;
 if(mutation){origin[0]+=9;left[1]-=3;up[2]+=5;entity.origin[0]+=31;entity.radius[0]=19;entity.materialRGBA[0]=255;material.info.textureAtlasRowCount=7;view.axis[0][2]=-3;}}
bool close(float a,float b){return (std::isnan(a)&&std::isnan(b))||a==b||std::fabs(a-b)<=1e-5f*(1+std::fabs(b));}
void MakeNormalVectors(const float *forward,float *right,float *up){assert(forward==entity.axis[0]);right[0]=1;right[1]=right[2]=0;up[1]=-1;up[0]=up[2]=0;}
'''+source+r'''
void reset(int mode,int base,int first,int change){
 renderer.current.integer=mode;mutation=change;overflows=0;memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indices,0x5a,sizeof(indices));
 tess.indices=indices;tess.vertexCount=base;tess.indexCount=first;memset(&view,0,sizeof(view));backEnd.viewParms=&view;
 view.axis[0][2]=view.axis[1][0]=view.axis[2][1]=1;for(int i=0;i<4;++i){view.viewProjectionMatrix.m[i][i]=1;view.inverseViewProjectionMatrix.m[i][i]=1;}
 origin[0]=1;origin[1]=-2;origin[2]=3;left[0]=2;left[1]=3;left[2]=-1;up[0]=-.5f;up[1]=1;up[2]=2;
}
void checkQuad(int mode,int base,int first,const float *o,const float *l,const float *u,unsigned color,const float *uv){
 const int order[]={0,1,3,3,1,2};for(int i=0;i<6;++i)assert(indices[first+i]==(unsigned short)(base+order[i]));
 if(first)assert(indices[first-1]==0x5a5a);assert(indices[first+6]==0x5a5a);
 int stride=mode==2?36:64;
 for(int i=0;i<base*stride;++i)assert(tess.vertexData[i]==0x5a);
 for(unsigned i=(base+4)*stride;i<sizeof(tess.vertexData);++i)assert(tess.vertexData[i]==0x5a);
 for(int corner=0;corner<4;++corner){
  GfxVertex *v=(GfxVertex *)tess.vertexData+base+corner;GfxVertexDx7 *v7=(GfxVertexDx7 *)tess.vertexData+base+corner;
  float *pos=mode==2?v7->xyz:v->xyzw,*n=mode==2?v7->normal:v->normal,*tc=mode==2?v7->texCoord:v->texCoord;
  for(int c=0;c<3;++c){float sum=l[c]+u[c],dif=l[c]-u[c];float expected=corner==0?sum+o[c]:corner==1?o[c]-dif:corner==2?o[c]-sum:dif+o[c];
   assert(close(pos[c],expected)&&close(n[c],-view.axis[0][c]));if(mode!=2)assert(close(v->binormal[c],u[c])&&close(v->tangent[c],-l[c]));}
  if(mode!=2)assert(v->xyzw[3]==1);assert((mode==2?v7->color.packed:v->color.packed)==color);
  assert(close(tc[0],uv[(corner==1||corner==2)?2:0])&&close(tc[1],uv[corner>=2?3:1]));
 }
 assert(tess.vertexCount==base+4&&tess.indexCount==first+6);
}
int main(){
 int stamps=0,sprites=0,quads=0;float uv[]={.125f,.25f,.75f,1.5f};
 for(int mode:{1,2,3})for(int base:{0,3,5446,5447})for(int first:{0,0x100000-6,0x100000-5})for(int change:{0,1}){
  reset(mode,base,first,change);if(mode==2)RB_AddQuadStampDx7(origin,left,up,0x81234567,uv[0],uv[1],uv[2],uv[3]);else RB_AddQuadStamp(origin,left,up,0x81234567,uv[0],uv[1],uv[2],uv[3]);
  bool overflow=base>5446||first>0x100000-6;assert(overflows==overflow);checkQuad(mode,overflow?0:base,overflow?0:first,origin,left,up,0x81234567,uv);++stamps;
 }
 float nan=std::numeric_limits<float>::quiet_NaN();
 for(int mode:{1,2,3})for(int flags:{0,0x1000,0x2000,0x3000})for(float rotation:{0.0f,37.0f,90.0f})for(int atlas:{1,6})for(int frame:{-2,0,5})
 for(float minimum:{-1.0f,0.0f,.05f,3.0f,nan})for(float w:{-1.0f,0.0f,.5f,2.0f,nan})for(int change:{0,1}){
  reset(mode,change?5447:0,0,change);material.info={byte(atlas==1?1:2),byte(atlas==1?1:3)};memset(&entity,0,sizeof(entity));entity.customMaterial=&material;
  entity.origin[0]=1;entity.origin[1]=2;entity.origin[2]=3;entity.radius[0]=2;entity.radius[1]=3;entity.rotation=rotation;entity.minScreenRadius=minimum;entity.renderFxFlags=flags;entity.materialSubimageIndex=frame;
  byte color[]={17,63,129,193};memcpy(entity.materialRGBA,color,4);view.viewProjectionMatrix.m[3][3]=w;view.inverseViewProjectionMatrix.m[1][1]=.5f;
  float radii[2]={2,3};bool draw=true;
  if(flags&0x2000){draw=!(w<=0);radii[0]=radii[1]=3*w;}
  else if(minimum>0){draw=!(w<=0);float screenY=3*(1.0f/w)*.5f;if(draw&&screenY<minimum){float scale=minimum/screenY;radii[0]=2*scale;radii[1]=3*scale;}}
  float o[]={1,2,3};if(flags&0x1000)o[2]+=radii[1];float l[3],u[3];
  float angle=rotation*.017453292f,co=rotation==0?1:(float)cos(angle),si=rotation==0?0:(float)sin(angle);
  for(int c=0;c<3;++c){l[c]=-(si*radii[0])*view.axis[2][c]+co*radii[0]*view.axis[1][c];u[c]=si*radii[1]*view.axis[1][c]+co*radii[1]*view.axis[2][c];}
  float coords[4]={0,0,1,1};if(atlas!=1){coords[0]=(frame%3)*(1.0f/3);coords[1]=(frame/3)*.5f;coords[2]=coords[0]+1.0f/3;coords[3]=coords[1]+.5f;}
  RB_TessSprite(&entity);
  if(draw){assert(overflows==change);checkQuad(mode,0,0,o,l,u,0xc1113f81,coords);}else assert(!overflows&&tess.vertexCount==(change?5447:0)&&!tess.indexCount);
  ++sprites;
 }

 for(int mode:{1,2,3})for(float rotation:{0.0f,37.0f,90.0f})for(int frame:{-2,0,5})for(int change:{0,1}){
  reset(mode,change?5447:0,0,change);material.info={2,3};memset(&entity,0,sizeof(entity));entity.customMaterial=&material;
  entity.origin[0]=1;entity.origin[1]=2;entity.origin[2]=3;entity.radius[0]=2;entity.radius[1]=3;entity.rotation=rotation;entity.renderFxFlags=0x3000;entity.minScreenRadius=100;entity.materialSubimageIndex=frame;
  byte color[]={17,63,129,193};memcpy(entity.materialRGBA,color,4);float co=(float)cos(rotation*.017453292f),si=(float)sin(rotation*.017453292f);
  float l[]={co*2,si*2,0},u[]={si*3,-co*3,0},uv[]={(frame%3)*(1.0f/3),(frame/3)*.5f,0,0};uv[2]=uv[0]+1.0f/3;uv[3]=uv[1]+.5f;
  RB_TessOrientedQuad(&entity);assert(overflows==change);
  checkQuad(mode,0,0,entity.origin,l,u,0xc1113f81,uv);++quads;
 }
 printf("PASS: %d direct quad stamps %d sprite routes and %d oriented quads; both vertex formats, all buffer guards, BGRA/atlas, signed frames, rotation/lift, minimum/screen projection, NaNs and overflow capture\n",stamps,sprites,quads);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sprites_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
