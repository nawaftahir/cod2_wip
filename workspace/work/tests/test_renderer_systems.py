"""Actual systems initialization order, shared storage and bounded resets."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_init.cpp')
source = text[text.index('typedef char rendererSystemsLayoutCheck'):text.index('void R_RegisterCmds();')]
types = (work.parent / 'src/opencod2/headers/common_types.h').read_text()
start = types.index('struct DebugGlobals {')
debug = types[start:types.index('\n};', start)+3]
start = types.index('struct r_globals_t {')
globals_prefix = types[start:types.index('    float sinTable[1024];', start)] + '};'
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
typedef unsigned char byte;typedef byte Bool;typedef float vec3_t[3];
struct GfxDebugPoly;struct trDebugString_t;struct trDebugLine_t;struct GfxDebugPlume;
struct Material;struct water_t {byte bytes[68];};struct GfxFog {byte bytes[32];};
struct GfxLightDef {} light;
''' + debug + globals_prefix + r'''
r_globals_t rg;
struct {unsigned before;GfxLightDef *dlightDef;unsigned after;} rgp;
DebugGlobals debugGlobals;
std::vector<std::string> calls;
int initialCount;
void R_InitImages() {assert(calls.empty()&&rg.sceneWaterMapSetupsCount==initialCount);calls.push_back("images");}
void Material_Init() {assert(calls.size()==1&&calls[0]=="images");calls.push_back("materials");rg.sceneWaterMapSetupsCount=12;}
GfxLightDef *R_RegisterLightDef(const char *name) {
    assert(calls.size()==2&&!strcmp(name,"light_dynamic")&&rg.sceneWaterMapSetupsCount==0);
    calls.push_back("light");memset(rg.fogSettings,0x37,sizeof(rg.fogSettings));return &light;
}
''' + source + r'''
int main() {
    int cases=0;
    for(int fill:{0,0x5a,0xff})for(initialCount=0;initialCount<=16;++initialCount) {
        memset(&rg,fill,sizeof(rg));memset(&debugGlobals,fill,sizeof(debugGlobals));
        rg.sceneWaterMapSetupsCount=initialCount;rgp.before=0x12345678;rgp.after=0x87654321;
        auto expected=rg;expected.sceneWaterMapSetupsCount=0;memset(expected.fogSettings,0,sizeof(expected.fogSettings));
        expected.fogIndex=0;expected.registered=1;
        DebugGlobals expectedDebug={};expectedDebug.vertLimit=4096;expectedDebug.polyLimit=512;
        expectedDebug.stringLimit=4096;expectedDebug.lineLimit=16384;expectedDebug.plumeLimit=4096;
        calls.clear();R_InitSystems();
        assert(calls.size()==3&&rgp.dlightDef==&light&&rgp.before==0x12345678&&rgp.after==0x87654321);
        assert(!memcmp(&rg,&expected,sizeof(rg))&&!memcmp(&debugGlobals,&expectedDebug,sizeof(debugGlobals)));
        ++cases;
    }
    printf("PASS: %d actual renderer systems routes, image/material/light order, shared water count, five fogs and exact debug reset limits\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_renderer_systems_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
