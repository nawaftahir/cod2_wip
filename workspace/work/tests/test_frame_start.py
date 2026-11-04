"""Actual BeginFrame settings/order with live dvar, world and client callback changes."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import json
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_rendercmds.cpp').read_text()
clears = text[text.index('static bool R_ClearModifiedDvar('):text.index('// PC 1.0 layouts of the small commands')]
source = text[text.index('// Role name; PINNED 10021db0:'):text.index('// PINNED 10021f90:')]
local = (work / 'src/gfx_d3d/r_local.h').read_text()
dvars = local[local.index('union DvarValue\n'):local.index('// opencod2 layout; PINNED maxTextureSize')]
retail = pefile.PE(str(retail_anchor()))
warning = retail.get_string_at_rva(0x196a18).decode()
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
lod_ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x21db0,152),0x10021db0)]
assert ('je','0x10021de5') in lod_ops and ('mov','dword ptr [esp + 4], 0x3a83126f') in lod_ops
assert lod_ops[-1]==('ret','')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <vector>
typedef unsigned char Bool;
''' + dvars + r'''
typedef dvar_s dvar_t;
dvar_t settings[17];
const dvar_t *r_lightTweakAmbient=&settings[0],*r_lightTweakDiffuseFraction=&settings[1],*r_lightTweakSunLight=&settings[2],*r_lightTweakAmbientColor=&settings[3],*r_lightTweakSunColor=&settings[4],*r_lightTweakSunDiffuseColor=&settings[5],*r_lightTweakSunDirection=&settings[6];
const dvar_t *r_zFeather=&settings[7],*r_sun_from_dvars=&settings[8],*r_gpuSync=&settings[9],*r_multiGpu=&settings[10],*r_skinCache=&settings[11],*r_forceLod=&settings[12],*r_highLodDist=&settings[13],*r_mediumLodDist=&settings[14],*r_lowLodDist=&settings[15],*r_lowestLodDist=&settings[16];
dvar_t renderer;const dvar_t *r_rendererInUse=&renderer;
struct sunflare_t {int marker;};struct GfxWorld {unsigned char before[0x160];sunflare_t sun;} world,alternate;
struct {Bool registered;} rg;
struct {int materialLoaded;GfxWorld *world;} rgp;
struct {int gpuSync;struct {void *colorSurface;} renderTargets[13];int untouched;} dx;
std::vector<int> events,expected;
float expectedLod[4];int mutation;
void Clear(const dvar_t *dvar) {
    int index=dvar-settings;assert(index>=0&&index<17&&dvar->modified);events.push_back(10+index);settings[index].modified=0;
    if(mutation==2&&index==7)settings[7].current.enabled=0;
    if(mutation==3&&index==9)settings[9].current.integer=2;
    if(mutation==4&&index==10)settings[10].current.enabled=0;
}
const char *warning=''' + json.dumps(warning) + r''';
void Print(int level,const char *format,...){assert(!level&&!strcmp(format,warning));events.push_back(80);}
void SetLod(int index,float distance) {
    assert(index>=0&&index<4&&distance==expectedLod[index]);events.push_back(100+index);
    if(mutation==5&&index==0)settings[12].current.integer=2;
    if(mutation==6&&index==0)settings[14].current.value=99;
}
void Flush(int flag){assert(!flag);events.push_back(200);if(mutation==7)settings[11].current.enabled=0;if(mutation==8)settings[11].current.enabled=1;}
struct {void (*Dvar_ClearModified)(const dvar_t *);void (*Printf)(int,const char *,...);void (*XModelSetTestLods)(int,float);void (*CL_FlushDebugData)(int);} ri={Clear,Print,SetLod,Flush};
void R_UpdateLightsFromDvars(){events.push_back(2);if(mutation==9)rgp.world=&alternate;}
void R_SetSunFromDvars(sunflare_t *sun){assert(sun==&rgp.world->sun);events.push_back(3);sun->marker=99;}
void Material_Sort(){assert(!rgp.materialLoaded);events.push_back(1);if(mutation==1)rgp.materialLoaded=9;}
void R_LockSkinnedCache(int lock){assert(!lock&&settings[11].current.enabled);events.push_back(201);}
''' + clears + source + r'''
void setup() {
    memset(settings,0,sizeof(settings));memset(&renderer,0,sizeof(renderer));memset(&dx,0,sizeof(dx));
    world.sun.marker=17;alternate.sun.marker=18;rg.registered=1;rgp.world=&world;rgp.materialLoaded=0;dx.gpuSync=77;dx.untouched=123;
    settings[12].current.integer=settings[12].reset.integer=4;
    for(int i=0;i<4;++i){settings[13+i].current.value=10*(i+1);expectedLod[i]=10*(i+1);}
    events.clear();expected.clear();mutation=0;
}
int main() {
    int routes=0;
    for(unsigned seed=0;seed<4096;++seed) {
        setup();unsigned mask=seed*2654435761u;
        rg.registered=seed&1;rgp.materialLoaded=(seed>>1)&1;rgp.world=seed&4?&world:0;
        settings[8].current.enabled=(seed>>3)&1;settings[7].modified=(seed>>4)&1;settings[7].current.enabled=(seed>>5)&1;
        renderer.current.integer=seed&64?2:0;dx.renderTargets[6].colorSurface=seed&128?(void *)1:0;
        settings[9].modified=(seed>>8)&1;settings[10].modified=(seed>>9)&1;settings[10].current.enabled=(seed>>10)&1;
        settings[9].current.integer=seed%4;settings[11].current.enabled=(seed>>11)&1;
        settings[12].current.integer=(int)(seed%7)-1;
        unsigned lights=mask&127;for(int i=0;i<7;++i)settings[i].modified=(lights>>i)&1;
        if(rg.registered) {
            if(rgp.materialLoaded)expected.push_back(1);
            if(rgp.world){for(int i=0;i<7;++i)if(settings[i].modified)expected.push_back(10+i);if(lights)expected.push_back(2);}
            if(settings[7].modified){expected.push_back(17);if(renderer.current.integer!=2&&settings[7].current.enabled&&!dx.renderTargets[6].colorSurface)expected.push_back(80);}
            if(settings[8].current.enabled&&rgp.world)expected.push_back(3);
            if(settings[9].modified)expected.push_back(19);if(settings[10].modified)expected.push_back(20);
            for(int i=0;i<4;++i){expected.push_back(100+i);if(settings[12].current.integer!=4)expectedLod[i]=settings[12].current.integer==i?0:.001f;}
            expected.push_back(200);if(settings[11].current.enabled)expected.push_back(201);
        }
        int initialLoaded=rgp.materialLoaded;bool changed=settings[9].modified||settings[10].modified;
        int gpuAfter=rg.registered&&changed?(settings[10].current.enabled?0:settings[9].current.integer):77;
        R_BeginFrame();assert(events==expected&&dx.gpuSync==gpuAfter&&dx.untouched==123);
        assert(rgp.materialLoaded==(rg.registered?0:initialLoaded));
        for(int i=0;i<7;++i)assert(settings[i].modified==(rg.registered&&rgp.world?0:int((lights>>i)&1)));
        ++routes;
    }
    for(int mode=1;mode<=9;++mode) {
        setup();mutation=mode;rgp.materialLoaded=mode==1;settings[7].modified=settings[7].current.enabled=mode==2;
        settings[9].modified=mode==3;settings[9].current.integer=3;settings[10].modified=settings[10].current.enabled=mode==4;
        settings[11].current.enabled=mode==7;settings[8].current.enabled=mode==9;settings[0].modified=mode==9;
        if(mode==5){settings[12].current.integer=0;expectedLod[0]=0;expectedLod[1]=.001f;expectedLod[2]=0;expectedLod[3]=.001f;}
        if(mode==6)expectedLod[1]=99;
        R_BeginFrame();
        assert(rgp.materialLoaded==(mode==1?9:0));
        if(mode==2)for(int event:events)assert(event!=80);
        if(mode==3)assert(dx.gpuSync==2);if(mode==4)assert(dx.gpuSync==3);
        if(mode==7)assert(events.back()==200);if(mode==8)assert(events.back()==201);
        if(mode==9)assert(world.sun.marker==17&&alternate.sun.marker==99&&rgp.world==&alternate);
        ++routes;
    }
    printf("PASS: %d actual BeginFrame routes; retail order, flags, inverse forced LOD, live dvar/world/client mutations and untouched state\n",routes);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_frame_start_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
