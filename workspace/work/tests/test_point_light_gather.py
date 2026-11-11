"""Actual light selection, surface gathering, partition compaction and culling."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];light=(w/'src/gfx_d3d/r_light.cpp').read_text();dpvs=(w/'src/gfx_d3d/r_dpvs.cpp').read_text();math=(w/'src/universal/com_math.cpp').read_text()
helper=math[math.index('float PointToBoxDistSq('):math.index('\n/*\n==============\nAxisClear')]
u=(w/'src/gfx_d3d/r_utils.cpp').read_text();radius=u[u.index('// PINNED 1002c060/71:'):u.index('\n}\n', u.index('// PINNED 1002c060/71:')) + 3]
source=radius+light[light.index('// Point-light scene gathering.'):]+dpvs[dpvs.index('// PINNED 1000a840/129:'):dpvs.index('// Visibility-tree gathering.')]
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <vector>
#include <algorithm>
#include <limits>
#include <initializer_list>
#define __forceinline inline
typedef float vec_t;typedef float vec3_t[3];typedef unsigned char Bool;
#define VectorSubtract(a,b,c) do{for(int k=0;k<3;++k)(c)[k]=(a)[k]-(b)[k];}while(0)
struct GfxDrawSurf {unsigned sort,payload;}input[8],output[512];
struct GfxLight {void *def;float position[4],color[3];int unused[3];};
struct PointLightPartition {const GfxLight *light;int firstDrawSurf,drawSurfCount;};
struct DpvsPlane {float coeffs[4];int flags;};
struct {int dlightCount;GfxLight dlights[32];Bool dlightCulled[32];int drawSurfCount;GfxDrawSurf *drawSurfs;}scene;
struct {float viewOrg[3];}rg;
struct Frame {int drawSurfCount;}frame,*frontEndDataOut=&frame;
struct dvar_t {struct {int integer;}current;}limit;
const dvar_t *r_dlightLimit=&limit;
float boxes[8][6];int visits;bool replaceFrame;
const float *R_BoundsForDrawSurf(const GfxDrawSurf *s){++visits;if(replaceFrame)frontEndDataOut=&frame;return s->payload==7?0:boxes[s->payload];}
'''+helper+source+r'''
void reset(){memset(&scene,0,sizeof(scene));memset(&rg,0,sizeof(rg));memset(output,0,sizeof(output));frame.drawSurfCount=0;frontEndDataOut=&frame;scene.drawSurfs=output;visits=0;replaceFrame=false;limit.current.integer=32;for(int i=0;i<8;++i){input[i]={(unsigned)(70+i),(unsigned)i};for(int k=0;k<3;++k){boxes[i][k]=i*3;boxes[i][k+3]=i*3+1;}}}
int main(){int cases=0;
 for(int n:{-2,0,1,8})for(float radius:{0.0f,1.0f,100.0f,std::numeric_limits<float>::quiet_NaN()}){reset();float origin[3]={0,0,0};R_AddPointLightSurfaces(origin,radius,input,n);std::vector<unsigned>expected;for(int i=n-1;i>=0;--i)if(i!=7&&PointToBoxDistSq(origin,boxes[i],boxes[i]+3)<=radius*radius)expected.push_back(i);assert(scene.drawSurfCount==(int)expected.size()&&frame.drawSurfCount==scene.drawSurfCount);for(unsigned i=0;i<expected.size();++i)assert(output[i].payload==expected[i]);assert(visits==(n>0?n:0));++cases;}
 for(int n=0;n<=32;++n)for(int wanted=0;wanted<=n;++wanted){reset();const GfxLight *selected[32];for(int i=0;i<n;++i){scene.dlights[i].position[0]=(float)(n-i);scene.dlights[i].position[3]=1;selected[i]=&scene.dlights[i];}if(wanted<n)R_SelectPointLights(selected,n,wanted);for(int i=0;i<wanted;++i)for(int j=wanted;j<n;++j)assert(selected[i]->position[0]<=selected[j]->position[0]);++cases;}
 for(int n:{0,1,4,32})for(int cap:{0,1,3,32})for(int hide=0;hide<2;++hide){reset();scene.dlightCount=n;limit.current.integer=cap;for(int i=0;i<n;++i){scene.dlights[i].position[0]=(float)i;scene.dlights[i].position[3]=100;scene.dlightCulled[i]=hide&&(i&1);}PointLightPartition parts[33];memset(parts,0xcd,sizeof(parts));int live=hide?(n+1)/2:n;int expect=std::min(3,std::min(cap,live));int result=R_GetPointLightPartitions(input,2,parts,3);assert(result==expect&&scene.drawSurfCount==expect*2&&frame.drawSurfCount==expect*2);for(int i=0;i<result;++i){assert(parts[i].drawSurfCount==2&&parts[i].firstDrawSurf==i*2);assert(output[i*2].payload==1&&output[i*2+1].payload==0);}++cases;}
 reset();scene.dlightCount=2;scene.dlights[0].position[0]=100;scene.dlights[0].position[3]=0;scene.dlights[1].position[3]=2;PointLightPartition compact[2];assert(R_GetPointLightPartitions(input,1,compact,2)==1&&compact[0].light==&scene.dlights[1]&&compact[0].firstDrawSurf==0);++cases;
 reset();GfxLight a={},b={};a.position[0]=b.position[0]=2;a.position[3]=b.position[3]=1;assert(R_PointLightRanksBefore(&a,&b));b.position[0]=std::numeric_limits<float>::quiet_NaN();assert(!R_PointLightRanksBefore(&a,&b)&&!R_PointLightRanksBefore(&b,&a));++cases;
 for(float x:{-2.0f,-1.0f,0.0f,2.0f,std::numeric_limits<float>::quiet_NaN()})for(int n:{-1,0,1,2}){reset();scene.dlightCount=1;scene.dlights[0].position[0]=x;scene.dlights[0].position[3]=1;DpvsPlane planes[2]={{{1,0,0,0},0},{{-1,0,0,0},0}};R_CullSceneLights(planes,n);assert(scene.dlightCulled[0]==(n>0&&(x<-1||(n>1&&x>1))));++cases;}
 printf("PASS: %d actual light gather/selection/cull cases, limits, empty compaction, reverse draws and FP boundaries\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_light_gather_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)
