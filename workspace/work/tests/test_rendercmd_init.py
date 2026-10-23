"""Normal-frame debug setup and both actual tess index allocations."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_rendercmds.cpp').read_text()
source = text[text.index('void R_InitRenderCmds()'):text.index('// PINNED in 10013080:')]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
instructions = list(decoder.disasm(retail.get_data(0x20b50, 126), 0x10020b50))
assert instructions[-1].address == 0x10020bcd and instructions[-1].mnemonic == 'ret'
operands = [(i.mnemonic, i.op_str) for i in instructions]
for pair in [('mov', 'edi, 0x10678498'), ('mov', 'ecx, 0x15'),
             ('mov', 'dword ptr [0x1072d9b0], eax'),
             ('mov', 'dword ptr [0x1072d9b4], eax'), ('jmp', '0x10021040')]:
    assert pair in operands, pair
assert operands.count(('push', '0x200000')) == 2
assert operands.count(('call', 'dword ptr [0x101d49d4]')) == 2
header = (work / 'src/gfx_d3d/rb_tess.h').read_text()
assert 'offsetof(GfxTess, secondaryIndices) == 0x5a7b4' in header
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
struct DebugGlobals {
    void *verts;int vertCount,vertLimit;
    void *polys;int polyCount,polyLimit;
    void *strings;int stringCount,stringLimit;
    void *externStrings;int externStringCount,externMaxStringCount;
    void *lines;int lineCount,lineLimit;
    void *externLines;int externLineCount,externMaxLineCount;
    void *plumes;int plumeCount,plumeLimit;
};
struct GfxCmdArray {int usedTotal,usedCritical;void *lastCmd;};
struct GfxBackEndData {int untouched;GfxCmdArray commands;DebugGlobals debugGlobals;};
GfxBackEndData s_backEndData,alternate,*frontEndDataOut;
struct {unsigned short *indices,*secondaryIndices;} tess;
unsigned short buffers[2][4];
int allocations,frameInits,mode;
void *Allocate(int size) {
    assert(size==0x200000&&allocations<2);
    assert(s_backEndData.debugGlobals.vertLimit==4096);
    if(allocations==1)assert(tess.indices==buffers[0]);
    if(mode==2&&allocations==1)frontEndDataOut=&alternate;
    if(mode==3&&allocations==1)frontEndDataOut=0;
    return buffers[allocations++];
}
struct {void *(*Hunk_AllocInternal)(int);} ri={Allocate};
void R_InitFrameBackendData() {
    assert(allocations==2&&!frontEndDataOut);++frameInits;
    frontEndDataOut=&s_backEndData;
}
'''+source+r'''
int main() {
    static_assert(sizeof(DebugGlobals)==84,"primary debug extent");
    for(mode=0;mode<4;++mode) {
        memset(&s_backEndData,0x5a,sizeof(s_backEndData));
        memset(&alternate,0x6b,sizeof(alternate));
        GfxBackEndData before=s_backEndData,other=alternate;
        tess.indices=tess.secondaryIndices=0;allocations=frameInits=0;
        frontEndDataOut=mode==1||mode==3?&alternate:0;
        R_InitRenderCmds();
        assert(allocations==2&&tess.indices==buffers[0]&&tess.secondaryIndices==buffers[1]);
        DebugGlobals expected={};
        expected.vertLimit=expected.stringLimit=expected.plumeLimit=4096;
        expected.polyLimit=512;expected.lineLimit=16384;
        before.debugGlobals=expected;
        if(mode==1||mode==2) {
            other.commands.usedTotal=other.commands.usedCritical=0;other.commands.lastCmd=0;
            assert(!frameInits&&frontEndDataOut==&alternate);
        } else assert(frameInits==1&&frontEndDataOut==&s_backEndData);
        assert(!memcmp(&s_backEndData,&before,sizeof(before)));
        assert(!memcmp(&alternate,&other,sizeof(other)));
    }
    puts("PASS: four render-command startup routes, debug limits, allocation order and callback ownership changes");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_rendercmd_init_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
