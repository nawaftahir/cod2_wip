"""Actual material startup, retail registration destinations and raw binding ownership."""
from pathlib import Path
import json
import struct
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material.cpp').read_text()

def declaration(name):
    file = 'r_material_globals.h' if name == 'MaterialGlobals' else 'r_permanent.h' if name in ['MaterialTextureDef','r_global_permanent_t'] else 'r_material.cpp'
    owner = (work / 'src/gfx_d3d' / file).read_text()
    start = owner.index('struct ' + name + '\n{')
    return owner[start:owner.index('\n};', start) + 3] + '\n'

types = ''.join(declaration(name) for name in ['MaterialVertexDeclaration', 'MaterialGlobals', 'MaterialTextureDef', 'Material', 'r_global_permanent_t'])
check = text[text.index('typedef char materialStartupLayoutCheck'):text.index('Material **R_GetMaterialHashTable();')]
predicate = text[text.index('Bool Material_IsDefault('):text.index('// Name unconfirmed (Mac 1.3 inlines this into Material_ReleaseAll).')]
source = text[text.index('struct BuiltInMaterialTable'):text.index('void RB_SetFVF(')]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
expected = []
for address, count in [(0x18e988, 28), (0x18ea68, 12)]:
    for index in range(count):
        name, destination = struct.unpack('<II', retail.get_data(address + index * 8, 8))
        expected.append('{%s,0x%x}' % (json.dumps(retail.get_string_at_rva(name - 0x10000000).decode('ascii')), destination - 0x101d0b00))
assert retail.get_string_at_rva(0x1926dc) == b'r_testFillEnable'
assert retail.get_string_at_rva(0x194360) == b"material '$raw' doesn't use just one image"
program = r'''
#include <cassert>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <string>
#include <vector>
#include <stdexcept>
typedef unsigned char byte;typedef byte Bool;
struct GfxImage;struct GfxWorld;struct GfxLightDef;struct MaterialWaterDef;struct MaterialTechniqueSet;struct MaterialTechnique;
struct MaterialStateMap;struct MaterialShader;struct MaterialStreamRouting;struct IDirect3DVertexDeclaration9;
''' + types + r'''
r_global_permanent_t rgp;MaterialGlobals materialGlobals;
''' + check + predicate + r'''
enum errorParm_t {ERR_FATAL=0};
struct dvar_t {struct {Bool enabled;} current;} fill;
const dvar_t *r_testFillEnable=&fill;
struct Expected {const char *name;unsigned offset;} expected[]={''' + ','.join(expected) + r'''};
std::vector<std::string> calls;
Material registered[41],defaultMaterial,rawMaterial;
MaterialTextureDef defaultTextures[2],rawTextures[2];
int defaultConstants,rawConstants,defaultTechniques,rawTechniques;
int scenario,rawCount,preloads,prints,failEntry;
void Material_PreloadShaderText() {
    byte zeros[sizeof(materialGlobals)]={};assert(!memcmp(zeros,&materialGlobals,sizeof(zeros)));
    assert(calls.empty());++preloads;
}
Material *Material_Register(const char *name,int track) {
    assert(track==0&&preloads==1);unsigned index=calls.size();calls.push_back(name);
    if(!strcmp(name,"$raw"))return &rawMaterial;
    assert(index<40&&!strcmp(name,expected[index].name));
    if(int(index)==failEntry)return 0;
    return index?&registered[index]:&defaultMaterial;
}
void print(int channel,const char *message,...) {
    assert(channel==3&&!strcmp(message,"material '$raw' doesn't use just one image"));++prints;
}
struct {void (*Printf)(int,const char*,...);} ri={print};
void Com_Error(errorParm_t code,const char *format,...) {
    assert(code==ERR_FATAL&&!strcmp(format,"Could not find material '%s'"));throw std::runtime_error("fatal");
}
''' + source + r'''
int main() {
    static_assert(sizeof(rgp)==0x10f0,"shared PC permanent state");int cases=0;
    for(int enabled=0;enabled<2;++enabled)for(scenario=0;scenario<4;++scenario)for(rawCount=0;rawCount<3;++rawCount) {
        memset(&rgp,0x5a,sizeof(rgp));memset(&materialGlobals,0xa5,sizeof(materialGlobals));
        memset(registered,0,sizeof(registered));memset(&defaultMaterial,0,sizeof(defaultMaterial));
        defaultMaterial.textures=defaultTextures;defaultMaterial.constants=&defaultConstants;defaultMaterial.techniqueSet=&defaultTechniques;
        rawMaterial=defaultMaterial;rawMaterial.textureCount=rawCount;
        if(scenario==1)rawMaterial.textures=rawTextures;
        if(scenario==2)rawMaterial.constants=&rawConstants;
        if(scenario==3)rawMaterial.techniqueSet=&rawTechniques;
        rawTextures[0].name="raw-name";defaultTextures[0].name="default-name";
        auto before=rgp.rawTexdef;calls.clear();preloads=prints=0;failEntry=-1;fill.current.enabled=enabled;
        Material_Init();
        unsigned count=enabled?40:28;assert(calls.size()==count+1&&calls.back()=="$raw");
        for(unsigned i=0;i<count;++i) {
            auto **slot=(Material**)((byte*)&rgp+expected[i].offset);
            assert(*slot==(i?&registered[i]:&defaultMaterial));
        }
        if(!enabled)for(unsigned i=28;i<40;++i)assert(*(unsigned*)((byte*)&rgp+expected[i].offset)==0x5a5a5a5a);
        bool fallback=scenario&&rawCount!=1;
        assert(prints==int(fallback)&&rgp.rawMaterial==(fallback?&defaultMaterial:&rawMaterial));
        if(scenario&&!fallback) {
            assert(rgp.rawTexdef.name==(scenario==1?rawTextures[0].name:defaultTextures[0].name));
            assert(rawMaterial.textures==&rgp.rawTexdef);
        } else assert(rgp.rawTexdef.name==before.name);
        assert(!memcmp((byte*)&rgp.rawTexdef+4,(byte*)&before+4,8));
        assert(defaultMaterial.textures==defaultTextures&&rgp.savedScreenTime==0x5a5a5a5a);
        ++cases;
    }
    for(int enabled=0;enabled<2;++enabled)for(int failure:{0,27,28,39}) {
        calls.clear();preloads=prints=0;fill.current.enabled=enabled;failEntry=failure;
        memset(&materialGlobals,0x55,sizeof(materialGlobals));
        bool caught=false;try{Material_Init();}catch(const std::runtime_error&){caught=true;}
        bool shouldFail=failure<28||enabled;assert(caught==shouldFail);
        if(shouldFail)assert(calls.size()==unsigned(failure+1));++cases;
    }
    assert(sizeof(s_builtInMaterials)==28*8&&sizeof(s_fillTestMaterials)==12*8);
    printf("PASS: %d actual material startup routes, 40 retail names/destinations, globals reset, optional tables, raw fallback/rebinding and preserved sampler/image\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_startup_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
