"""Actual logical shutdown order, publication and optional hardware teardown."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import json
import subprocess
import tempfile
import pefile
import capstone
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_init.cpp')
source = text[text.index('void R_Shutdown(int destroyWindow)'):]
commands = fragment('gfx_d3d/r_cmds.cpp')
unregister = commands[commands.index('// PINNED 10005360:'):]
material = (work / 'src/gfx_d3d/r_material_globals.h').read_text().replace('#pragma once', '')
retail = pefile.PE(str(retail_anchor()))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
names = [retail.get_string_at_rva(int(i.op_str,16)-0x10000000).decode() for i in decoder.disasm(retail.get_data(0x5360,114),0x10005360) if i.mnemonic=='push']
assert len(names)==10 and names[1]=='r_vc_stats'

def body(file, name):
    owner = (work / 'src/gfx_d3d' / file).read_text()
    start = owner.index('void ' + name + '()')
    return owner[start:owner.index('\n}', start) + 2]

owners = r'''
namespace owners {
struct {struct {void *vb;int offset,stride;} streams[1];} dxState;
int changes;
void RB_ChangeStreamSource(int stream,void *vb,int offset,int stride){assert(!stream&&!vb&&!offset&&!stride);++changes;}
int registeredFontCount;void *registeredFont[16];
struct {int count;void *defs[64];} lightGlobals;
struct DebugGlobals {int marker;};
struct {DebugGlobals debugGlobals;} s_backEndData;
void R_ShutdownDebugEntry(DebugGlobals *entry){assert(entry==&s_backEndData.debugGlobals&&entry->marker==77);entry->marker=88;}
''' + body('rb_state.cpp','RB_ClearAllStreamSources') + body('r_font.cpp','R_ShutdownFonts') + body('r_light.cpp','R_ShutdownLightDefs') + body('r_rendercmds.cpp','R_ShutdownBackendData') + r'''
void check() {
    for(int mask=0;mask<8;++mask) {
        dxState.streams[0].vb=mask&1?(void *)1:0;
        dxState.streams[0].offset=mask&2?-7:0;dxState.streams[0].stride=mask&4?64:0;changes=0;
        RB_ClearAllStreamSources();assert(changes==(mask!=0));
    }
    for(int count=0;count<17;++count) {
        registeredFontCount=count;memset(registeredFont,0x5a,sizeof(registeredFont));
        R_ShutdownFonts();assert(!registeredFontCount);
        for(auto p:registeredFont)assert(p==(void *)0x5a5a5a5a);
    }
    for(int count=0;count<65;++count) {
        lightGlobals.count=count;memset(lightGlobals.defs,0x6b,sizeof(lightGlobals.defs));
        R_ShutdownLightDefs();assert(!lightGlobals.count);
        for(auto p:lightGlobals.defs)assert(p==(void *)0x6b6b6b6b);
    }
    s_backEndData.debugGlobals.marker=77;R_ShutdownBackendData();assert(s_backEndData.debugGlobals.marker==88);
}
}
'''
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <vector>
#include <initializer_list>
struct MaterialVertexDeclaration {void *routingData;int streamCount;void *decl[4];};
struct MaterialTechniqueSet;struct MaterialTechnique;struct MaterialStateMap;struct MaterialShader;
''' + material + r'''
MaterialGlobals materialGlobals;
struct {unsigned char registered;void *materialHashTable[1024];int untouched;} rg;
struct {int materialCount;void *world;int untouched;} rgp;
struct {void *device;unsigned char deviceLost;int untouched;} dx;
std::vector<int> calls,expected;int failAt,removed;
struct Failure {};
void step(int id){calls.push_back(id);if(id==failAt)throw Failure();}
void RB_ClearAllStreamSources(){assert(!rg.registered);step(0);}
void R_ShutdownBackendData(){assert(!rg.registered);step(1);}
void R_ShutdownDebug(){step(2);}void RB_SaveLightVisHistory(){step(3);}
void R_ShutdownLightDefs(){step(4);}void R_ShutdownWorld(){step(5);rgp.world=0;}
void R_ShutdownFonts(){step(6);}void R_ReleaseAllModels(){step(7);}
void Material_Shutdown(){step(8);memset(&materialGlobals,0x6b,sizeof(materialGlobals));}
void R_ShutdownImages(){
    unsigned char zeros[sizeof(materialGlobals)]={};void *empty[1024]={};
    assert(!memcmp(&materialGlobals,zeros,sizeof(zeros))&&!memcmp(rg.materialHashTable,empty,sizeof(empty))&&!rgp.materialCount);
    step(9);rgp.world=(void *)2;
}
void R_UnlockSkinnedCache(){assert(!rgp.world);step(10);}
void R_FlushStaticModelCache(){step(11);}void R_ShutdownHardware(){step(12);}
void unregisterSystem(int flag){assert(flag==0x2000);step(13);}
const char *names[]={''' + ','.join(json.dumps(n) for n in names) + r'''};
void removeCommand(const char *name){assert(removed<10&&!strcmp(name,names[removed]));step(14+removed++);}
struct {void (*Dvar_UnregisterSystem)(int);void (*Cmd_RemoveCommand)(const char *);} ri={unregisterSystem,removeCommand};
''' + unregister + source + owners + r'''
int main() {
    static_assert(sizeof(MaterialGlobals)==0x299c,"actual shared material tables");
    owners::check();
    int cases=0;
    for(int device=0;device<2;++device)for(int lost=0;lost<2;++lost)for(int destroy:{0,1,-1})for(failAt=-1;failAt<24;++failAt) {
        memset(&rg,0x5a,sizeof(rg));memset(&rgp,0x6b,sizeof(rgp));memset(&dx,0x7c,sizeof(dx));memset(&materialGlobals,0x4d,sizeof(materialGlobals));
        rg.registered=1;dx.device=device?(void *)1:0;dx.deviceLost=lost;calls.clear();expected.clear();removed=0;
        if(device&&!lost)expected.push_back(0);
        for(int i=1;i<12;++i)expected.push_back(i);
        if(destroy){expected.push_back(12);expected.push_back(13);}
        for(int i=14;i<24;++i)expected.push_back(i);
        bool shouldThrow=false;for(unsigned i=0;i<expected.size();++i)if(expected[i]==failAt){expected.resize(i+1);shouldThrow=true;break;}
        bool threw=false;try{R_Shutdown(destroy);}catch(Failure &){threw=true;}
        assert(threw==shouldThrow&&calls==expected&&!rg.registered);
        assert(rg.untouched==0x5a5a5a5a&&rgp.untouched==0x6b6b6b6b&&dx.untouched==0x7c7c7c7c);
        if(!threw)assert(removed==10&&!rgp.world);++cases;
    }
    printf("PASS: %d actual logical-shutdown routes, retail command names/order, table clears, late world reset, optional hardware and interrupted cleanup\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_renderer_shutdown_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
