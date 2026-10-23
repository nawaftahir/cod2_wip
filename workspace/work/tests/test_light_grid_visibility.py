"""Actual cache insertion, debug boxes and seven-argument grid sight traces."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
source=(work/'src/gfx_d3d/rb_light_grid.cpp').read_text()
source=source[source.index('// PINNED 10035fb0'):]
source=source[:source.index('/* PINNED 100363a0.')]
program=r'''
#include <algorithm>
#include <array>
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <vector>
typedef unsigned char byte;typedef float vec3_t[3];typedef float vec4_t[4];
struct GfxLightGridPoint {unsigned xyzHighBits;byte xyzLowBitsAndSunVisible,needsTrace;unsigned short colorsIndex;};
struct GfxLightGridColors {byte rgb[3][8];};
struct GfxLightGrid {int pointCount;GfxLightGridPoint *points;int colorCount;GfxLightGridColors *colors;};
struct {void *world;} rgp;
struct dvar_t {union {int integer;byte enabled;} current;} missing,show,logDvar;
const dvar_t *r_showMissingLightGrid=&missing,*r_showLightGrid=&show,*r_vc_makelog=&logDvar;
struct DebugGlobals {int id;};struct GfxBackEndData {DebugGlobals debugGlobals;} backend[2];
GfxBackEndData *backEndData=backend;
byte logStorage[4096],*s_vc_log;int s_vc_logCount;
const vec3_t vec3_origin={0,0,0};
const vec4_t colorBlue={0,0,1,1},colorWhite={1,1,1,1},colorGreen={0,1,0,1},colorRed={1,0,0,1},colorYellow={1,1,0,1};
#define VectorSubtract(a,b,out) do{for(int axis=0;axis<3;++axis)(out)[axis]=(a)[axis]-(b)[axis];}while(0)
int normalizeCalls,traceCalls,traceResult,mutateTrace,expectedLogCount;
GfxLightGrid *callbackGrid;GfxLightGridPoint replacementPoint;
float pointOrigin[3],sample[3];
struct Box {DebugGlobals *debug;float mins[3],maxs[3],color[4];};std::vector<Box> boxes;
void R_AddDebugBox(DebugGlobals *debug,const float *mins,const float *maxs,const float *color) {
    assert(debug==&backEndData->debugGlobals);Box b;b.debug=debug;
    memcpy(b.mins,mins,12);memcpy(b.maxs,maxs,12);memcpy(b.color,color,16);boxes.push_back(b);
}
float Vec3Normalize(float *v) {
    ++normalizeCalls;float length=sqrtf(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
    if(length)for(int i=0;i<3;++i)v[i]/=length;return length;
}
int Trace(int old,const float *start,const float *end,const float *mins,const float *maxs,int model,int mask) {
    assert(old==0&&start==sample&&mins==vec3_origin&&maxs==vec3_origin&&model==0&&mask==0x2001);
    assert(s_vc_logCount==expectedLogCount&&normalizeCalls==1);++traceCalls;
    float direction[3],length=0;
    for(int i=0;i<3;++i){direction[i]=sample[i]-pointOrigin[i];length+=direction[i]*direction[i];}
    length=sqrtf(length);
    for(int i=0;i<3;++i)assert(fabs(end[i]-(pointOrigin[i]+(length?direction[i]/length:0)*0.01f))<1e-6f);
    if(mutateTrace){show.current.enabled=!show.current.enabled;backEndData=backend+1;callbackGrid->points=&replacementPoint;}
    return traceResult;
}
struct {int (*CM_BoxSightTrace)(int,const float *,const float *,const float *,const float *,int,int);} ri={Trace};
''' + source + r'''
void resetLog() {memset(logStorage,0x5a,sizeof(logStorage));s_vc_log=logStorage+16;s_vc_logCount=0;}
void checkLog(const std::vector<std::array<unsigned short,3>> &expected) {
    assert(s_vc_logCount==(int)expected.size());
    for(unsigned i=0;i<expected.size();++i)assert(!memcmp(s_vc_log+i*6,expected[i].data(),6));
    for(int i=0;i<16;++i)assert(logStorage[i]==0x5a);
    for(unsigned i=16+expected.size()*6;i<sizeof(logStorage);++i)assert(logStorage[i]==0x5a);
}
void checkBox(const float *origin,float radius,const float *color) {
    assert(boxes.size()==1);const Box &b=boxes[0];assert(b.debug==&backEndData->debugGlobals);
    float mins[3],maxs[3];for(int i=0;i<3;++i){mins[i]=origin[i]-radius;maxs[i]=origin[i]+radius;}
    assert(!memcmp(b.mins,mins,12)&&!memcmp(b.maxs,maxs,12));
    assert(!memcmp(b.color,color,16));
}
int main() {
    int cacheCases=0,boxCases=0,visibilityCases=0;
    resetLog();std::vector<std::array<unsigned short,3>> expected;
    for(int pass=0;pass<2;++pass)for(int x=3;x>=0;--x)for(int y=3;y>=0;--y)for(int z=3;z>=0;--z) {
        std::array<unsigned short,3> key={(unsigned short)x,(unsigned short)y,(unsigned short)z};
        auto it=std::lower_bound(expected.begin(),expected.end(),key);int index=it-expected.begin();bool exists=it!=expected.end()&&*it==key;
        int before=s_vc_logCount;assert(RB_GridVisLogIndex(x,y,z,false)==(exists?index:-1));assert(s_vc_logCount==before);
        assert(RB_GridVisLogIndex(x,y,z,true)==index);if(!exists)expected.insert(it,key);
        checkLog(expected);++cacheCases;
    }
    for(int flag:{0,1,-1,256}) {resetLog();assert(RB_GridVisLogIndex(1,2,3,flag)==(flag?0:-1));assert(s_vc_logCount==(flag!=0));++cacheCases;}
    for(int cap:{0x400000,0x400001}) {s_vc_log=0;s_vc_logCount=cap;assert(!RB_InsertGridVisLog(0,1,2,3)&&s_vc_logCount==cap);++cacheCases;}
    resetLog();assert(RB_InsertGridVisLog(0,(unsigned short)70000,(unsigned short)-1,(unsigned short)65536));
    checkLog({{{(unsigned short)70000,65535,0}}});++cacheCases;
    for(float offset:{-100.0f,0.0f,17.25f}) {
        float position[]={offset,offset+2,offset-3};backEndData=backend;boxes.clear();RB_DrawGridSampleBox(position);checkBox(position,0.5f,colorBlue);++boxCases;
        for(float radius:{-1.0f,0.0f,0.9f,1.0f,1.1f}){boxes.clear();RB_DrawGridPointBox(position,radius,colorRed);checkBox(position,radius,colorRed);++boxCases;}
    }
    for(int x:{0,4095,4096,8191})for(int y:{0,4096,8191})for(int z:{0,2048,4095}) {
        boxes.clear();RB_DrawGridCellBox(x,y,z);float physical[]={(float)((x-4096)*32),(float)((y-4096)*32),(float)((z-2048)*64)};
        assert(boxes.size()==1&&!memcmp(boxes[0].color,colorWhite,16));
        for(int i=0;i<3;++i){assert(boxes[0].mins[i]==physical[i]);assert(boxes[0].maxs[i]==physical[i]+(i==2?64:32));}++boxCases;
    }
    GfxLightGridPoint point={0x80100200,1,0,0};GfxLightGrid grid={1,&point,0,0};
    for(int corner=0;corner<8;++corner)for(int mask:{0,255,1<<corner})for(int blocked:{0,7})
    for(int debug:{0,1})for(int mutate:{0,1})for(int logging:{0,1,2})for(int hit:{0,1}) {
        resetLog();boxes.clear();backEndData=backend;show.current.enabled=debug;logDvar.current.integer=logging;grid.points=&point;callbackGrid=&grid;
        normalizeCalls=traceCalls=0;traceResult=blocked;mutateTrace=mutate;expectedLogCount=logging!=0;
        point.needsTrace=mask;sample[0]=3;sample[1]=4;sample[2]=5;pointOrigin[0]=pointOrigin[1]=pointOrigin[2]=0;
        auto oldPoint=point;bool traced=hit&&(mask&(1<<corner));
        bool visible=hit&&(!traced||!blocked);
        const auto *actual=RB_GetValidGridPoint(&grid,hit?4096:4097,4096,2048,corner,sample);
        assert(actual==(visible?(traced&&mutate?&replacementPoint:&point):0)&&traceCalls==traced&&normalizeCalls==traced);
        assert(!memcmp(&point,&oldPoint,sizeof(point))&&s_vc_logCount==expectedLogCount);
        bool draw=hit&&(traced&&mutate?!debug:debug);
        if(draw)checkBox(pointOrigin,traced?(blocked?1.1f:1.0f):0.9f,traced?(blocked?colorRed:colorYellow):colorGreen);
        else assert(boxes.empty());
        ++visibilityCases;
    }
    printf("PASS: %d sorted cache cases, %d exact debug boxes and %d actual visibility routes; trace ABI, shared history, masks and late state changes\n",cacheCases,boxCases,visibilityCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_grid_visibility_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
