"""Actual cached/uncached skinned submission and the existing index copier."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_tess.cpp').read_text()
source=text[text.index('// PINNED PC skinned-model submission, 10041140..100413b5.'):text.index('// PINNED PC particle-cloud submission, 10040ca0..10041024.')]
text=(work/'src/gfx_d3d/r_xsurface.cpp').read_text()
a=text.index('void XSurfaceGetTris(',text.index('// PC 1.0 takes'))
copier=text[a:text.index('XVertexInfo *XSurfaceGetVertexInfoArray(',a)]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef unsigned short r_index_t;typedef int surfaceType_t;
struct IDirect3DVertexBuffer9 {int id;} vb={1},oldVb={2},alternateVb={3};
struct IDirect3DIndexBuffer9 {int id;} ib={1},oldIb={2};
struct XSurface {byte mode;short vertCount,triCount,boneOffset;int (*triIndices)[4];void *verts;struct {IDirect3DVertexBuffer9 *vb;} surfRigid;IDirect3DIndexBuffer9 *indexBuffer;};
struct GfxModelSurface {int type;XSurface *xsurf;};
struct GfxModelSkinnedSurface {GfxModelSurface surf;int skinnedCachedOffset;union {void *variant;} skinnedVert;};
struct r_vb_state_t {int used,total;IDirect3DVertexBuffer9 *buffer;} pool={0,10000,&vb},alternatePool={0,20000,&alternateVb};
struct GfxBackEndData {byte before[0x217c78];r_vb_state_t *skinnedCacheVb;} data={ {},&pool },alternateData={ {},&alternatePool };
GfxBackEndData *backEndData=&data;
struct Material {struct {const char *name;} info;} material={{"skinned/test"}};
#include "'''+str(work/'src/gfx_d3d/rb_tess.h')+r'''"
GfxTess tess;
r_index_t indices[0x100010],alternateIndices[0x100010],triangles[32];
byte vertices[1024],alternateVertices[1024];
struct {IDirect3DIndexBuffer9 *indexBuffer;struct {IDirect3DVertexBuffer9 *vb;int offset,stride;} streams[1];} dxState;
struct GfxDrawPrimArgs {int firstVertexFromBase,vertexCount,primCount;union {struct {int baseVertex,baseIndex;} buf;} u;};
struct dvar_t {struct {int integer;} current;} renderer,logging;
const dvar_t *r_rendererInUse=&renderer,*r_logFile=&logging;
int ends,overflows,formats,logs,indexBinds,vertexBinds,draws,copies,copyBytes,mutation,boundStride;
GfxDrawPrimArgs drawn;std::string logText;std::vector<int> events;
GfxModelSkinnedSurface *live;void *copyOut;const void *copyIn;
void RB_EndSurface(){++ends;events.push_back(1);tess.indexCount=tess.vertexCount=tess.optimizedIndexCount=0;}
void RB_TessOverflow(){++overflows;events.push_back(2);tess.indexCount=tess.vertexCount=tess.optimizedIndexCount=0;
 if(mutation==3&&overflows==1)tess.indexCount=1;
 if(mutation==4)live->skinnedVert.variant=alternateVertices;}
char *va(const char *format,...){static char text[128];++formats;events.push_back(3);va_list args;va_start(args,format);vsnprintf(text,sizeof(text),format,args);va_end(args);if(mutation==1)logging.current.integer=0;return text;}
void RB_LogPrint(const char *text){if(logging.current.integer){++logs;logText=text;}}
void RB_ChangeIndices(IDirect3DIndexBuffer9 *buffer){assert(buffer==&ib);++indexBinds;events.push_back(4);dxState.indexBuffer=buffer;
 if(mutation==2){backEndData=&alternateData;renderer.current.integer=3;live->skinnedCachedOffset=999;live->surf.xsurf->vertCount=99;}}
void RB_ChangeStreamSource(int stream,IDirect3DVertexBuffer9 *buffer,int offset,int stride){
 assert(stream==0&&!offset&&buffer==(mutation==2?&alternateVb:&vb));++vertexBinds;events.push_back(5);boundStride=stride;dxState.streams[0]={buffer,offset,stride};}
void RB_DrawTechnique(int declaration,const GfxDrawPrimArgs *args){assert(declaration==0);++draws;events.push_back(6);drawn=*args;}
extern "C" void Com_Memcpy(void *out,const void *in,int count){++copies;events.push_back(7);copyBytes=count;copyOut=out;copyIn=in;memcpy(out,in,count);
 if(mutation==5){tess.vertexCount=5;tess.indexCount=8;tess.indices=alternateIndices;}}
'''+source+copier+r'''
XSurface xs;GfxModelSkinnedSurface surface;
void reset(){
 memset(&tess,0x5a,sizeof(tess));memset(indices,0x5a,sizeof(indices));memset(alternateIndices,0x5a,sizeof(alternateIndices));
 tess.indices=indices;tess.indexCount=tess.vertexCount=tess.optimizedIndexCount=0;tess.material=&material;tess.declType=0;
 xs={0,4,2,0,(int (*)[4])triangles,0,{0},&ib};surface={{3,&xs},0,{vertices}};
 for(int i=0;i<32;++i)triangles[i]=i%4;
 for(int i=0;i<1024;++i){vertices[i]=(byte)(i*7);alternateVertices[i]=vertices[i]^0xff;}
 ends=overflows=formats=logs=indexBinds=vertexBinds=draws=copies=copyBytes=mutation=boundStride=0;events.clear();logText.clear();live=&surface;
 backEndData=&data;renderer.current.integer=1;logging.current.integer=0;dxState.indexBuffer=&ib;dxState.streams[0]={&vb,0,64};copyOut=0;copyIn=0;
}
int main(){
 int cases=0;
 for(int mode:{1,2,3})for(int ordinary:{0,3})for(int optimized:{0,6})for(int enabled:{0,1})for(int ibChanged:{0,1})
 for(int vbChanged:{0,1,2,3})for(int offset:{0,65,129,300}){
  reset();renderer.current.integer=mode;tess.indexCount=ordinary;tess.optimizedIndexCount=optimized;logging.current.integer=enabled;
  int stride=mode==2?36:64;surface.skinnedCachedOffset=offset;dxState.indexBuffer=ibChanged?&oldIb:&ib;
  dxState.streams[0]={vbChanged==1?&oldVb:&vb,vbChanged==2?4:0,stride+(vbChanged==3?4:0)};
  RB_TessXModelSkinned((surfaceType_t *)&surface);
  assert(ends==(ordinary!=0||optimized!=0)&&!overflows&&!copies&&formats==enabled&&logs==enabled&&indexBinds==ibChanged&&vertexBinds==(vbChanged!=0)&&draws==1);
  assert(drawn.firstVertexFromBase==0&&drawn.vertexCount==4&&drawn.primCount==2&&drawn.u.buf.baseIndex==0&&drawn.u.buf.baseVertex==offset/stride);
  if(enabled)assert(logText=="--- RB_TessXModelSkinnedCached( skinned/test ) ---\n");++cases;
 }
 for(int mode:{1,2,3})for(int initialVertex:{0,3,5446,5447})for(int initialIndex:{0,2,3,1048572,1048573})for(int vc:{4,8})for(int tc:{2,4})for(int cache:{-1,-17}){
  reset();renderer.current.integer=mode;surface.skinnedCachedOffset=cache;xs.vertCount=vc;xs.triCount=tc;
  tess.vertexCount=initialVertex;tess.indexCount=initialIndex;tess.optimizedIndexCount=9;
  bool overflow=initialVertex+vc>5450||initialIndex+tc*3>1048576||(initialIndex&1);
  int base=overflow?0:initialVertex,ic=overflow?0:initialIndex,stride=mode==2?36:64;
  RB_TessXModelSkinned((surfaceType_t *)&surface);
  assert(!ends&&overflows==(int)overflow&&!indexBinds&&!vertexBinds&&!draws&&copies==1&&copyBytes==vc*stride&&copyOut==tess.vertexData+base*stride&&copyIn==vertices);
  assert(tess.vertexCount==base+vc&&tess.indexCount==ic+tc*3&&tess.optimizedIndexCount==(overflow?0:9)&&tess.declType==0);
  assert(!memcmp(tess.vertexData+base*stride,vertices,vc*stride));if(base)assert((byte)tess.vertexData[base*stride-1]==0x5a);assert((byte)tess.vertexData[(base+vc)*stride]==0x5a);
  for(int i=0;i<tc*3;++i)assert(indices[ic+i]==triangles[i]+base);
  if(ic)assert(indices[ic-1]==0x5a5a);assert(indices[ic+tc*3]==0x5a5a);++cases;
 }
 reset();surface.skinnedCachedOffset=72;renderer.current.integer=2;dxState.indexBuffer=&oldIb;dxState.streams[0].vb=&oldVb;mutation=2;
 RB_TessXModelSkinned((surfaceType_t *)&surface);assert(drawn.u.buf.baseVertex==2&&drawn.vertexCount==4&&boundStride==36&&dxState.streams[0].vb==&alternateVb);++cases;
 reset();surface.skinnedCachedOffset=-1;tess.vertexCount=5450;mutation=3;RB_TessXModelSkinned((surfaceType_t *)&surface);assert(overflows==2&&tess.indexCount==6);++cases;
 reset();surface.skinnedCachedOffset=-1;tess.vertexCount=5450;mutation=4;RB_TessXModelSkinned((surfaceType_t *)&surface);assert(copyIn==alternateVertices&&!memcmp(tess.vertexData,alternateVertices,256));++cases;
 reset();surface.skinnedCachedOffset=-1;tess.vertexCount=3;mutation=5;RB_TessXModelSkinned((surfaceType_t *)&surface);
 assert(tess.vertexCount==9&&tess.indexCount==14&&copyOut==tess.vertexData+3*64);for(int i=0;i<6;++i)assert(alternateIndices[8+i]==triangles[i]+3);++cases;
 for(int cache:{-1,0}){reset();surface.skinnedCachedOffset=cache;logging.current.integer=1;mutation=1;RB_TessXModelSkinned((surfaceType_t *)&surface);assert(formats==1&&!logs);++cases;}
 reset();GfxTess before=tess;RB_TessBad(0);assert(!memcmp(&before,&tess,sizeof(tess))&&events.empty());++cases;
 printf("PASS: %d actual skinned routes, signed cache dispatch, live VB binding, stride capture, vertex bits, padded index rebasing, parity/capacity flush and count publication\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)
