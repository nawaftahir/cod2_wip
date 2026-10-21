"""Run the actual scalar/SSE skinning and command source as 32-bit code."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent.parent / 'src'
model = (packet / 'gfx_d3d/r_model.cpp').read_text()
model = model[model.index('void R_ConvertAnimMatToSkelMat('):model.index('static void *Hunk_AllocXModelPrecache(')]
transform = (packet / 'gfx_d3d/r_skin_transform.cpp').read_text().replace('#include "gfx.h"', '')
skin = (packet / 'gfx_d3d/r_skin_rigid.cpp').read_text().replace('#include "gfx.h"', '')
xsurface = (packet / 'gfx_d3d/r_xsurface.cpp').read_text()
xsurface = xsurface[xsurface.index('static inline __attribute__((always_inline)) void XSurfaceRotateNormal'):]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstddef>
#include <xmmintrin.h>
#define align(x) aligned(x)
#define __declspec(x) __attribute__((x))
#define __forceinline inline __attribute__((always_inline))
typedef unsigned char byte;
typedef float vec3_t[3];
union GfxColor { byte array[4];unsigned int packed; };
struct DObjAnimMat { float quat[4],trans[3],transWeight; };
struct DObjSkelMat { float axis[3][4],origin[4]; };
struct XVertexInfo { float normal[3];byte color[4];float binormal[3],texCoordX;
 float tangent[3],texCoordY,offset[3];byte numWeights,boneWeight;short boneOffset; };
struct XBlendInfo { float offset[3];short boneOffset;unsigned short boneWeight; };
struct XVertexBuffer { XVertexInfo v;XBlendInfo w[1]; };
struct XSurface { byte tileMode;short vertCount,triCount,boneOffset;unsigned int triIndices;XVertexBuffer *verts; };
struct GfxVertex { float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3]; };
struct GfxVertexDx7 { float xyz[3],normal[3];GfxColor color;float texCoord[2]; };
struct GfxModelSurface { int surfType;XSurface *xsurf; };
struct GfxModelSkinnedSurface { GfxModelSurface surf;int skinnedCachedOffset;
 union { void *variant;GfxVertex *dx9;GfxVertexDx7 *dx7; } skinnedVert; };
struct GfxModelRigidSurface { GfxModelSurface surf;vec3_t boneAxis[4]; };
struct GfxEntity { int type,flags;float lighting[3],axis[3][3],scale,origin[3]; };
struct SkinRigidXModelCmd { int *surfs;int surfCount;GfxEntity *e;DObjAnimMat mat; };
struct SkinBuffers { DObjSkelMat matArrayBuf[128];byte verts[32768]; };
struct SkinXModelCmd { int *surfs;GfxEntity *e;const DObjAnimMat *mat;int surfacePartBits[4];
 byte surfCount,boneCount,matOffset[64]; };
struct dvar_t { int flags,type;union { int integer;bool enabled; } current; };
struct DxGlobals { byte *skinnedCacheLockAddr; };
DxGlobals dx;
dvar_t renderer={},sse={},skinning={};
const dvar_t *r_rendererInUse=&renderer,*sys_SSE=&sse,*r_sse_skinning=&skinning;
void VectorScale(const float *in,float scale,float *out) {
 for(int i=0;i<3;++i)out[i]=in[i]*scale;
}
'''+model+transform+skin+xsurface+r'''
void transformOracle(const DObjSkelMat &bone,const float *in,bool position,double *out) {
 for(int c=0;c<3;++c) {
  out[c]=position?bone.origin[c]:0;
  for(int r=0;r<3;++r)out[c]+=(double)in[r]*bone.axis[r][c];
 }
}
void checkVector(const float *actual,const double *expected) {
 for(int c=0;c<3;++c)assert(std::fabs(actual[c]-expected[c])<0.0002);
}
int main() {
 assert(sizeof(void *)==4);
 __declspec(align(16)) DObjSkelMat matrices[3]={};
 const DObjSkelMat *bones=matrices+1;
 __declspec(align(16)) byte input[512];
 __declspec(align(16)) byte output[512];
 XSurface surface={};surface.verts=(XVertexBuffer *)input;surface.boneOffset=-1;surface.vertCount=3;
 int cases=0;
 for(int sample=0;sample<32;++sample) {
  for(int b=0;b<3;++b) {
   for(int r=0;r<3;++r)for(int c=0;c<3;++c)
    matrices[b].axis[r][c]=((sample+b*3+r*7+c*11)%17-8)*.125f;
   for(int c=0;c<3;++c)matrices[b].origin[c]=(sample-b*3+c)*.25f;
   matrices[b].origin[3]=1;
  }
  std::memset(input,0,sizeof(input));
  XVertexInfo *vertices[3];double positions[3][3],normals[3][3],binormals[3][3],tangents[3][3],ws[3];
  byte *cursor=input;
  for(int v=0;v<3;++v) {
   XVertexInfo *in=(XVertexInfo *)cursor;vertices[v]=in;
   for(int c=0;c<3;++c) {
    in->offset[c]=(v+c-2)*.25f;in->normal[c]=(v+c+1)*.125f;
    in->binormal[c]=(v-c)*.25f;in->tangent[c]=(v+c-1)*.125f;
   }
   in->texCoordX=v*.25f;in->texCoordY=-v*.5f;
   unsigned color=0x7fc00001u+v*17;std::memcpy(in->color,&color,4);
   in->boneOffset=(short)((v-1)*64);in->numWeights=(byte)((sample+v)%3);in->boneWeight=(byte)(80+v*17);
   const DObjSkelMat &bone=matrices[v];
   transformOracle(bone,in->offset,true,positions[v]);
   transformOracle(bone,in->normal,false,normals[v]);
   transformOracle(bone,in->binormal,false,binormals[v]);
   transformOracle(bone,in->tangent,false,tangents[v]);
   ws[v]=1;
   cursor+=64;
   if(in->numWeights) {
    double weight=(double)in->boneWeight/256;
    for(int c=0;c<3;++c)positions[v][c]*=weight;
    ws[v]=weight;
    for(int w=0;w<in->numWeights;++w) {
     XBlendInfo *blend=(XBlendInfo *)cursor;
     blend->boneOffset=(short)((1-w)*64);blend->boneWeight=(unsigned short)(9000+w*7000+sample);
     for(int c=0;c<3;++c)blend->offset[c]=(v-w+c+1)*.125f;
     double point[3];transformOracle(matrices[2-w],blend->offset,true,point);
     weight=(double)blend->boneWeight/65536;
     for(int c=0;c<3;++c)positions[v][c]+=point[c]*weight;
     ws[v]+=weight;cursor+=16;
    }
   }
  }
  for(int wantNormal=0;wantNormal<2;++wantNormal) {
   float xyz[9],normal[9],uv[6];
   for(int i=0;i<6;++i)uv[i]=1234.0f;
   XSurfaceGetVerts(&surface,matrices+1,xyz,uv,wantNormal?normal:0);
   for(int v=0;v<3;++v) {
    checkVector(xyz+3*v,positions[v]);
    if(wantNormal)checkVector(normal+3*v,normals[v]);
   }
   for(int i=0;i<6;++i)assert(uv[i]==1234.0f);
   XSurface rigidSurface=surface;rigidSurface.vertCount=1;
   for(int bone=0;bone<3;++bone) {
    rigidSurface.boneOffset=(short)((bone-1)*64);
    double pos[3],norm[3];
    transformOracle(matrices[bone],vertices[0]->offset,true,pos);
    transformOracle(matrices[bone],vertices[0]->normal,false,norm);
    XSurfaceGetVerts(&rigidSurface,matrices+1,xyz,uv,wantNormal?normal:0);
    checkVector(xyz,pos);if(wantNormal)checkVector(normal,norm);
    assert(uv[0]==vertices[0]->texCoordX&&uv[1]==vertices[0]->texCoordY);
    XSurfaceGetVerts(&rigidSurface,matrices+1,xyz,0,wantNormal?normal:0);
    checkVector(xyz,pos);
   }
   XSurface empty=surface;empty.vertCount=0;
   xyz[0]=5678.0f;XSurfaceGetVerts(&empty,matrices+1,xyz,0,0);
   assert(xyz[0]==5678.0f);
  }
  for(int mode=1;mode<=2;++mode)for(int use=0;use<=1;++use)for(int enabled=0;enabled<=1;++enabled)
  for(int cached=0;cached<=1;++cached) {
   renderer.current.integer=mode;sse.current.enabled=use;skinning.current.enabled=enabled;
   std::memset(output,0xcc,sizeof(output));dx.skinnedCacheLockAddr=output;
   GfxModelSkinnedSurface ms={};ms.surf.xsurf=&surface;
   ms.skinnedCachedOffset=cached?32:-1;ms.skinnedVert.variant=output+32;
   R_SkinXSurfaceSkinned(&ms,bones);_mm_sfence();
   int stride=mode==2?36:64;
   for(int v=0;v<3;++v) {
    const float *pos,*normal,*uv;const GfxColor *color;
    if(mode==2) {
     const GfxVertexDx7 *out=(const GfxVertexDx7 *)(output+32+v*stride);
     pos=out->xyz;normal=out->normal;uv=out->texCoord;color=&out->color;
    } else {
     const GfxVertex *out=(const GfxVertex *)(output+32+v*stride);
     pos=out->xyzw;normal=out->normal;uv=out->texCoord;color=&out->color;
     checkVector(out->binormal,binormals[v]);checkVector(out->tangent,tangents[v]);
     assert(std::fabs(out->xyzw[3]-(use&&enabled?ws[v]:1.0))<0.00001);
    }
    checkVector(pos,positions[v]);checkVector(normal,normals[v]);
    assert(!std::memcmp(color->array,vertices[v]->color,4));
    assert(uv[0]==vertices[v]->texCoordX&&uv[1]==vertices[v]->texCoordY);
   }
   for(int i=0;i<32;++i)assert(output[i]==0xcc);
   for(unsigned i=32+3*stride;i<sizeof(output);++i)assert(output[i]==0xcc);
   ++cases;
  }
 }
 assert(cases==512);
 surface.vertCount=0;
 for(int mode=1;mode<=2;++mode)for(int use=0;use<=1;++use) {
  renderer.current.integer=mode;sse.current.enabled=use;skinning.current.enabled=use;
  std::memset(output,0xcc,sizeof(output));
  GfxModelSkinnedSurface ms={};ms.surf.xsurf=&surface;ms.skinnedCachedOffset=-1;ms.skinnedVert.variant=output+32;
  R_SkinXSurfaceSkinned(&ms,bones);_mm_sfence();
  for(byte v:output)assert(v==0xcc);
 }
 // Exercise variable record sizes and a generated rigid transform through the real command.
 __declspec(align(16)) byte records[96];std::memset(records,0xcc,sizeof(records));
 GfxModelSurface *skip=(GfxModelSurface *)records;skip->surfType=5;
 GfxModelRigidSurface *rigid=(GfxModelRigidSurface *)(records+16);
 rigid->surf.surfType=4;rigid->surf.xsurf=&surface;surface.boneOffset=0;
 GfxModelSkinnedSurface *skinned=(GfxModelSkinnedSurface *)(records+72);
 skinned->surf.surfType=3;skinned->surf.xsurf=&surface;skinned->skinnedCachedOffset=-1;skinned->skinnedVert.variant=output+32;
 GfxEntity entity={};entity.axis[0][0]=entity.axis[1][1]=entity.axis[2][2]=1;entity.scale=1.5f;
 entity.origin[0]=5;entity.origin[1]=7;entity.origin[2]=9;
 SkinRigidXModelCmd cmd={};cmd.surfs=(int *)records;cmd.surfCount=3;cmd.e=&entity;
 cmd.mat.quat[3]=1;cmd.mat.transWeight=2;cmd.mat.trans[0]=1;cmd.mat.trans[1]=2;cmd.mat.trans[2]=3;
 R_SkinRigidXModelCmd(&cmd);
 for(int r=0;r<3;++r)for(int c=0;c<3;++c)assert(rigid->boneAxis[r][c]==(r==c?1.5f:0));
 for(int c=0;c<3;++c)assert(rigid->boneAxis[3][c]==entity.origin[c]+cmd.mat.trans[c]*1.5f);
 for(int i=88;i<96;++i)assert(records[i]==0xcc);
 // The single-surface router uses signed byte offsets into the pose array.
 assert(R_SkinXModelSurface(bones,&entity,records)==records+16);
 for(int offset=-64;offset<=64;offset+=64) {
  surface.boneOffset=(short)offset;
  assert(R_SkinXModelSurface(bones,&entity,records+16)==records+72);
  const DObjSkelMat &selected=matrices[1+offset/64];
  for(int r=0;r<3;++r)for(int c=0;c<3;++c)
   assert(rigid->boneAxis[r][c]==selected.axis[r][c]*entity.scale);
  for(int c=0;c<3;++c)
   assert(rigid->boneAxis[3][c]==selected.origin[c]*entity.scale+entity.origin[c]);
 }
 surface.boneOffset=0;
 // The bitset crosses 32-bit words; unselected bones must remain untouched.
 DObjAnimMat animation[128]={};
 std::memset(g_skinBuffers,0xcc,sizeof(g_skinBuffers));
 for(int b=0;b<128;++b) {
  animation[b].quat[3]=1;animation[b].transWeight=2;
  for(int c=0;c<3;++c)animation[b].trans[c]=(b+c)*.25f;
 }
 SkinXModelCmd animated={};animated.mat=animation;animated.boneCount=128;
 animated.surfacePartBits[0]=(int)0x80000001u;
 animated.surfacePartBits[1]=(int)0x80000001u;
 animated.surfacePartBits[2]=(int)0x80000001u;
 animated.surfacePartBits[3]=(int)0x80000001u;
 R_SkinXModelCmd(&animated,0);
 for(int b=0;b<128;++b) {
  const DObjSkelMat &result=g_skinBuffers[0].matArrayBuf[b];
  if(b==0||b==31||b==32||b==63||b==64||b==95||b==96||b==127) {
   for(int r=0;r<3;++r)for(int c=0;c<4;++c)assert(result.axis[r][c]==(r==c?1.0f:0.0f));
   for(int c=0;c<3;++c)assert(result.origin[c]==animation[b].trans[c]);
   assert(result.origin[3]==1);
  } else for(unsigned i=0;i<sizeof(result);++i)assert(((const byte *)&result)[i]==0xcc);
 }
 animated.surfs=(int *)records;animated.surfCount=3;animated.e=&entity;
 animated.matOffset[0]=0;animated.matOffset[1]=31;animated.matOffset[2]=32;
 R_SkinXModelCmd(&animated,0);
 for(int r=0;r<3;++r)for(int c=0;c<3;++c)assert(rigid->boneAxis[r][c]==(r==c?1.5f:0));
 for(int c=0;c<3;++c)assert(rigid->boneAxis[3][c]==entity.origin[c]+animation[31].trans[c]*1.5f);
 for(int i=88;i<96;++i)assert(records[i]==0xcc);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_skinning_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-msse','-mfpmath=387','-std=c++11','-O2','-fno-strict-aliasing',
                    '-x','c++','-','-o',binary], input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual 32-bit skinning, 512 scalar/SSE/cache cases plus XSurfaceGetVerts rigid/skinned/empty/optional-output cases, signed bone offsets, weighted positions, normals, color/UV bits and canaries')
