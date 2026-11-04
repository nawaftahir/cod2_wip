"""Actual PC shadow selector: top24 oracle, flags, ties and unordered inputs."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
types = (gfx / 'target/src/opencod2/headers/common_types.h').read_text()
definitions = ''
for prefix in ('union GfxModel {', 'struct GfxSceneEntity {', 'struct GfxSceneDef {',
               'struct GfxEntity {', 'struct ShadowCandidate {'):
    start = types.index(prefix)
    definitions += types[start:types.index('\n};', start) + 3] + '\n'
header = (packet / 'src/universal/com_math.h').read_text()
helpers = ''
for result, name in [('float', 'I_sqrt'), ('void', 'VectorSubtract'),
                     ('void', 'Vec3Mul'), ('vec_t', 'VectorLength')]:
    start = header.index('TU_STATIC ' + result + ' ' + name + '(')
    helpers += header[start:header.index('\n}', start) + 2] + '\n'
source = (packet / 'src/gfx_d3d/r_shadowcookie_candidates.cpp').read_text()
source = '\n'.join(line for line in source.splitlines()
                   if not line.startswith(('#include', 'typedef char')))
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <algorithm>
#include <limits>
#include <set>
#include <vector>
typedef float vec_t;
typedef float vec2_t[2];typedef float vec3_t[3];typedef float vec4_t[4];
typedef unsigned char byte;typedef int refEntityType_t;typedef int surfaceType_t;
struct Material;struct GfxEntity;typedef Material *MaterialHandle;
struct FxMemMgr_Emitter;struct XModel;struct GfxBrushModel;struct centity_s;
struct DObj_s { vec3_t mins,maxs; };typedef DObj_s DObj;
#define TU_STATIC static inline
''' + definitions + r'''
struct { GfxSceneDef def;GfxSceneEntity sceneEnts[80]; } scene;
static int boundsCalls;
void getBounds(const DObj *obj,float *mins,float *maxs) {
    ++boundsCalls;std::memcpy(mins,obj->mins,12);std::memcpy(maxs,obj->maxs,12);
}
struct { void (*DObjGetBounds)(const DObj *,float *,float *); } ri={getBounds};
''' + helpers + source + r'''
static GfxEntity entities[80];static DObj objects[80];
void reset(int count) {
    boundsCalls=0;std::memset(&scene,0,sizeof(scene));std::memset(entities,0,sizeof(entities));
    std::memset(objects,0,sizeof(objects));scene.def.entities=entities;scene.def.entityCount=count;
    for(int i=0;i<count;++i) {
        scene.sceneEnts[i].u.obj=&objects[i];objects[i].maxs[0]=2;
        entities[i].origin[0]=float(i+1);
    }
}
std::set<int> selected(const ShadowCandidate *c) {
    std::set<int> result;
    for(int i=0;i<24;++i)if(c[i].entIndex!=-1)result.insert(c[i].entIndex);
    return result;
}
int main() {
    const float origin[3]={0,0,0};ShadowCandidate output[26];
    for(int count=0;count<=70;++count) {
        reset(count);std::memset(output,0xcc,sizeof(output));
        R_PopulateCandidates(origin,output+1);
        std::set<int> expected;for(int i=0;i<std::min(count,24);++i)expected.insert(i);
        assert(selected(output+1)==expected && boundsCalls==count);
        for(int i=1;i<=24;++i)if(output[i].entIndex>=0)
            assert(output[i].weight==(output[i].entIndex+1)*0.5f);
        for(unsigned char c:*(unsigned char (*)[sizeof(ShadowCandidate)])&output[0])assert(c==0xcc);
        for(unsigned char c:*(unsigned char (*)[sizeof(ShadowCandidate)])&output[25])assert(c==0xcc);
    }
    reset(5);entities[0].reType=1;entities[1].renderFxFlags=8;entities[2].renderFxFlags=0x200;
    objects[3].maxs[0]=0;R_PopulateCandidates(origin,output);
    assert(selected(output)==std::set<int>{4} && boundsCalls==2);
    reset(4);entities[0].origin[0]=8;entities[0].renderFxFlags=0x800;
    entities[1].origin[0]=8;entities[1].renderFxFlags=0x600;
    entities[2].origin[0]=8;entities[2].renderFxFlags=0x400;
    entities[3].origin[0]=8;R_PopulateCandidates(origin,output);
    assert(output[0].weight==0 && output[1].weight==1 && output[2].weight==16 && output[3].weight==4);
    reset(25);for(int i=0;i<25;++i)entities[i].origin[0]=2;
    R_PopulateCandidates(origin,output);assert(output[0].entIndex==24 && selected(output).size()==24);
    reset(1);objects[0].maxs[0]=2;objects[0].maxs[1]=6;objects[0].maxs[2]=4;
    entities[0].origin[0]=12;R_PopulateCandidates(origin,output);assert(output[0].weight==2);
    reset(1);objects[0].maxs[0]=-2;R_PopulateCandidates(origin,output);assert(output[0].weight==-0.5f);
    reset(1);entities[0].origin[0]=200000000.0f;R_PopulateCandidates(origin,output);
    assert(selected(output).empty());
    reset(1);entities[0].origin[0]=std::numeric_limits<float>::quiet_NaN();
    R_PopulateCandidates(origin,output);assert(output[0].entIndex==0 && std::isnan(output[0].weight));
    reset(60);std::vector<std::pair<float,int>> weights;
    for(int i=0;i<60;++i) {
        entities[i].origin[0]=float((i*37)%97+1);
        entities[i].origin[1]=float(i%7);entities[i].origin[2]=float(i%3);
        double x=entities[i].origin[0],y=entities[i].origin[1],z=entities[i].origin[2];
        weights.push_back({float(std::sqrt(x*x+y*y+z*z)/2),i});
    }
    std::sort(weights.begin(),weights.end());std::set<int> expected;
    for(int i=0;i<24;++i)expected.insert(weights[i].second);
    R_PopulateCandidates(origin,output);assert(selected(output)==expected);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_shadow_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual shadow selection vs top24 oracle, skip flags, hint weighting, ties, bounds, NaN and output guards')
