"""Check actual scaled-string math, caller routing, zero vectors and NaNs."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_debug.cpp').read_text()
source = text[text.index('void R_AddScaledDebugString('):text.index('void R_ShutdownDebugEntry(')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
typedef float vec3_t[3];
struct DebugGlobals {} debug;
struct GfxViewParms { float origin[3],axis[3][3]; };
const float *expectedOrigin,*expectedColor;const char *expectedText;
float observedScale;int calls;
void VectorSubtract(const float *a,const float *b,float *out) {
    for(int i=0;i<3;++i)out[i]=a[i]-b[i];
}
float Vec3Normalize(float *v) {
    float length=std::sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2]);
    if(length!=0)for(int i=0;i<3;++i)v[i]*=1.0f/length;
    return length;
}
float DotProduct(const float *a,const float *b) {
    return a[0]*b[0]+a[1]*b[1]+a[2]*b[2];
}
void R_AddDebugString(DebugGlobals *d,const float *o,const float *c,float s,const char *t) {
    assert(d==&debug&&o==expectedOrigin&&c==expectedColor&&t==expectedText);
    ++calls;observedScale=s;
}
'''+source+r'''
int main() {
    float origin[3],color[4]={1,2,3,4};const char message[]="original text";
    expectedOrigin=origin;expectedColor=color;expectedText=message;
    for(int sample=0;sample<2048;++sample) {
        GfxViewParms view={};
        for(int axis=0;axis<3;++axis) {
            view.origin[axis]=((sample*(axis+3))%19-9)*.25f;
            origin[axis]=view.origin[axis]+((sample*(axis+7))%23-11)*(sample%4?1.0f:100.0f);
            view.axis[0][axis]=((sample*(axis+5))%13-6)*.25f;
        }
        if(sample==0)memcpy(origin,view.origin,12);
        if(sample==1)origin[0]=std::numeric_limits<float>::quiet_NaN();
        if(sample==2)view.axis[0][0]=std::numeric_limits<float>::quiet_NaN();
        double delta[3],length=0,dot=0;
        for(int axis=0;axis<3;++axis) {
            delta[axis]=origin[axis]-view.origin[axis];length+=delta[axis]*delta[axis];
        }
        length=std::sqrt(length);
        for(int axis=0;axis<3;++axis)dot+=(length!=0?delta[axis]/length:delta[axis])*view.axis[0][axis];
        double expected=length*(dot-.995f);if(expected<1)expected=1;
        GfxViewParms before=view;float originBefore[3];memcpy(originBefore,origin,12);
        calls=0;R_AddScaledDebugString(&debug,&view,origin,color,message);assert(calls==1);
        assert(!memcmp(&view,&before,sizeof(view))&&!memcmp(origin,originBefore,12));
        if(std::isnan(expected))assert(std::isnan(observedScale));
        else assert(std::fabs(observedScale-expected)<.002+std::fabs(expected)*.00002);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_scaled_strings_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 2,048 scaled-string cases, routing, lower clamp, zero-vector and NaN behavior')
