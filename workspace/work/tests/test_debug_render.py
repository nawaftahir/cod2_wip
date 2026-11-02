"""Actual debug drawing: geometry, BGRA truncation, batching, text and frame ownership."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1]
s=(w/'src/gfx_d3d/rb_debug.cpp').read_text();source=s[s.index('typedef char debugDrawLayoutCheck'):]
def record(text,name):
 a=text.index('struct '+name+' {');return text[a:text.index('\n};',a)+3]
common=(w.parent/'src/opencod2/headers/cod2_defs.h').read_text();pc=(w.parent/'src/opencod2/headers/PC/gfx_d3d/rb_backend.h').read_text()
records='\n'.join(record(pc,n) for n in ('GfxDebugPlume','GfxDebugPoly','trDebugLine_t','trDebugString_t','GfxPointVertex','GfxVertex','GfxVertexDx7'))+record(common,'DebugGlobals')
tess=(w/'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
program=r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstddef>
#include <cstdlib>
#include <cstdarg>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef float vec3_t[3];typedef float vec4_t[4];typedef float vec2_t[2];typedef int qboolean;
union GfxColor {unsigned packed;byte array[4];};struct Material {int id;} white;struct Font_s{} font;
'''+records+tess+r'''
struct GfxViewParms {float origin[3],axis[3][3];} view;
struct GfxBackEndData {byte before[0x249d18];DebugGlobals debugGlobals;} frames[2];GfxBackEndData *backEndData;
struct {bool projection2D;GfxViewParms *viewParms;void *debugFont;struct {int time;}sceneDef;}backEnd;
struct {Material *whiteMaterial;}rgp;
struct dvar_t {struct {int integer;}current;}renderer;const dvar_t *r_rendererInUse=&renderer;
GfxTess tess;unsigned short indices[0x100010];vec3_t polyPoints[4]={{1,2,3},{4,5,6},{7,8,9},{10,11,12}};
GfxDebugPoly poly;trDebugLine_t lines[1400];trDebugString_t strings[2];GfxDebugPlume plumes[3];
struct Batch {int count;bool depth;std::vector<GfxPointVertex>v;};std::vector<Batch>batches;
int allocs,frees,sets,ends,begins,overflows,textCalls,addStrings,mutation;bool resetCounts;float seenPosition[3],seenColor[4];unsigned seenTextColor;float seenX[3],seenY[3];
void *allocate(int size){assert(size==0xaa50);++allocs;return malloc(size);}void release(void *p){++frees;free(p);}
struct {void *(*Z_MallocInternal)(int);void (*Z_FreeInternal)(void*);}ri={allocate,release};
void RB_Set3D(){++sets;backEnd.projection2D=false;}
void RB_EndSurface(){++ends;if(resetCounts)tess.indexCount=tess.optimizedIndexCount=tess.vertexCount=0;}
void RB_BeginSurface(const Material *m,int t,int l){assert(m==&white&&t==3&&l==0);++begins;}
void RB_TessOverflow(){++overflows;tess.indexCount=tess.vertexCount=0;}
void RB_DrawLines3D(int count,int width,const GfxPointVertex *v,bool depth){assert(width==1);batches.push_back({count,depth,std::vector<GfxPointVertex>(v,v+count*2)});if(mutation==1)backEndData=frames+1;}
void RB_DrawTextInSpace(const char*,Font_s *f,const float*,const float *x,const float*y,unsigned color){assert(f==&font);++textCalls;seenTextColor=color;memcpy(seenX,x,12);memcpy(seenY,y,12);tess.indexCount=3;if(mutation==2)backEndData=frames+1;}
char *va(const char *format,...){assert(!strcmp(format,"%i"));static char buf[32];va_list a;va_start(a,format);snprintf(buf,sizeof(buf),format,va_arg(a,int));va_end(a);return buf;}
void R_AddDebugString(DebugGlobals *d,const float *origin,const float *color,float scale,const char *text){assert(d==&backEndData->debugGlobals&&scale==.5f&&atoi(text)==plumes[0].score);++addStrings;memcpy(seenPosition,origin,12);memcpy(seenColor,color,16);}
#define VectorSet(v,a,b,c) ((v)[0]=(a),(v)[1]=(b),(v)[2]=(c))
#define Vector2Set(v,a,b) ((v)[0]=(a),(v)[1]=(b))
'''+source+r'''
void reset(int mode){memset(frames,0,sizeof(frames));memset(&backEnd,0,sizeof(backEnd));memset(&tess,0,sizeof(tess));memset(tess.vertexData,0x5a,sizeof(tess.vertexData));memset(indices,0x5a,sizeof(indices));memset(lines,0,sizeof(lines));memset(strings,0,sizeof(strings));memset(plumes,0,sizeof(plumes));backEndData=frames;backEnd.viewParms=&view;backEnd.debugFont=&font;backEnd.sceneDef.time=100;view.axis[1][0]=1;view.axis[1][1]=2;view.axis[1][2]=3;view.axis[2][0]=4;view.axis[2][1]=5;view.axis[2][2]=6;rgp.whiteMaterial=&white;renderer.current.integer=mode;tess.indices=indices;allocs=frees=sets=ends=begins=overflows=textCalls=addStrings=mutation=0;resetCounts=false;batches.clear();}
bool near(float a,float b){return a==b||fabsf(a-b)<1e-5f*(1+fabsf(b));}
int main(){int cases=0;float color[]={.25f,.5f,.75f,1};float p[]={1,2,3},q[]={4,5,6};
 for(bool colored:{false,true})for(int base:{0,2,4}){reset(3);GfxPointVertex v[8];memset(v,0x5a,sizeof(v));int n=RB_AddDebugLine(p,q,colored?color:0,true,base,4,v);assert(n==(base==4?2:base+2));int at=n-2;assert(!memcmp(v[at].xyz,p,12)&&!memcmp(v[at+1].xyz,q,12));unsigned packed;memcpy(&packed,v[at].color,4);assert(packed==(colored?0xff3f7fbfu:0xffffffffu)&&!memcmp(v[at].color,v[at+1].color,4));assert(batches.size()==(base==4?1u:0u));++cases;}
 for(int mode:{2,3})for(int index:{0,3,100}){reset(mode);RB_SetDebugVertex(index,p,0xff010203);int stride=mode==2?36:64;const byte *v=(byte*)tess.vertexData+stride*index;assert(!memcmp(v,p,12));if(mode==2){auto*x=(GfxVertexDx7*)v;assert(x->normal[2]==1&&x->color.packed==0xff010203&&x->texCoord[0]==0);}else{auto*x=(GfxVertex*)v;assert(x->xyzw[3]==1&&x->binormal[1]==1&&x->tangent[0]==1&&x->color.packed==0xff010203);}assert(v[stride]==0x5a);++cases;}
 for(int mode:{2,3})for(int count:{0,1,2,3,4})for(int base:{0,5449}){reset(mode);memcpy(poly.color,color,16);poly.firstVert=0;poly.vertCount=count;backEndData->debugGlobals.polys=&poly;backEndData->debugGlobals.polyCount=1;backEndData->debugGlobals.verts=polyPoints;tess.vertexCount=base;RB_DrawPolyInteriors();int overflow=count+base>5450;int start=overflow?0:base;assert(overflows==overflow&&begins==1&&ends==1&&tess.vertexCount==start+count&&tess.indexCount==(count>2?(count-2)*3:0));for(int i=2;i<count;++i){int at=(i-2)*3;assert(indices[at]==start&&indices[at+1]==start+i&&indices[at+2]==start+i-1);}++cases;}
 for(int count:{0,1,2,4}){reset(3);poly.firstVert=0;poly.vertCount=count;backEndData->debugGlobals.polys=&poly;backEndData->debugGlobals.polyCount=1;backEndData->debugGlobals.verts=polyPoints;RB_DrawPolyOutlines();assert(allocs==1&&frees==1&&batches.size()==(count?1u:0u));if(count){assert(batches[0].count==count&&!batches[0].depth);for(auto&v:batches[0].v)for(byte c:v.color)assert(c==255);}++cases;}
 for(int count:{-1,0,1,4,1400})for(bool alternate:{false,true}){reset(3);backEnd.projection2D=true;for(int i=0;i<1400;++i){memcpy(lines[i].start,p,12);memcpy(lines[i].end,q,12);memcpy(lines[i].color,color,16);lines[i].depthTest=alternate?i%2:1;}RB_DrawDebugLines(lines,count);assert(sets==int(count!=0)&&allocs==int(count!=0)&&frees==allocs);int total=0;for(auto &b:batches)total+=b.count;assert(total==(count>0?count:0));if(count==4&&alternate)assert(batches.size()==4);if(count==1400&&!alternate)assert(batches.size()==2&&batches[0].count==1362);++cases;}
 for(int count:{-1,0,1,2}){reset(3);backEnd.projection2D=true;for(auto &str:strings){memcpy(str.color,color,16);str.scale=.5f;}RB_DrawDebugStrings(strings,count);assert(sets==int(count!=0)&&textCalls==(count>0?count:0));if(count>0){assert(seenTextColor==0xff3f7fbfu&&seenX[1]==-1&&seenY[2]==-3&&ends==1);}++cases;}
 for(int elapsed:{-1,0,50,51,100,101}){reset(3);plumes[0].startTime=100-elapsed;plumes[0].duration=100;plumes[0].score=77;plumes[0].origin[0]=10;plumes[0].origin[1]=20;plumes[0].origin[2]=30;backEndData->debugGlobals.plumes=plumes;backEndData->debugGlobals.plumeCount=1;RB_DrawDebugPlumes(&view);bool active=elapsed>=0&&elapsed<=100;assert(addStrings==int(active));if(active){double shift=sin((double)elapsed*0.012566371f)*4;assert(near(seenPosition[0],shift+10)&&near(seenPosition[2],shift*3+30+(double)elapsed*.064f));assert(near(seenColor[3],elapsed>50?2.0f-float(elapsed*2)/100:1.0f));}++cases;}
 reset(3);memcpy(lines[0].color,color,16);frames[0].debugGlobals.lines=lines;frames[0].debugGlobals.lineCount=1;frames[1].debugGlobals.lines=lines;frames[1].debugGlobals.lineCount=5;mutation=1;RB_DrawDebug(&view);assert(frames[0].debugGlobals.lineCount==1&&frames[1].debugGlobals.lineCount==0);++cases;
 printf("PASS: %d actual debug drawing cases, vertex formats/fans/guards, white outlines, depth/capacity batches, signed counts, BGRA truncation, plume timing and live frame ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_render_') as d:
 b=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True);subprocess.run([b],check=True)
