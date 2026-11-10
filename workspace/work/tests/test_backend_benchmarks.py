"""Actual benchmark source: captured counts, timer math and retail setup quirks."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/rb_backend.cpp').read_text();source=s[s.index('// GPU fill and transform benchmarks.'):s.index('// Render-command execution.')]
import sys;sys.path.insert(0,str(w/'tools'));from retail_order import items
seconds=next(c[1] for c in items(s) if c[0]=='fn' and 'double RB_BenchmarkSeconds(' in c[1])
program=r'''
#include <cassert>
#include <cmath>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <vector>
#include <string>
#include <initializer_list>
typedef unsigned char Bool;typedef float vec3_t[3];typedef unsigned GfxColor;typedef long long __int64;struct LARGE_INTEGER {long long QuadPart;};
struct D3DMATRIX {float m[4][4];};struct Material {int id;} material={1},absent={0};struct GfxEntity{};
struct {struct Matrix {D3DMATRIX matrix[4];};struct Stack {Matrix world,projection;}codeMatrixStack[3];int codeMatrixStackLevel;int worldEntityReType;GfxEntity *currentEntity;void *currentEntityLighting;float codeConsts[59][4];}backEnd;
struct {int vertexCount,indexCount;unsigned short *indices;}tess;unsigned short indexStore[0x4000];
struct dvar_t {union {Bool enabled;int integer;}current;}fill,enable,transform;const dvar_t *r_testFill=&fill,*r_testFillEnable=&enable,*r_testTransform=&transform;
struct {bool stencilTwoSided;}dx;struct {int renderTargetWidth,renderTargetHeight;}dxState;
struct {Material *whiteMaterial,*normalFillMaterial,*alphaBlendFillMaterial,*alphaTestPassFillMaterial,*alphaTestFailFillMaterial,*additiveFillMaterial,*depthOnlyFillMaterial,*stencilOneSideKeepFillMaterial,*stencilOneSideRejectFillMaterial,*stencilTwoSideKeepFillMaterial,*stencilTwoSideRejectFillMaterial,*phongBumpFillMaterial,*phongBumpSpecFillMaterial;}rgp;
const float identityMatrix44[4][4]={{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};
int begins,ends,draws,vertices,sets,pushes,pops,timed,mutation,capturedCount;float lastWidth,lastHeight;std::vector<float>coords;std::vector<std::string>labels;std::vector<double>values;
Bool Material_IsDefault(const Material *m){return m->id==0;}
void RB_BeginBenchmarkGpu(LARGE_INTEGER *t){++begins;t->QuadPart=100;if(mutation)fill.current.integer=1;capturedCount=tess.indexCount;}
void RB_EndBenchmarkGpu(LARGE_INTEGER *t){++ends;t->QuadPart=200;}
void QueryPerformanceFrequency(LARGE_INTEGER *t){t->QuadPart=1000;++timed;}
void RB_DrawStretchPic(const Material*m,float x,float y,float width,float height,float s,float t,float u,float v,unsigned color){assert(m==&material&&x==0&&y==0&&s==0&&t==0&&u==1&&v==1&&color==0xffffffff);++draws;lastWidth=width;lastHeight=height;}
void RB_EndSurface(){}
void MatrixForViewer(float m[4][4],const vec3_t origin,const vec3_t axis[3]){assert(origin[0]==0&&origin[1]==0&&origin[2]==0);for(int i=0;i<3;++i)for(int j=0;j<3;++j)assert(axis[i][j]==float(i==j));memset(m,0,64);m[0][0]=2;}
void InfinitePerspectiveMatrix(float m[4][4],float x,float y,float z){assert(x==90&&y==90&&fabsf(z-.9f)<1e-6f);memset(m,0,64);m[0][0]=3;}
void RB_Set3D(){++sets;}void RB_PushMatrixStack(){++pushes;++backEnd.codeMatrixStackLevel;}void RB_PopMatrixStack(){++pops;--backEnd.codeMatrixStackLevel;}
void RB_ChangedWorldMatrix(float scale){assert(scale==1&&!memcmp(&backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0],identityMatrix44,64));}
void RB_SetViewMatrix(const D3DMATRIX *m){assert(m->m[0][0]==2);}
void RB_ProjectionMatrixChanged(){assert(backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0].m[0][0]==3);}
void RB_SetCodeConstant(int i,float x,float y,float z,float v){backEnd.codeConsts[i][0]=x;backEnd.codeConsts[i][1]=y;backEnd.codeConsts[i][2]=z;backEnd.codeConsts[i][3]=v;}
void RB_BeginSurface(const Material *m,int technique,int lightmap){assert(m==&material&&(technique==9||technique==18)&&lightmap==0);}
void RB_SetVertex3D(int index,float x,float y,float z,float s,float t,const unsigned*color){assert(index==0&&*color==0xffffffff);++vertices;coords.insert(coords.end(),{x,y,z,s,t});}
void print(int channel,const char *fmt,...){assert(channel==0);labels.push_back(fmt);if(strchr(fmt,'%')){va_list a;va_start(a,fmt);values.push_back(va_arg(a,double));va_end(a);}}
struct {void(*Printf)(int,const char*,...);}ri={print};
'''+seconds+source+r'''
void reset(){memset(&backEnd,0,sizeof(backEnd));memset(&tess,0,sizeof(tess));memset(indexStore,0x5a,sizeof(indexStore));tess.indices=indexStore;begins=ends=draws=vertices=sets=pushes=pops=timed=mutation=0;coords.clear();labels.clear();values.clear();fill.current.integer=3;enable.current.enabled=1;dx.stencilTwoSided=0;dxState.renderTargetWidth=640;dxState.renderTargetHeight=480;
 rgp.whiteMaterial=rgp.normalFillMaterial=rgp.alphaBlendFillMaterial=rgp.alphaTestPassFillMaterial=rgp.alphaTestFailFillMaterial=rgp.additiveFillMaterial=rgp.depthOnlyFillMaterial=rgp.stencilOneSideKeepFillMaterial=rgp.stencilOneSideRejectFillMaterial=rgp.stencilTwoSideKeepFillMaterial=rgp.stencilTwoSideRejectFillMaterial=rgp.phongBumpFillMaterial=rgp.phongBumpSpecFillMaterial=&material;
}
int main(){int cases=0;
 for(int count:{-1,0,1,3})for(bool missing:{false,true}){reset();double result=RB_Benchmark2D(missing?&absent:&material,320,200,count);assert(begins==!missing&&ends==!missing&&timed==!missing&&draws==(!missing&&count>0?count:0));assert(fabs(result-(missing?0:count*10))<1e-8);if(draws)assert(lastWidth==320&&lastHeight==200);++cases;}
 for(int count:{0,1,3,500})for(int change:{0,1})for(int technique:{9,18}){reset();fill.current.integer=count;mutation=change;float result=RB_Benchmark3D(&material,technique);assert(vertices==4&&sets==1&&pushes==1&&pops==1&&backEnd.codeMatrixStackLevel==0&&begins==1&&ends==1&&capturedCount==count*6);assert(fabsf(result-float(count/6.0))<1e-4f);assert(coords==std::vector<float>({1,1,1,0,0,1,-1,1,1,0,1,-1,-1,1,1,1,1,-1,0,1}));unsigned short winding[]={3,0,2,2,0,1};for(int i=0;i<count*6;++i)assert(indexStore[i]==winding[i%6]);assert(indexStore[count*6]==0x5a5a);++cases;}
 reset();enable.current.enabled=0;RB_TestFill();assert(labels.size()==2&&values.empty()&&draws==0);++cases;
 for(bool stencil:{false,true}){reset();dx.stencilTwoSided=stencil;RB_TestFill();assert(values.size()==unsigned(stencil?14:12));assert(labels.front()==labels.back()&&vertices==16);++cases;}
 reset();RB_TestTransform();assert(draws==1362&&lastWidth==0&&lastHeight==0&&values.size()==6);for(int i=0;i<4;++i)assert(values[i]==0);assert(fabs(values[4]-values[5]*2)<1e-3);++cases;
 printf("PASS: %d actual benchmark cases, default aliases, timer/count capture, vertex-zero setup, winding/guards and original reports\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_benchmarks_') as d:
 b=str(Path(d)/'test');subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',b],input=program,text=True,check=True);subprocess.run([b],check=True)
