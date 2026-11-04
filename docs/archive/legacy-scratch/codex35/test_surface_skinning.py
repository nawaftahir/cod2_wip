"""Execute actual PC skinning source; compare positions with scalar algebra."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
target = next(p for p in packet.parents if (p / 'src/opencod2/headers/common_types.h').is_file())
types = (target / 'src/opencod2/headers/common_types.h').read_text()
source = (packet / 'src/gfx_d3d/r_xsurface.cpp').read_text()

def body(text, declaration):
    start = text.index(declaration)
    brace = text.index('{', start)
    depth, end = 1, brace + 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstddef>
typedef unsigned char byte;
typedef float vec3_t[3];
struct DObjSkelMat { float axis[3][4],origin[4]; };
struct XVertexBuffer;
struct IDirect3DIndexBuffer9;
struct IDirect3DVertexBuffer9;
struct XRigidSurface { IDirect3DVertexBuffer9 *vb; };
'''
for name in ('XBlendInfo_s', 'XVertexInfo_s', 'XSurface_s'):
    program += body(types, 'struct '+name+' {')+';\n'
    program += 'typedef '+name+' '+name[:-2]+';\n'
for declaration in ('static inline __attribute__((always_inline)) void XSurfaceRotateNormal(',
                    'static inline __attribute__((always_inline)) void XSurfaceTransformPos(',
                    'static inline __attribute__((always_inline)) void XSurfaceTransformPosWeighted(',
                    'void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal)\n{'):
    program += body(source, declaration)+'\n'
program += r'''
void close(float a,float b) { assert(std::fabs(a-b)<0.0001f); }
float transformed(const float *in,const DObjSkelMat &m,int c,bool position) {
 return in[0]*m.axis[0][c]+in[1]*m.axis[1][c]+in[2]*m.axis[2][c]+(position?m.origin[c]:0);
}
int main() {
 static_assert(sizeof(XVertexInfo)==64,"vertex stream stride");
 static_assert(sizeof(XBlendInfo)==16,"blend stream stride");
 static_assert(sizeof(DObjSkelMat)==64,"bone matrix stride");
 DObjSkelMat bones[5]={};
 for(int b=0;b<5;++b)for(int r=0;r<3;++r) {
  bones[b].origin[r]=b*2+r;
  for(int c=0;c<3;++c)bones[b].axis[r][c]=(r==c)?b+1:(b+r+c+1)*0.125f;
 }
 for(int rigid=0;rigid<2;++rigid)for(int count=0;count<9;++count)
 for(int normals=0;normals<2;++normals)for(int coords=0;coords<2;++coords) {
  alignas(XVertexInfo) byte bytes[9*(64+4*16)]={};
  byte *cursor=bytes;const XVertexInfo *vertices[9];
  XSurface surface={};surface.vertCount=count;surface.boneOffset=rigid?128:-1;
  surface.verts=(XVertexBuffer*)bytes;
  for(int v=0;v<count;++v) {
   auto *vertex=(XVertexInfo*)cursor;vertices[v]=vertex;
   vertex->boneOffset=(v%5)*64;vertex->boneWeight=128;
   vertex->numWeights=rigid?0:v%5;
   for(int c=0;c<3;++c) { vertex->normal[c]=v+c+0.25f;vertex->offset[c]=2*v+c+0.5f; }
   vertex->texCoordX=v+0.25f;vertex->texCoordY=v+0.75f;
   cursor+=64;
   for(int w=0;w<vertex->numWeights;++w) {
    auto *blend=(XBlendInfo*)cursor;blend->boneOffset=(w%5)*64;blend->boneWeight=8192+4096*w;
    for(int c=0;c<3;++c)blend->offset[c]=v+w+c+0.75f;
    cursor+=16;
   }
  }
  float positions[29],normal[29],uv[20];
  for(float &v:positions)v=-9876;for(float &v:normal)v=-9876;for(float &v:uv)v=-9876;
  XSurfaceGetVerts(&surface,bones,positions+1,coords?uv+1:0,normals?normal+1:0);
  for(int v=0;v<count;++v) {
   const auto &vertex=*vertices[v];const auto &m=bones[rigid?2:v%5];
   for(int c=0;c<3;++c) {
    float expected=transformed(vertex.offset,m,c,true);
    if(!rigid&&vertex.numWeights) {
     expected*=vertex.boneWeight/256.f;
     const auto *blend=(const XBlendInfo*)(&vertex+1);
     for(int w=0;w<vertex.numWeights;++w)
      expected+=transformed(blend[w].offset,bones[w%5],c,true)*(blend[w].boneWeight/65536.f);
    }
    close(positions[1+3*v+c],expected);
    if(normals)close(normal[1+3*v+c],transformed(vertex.normal,m,c,false));
   }
   if(coords&&rigid) { close(uv[1+2*v],vertex.texCoordX);close(uv[2+2*v],vertex.texCoordY); }
  }
  for(int i=0;i<29;++i) {
   if(i==0||i>count*3)assert(positions[i]==-9876);
   if(!normals||i==0||i>count*3)assert(normal[i]==-9876);
  }
  for(int i=0;i<20;++i)if(!coords||!rigid||i==0||i>count*2)assert(uv[i]==-9876);
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_skinning_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual rigid/blended skinning, 0..4 weights, optional normals/UVs and output guards')
