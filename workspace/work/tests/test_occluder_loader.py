"""Run the actual loader on distinct occluders and nonzero disk indices."""
from pathlib import Path
import re
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_bsp_load_obj.cpp').read_text()
start = text.index('void R_LoadOccluders(')
source = text[start:text.index('\n}\n', start)+3]
header = (work.parents[1] / 'target/src/opencod2/headers/common_types.h').read_text()
def declaration(name):
    return re.search(r'struct '+name+r'\s*\{.*?\n\};', header, re.S).group(0)
program = r'''
#include <cassert>
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <vector>
typedef unsigned char byte;typedef float vec3_t[3];
struct DpvsPlane {float coeffs[4];byte side[3],flags;};
struct GfxOccluderEdge;
''' + '\n'.join(declaration(n) for n in ['DiskGfxOccluder','DiskGfxOccluderEdge','GfxOccluderEdge','GfxOccluder']) + r'''
struct Lump {int fileofs;};struct Header {Lump lumps[21];};
struct GfxBspLoad {Header *header;byte *fileBase;};
vec3_t vertices[8];struct {GfxOccluder *occluders;vec3_t *portalVerts;}rgl={0,vertices};
int count;std::vector<void*> blocks;float collisionPlanes[2][4]={{1,-1,0,3},{-1,1,-0.0f,-4}};
void *allocate(int size){void *p=malloc(size?size:1);memset(p,0xcd,size);blocks.push_back(p);return p;}
const float *plane(int index){assert(index>=0&&index<2);return collisionPlanes[index];}
struct {void *(*Hunk_AllocInternal)(int);const float *(*CM_GetPlaneNum)(int);}ri={allocate,plane};
int R_GetLumpElemCount(GfxBspLoad*,int lump,int size){assert((lump==18&&size==20)||(lump==19&&size==4)||(lump==20&&size==4));return count;}
''' + source + r'''
int main(){
 for(count=0;count<=2;++count){
  alignas(4) byte data[256]={};Header header={};header.lumps[18].fileofs=0;header.lumps[19].fileofs=128;header.lumps[20].fileofs=160;
  auto disk=(DiskGfxOccluder*)data;auto indices=(int*)(data+128);auto edges=(DiskGfxOccluderEdge*)(data+160);
  edges[0]={{0,0},{0,1}};edges[1]={{0,0},{1,0}};
  for(int i=0;i<count;++i){disk[i]={i,1,1,i,i*2,2};indices[i]=i;}
  GfxBspLoad load={&header,data};R_LoadOccluders(&load);assert(blocks.size()==3);
  for(int i=0;i<count;++i){auto &out=rgl.occluders[i];assert(out.planeCount==1&&out.edgeCount==1&&out.vertexCount==2);
   assert(out.planes==(DpvsPlane*)blocks[1]+i&&out.edges==(GfxOccluderEdge*)blocks[2]+i&&out.vertices==vertices+i*2);
   for(int j=0;j<3;++j)assert(!memcmp(&out.planes[0].coeffs[j],&collisionPlanes[i][j],4));
   assert(out.planes[0].coeffs[3]==-collisionPlanes[i][3]);
   assert(out.planes[0].side[0]==(i?0:12)&&out.planes[0].side[1]==(i?16:4)&&out.planes[0].side[2]==8);
   assert(out.edges[0].plane[0]==out.planes&&out.edges[0].plane[1]==out.planes);
   assert(out.edges[0].vertex[0]==out.vertices&&out.edges[0].vertex[1]==out.vertices+1);
   assert(out.viewPlaneCount==0&&out.viewPlanes==0&&out.ignoreStackLevel==(int)0xcdcdcdcd);
  }
  for(void *p:blocks)free(p);blocks.clear();
 }
 puts("PASS: actual occluder loader, empty/multiple records, distinct planes, signed-zero sides, edge restart and untouched state");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_occluder_load_') as d:
    binary = str(Path(d)/'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
