"""Actual polygon/world-triangle tessellation, packed vertices and separate count lifetimes."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('typedef char tessSurfaceLayoutCheck'):text.index('extern DxState dxState;')]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef int surfaceType_t;
struct Material {struct {const char *name;} info;} material={{"tess/test"}};
struct XSurface {byte mode;short vertCount,triCount,boneOffset;};
struct GfxModelSurface {int type;XSurface *xsurf;};
struct GfxStaticModelSurfaceCached {int baseVertIndex;};
struct GfxStaticModelCachedSurface {GfxModelSurface surf;GfxStaticModelSurfaceCached *surface;void *ent;};
struct DxGlobals {byte before[0x2dc8];unsigned short *smodelCacheIndices;} dx;
struct dvar_t {struct {int integer;} current;} logging;
const dvar_t *r_logFile=&logging;
int formats,logs,logMode;std::string logText;
char *va(const char *format,...){static char text[256];++formats;va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);if(logMode==1)logging.current.integer=0;return text;}
void RB_LogPrint(const char *text){if(logging.current.integer){++logs;logText=text;}}
union GfxColor {unsigned packed;byte array[4];};
struct GfxWorldVertex {float xyz[3],normal[3];GfxColor color;float texCoord[2],lmapCoord[2],binormal[3],tangent[3];};
struct GfxWorldVertexDx7 {float xyz[3];GfxColor color;float texCoord[2],lmapCoord[2];};
struct srfPoly_t {surfaceType_t surfaceType;Material *material;unsigned short lmapIndex,vertCount;GfxWorldVertex *verts;};
struct srfTriangles_t {surfaceType_t surfaceType;float bounds[2][3];int firstVertex;unsigned short vertexCount,indexCount;int (*indices)[4];};
#include "'''+str(work/'src/gfx_d3d/rb_tess.h')+r'''"
GfxTess tess;
unsigned short primary[0x100010],secondary[0x100010];
struct {struct {int integer;} current;} renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
int ends,overflows,copies,copyBytes,mutation;
void *copyOut;const void *copyIn;
std::vector<int> events;
GfxStaticModelCachedSurface *liveCached;
unsigned short cachedIndices[512];
srfPoly_t *livePoly;srfTriangles_t *liveTriangles;GfxWorldVertex alternate[8];
void RB_EndSurface(){++ends;events.push_back(1);tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;
 if(mutation==1){livePoly->verts=alternate;livePoly->vertCount=3;renderer.current.integer=2;}}
void RB_TessOverflow(){++overflows;events.push_back(2);tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;
 if(mutation==4){liveCached->surf.xsurf->triCount=1;liveCached->surface->baseVertIndex=3;}
 if(mutation==2){livePoly->verts=alternate;livePoly->vertCount=3;renderer.current.integer=2;}}
extern "C" void Com_Memcpy(void *out,const void *in,int count){++copies;events.push_back(3);copyBytes=count;copyOut=out;copyIn=in;if(mutation==5)assert(tess.optimizedIndexCount==12);memcpy(out,in,count);
 if(mutation==3){tess.optimizedIndexCount=7;liveTriangles->indexCount=3;liveTriangles->vertexCount=12;liveTriangles->firstVertex=-7;}}
'''+source+r'''
GfxWorldVertex vertices[8];
void reset(){
 memset(&tess,0x5a,sizeof(tess));memset(primary,0x5a,sizeof(primary));memset(secondary,0x5a,sizeof(secondary));
 tess.indices=primary;tess.secondaryIndices=secondary;tess.declType=1;tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;
 for(unsigned i=0;i<sizeof(vertices)/4;++i){unsigned bits=0x3f000000+i*379;memcpy((byte *)vertices+i*4,&bits,4);bits^=0x00800000;memcpy((byte *)alternate+i*4,&bits,4);}
 for(int i=0;i<512;++i)cachedIndices[i]=i*3+7;dx.smodelCacheIndices=cachedIndices;
 formats=logs=logMode=0;logging.current.integer=0;logText.clear();tess.material=&material;liveCached=0;
 ends=overflows=copies=copyBytes=mutation=0;copyOut=0;copyIn=0;events.clear();livePoly=0;liveTriangles=0;
}
void checkVertex(const GfxWorldVertex &v,int slot,int mode){
 const byte *at=(const byte *)tess.vertexData+slot*(mode==2?32:68);
 if(mode!=2){assert(!memcmp(at,&v,68));return;}
 assert(!memcmp(at,v.xyz,12)&&!memcmp(at+12,&v.color,4)&&!memcmp(at+16,v.texCoord,8)&&!memcmp(at+24,v.lmapCoord,8));
}
int main(){
 int cases=0;
 for(int mode:{1,2,3})for(int decl:{0,1,3})for(int ordinary:{0,1})for(int optimized:{0,3})
 for(int initialVertex:{0,5446,5447})for(int initialIndex:{0,1048570,1048573})for(int count:{0,1,2,3,4,7}){
  reset();renderer.current.integer=mode;tess.declType=decl;tess.vertexCount=initialVertex;
  tess.indexCount=initialIndex+ordinary;tess.optimizedIndexCount=optimized;
  srfPoly_t poly={1,0,0,(unsigned short)count,vertices};
  bool flush=decl!=1&&(initialIndex+ordinary!=0||optimized!=0);
  int vc=flush?0:initialVertex,ic=flush?0:initialIndex+ordinary;
  bool overflow=vc+count>5450||ic+(count-2)*3>1048576;
  if(overflow)vc=ic=0;
  RB_TessPoly(&poly.surfaceType);
  assert(tess.declType==1&&ends==(int)flush&&overflows==(int)overflow&&!copies);
  int tris=count<3?0:count-2;assert(tess.vertexCount==vc+count&&tess.indexCount==ic+tris*3);
  assert(tess.optimizedIndexCount==(flush||overflow?0:optimized));
  for(int i=0;i<count;++i)checkVertex(vertices[i],vc+i,mode);
  for(int i=0;i<tris;++i){assert(primary[ic+i*3]==vc&&primary[ic+i*3+1]==vc+i+1&&primary[ic+i*3+2]==vc+i+2);}
  if(ic)assert(primary[ic-1]==0x5a5a);assert(primary[ic+tris*3]==0x5a5a&&secondary[0]==0x5a5a);
  int end=(vc+count)*(mode==2?32:68);if(end<(int)sizeof(tess.vertexData))assert((byte)tess.vertexData[end]==0x5a);
  if(vc)assert((byte)tess.vertexData[vc*(mode==2?32:68)-1]==0x5a);++cases;
 }
 for(int mutationMode:{1,2}){
  reset();renderer.current.integer=1;mutation=mutationMode;
  tess.declType=mutationMode==1?0:1;tess.indexCount=mutationMode==1?1:0;tess.vertexCount=mutationMode==2?5450:0;
  srfPoly_t poly={1,0,0,4,vertices};livePoly=&poly;RB_TessPoly(&poly.surfaceType);
  assert(renderer.current.integer==2&&tess.vertexCount==3&&tess.indexCount==3);
  for(int i=0;i<3;++i)checkVertex(alternate[i],i,2);++cases;
 }
 unsigned short input[16];for(int i=0;i<16;++i)input[i]=i*7+3;
 for(int pending:{0,2,1048568})for(int first:{-3,5,6})for(int verts:{0,7,8})for(int count:{0,3,8,9}){
  reset();tess.vertexCount=17;tess.indexCount=11;tess.declType=3;tess.optimizedIndexCount=pending;
  tess.firstOptimizedVertex=5;tess.optimizedVertexCount=7;
  srfTriangles_t triangles={6,{{0}},first,(unsigned short)verts,(unsigned short)count,(int (*)[4])input};
  bool overflow=(pending&&(first!=5||verts!=7))||pending+count>1048576;
  int ic=overflow?0:pending;RB_TessTriangles(&triangles.surfaceType);
  assert(!ends&&overflows==(int)overflow&&copies==1&&copyBytes==count*2&&copyIn==input&&copyOut==secondary+ic);
  assert(tess.optimizedVertexSource==1&&tess.optimizedIndexCount==ic+count&&tess.firstOptimizedVertex==first&&tess.optimizedVertexCount==verts);
  assert(tess.vertexCount==(overflow?0:17)&&tess.indexCount==(overflow?0:11)&&tess.declType==3);
  assert(!memcmp(secondary+ic,input,count*2));if(ic)assert(secondary[ic-1]==0x5a5a);assert(secondary[ic+count]==0x5a5a&&primary[0]==0x5a5a);++cases;
 }
 reset();srfTriangles_t triangles={6,{{0}},5,7,8,(int (*)[4])input};liveTriangles=&triangles;mutation=3;RB_TessTriangles(&triangles.surfaceType);
 assert(copies==1&&copyBytes==16&&tess.optimizedIndexCount==10&&tess.firstOptimizedVertex==-7&&tess.optimizedVertexCount==12);++cases;
 for(int count:{0,1,2,3,4,8})for(int pending:{0,6,1048560})for(int enabled:{0,1})for(int lm:{0,1}){
  reset();logging.current.integer=enabled;logMode=lm;tess.optimizedIndexCount=pending;tess.indexCount=17;tess.vertexCount=23;
  XSurface xs={0,11,(short)count,0};GfxStaticModelSurfaceCached cached={2};GfxStaticModelCachedSurface surface={{5,&xs},&cached,0};
  bool overflow=pending+count*3>1048576;int ic=overflow?0:pending;
  RB_TessStaticModelCached((surfaceType_t *)&surface);
  assert(overflows==(int)overflow&&!ends&&copies==1&&copyBytes==count*6&&copyIn==cachedIndices+12&&copyOut==secondary+ic);
  assert(tess.optimizedVertexSource==2&&tess.firstOptimizedVertex==0&&tess.optimizedVertexCount==65536&&tess.optimizedIndexCount==ic+count*3);
  assert(tess.indexCount==(overflow?0:17)&&tess.vertexCount==(overflow?0:23));
  assert(formats==enabled&&logs==(enabled&&!lm));if(logs)assert(logText=="--- RB_TessStaticModelCached( tess/test ) ---\n");
  assert(!memcmp(secondary+ic,cachedIndices+12,count*6));++cases;
 }
 reset();tess.optimizedIndexCount=1048576;XSurface xs={0,11,4,0};GfxStaticModelSurfaceCached cached={2};GfxStaticModelCachedSurface surface={{5,&xs},&cached,0};
 liveCached=&surface;mutation=4;RB_TessStaticModelCached((surfaceType_t *)&surface);
 assert(overflows==1&&copies==1&&copyBytes==24&&tess.optimizedIndexCount==12&&copyIn==cachedIndices+18);++cases;
 reset();xs.triCount=4;cached.baseVertIndex=2;mutation=5;RB_TessStaticModelCached((surfaceType_t *)&surface);assert(copies==1&&tess.optimizedIndexCount==12);++cases;
 printf("PASS: %d actual tessellation routes, DX7/DX9 vertex fields, fan winding, declaration/capacity flushes, live inputs and separate optimized counts\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
