"""Actual interpolation across occupancy masks and bounded retail-style FP inputs."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_light_grid.cpp').read_text()
helpers=text[text.index('// PINNED 10036100:'):text.index('// PINNED 10036320:')]
source=text[text.index('float RB_GetLightingAtPoint('):text.index('typedef char entityLightingLayoutCheck')]
program=r'''
#include <cassert>
#include <cfenv>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <initializer_list>
typedef unsigned char byte;typedef float vec4_t[4];
struct GfxLightGridPoint {unsigned key;byte xyzLowBitsAndSunVisible,needsTrace;unsigned short colorsIndex;};
struct GfxLightGridColors {byte rgb[3][8];};
struct GfxLightGrid {int pointCount;GfxLightGridPoint *points;int colorCount;GfxLightGridColors *colors;};
struct dvar_t {struct {byte enabled;} current;} show;const dvar_t *r_showLightGrid=&show;
int expectedCell[3],validCalls,nearestCalls,boxCalls,mask,fallback;
float fraction[3];const float *sample;
GfxLightGridPoint points[8];GfxLightGridColors colors[8];GfxLightGrid grid={8,points,8,colors};
__attribute__((noinline)) int I_fround(float value) {return (int)lrintl((long double)value+0x1p-30L);}
void RB_DrawGridCellBox(int x,int y,int z) {
    assert(boxCalls++==0&&x==expectedCell[0]&&y==expectedCell[1]&&z==expectedCell[2]);
}
void RB_DrawGridSampleBox(const float *origin) {assert(boxCalls++==1&&origin==sample);}
const GfxLightGridPoint *RB_GetValidGridPoint(const GfxLightGrid *g,int x,int y,int z,unsigned corner,const float *origin) {
    assert(g==&grid&&origin==sample&&corner==(unsigned)validCalls++);
    assert(x==expectedCell[0]+(int)(corner&1)&&y==expectedCell[1]+(int)((corner>>1)&1)&&z==expectedCell[2]+(int)((corner>>2)&1));
    assert(boxCalls==(show.current.enabled?2:0));
    return (mask&(1<<corner))?points+corner:0;
}
bool RB_GetNearestGridColors(const GfxLightGrid *g,int x,int y,int z,vec4_t *out,float *sun) {
    assert(g==&grid&&validCalls==8);++nearestCalls;
    assert(x==expectedCell[0]+(fraction[0]>0.5f)&&y==expectedCell[1]+(fraction[1]>0.5f)&&z==expectedCell[2]+(fraction[2]>0.5f));
    for(int i=0;i<24;++i)assert(((float *)out)[i]==0);
    if(!fallback)return false;
    for(int i=0;i<24;++i)((float *)out)[i]=0.625f;*sun=0.875f;return true;
}
''' + helpers + source + r'''
int main() {
    for(int c=0;c<8;++c){points[c].colorsIndex=c;points[c].xyzLowBitsAndSunVisible=c&1;for(int i=0;i<24;++i)((byte *)&colors[c])[i]=(byte)(c*17+i*3);}
    float positions[][3]={{0,0,0},{16,16,32},{8,24,16},{0.5f,0.5f,0.5f},{31.5f,31.5f,63.5f},{-0.5f,-0.5f,-0.5f},{-131071.5f,-131071.5f,-131071.5f},{131071.5f,131071.5f,131071.5f}};
    int cases=0;
    for(int precision:{0,0x300}) {
        fenv_t environment;fegetenv(&environment);environment.__control_word=(environment.__control_word&~0x300)|precision;fesetenv(&environment);
        for(int mode:{FE_TONEAREST,FE_DOWNWARD,FE_UPWARD,FE_TOWARDZERO}) {
            fesetround(mode);
            for(auto &position:positions) {
                sample=position;
                for(int axis=0;axis<3;++axis) {
                    volatile float shifted=position[axis]+131072.0f;
                    expectedCell[axis]=(int)lrintl((long double)shifted-0x1.fffffff000000p-2L)>>(axis==2?6:5);
                    fraction[axis]=shifted*(axis==2?0.015625f:0.03125f)-expectedCell[axis];
                }
                for(mask=0;mask<256;++mask)for(fallback=0;fallback<2;++fallback)for(int debug:{0,1}) {
                    show.current.enabled=debug;validCalls=nearestCalls=boxCalls=0;
                    struct {float before;vec4_t out[6];float after;} result;memset(&result,0x5a,sizeof(result));result.before=17;result.after=29;
                    float actualSun=RB_GetLightingAtPoint(&grid,position,result.out);
                    long double total=0,sun=0,expected[24]={};
                    for(int corner=0;corner<8;++corner)if(mask&(1<<corner)) {
                        float weight=(corner&2?fraction[1]:1.0f-fraction[1])*(corner&4?fraction[2]:1.0f-fraction[2])*(corner&1?fraction[0]:1.0f-fraction[0]);
                        total+=weight;if(corner&1)sun+=weight;
                        for(int i=0;i<24;++i)expected[i]+=((byte *)&colors[corner])[i]*(long double)weight/255.0L;
                    }
                    bool nearest=total==0;
                    if(nearest) {
                        sun=fallback?0.875L:0.0L;
                        for(int i=0;i<24;++i)expected[i]=fallback?0.625L:float(i==1||i==3||i==5||i==7||i==10||i==11||i==14||i==15||i>=20);
                    } else if(total<0.98f) {sun/=total;for(auto &value:expected)value/=total;}
                    assert(validCalls==8&&nearestCalls==nearest&&boxCalls==(debug?2:0));
                    assert(fabsl(actualSun-sun)<0.00002L);
                    for(int i=0;i<24;++i)assert(fabsl(((float *)result.out)[i]-expected[i])<0.00002L);
                    assert(result.before==17&&result.after==29);++cases;
                }
            }
        }
    }
    fesetround(FE_TONEAREST);
    printf("PASS: %d actual interpolation routes, all256 occupancy masks, four rounding modes,24/64-bit precision, fallback/threshold and guards; bounded world coordinates, not FP byte identity\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_grid_interpolation_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++17','-O2','-frounding-math','-ffloat-store','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
