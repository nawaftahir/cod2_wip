"""Actual brush bounds and cull routing after merging the DPVS helpers."""
from pathlib import Path
import json
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_dpvs.cpp').read_text()
source = text[text.index('static void R_TransformBoundsCorners('):text.index('#pragma optimize("p", off)')]
program = r'''
#include <cassert>
#include <algorithm>
#include <cstdio>
#include <vector>
typedef float vec_t,vec3_t[3];
struct GfxEntity {vec3_t origin,axis[3];};
struct Bmodel {vec3_t bounds[2];} model;
struct GfxSceneEntity {union {Bmodel *bmodel;} u;};
struct {struct {GfxEntity entities[3];} def;GfxSceneEntity sceneEnts[3];} scene;
struct DpvsPlane {int unused;} planes[2];
struct World {int *nodes;} worlds[2];
struct {World *world;} rgp;
int nodes[2],index,filterResult,mutate;
bool outside;
vec3_t expected[2];
std::vector<int> calls;
void VectorCopy(const float *in,float *out) {for(int i=0;i<3;++i)out[i]=in[i];}
void VectorMA(const float *in,float scale,const float *axis,float *out) {
    for(int i=0;i<3;++i)out[i]=in[i]+scale*axis[i];
}
bool R_IsBoundsOutsideViewNoStack(DpvsPlane *p,int count,const float *bounds) {
    assert(p==planes&&count==2);calls.push_back(1);
    for(int i=0;i<3;++i)assert(bounds[i]==expected[0][i]);
    if(mutate)rgp.world=&worlds[1];
    return outside;
}
int R_FilterEntityIntoCells_r(int *node,int entity,const float *mins,const float *maxs) {
    assert(node==&nodes[mutate]&&entity==index);calls.push_back(2);
    for(int i=0;i<3;++i)assert(mins[i]==expected[0][i]&&maxs[i]==expected[1][i]);
    return filterResult;
}
void R_AddBModelSurfaces(GfxSceneEntity *entity,int entityIndex) {
    assert(entity==&scene.sceneEnts[index]&&entityIndex==index);calls.push_back(3);
}
''' + source + r'''
int main() {
    int cases=0;
    for(int transform=0;transform<12;++transform)for(int boundsCase=0;boundsCase<8;++boundsCase) {
        GfxEntity entity={};
        for(int axis=0;axis<3;++axis) {
            entity.origin[axis]=(axis-1)*17;
            for(int component=0;component<3;++component)
                entity.axis[axis][component]=((transform+axis*3+component)%7)-3;
            model.bounds[0][axis]=-(boundsCase+axis+1);
            model.bounds[1][axis]=boundsCase*(axis+1);
            expected[0][axis]=131072;expected[1][axis]=-131072;
        }
        for(int corner=0;corner<8;++corner)for(int axis=0;axis<3;++axis) {
            double value=entity.origin[axis];
            for(int local=0;local<3;++local)
                value+=double(model.bounds[(corner>>local)&1][local])*entity.axis[local][axis];
            expected[0][axis]=std::min(expected[0][axis],float(value));
            expected[1][axis]=std::max(expected[1][axis],float(value));
        }
        vec3_t mins,maxs;R_TransformBoundsCorners(&entity,mins,maxs,model.bounds);
        for(int i=0;i<3;++i)assert(mins[i]==expected[0][i]&&maxs[i]==expected[1][i]);
        for(index=0;index<3;index+=2)for(int reject=0;reject<2;++reject)
        for(filterResult=-2;filterResult<2;++filterResult)for(mutate=0;mutate<2;++mutate) {
            scene.def.entities[index]=entity;scene.sceneEnts[index].u.bmodel=&model;
            worlds[0].nodes=&nodes[0];worlds[1].nodes=&nodes[1];rgp.world=&worlds[0];
            outside=reject;calls.clear();R_CullBrushEntity(index,planes,2);
            std::vector<int> want={1};
            if(!outside){want.push_back(2);if(filterResult==-1)want.push_back(3);}
            assert(calls==want);++cases;
        }
    }
    printf("PASS: %d actual brush cull routes, corner extrema, shear/reflection, cell returns and live world reload\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_brush_bounds_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

bindings = json.loads((work.parent / 'build/codex_boundsoutside_1016_02/bind.json').read_text())
row = bindings['?R_TransformBoundsCorners@@YAXPBUGfxEntity@@QAM1PAY02$$CBM@Z']
assert (row['t'], row['n'], row['obj'], row['why']) == ('0x100088c0', 2317, 'r_dpvs.obj', [])
