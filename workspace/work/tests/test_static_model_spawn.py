"""Actual spawn lookups, model validation, misc-model transforms and lighting routing."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
bsp = (work / 'src/gfx_d3d/r_bsp_load_obj.cpp').read_text()
source = bsp[bsp.index('// PINNED 10002e80;'):bsp.index('const char *R_ParseSunLight(')]
lighting = (work / 'src/gfx_d3d/r_staticmodel_load_obj.cpp').read_text()
def body(name):
    start = lighting.index('void ' + name + '(')
    return lighting[start:lighting.index('\n}', start) + 2]

scale = body('R_ScaleStaticModelLighting') + '\n' + body('R_GetStaticModelLightingFromGround')

program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <strings.h>
#include <cstdarg>
#include <vector>
#include <string>
#include <initializer_list>
#define _stricmp strcasecmp
#define _strnicmp strncasecmp
#define VectorCopy(a,b) memcpy(b,a,12)
typedef unsigned char Bool;typedef float vec_t;typedef float vec3_t[3];typedef float vec4_t[4];
enum errorParm_t {ERR_FATAL,ERR_DROP};
struct Failure {std::string message;};
void R_Error(errorParm_t code,const char *format,...) {
    assert(code==ERR_DROP&&format[0]==21);throw Failure{format};
}
std::vector<std::string> warnings,registrations;
void Com_Printf(const char *format,...) {warnings.push_back(format);}
struct XModel {int bad,valid;unsigned char flags;} model, fallback;
struct GfxStaticModelInstance {int marker;} instances[8];
struct GfxWorld {GfxStaticModelInstance *smodelInsts;int smodelCount;} s_world;
struct dvar_t {struct {bool enabled;} current;} fullbright;
const dvar_t *r_showGroundLit=&fullbright;
int badCalls,validCalls,createCalls,gridCalls,cacheCalls,flagMutation;
float cachedSun,lastScale;vec3_t lastOrigin,lastAngles;vec4_t cachedColors[6];
XModel *registeredModel;
XModel *R_RegisterModel(const char *name) {
    registrations.push_back(name);
    return !strcmp(name,"xmodel/default_static_model")?&fallback:registeredModel;
}
bool R_ValidateStaticModel(XModel *value) {++validCalls;return value->valid;}
int bad(XModel *value) {++badCalls;return value->bad;}
unsigned char flags(XModel *value) {
    if(flagMutation>=0)fullbright.current.enabled=flagMutation;
    return value->flags;
}
struct {int (*XModelBad)(XModel*);unsigned char (*XModelGetFlags)(XModel*);} ri={bad,flags};
void R_CreateStaticModel(GfxWorld *world,XModel *value,const float *origin,const float *angles,
    float scale,GfxStaticModelInstance *instance) {
    assert(world==&s_world&&instance==&instances[s_world.smodelCount-1]&&value==registeredModel);
    ++createCalls;VectorCopy(origin,lastOrigin);VectorCopy(angles,lastAngles);lastScale=scale;
}
void R_GetStaticModelLightingFromGrid(const GfxWorld *world,GfxStaticModelInstance *instance,
    float *sun,vec4_t *colors) {
    assert(world==&s_world&&instance==&instances[s_world.smodelCount-1]);++gridCalls;*sun=.5f;
    for(int face=0;face<6;++face)for(int c=0;c<4;++c)colors[face][c]=float(face*4+c+1);
}
void R_CacheStaticModelLighting(const GfxWorld *world,GfxStaticModelInstance *instance,
    float sun,vec4_t *colors) {
    assert(world==&s_world&&instance==&instances[s_world.smodelCount-1]);++cacheCalls;
    cachedSun=sun;memcpy(cachedColors,colors,sizeof(cachedColors));
}
void Vector4Set(vec4_t out,float x,float y,float z,float w) {out[0]=x;out[1]=y;out[2]=z;out[3]=w;}
''' + scale + source + r'''
void reset() {
    registrations.clear();warnings.clear();badCalls=validCalls=createCalls=gridCalls=cacheCalls=0;
    model={0,1,0};fallback={0,1,0};registeredModel=&model;flagMutation=-1;
    s_world={instances,0};fullbright.current.enabled=false;
}
int main() {
    int cases=0;
    const char *vars[][2]={{"angle","999"},{"origin","1 2 3"},{"model","xmodel/test"},
        {"angle","0"},{"angles","10 20 30"},{"modelscale_vec","4 5 6"},
        {"gndLt","FF804020"},{"directLightScale","2"},{"indirectLightScale","3"}};
    const int count=sizeof(vars)/sizeof(vars[0]);
    for(int n:{0,1,2}) {
        assert(R_FloatForKey("angle",7.5f,vars,n)==7.5);vec3_t out={99,99,99};
        assert(!R_Vec3ForKey("angles","8 9",vars,n,out));
        assert(out[0]==8&&out[1]==9&&out[2]==0);++cases;
    }
    const char *lookups[][2]={{"x","999"},{"VaLuE","1.25"},{"value","9"},{"partial","1 nope"},
        {"empty",0},{"empty","7 8 9"},{"hex","FF804020"}};
    assert(R_FloatForKey("value",0,lookups,7)==1.25);
    assert(R_FloatForKey("empty",6,lookups,7)==6);
    vec3_t vector;assert(R_Vec3ForKey("partial","0 0 0",lookups,7,vector));
    assert(vector[0]==1&&vector[1]==0&&vector[2]==0);
    assert(!R_Vec3ForKey("empty","4 5 6",lookups,7,vector)&&vector[0]==4&&vector[2]==6);
    vec4_t hex;assert(R_Vec4ForKeyHex("hex","00000000",lookups,7,hex));
    assert(hex[0]==1&&fabs(hex[1]-128/255.0f)<1e-7f&&fabs(hex[3]-32/255.0f)<1e-7f);
    bool threw=false;try{R_Vec4ForKeyHex("absent","nope",lookups,7,hex);}catch(Failure&){threw=true;}assert(threw);++cases;
    for(int badModel=0;badModel<3;++badModel)for(int badDefault=0;badDefault<2;++badDefault) {
        reset();model.bad=badModel==1;model.valid=badModel!=2;fallback.bad=badDefault;
        XModel *result=0;vec3_t origin={};
        Bool valid=R_IsValidStaticModel(vars,count,&result,origin);
        assert(valid==!(badModel&&badDefault));
        assert(registrations.size()==size_t(badModel?2:1)&&warnings.size()==size_t(bool(badModel)));
        if(valid)assert(result==(badModel?&fallback:&model)&&origin[0]==1&&origin[2]==3);++cases;
    }
    reset();registeredModel=0;assert(R_IsValidStaticModel(vars,count,0,0));
    assert(registrations.size()==2&&warnings.size()==1);++cases;
    reset();const char *shadow[][2]={{"classname","misc_model"},{"origin","1 2 3"},{"model","XMODEL/SHADOW_a"}};
    assert(!R_IsValidStaticModel(shadow,3,0,0)&&registrations.empty());++cases;
    for(int bright=0;bright<2;++bright)for(int ground=0;ground<2;++ground)for(int yaw=0;yaw<2;++yaw)for(int mutation:{-1,0,1}) {
        reset();model.flags=ground;fullbright.current.enabled=bright;flagMutation=mutation;
        vars[3][1]=yaw?"45":"0";R_LoadMiscModel(vars,count);
        assert(s_world.smodelCount==1&&createCalls==1&&cacheCalls==1&&lastScale==6);
        assert(lastOrigin[0]==1&&lastOrigin[1]==2&&lastOrigin[2]==3);
        assert(lastAngles[0]==(yaw?0:10)&&lastAngles[1]==(yaw?45:20)&&lastAngles[2]==(yaw?0:30));
        bool liveBright=mutation<0?bright:mutation;
        assert(gridCalls==(!liveBright&&!ground));
        if(liveBright) {
            assert(cachedSun==0);
            for(int c=0;c<24;++c)assert(((float*)cachedColors)[c]==float(ground?(c<8?0:c<16?1:0):(c<8?1:0)));
        } else if(ground) {
            assert(fabs(cachedSun-64/255.0f)<1e-7f);
            for(int c=0;c<24;++c)assert(fabs(((float*)cachedColors)[c]-(c<8?1.0f:c<16?128/255.0f:64/255.0f)*3)<1e-6f);
        } else {
            assert(cachedSun==1);
            for(int c=0;c<24;++c)assert(((float*)cachedColors)[c]==float((c+1)*3));
        }
        ++cases;
    }
    const char *missingOrigin[][2]={{"classname","misc_model"},{"model","xmodel/test"}};
    const char *missingModel[][2]={{"classname","misc_model"},{"origin","1 2 3"}};
    for(auto badVars:{missingOrigin,missingModel}) {
        reset();threw=false;try{R_IsValidStaticModel(badVars,2,0,0);}catch(Failure&){threw=true;}
        assert(threw&&registrations.empty()&&!createCalls&&!cacheCalls);++cases;
    }
    reset();vars[5][0]="modelscale";vars[5][1]="2.5";
    R_LoadMiscModel(vars,count);assert(lastScale==2.5f);++cases;
    vars[5][0]="unused";reset();R_LoadMiscModel(vars,count);assert(lastScale==1.0f);++cases;
    vars[5][0]="modelscale_vec";vars[5][1]="4 5 6";
    reset();vars[7][1]="-1";threw=false;
    try{R_LoadMiscModel(vars,count);}catch(Failure&){threw=true;}
    assert(threw&&s_world.smodelCount==1&&createCalls==1&&!cacheCalls);++cases;
    puts("PASS: actual spawn defaults/duplicates/nulls/partial vectors/hex, validation/fallback/shadow filtering, transforms, Z scale, live fullbright and lighting/error routes");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_static_model_spawn_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

import copy
import json

accepted = {
    '?R_Vec3ForKey@@YAEPBD0PAY01PBDHPAM@Z': (0x10002ed0, 115),
    '?R_Vec4ForKeyHex@@YAEPBD0PAY01PBDHPAM@Z': (0x10002f50, 192),
}

def validate_bindings(bindings):
    for name, (address, size) in accepted.items():
        assert name in bindings, name
        row = bindings[name]
        assert int(row['t'], 16) == address and row['n'] == size, (name, row)
        assert not row['why'] and row['obj'] == 'r_bsp_load_obj.obj', (name, row)

bindings = json.loads((work.parent / 'build/codex_boundsoutside_1016_02/bind.json').read_text())
validate_bindings(bindings)
for name in accepted:
    for damage in ['missing', 'target', 'length', 'binding', 'owner']:
        altered = copy.deepcopy(bindings)
        if damage == 'missing':
            del altered[name]
        elif damage == 'target':
            altered[name]['t'] = hex(int(altered[name]['t'], 16) + 1)
        elif damage == 'length':
            altered[name]['n'] -= 1
        elif damage == 'binding':
            altered[name]['why'] = ['negative control']
        else:
            altered[name]['obj'] = 'wrong_owner.obj'
        try:
            validate_bindings(altered)
        except AssertionError:
            pass
        else:
            raise AssertionError((name, damage))
print('PASS: two accepted spawn leaves, exact extents/source owners and ten binding-corruption negatives')
