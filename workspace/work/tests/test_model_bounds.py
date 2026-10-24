"""Run the actual model cohort with recording engine imports and corner oracles."""
from pathlib import Path
import re
import subprocess
import tempfile
from fragment import fragment

root = Path(__file__).resolve().parent.parent / 'src'
source = fragment('gfx_d3d/r_model_bounds.cpp')
math_header = (root / 'universal/com_math.h').read_text()
math_source = (root / 'universal/com_math.cpp').read_text()
anim_header = (root / 'xanim/xanim_public.h').read_text()


def function(text, token):
    name = token.split()[-1].removesuffix('(')
    matches = list(re.finditer(r'(?m)^(?:(?:TU_STATIC|static|inline)\s+)*(?:void|int|float|vec_t)\s+'
                              + re.escape(name) + r'\s*\(', text))
    assert len(matches) == 1, (name, len(matches))
    start = matches[0].start()
    brace = text.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end].replace('TU_STATIC', 'static inline') + '\n'


program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <algorithm>
#include <vector>
typedef unsigned char byte;
typedef float vec_t,vec3_t[3],vec4_t[4];
int FloatAsInt(float x) { int result;std::memcpy(&result,&x,4);return result; }
struct DObj { int id; } object={1},defaultObject={2};
struct XModel { int id; } model={3};
struct centity_s { int id; } pose;
struct DObjAnimMat { float quat[4],trans[3],transWeight; } bones[128];
struct XBoneInfo { vec3_t bounds[2]; } infos[128];
struct DSurface_s { short modelIndex,subMatIndex; };
struct GfxEntity { int reType;float axis[3][3],scale,origin[3]; };
struct GfxSceneEntity {
 union { const DObj *obj;const XModel *model; } u;
 const centity_s *cent;volatile int cullState;float curMins[3],curMaxs[3];
};
struct trDebugLine_t { float start[3],end[3],color[4];int depthTest; };
struct DebugGlobals { trDebugLine_t *lines;int lineCount,lineLimit; };
struct GfxBackEndData { DebugGlobals debugGlobals; } data;
GfxBackEndData *frontEndDataOut=&data;
struct { DObj *modelDObj;struct { float origin[3],scale,bias; } lodParms; } rg;
struct { struct { int integer; } current; } developerValue;
const decltype(developerValue) *developer=&developerValue;
const vec3_t vec3_origin={0,0,0};
int active[4],modelCount,surfaceCount,boneCount,poseCalls,modelCalls,casCalls;
bool bad,noBones,busy;
std::vector<float> distances;
std::vector<void *> allocations;
void *allocate(int bytes) { void *p=std::calloc(1,bytes);assert(p);allocations.push_back(p);return p; }
int getModelCount(const DObj *) { return modelCount; }
int getLod(const DObj *,int index,float distance) { distances.push_back(distance);return index+1; }
int getSurfaces(const DObj *,DSurface_s *,int *parts,char *lods) {
 for(int i=0;i<modelCount;++i)assert(lods[i]==i+1);
 std::memcpy(parts,active,sizeof(active));return surfaceCount;
}
void calcPose(const centity_s *context,const DObj *,int *parts) {
 assert(context==&pose&&!std::memcmp(parts,active,sizeof(active)));++poseCalls;
}
int getBoneCount(const DObj *) { return boneCount; }
void getBoneInfo(const DObj *,XBoneInfo **out) { for(int i=0;i<128;++i)out[i]=&infos[i]; }
DObjAnimMat *getBoneMatrix(const DObj *) { return noBones?0:bones; }
int isBad(const DObj *) { return bad; }
void setModel(DObj *obj,const XModel *m) { assert(obj==&defaultObject&&m==&model);++modelCalls; }
struct {
 void (*slot139)();int (*DObjGetNumModels)(const DObj *);
 int (*DObjGetLodForDist)(const DObj *,int,float);
 int (*DObjGetSurfaceList)(const DObj *,DSurface_s *,int *,char *);
 int (*DObjNumBones)(const DObj *);
 void (*DObjGetBoneInfo)(const DObj *,XBoneInfo **);
 DObjAnimMat *(*DObjGetRotTransArray)(const DObj *);
 void *(*Z_MallocInternal)(int);int (*DObjBad)(const DObj *);
 void (*DObjSetModel)(DObj *,const XModel *);
} ri={(void(*)())calcPose,getModelCount,getLod,getSurfaces,getBoneCount,getBoneInfo,getBoneMatrix,allocate,isBad,setModel};
long InterlockedCompareExchange(long volatile *pointer,long exchange,long comparand) {
 ++casCalls;
 // The production member is a Win32 long; this host adapter only accesses its four bytes.
 volatile int *word=(volatile int *)pointer;
 if(busy){*word=2;return 1;}
 int old=*word;if(old==comparand)*word=(int)exchange;return old;
}
'''
for name in ('I_sel', 'I_sqrt', 'VectorCopy', 'VectorCopy4', 'VectorScale',
             'VectorAdd', 'VectorSubtract', 'DotProduct', 'VectorLength', 'VectorSet'):
    program += function(math_header, name + '(')
for name in ('Vec3Distance', 'ClearBounds', 'MatrixTransformVector', 'TransformBounds'):
    program += function(math_source, name + '(')
program += function(anim_header, 'inline void ConvertQuatToMat(')
program += function(anim_header, 'inline void MatrixTransformVectorQuatTrans(').replace(
    'MatrixTransformVectorQuatTrans(', 'TransformVectorByAnimMat(')
lod_source = (root / 'gfx_d3d/r_model_lod.cpp').read_text()
program += function(lod_source, 'float R_GetModelLodDistance(')
debug_source = (root / 'gfx_d3d/r_debug.cpp').read_text()
program += function(debug_source, 'void R_AddDebugLine(')
program += source[source.index('static void R_CalcSceneEntityPose('):]
program += r'''
void reset() {
 for(void *p:allocations)std::free(p);allocations.clear();
 std::memset(&data,0,sizeof(data));data.debugGlobals.lineLimit=15;
 std::memset(active,0,sizeof(active));std::memset(bones,0,sizeof(bones));
 for(int i=0;i<128;++i) {
  bones[i].quat[3]=1;bones[i].transWeight=2;bones[i].trans[0]=i;
  for(int j=0;j<3;++j){infos[i].bounds[0][j]=-1-j;infos[i].bounds[1][j]=2+j;}
 }
 rg.modelDObj=&defaultObject;rg.lodParms={{3,4,0},2,1};
 modelCount=8;surfaceCount=1;boneCount=128;poseCalls=modelCalls=casCalls=0;
 bad=noBones=busy=false;developerValue.current.integer=0;distances.clear();
}
GfxEntity entity() {
 GfxEntity e={};e.axis[0][0]=e.axis[1][1]=e.axis[2][2]=1;e.scale=2;return e;
}
GfxSceneEntity sceneEntity() { GfxSceneEntity s={};s.u.obj=&object;s.cent=&pose;return s; }
void near(float a,float b) { assert(std::fabs(a-b)<0.0001f); }
int main() {
 reset();
 for(int sample=0;sample<512;++sample) {
  vec3_t local[2]={{-3,-1,-5},{4,2,6}},origin={-3,7,11},axis[3],out[2]={{-2,-2,-2},{2,2,2}};
  for(int i=0;i<3;++i)for(int j=0;j<3;++j)axis[i][j]=((sample*(i+1)*(j+3))%17-8)*.25f;
  vec3_t expected[2];std::memcpy(expected,out,sizeof(out));
  for(int corner=0;corner<8;++corner)for(int j=0;j<3;++j) {
   float value=origin[j];for(int i=0;i<3;++i)value+=local[(corner>>i)&1][i]*axis[i][j];
   expected[0][j]=std::min(expected[0][j],value);expected[1][j]=std::max(expected[1][j],value);
  }
  R_ExpandBoneBounds(local,origin,axis,out);assert(!std::memcmp(out,expected,sizeof(out)));
 }
 for(float scale:{2.0f,-2.0f,0.0f,-0.0f}) {
  const float origin[3]={0,0,0};near(R_GetModelLodDistance(origin,scale),scale?11/scale:11);
 }
 { const float origin[3]={0,0,0};assert(std::isnan(R_GetModelLodDistance(origin,NAN))); }
 for(int mode=0;mode<7;++mode) {
  reset();GfxEntity e=entity();GfxSceneEntity s=sceneEntity();
  e.origin[0]=9;e.origin[1]=10;e.origin[2]=11;
  if(mode==0)s.cullState=2;
  if(mode==1)busy=true;
  if(mode==2)bad=true;
  if(mode==3)surfaceCount=0;
  if(mode==4)noBones=true;
  if(mode==5){s.u.model=&model;e.reType=1;active[0]=1;}
  if(mode==6)active[0]=1;
  R_UpdateXModelBounds(&s,&e);assert(s.cullState==2);
  if(mode<2){assert(casCalls==mode&&distances.empty());continue;}
  assert(casCalls==1&&modelCalls==(mode==5));
  if(mode<5){assert(!std::memcmp(s.curMins,e.origin,12)&&!std::memcmp(s.curMaxs,e.origin,12));}
  else for(int j=0;j<3;++j){near(s.curMins[j],infos[0].bounds[0][j]+e.origin[j]);near(s.curMaxs[j],infos[0].bounds[1][j]+e.origin[j]);}
 }
 for(int bone:{0,31,32,63,64,95,96,127}) {
  reset();active[bone>>5]=(int)(1u<<(bone&31));GfxEntity e=entity();GfxSceneEntity s=sceneEntity();
  R_UpdateXModelBounds(&s,&e);near(s.curMins[0],bone-1);near(s.curMaxs[0],bone+2);
  near(s.curMins[1],-2);near(s.curMaxs[2],4);assert(poseCalls==1&&distances.size()==8);
 }
 reset();active[0]=1;boneCount=1;GfxEntity e=entity();GfxSceneEntity s=sceneEntity();
 bad=true;developerValue.current.integer=1;R_UpdateXModelBounds(&s,&e);
 assert(data.debugGlobals.lineCount==15&&allocations.size()==1&&poseCalls==2);
 const auto &first=data.debugGlobals.lines[0];
 for(int j=0;j<3;++j){near(first.start[j],infos[0].bounds[0][j]);near(first.color[j],1);}
 near(first.end[0],infos[0].bounds[1][0]);assert(!first.color[3]&&!first.depthTest);
 for(int axis=0;axis<3;++axis) {
  const auto &line=data.debugGlobals.lines[12+axis];
  for(int j=0;j<3;++j){near(line.end[j]-line.start[j],axis==j?6:0);near(line.color[j],axis==j?1:0);}
  assert(!line.color[3]&&!line.depthTest);
 }
 R_XModelDebugBoxes(&object,&e,&s);assert(data.debugGlobals.lineCount==15&&allocations.size()==1);
 reset();
}
'''
with tempfile.TemporaryDirectory(prefix='codex_model_bounds_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual model cohort, 512 corner oracles, LOD scale/NaN cases, state/fallback/model routing, all four bone-bit words, 12 box edges, 3 axes and line capacity')
