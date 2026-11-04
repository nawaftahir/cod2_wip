"""Actual normal-frame selection, backend ownership and preserved command/debug state."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_rendercmds.cpp').read_text()
source = text[text.index('void R_InitFrameBackendData()'):text.index('// PINNED 10020b50/')]
retail = pefile.PE(str(retail_anchor()))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
decoder.detail = True
stores, zero_offsets = {}, set()
for instruction in decoder.disasm(retail.get_data(0x21040, 143), 0x10021040):
    if instruction.mnemonic != 'mov':
        continue
    dest, value = instruction.operands
    if dest.type != capstone.CS_OP_MEM:
        continue
    if not dest.mem.base and value.type == capstone.CS_OP_IMM:
        stores[dest.mem.disp] = value.imm
    if dest.mem.base == capstone.x86.X86_REG_EAX and value.type == capstone.CS_OP_REG and value.reg == capstone.x86.X86_REG_ECX:
        zero_offsets.add(dest.mem.disp)
assert stores[0x101da9c8] == 0x1042e780
assert zero_offsets == {4,0x80008,0xa000c,0x187c70,0x18fc74,0x217c7c,0x249d4c,0x249d34,0x249d1c}
assert 0x1042e780 + 0x249d18 == 0x10678498
assert 0x1042e780 + 0x249d6c == 0x106784ec
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <initializer_list>
struct r_vb_state_t {int used,total;void *buffer;};
struct GfxCmdArray {int usedTotal,usedCritical;void *lastCmd;};
struct DebugGlobals {
    void *verts;int vertCount,vertLimit;
    void *polys;int polyCount,polyLimit;
    void *strings;int stringCount,stringLimit;
    void *externStrings;int externStringCount,externMaxStringCount;
    void *lines;int lineCount,lineLimit;
    void *externLines;int externLineCount,externMaxLineCount;
    void *plumes;int plumeCount,plumeLimit;
};
struct GfxBackEndData {
    int frameCount,drawSurfCount,surfPos,entityCount,polyCount,polyVertCount,viewParmCount;
    r_vb_state_t *skinnedCacheVb;GfxCmdArray commands;DebugGlobals debugGlobals;
} s_backEndData,alternate;
GfxBackEndData *frontEndDataOut;
GfxCmdArray *s_cmdList;
struct {int frameCountInternal;} rg;
struct {int dynamicBufferFrame;r_vb_state_t skinnedCacheVbPool[2];} dx;
bool replaceOwner;
int unlocks,expectedFrame;
void R_UnlockSkinnedCache() {
    assert(frontEndDataOut==&s_backEndData&&s_backEndData.frameCount==expectedFrame);
    assert(rg.frameCountInternal==expectedFrame);++unlocks;
    if(replaceOwner)frontEndDataOut=&alternate;
}
'''+source+r'''
int main() {
    int cases=0;
    for(int oldFrame:{0,1,-1,-3})for(int frameCount:{0,17,1024})for(int replace=0;replace<2;++replace) {
        memset(&s_backEndData,0x5a,sizeof(s_backEndData));memset(&alternate,0x6b,sizeof(alternate));
        DebugGlobals normalDebug=s_backEndData.debugGlobals,otherDebug=alternate.debugGlobals;
        GfxCmdArray normalCmd=s_backEndData.commands,otherCmd=alternate.commands;
        dx.dynamicBufferFrame=oldFrame;
        dx.skinnedCacheVbPool[0]={100,200,(void*)0x1234};
        dx.skinnedCacheVbPool[1]={300,400,(void*)0x5678};
        rg.frameCountInternal=frameCount;expectedFrame=frameCount+1;replaceOwner=replace;unlocks=0;
        frontEndDataOut=&alternate;s_cmdList=0;
        R_InitFrameBackendData();
        int selected=(oldFrame+1)%2;assert(selected==0||selected==1);
        GfxBackEndData *data=replace?&alternate:&s_backEndData;
        assert(unlocks==1&&frontEndDataOut==data&&s_cmdList==&data->commands);
        assert(s_backEndData.frameCount==expectedFrame&&dx.dynamicBufferFrame==selected);
        assert(data->skinnedCacheVb==&dx.skinnedCacheVbPool[selected]);
        assert(dx.skinnedCacheVbPool[selected].used==0);
        assert(dx.skinnedCacheVbPool[1-selected].used==(selected?100:300));
        assert(dx.skinnedCacheVbPool[0].total==200&&dx.skinnedCacheVbPool[1].total==400);
        assert(!data->drawSurfCount&&!data->surfPos&&!data->entityCount&&!data->polyCount&&!data->polyVertCount&&!data->viewParmCount);
        assert(!memcmp(&s_backEndData.commands,&normalCmd,sizeof(normalCmd)));
        assert(!memcmp(&alternate.commands,&otherCmd,sizeof(otherCmd)));
        DebugGlobals expected=replace?otherDebug:normalDebug;
        expected.vertCount=expected.stringCount=expected.lineCount=0;
        assert(!memcmp(&data->debugGlobals,&expected,sizeof(expected)));
        assert(!memcmp(replace?&s_backEndData.debugGlobals:&alternate.debugGlobals,
            replace?&normalDebug:&otherDebug,sizeof(expected)));
        ++cases;
    }
    printf("PASS: %d actual normal-backend routes, signed frame selection, unlock order, pointer reload and untouched command/debug fields\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_frame_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
