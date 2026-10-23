"""Actual entity/lighting/draw callers: cache publication, shader constants and dispatch."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
grid=(work/'src/gfx_d3d/rb_light_grid.cpp').read_text()
entity=grid[grid.index('// PINNED 100366b0:'):]
shade=(work/'src/gfx_d3d/rb_shade.cpp').read_text()
lighting=shade[shade.index('// PINNED 1003a340:'):shade.index('// PINNED 10190690:')]
dispatch=shade[shade.index('// PINNED 10190690:'):]
program=r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <string>
#include <vector>
typedef float vec3_t[3];typedef float vec4_t[4];
#define VectorCopy(a,b) memcpy(b,a,12)
#define VectorCopy4(a,b) memcpy(b,a,16)
struct GfxEntity {int reType,renderFxFlags;union {float origin[3],baseCoords[3];struct {vec4_t *colorForDir;float sunVisibility;} dx7;} lighting;float origin[3];};
struct GfxEntityLighting {int viewCount;float sunVisibility;vec4_t colorForDir[6];};
struct GfxLightGrid {};
struct GfxWorld {float smodelLightingLookupScale[3];GfxLightGrid lightGrid;} world;
struct {GfxWorld *world;} rgp={&world};
struct {float codeConsts[59][4];int viewCount;GfxEntity *currentEntity;GfxEntityLighting *currentEntityLighting;bool viewportIsDirty;struct {float color[4];}light[2];} backEnd;
struct {int techType;} tess;
struct dvar_t {struct {int integer;} current;} renderer;
const dvar_t *r_rendererInUse=&renderer;
GfxEntity object;GfxEntityLighting cached,alternate;
int sampleCalls,hwCalls,replaceLighting,expectedView,callbackTech;
const float *expectedSample;
vec4_t *hwColors;float hwSun;
float RB_GetLightingAtPoint(const GfxLightGrid *g,const float *origin,vec4_t *out) {
    assert(g==&world.lightGrid&&cached.viewCount==expectedView);++sampleCalls;
    for(int i=0;i<3;++i)assert(origin[i]==expectedSample[i]);
    assert(out==cached.colorForDir);for(int i=0;i<24;++i)((float *)out)[i]=(float)i;
    ++backEnd.viewCount;if(replaceLighting)backEnd.currentEntityLighting=&alternate;
    if(callbackTech>=0)tess.techType=callbackTech;
    return 0.625f;
}
void RB_SetEntityHwLightsDx7(vec4_t *colors,float sun) {++hwCalls;hwColors=colors;hwSun=sun;}
''' + entity + lighting + r'''
struct GfxStateOverride {int stateBitsMaskClear[2],stateBitsMaskSet[2];};
struct GfxDrawPrimArgs {int untouched;} args;
std::vector<std::string> events;
int fogMutation,viewportMutation,drawType,drawDecl;bool drawOverride;
void RB_UpdateViewport() {events.push_back("viewport");backEnd.viewportIsDirty=false;if(viewportMutation>=0)tess.techType=viewportMutation;}
void RB_SetIteratorFog() {events.push_back("fog");if(fogMutation>=0){tess.techType=fogMutation;renderer.current.integer=2;}}
void RB_DrawSingleTechnique(int type,int declaration,const GfxDrawPrimArgs *a,const GfxStateOverride *overrideState) {
    events.push_back("draw");assert(a==&args);drawType=type;drawDecl=declaration;drawOverride=overrideState!=0;
    if(overrideState){int words[]={-1,-1,0x40000000,0};assert(!memcmp(overrideState,words,16));}
}
''' + dispatch + r'''
void reset(int mode,int type,int present,int fresh,int entityType,int replace) {
    memset(&backEnd,0,sizeof(backEnd));memset(&object,0,sizeof(object));
    for(int i=0;i<236;++i)((float *)backEnd.codeConsts)[i]=100.0f+i;
    for(int i=0;i<4;++i)backEnd.light[0].color[i]=i+0.25f;
    world.smodelLightingLookupScale[0]=2;world.smodelLightingLookupScale[1]=3;world.smodelLightingLookupScale[2]=4;
    backEnd.viewCount=expectedView=17;object.reType=entityType;object.origin[0]=1;object.origin[1]=2;object.origin[2]=3;
    object.lighting.baseCoords[0]=0.25f;object.lighting.baseCoords[1]=0.5f;object.lighting.baseCoords[2]=0.75f;
    if(mode==2&&entityType==2){object.lighting.dx7.colorForDir=alternate.colorForDir;object.lighting.dx7.sunVisibility=0.875f;}
    cached.viewCount=fresh?17:16;cached.sunVisibility=0.125f;alternate.sunVisibility=0.75f;
    for(int i=0;i<24;++i){((float *)cached.colorForDir)[i]=50+i;((float *)alternate.colorForDir)[i]=75+i;}
    backEnd.currentEntity=&object;backEnd.currentEntityLighting=present?&cached:0;
    renderer.current.integer=mode;tess.techType=type;replaceLighting=replace;
    sampleCalls=hwCalls=0;callbackTech=-1;viewportMutation=fogMutation=-1;events.clear();
    static const float sample[]={1,2,7};expectedSample=sample;
}
int main() {
    int entityCases=0,lightingCases=0,drawCases=0;
    for(int flags:{0,1,127,128,255,256,384}) {
        reset(1,6,1,0,0,0);object.renderFxFlags=flags;
        object.lighting.origin[0]=8;object.lighting.origin[1]=9;object.lighting.origin[2]=10;
        float expected[]={1,2,7};if((signed char)flags<0)memcpy(expected,object.lighting.origin,12);expectedSample=expected;
        auto before=object;RB_SetupEntityLighting(&object,&cached);
        assert(sampleCalls==1&&cached.viewCount==17&&backEnd.viewCount==18&&cached.sunVisibility==0.625f);
        assert(!memcmp(&object,&before,sizeof(object)));++entityCases;
    }
    for(int mode:{0,1,2,3})for(int type=0;type<35;++type)for(int present:{0,1})for(int fresh:{0,1})for(int entityType:{0,2})for(int replace:{0,1}) {
        reset(mode,type,present,fresh,entityType,replace);float expected[59][4];memcpy(expected,backEnd.codeConsts,sizeof(expected));
        bool skip=mode==2&&type>=15&&type<=17;
        bool sampled=!skip&&present&&!fresh;
        GfxEntityLighting *active=sampled&&replace?&alternate:&cached;
        auto before=object;RB_SetupLighting();
        assert(sampleCalls==sampled&&!memcmp(&object,&before,sizeof(object)));
        if(mode==2) {
            bool hardware=!skip&&(present||entityType==2);assert(hwCalls==hardware);
            if(hardware){assert(hwColors==(present?active->colorForDir:object.lighting.dx7.colorForDir));assert(hwSun==(present?active->sunVisibility:object.lighting.dx7.sunVisibility));}
        } else {
            assert(hwCalls==0);memcpy(expected[5],backEnd.light[0].color,16);
            if(present){expected[5][3]=active->sunVisibility;memcpy(expected[18],active->colorForDir,96);}
            else if(entityType==2){memcpy(expected[25],world.smodelLightingLookupScale,12);expected[25][3]=0;memcpy(expected[24],object.lighting.baseCoords,12);expected[24][3]=0;}
        }
        assert(!memcmp(expected,backEnd.codeConsts,sizeof(expected)));++lightingCases;
    }
    for(int mode:{1,2})for(int type=0;type<35;++type)for(int dirty:{0,1})for(int mutation:{0,1,2}) {
        reset(mode,type,1,0,0,0);backEnd.viewportIsDirty=dirty;
        viewportMutation=mutation==1?6:-1;callbackTech=mutation==2?3:-1;fogMutation=mutation==2?12:-1;
        int current=dirty&&mutation==1?6:type;
        bool lights=current>=6&&current<=17;bool sampled=lights&&!(mode==2&&current>=15&&current<=17);
        if(sampled&&mutation==2)current=3;
        bool fog=current>=3&&current<=26;
        if(fog&&mutation==2)current=12;
        int finalMode=fog&&mutation==2?2:mode;
        RB_DrawTechnique(3,&args);
        assert(sampleCalls==sampled&&drawType==current&&drawDecl==3&&drawOverride==(finalMode==2&&current>=9&&current<=14));
        std::vector<std::string> expected;if(dirty)expected.push_back("viewport");if(fog)expected.push_back("fog");expected.push_back("draw");assert(events==expected);++drawCases;
    }
    printf("PASS: %d actual entity routes, %d full lighting cases and %d draw dispatches; cache reload, exact shader constants/override and live callback state\n",entityCases,lightingCases,drawCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_lighting_chain_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
