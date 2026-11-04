"""Actual surface setup must preserve fields not reset by the retail entry."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import json
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
source = (work / 'src/gfx_d3d/rb_shade.cpp').read_text()
source = (source[source.index('// PINNED 10037930'):source.index('// Dynamic index and vertex uploads.')]
    + source[source.index('// PINNED 1003a5f0'):])
header = (work / 'src/gfx_d3d/rb_tess.h').read_text()
header = header[header.index('struct Material;'):header.index('#ifdef _MSC_VER')]
retail = pefile.PE(str(retail_anchor()))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
decoder.detail = True
names = []
for i in decoder.disasm(retail.get_data(0x37930,304),0x10037930):
    if i.mnemonic == 'mov' and i.operands[0].type == capstone.x86.X86_OP_MEM and i.operands[0].mem.base == capstone.x86.X86_REG_ESP:
        names.append(retail.get_string_at_rva(i.operands[1].imm-retail.OPTIONAL_HEADER.ImageBase).decode('ascii'))
assert len(names) == 35
body = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x3a5f0,153),0x1003a5f0)]
for address in [0x1072d9cc,0x1072d9b8,0x1072d9d0,0x1072d9d4,0x1072d9d8,0x1072d9dc]:
    assert ('mov','dword ptr [%s], ebx' % hex(address)) in body
for address in [0x1072d9e0,0x1072d9e4,0x1072d9e8,0x1072d9c8]:
    assert not any(op.startswith('dword ptr [%s],' % hex(address)) for mnemonic,op in body if mnemonic=='mov')
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <climits>
''' + header + r'''
GfxTess tess, before;
struct Material {const char *name;};
struct dvar_t {struct {int integer;} current;} logDvar;
const dvar_t *r_logFile=&logDvar;
int logCalls,vaCalls;
char message[1024];
const char *va(const char *format,...) {
    assert(!memcmp(&tess,&before,sizeof(tess)));
    ++vaCalls;va_list args;va_start(args,format);vsnprintf(message,sizeof(message),format,args);va_end(args);
    return message;
}
void RB_LogPrint(const char *text) {
    assert(text==message&&!memcmp(&tess,&before,sizeof(tess)));++logCalls;
}
''' + source + '\nconst char *expectedNames[]={' + ','.join(json.dumps(n) for n in names) + r'''};
int main() {
    static_assert(sizeof(GfxTess)==0x5a7ec,"PC complete tess extent");
    static_assert(offsetof(GfxTess,optimizedIndexCount)==0x5a7e0,"optimized count");
    static_assert(offsetof(GfxTess,firstOptimizedVertex)==0x5a7e8,"last member");
    Material materials[]={{"first"},{"second"}};
    int fills[]={0,0x5a,0xff},logs[]={-1,0,1,2},lmaps[]={INT_MIN,-1,0,31,INT_MAX};
    int cases=0;
    for(int fill:fills)for(int log:logs)for(int type=0;type<35;++type)for(auto &material:materials)for(int lmap:lmaps) {
        memset(&tess,fill,sizeof(tess));before=tess;GfxTess expected=tess;
        logDvar.current.integer=log;logCalls=vaCalls=0;message[0]=0;
        expected.declType=expected.optimizedVertexSource=expected.indexCount=expected.vertexCount=0;
        expected.firstVertex=expected.lastVertex=0;
        expected.material=&material;expected.techType=type;expected.lmapIndex=lmap;
        assert(!strcmp(RB_TechniqueName(type),expectedNames[type]));
        RB_BeginSurface(&material,type,lmap);
        assert(!memcmp(&tess,&expected,sizeof(tess)));
        assert(logCalls==(log!=0)&&vaCalls==(log!=0));
        if(log) {char expectedMessage[1024];snprintf(expectedMessage,sizeof(expectedMessage),"---------- RB_BeginSurface( %s, %s )\n",material.name,expectedNames[type]);assert(!strcmp(message,expectedMessage));}
        ++cases;
    }
    printf("PASS: %d actual surface begins,35 retail names, logging-before-reset, complete shared extent and untouched optimized counts/material time\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_surface_begin_') as directory:
    binary = str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
