"""Actual LOD callback/view setup: camera locking, matrix routing and FOV math."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_scene.cpp').read_text()
source = text[text.index('static GfxViewParms lockPvsViewParms;'):text.index('#pragma function(tan)')]
math = (work / 'src/universal/com_math.h').read_text()
helpers = ''
for name in ('I_fsel', 'I_fmax'):
    start = math.index('TU_STATIC float ' + name + '(')
    helpers += math[start:math.index('\n}', start)+2] + '\n'
types = (work.parents[0] / 'src/opencod2/headers/common_types.h').read_text()
structs = ''
for name in ('GfxViewParms', 'refdef_s'):
    start = types.index('struct ' + name + ' {')
    structs += types[start:types.index('\n};', start)+3] + '\n'
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
#include <initializer_list>
#define __declspec(x)
#define TU_STATIC static inline
typedef float vec3_t[3];
struct D3DVIEWPORT9 { unsigned X,Y,Width,Height; float MinZ,MaxZ; };
struct D3DMATRIX { float m[4][4]; };
'''+structs+r'''
typedef refdef_s refdef_t;
struct dvar_t { bool modified; union { float value; bool enabled; } current; } lock,scale,bias,nearClip,depthClip;
const dvar_t *r_lockPvs=&lock,*r_lodScale=&scale,*r_lodBias=&bias,*r_znear=&nearClip,*r_znear_depthhack=&depthClip;
struct { struct { vec3_t origin;float scale,bias; } lodParms; } rg;
int cleared,matrices;float observedNear;
void clearModified(const dvar_t *dvar) { assert(dvar==r_lockPvs);++cleared;const_cast<dvar_t*>(dvar)->modified=false; }
struct { void (*Dvar_ClearModified)(const dvar_t*); } ri={clearModified};
void VectorCopy(const float *in,float *out) { memcpy(out,in,12); }
void AxisCopy(const vec3_t *in,vec3_t *out) { memcpy(out,in,36); }
void MatrixForViewer(float out[4][4],const float *origin,const vec3_t *axis) {
    assert(matrices++==0);assert(origin[0]==11 && axis[2][2]==9);out[0][0]=17;
}
void InfinitePerspectiveMatrix(float out[4][4],float x,float y,float z) {
    assert(matrices++==1 && y==70);assert(x==40 || x==80 || x==100);
    observedNear=z;out[0][0]=23;
}
void MatrixMultiply44(const float a[4][4],const float b[4][4],float out[4][4]) {
    assert(matrices++==2 && a[0][0]==17 && b[0][0]==23);out[0][0]=29;
}
void MatrixInverse44(const float *in,float *out) { assert(matrices++==3 && in[0]==29);out[0]=31; }
'''+helpers+source+r'''
int main() {
    refdef_t ref={};ref.x=3;ref.y=4;ref.width=640;ref.height=480;ref.fov_y=70;
    ref.vieworg[0]=11;ref.vieworg[1]=12;ref.vieworg[2]=13;ref.viewaxis[2][2]=9;
    const float nan=std::numeric_limits<float>::quiet_NaN();
    for(bool enabled:{false,true})for(bool modified:{false,true})
    for(float fov:{40.0f,80.0f,100.0f})for(float requested:{-1.0f,0.0f,2.0f,nan})
    for(float fallback:{-1.0f,0.005f,4.0f,nan}) {
        memset(&lockPvsViewParms,0,sizeof(lockPvsViewParms));lockPvsViewParms.origin[0]=99;
        lock.current.enabled=enabled;lock.modified=modified;scale.current.value=2;bias.current.value=-5;
        nearClip.current.value=fallback;depthClip.current.value=0.125f;
        ref.fov_x=fov;ref.zNear=requested;cleared=matrices=0;R_SetLodOrigin(&ref);
        assert(cleared==modified && matrices==(modified?4:0));
        assert(!lock.modified);
        assert(rg.lodParms.origin[0]==(enabled&&!modified?99:11));
        if(modified) {
            float expected=requested>0?requested:(0.01f-fallback>=0?0.01f:fallback);
            assert((std::isnan(expected)&&std::isnan(observedNear)) || observedNear==expected);
            assert(lockPvsViewParms.viewport.X==3 && lockPvsViewParms.viewport.Height==480);
            assert(lockPvsViewParms.viewport.MinZ==0 && lockPvsViewParms.viewport.MaxZ==1);
            assert(lockPvsViewParms.depthHackNearClip==0.125f);
            assert(lockPvsViewParms.inverseViewProjectionMatrix.m[0][0]==31);
        }
        double ratio=std::tan(fov*0.5*0.017453292f)/std::tan(double(80.0f*0.5f*0.017453292f));
        assert(std::fabs(rg.lodParms.scale-2*(fov==80?1:ratio))<0.000001);
        assert(std::fabs(rg.lodParms.bias+5*(fov==80?1:ratio))<0.000001);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_lod_api_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 192 actual LOD/view routes, lock updates, near-clip NaNs and matrix ownership')
