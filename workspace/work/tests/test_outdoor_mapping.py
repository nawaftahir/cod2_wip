"""Actual outdoor bounds, scale, matrix and collision-height source."""
from pathlib import Path
import struct
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_outdoor.cpp').read_text()
source = text[text.index('// PINNED 10020590/'):]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert struct.unpack('<3i', retail.get_data(0x190398, 12)) == (512,512,256)
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <limits>
#include <initializer_list>
typedef float vec3_t[3];
typedef int surfaceType_t;
typedef unsigned char byte;
struct Material {struct {byte gameFlags;} info;};
struct GfxSurface {const Material *material;surfaceType_t *data;};
struct GfxWorld {int surfaceCount;GfxSurface *surfaces;float outdoorLookupMatrix[4][4];unsigned guard;};
struct OutdoorGlob {vec3_t bbox[2],scale,invScale,add;byte *pic;} outdoorGlob;
const int outdoorMapSize[3]={512,512,256};
bool close(float got,double want) {return fabs(double(got)-want)<=fabs(want)*0.000001+1e-12;}
struct trace_t {float fraction;byte untouched[32];};
const vec3_t vec3_origin={0,0,0};
float fractionInput,xExpected,yExpected;
int traceCalls;
void boxTrace(trace_t *trace,const float *start,const float *end,const float *mins,const float *maxs,int model,int mask) {
    ++traceCalls;assert(trace->fraction==1.0f&&sizeof(*trace)==36);
    for(byte value:trace->untouched)assert(value==0);
    assert(start[0]==xExpected&&end[0]==xExpected&&start[1]==yExpected&&end[1]==yExpected);
    assert(start[2]==outdoorGlob.bbox[1][2]+1&&end[2]==outdoorGlob.bbox[0][2]-1);
    assert(mins==vec3_origin&&maxs==vec3_origin&&model==0&&mask==0x2001);
    trace->fraction=fractionInput;
}
struct {void (*CM_BoxTrace)(trace_t*,const float*,const float*,const float*,const float*,int,int);} ri={boxTrace};
void MatrixIdentity44(float matrix[4][4]) {
    for(int r=0;r<4;++r)for(int c=0;c<4;++c)matrix[r][c]=r==c?1.0f:0.0f;
}
void ClearBounds(float *mins,float *maxs) {
    for(int axis=0;axis<3;++axis) {mins[axis]=131072;maxs[axis]=-131072;}
}
void ExpandBounds(const float *inMin,const float *inMax,float *mins,float *maxs) {
    for(int axis=0;axis<3;++axis) {if(mins[axis]>inMin[axis])mins[axis]=inMin[axis];if(maxs[axis]<inMax[axis])maxs[axis]=inMax[axis];}
}
'''+source+r'''
int main() {
    const float nan=std::numeric_limits<float>::quiet_NaN();
    const float low[]={-100,0,23,131072,nan};
    const float high[]={-100,0,23.5f,200,nan};
    Material keep={{0}},skip={{8}};
    int cases=0;
    for(int count:{0,1,2,3})for(float lo:low)for(float hi:high) {
        OutdoorSurfaceBounds bounds[3]={
            {1,{lo,-3,-12},{hi,6,50}},
            {1,{-200,-200,-200},{200,200,200}},
            {1,{-40,-20,-30},{40,20,30}}
        };
        GfxSurface surfaces[3]={{&keep,&bounds[0].type},{&skip,&bounds[1].type},{&keep,&bounds[2].type}};
        GfxWorld world={count,surfaces,{},0x12345678};
        float expected[2][3]={{131072,131072,131072},{-131072,-131072,-131072}};
        for(int i=0;i<count;++i)if(!(surfaces[i].material->info.gameFlags&8))
            for(int axis=0;axis<3;++axis) {
                if(bounds[i].mins[axis]<expected[0][axis])expected[0][axis]=bounds[i].mins[axis];
                if(bounds[i].maxs[axis]>expected[1][axis])expected[1][axis]=bounds[i].maxs[axis];
            }
        for(int axis=0;axis<3;++axis) {
            if(expected[0][axis]==131072)expected[0][axis]=expected[1][axis]=0;
            if(expected[1][axis]-expected[0][axis]<1) {expected[0][axis]-=.5f;expected[1][axis]+=.5f;}
        }
        R_ComputeOutdoorBounds(&world);
        assert(!memcmp(expected,outdoorGlob.bbox,sizeof(expected)));
        R_ComputeOutdoorScale();R_ComputeOutdoorLookupMatrix(&world);
        assert(world.guard==0x12345678);
        for(int axis=0;axis<3;++axis) {
            float range=expected[1][axis]-expected[0][axis];
            assert(close(outdoorGlob.scale[axis],double(outdoorMapSize[axis]-1)/range));
            assert(close(outdoorGlob.invScale[axis],double(range)/(outdoorMapSize[axis]-1)));
            assert(close(outdoorGlob.add[axis],-(double(outdoorGlob.scale[axis])*expected[0][axis])));
            assert(close(world.outdoorLookupMatrix[axis][axis],1.0/double(range)));
            assert(close(world.outdoorLookupMatrix[3][axis],-(1.0/double(range)*expected[0][axis])));
            for(int index:{0,1,255,511}) {
                float center=R_OutdoorTexelToWorld(axis,index);
                float want=(index+.5f-outdoorGlob.add[axis])*outdoorGlob.invScale[axis];
                assert(close(center,want));
            }
        }
        for(int r=0;r<4;++r)for(int c=0;c<4;++c)
            if((r!=c&&r!=3)||(c==3&&r!=3))assert(world.outdoorLookupMatrix[r][c]==0);
        assert(world.outdoorLookupMatrix[3][3]==1);++cases;
    }
    outdoorGlob.bbox[0][2]=-50;outdoorGlob.bbox[1][2]=300;
    for(float fraction:{-.5f,0.0f,.25f,1.0f,1.5f,nan}) {
        fractionInput=fraction;xExpected=31;yExpected=-19;traceCalls=0;
        float result=R_OutdoorTraceHeight(xExpected,yExpected);
        float want=301.0f+(-51.0f-301.0f)*fraction;
        assert(traceCalls==1&&(std::isnan(want)?std::isnan(result):result==want));++cases;
    }
    printf("PASS: %d actual outdoor routes, flags, sentinel/NaN bounds, scales, matrix guards, centers and trace direction\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_outdoor_mapping_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
