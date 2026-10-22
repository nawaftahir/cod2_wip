"""Actual API59 effect callbacks forward to the verified client imports."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_rendercmds.cpp').read_text()
source = text[text.index('void R_UpdateEffectsBolt()'):text.index('// PINNED 101e4a00:')]
pe = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
decoder.detail = True
for address, slot in ((0x10020cb0, 166), (0x10020cc0, 165)):
    instruction = next(decoder.disasm(pe.get_data(address - 0x10000000, 6), address))
    assert instruction.mnemonic == 'jmp' and instruction.size == 6
    assert instruction.operands[0].mem.disp == 0x101d49c8 + 4 * slot
program = r'''
#include <cassert>
#include <vector>
#include <cstdio>
std::vector<int> calls;
void bolt() {calls.push_back(166);}
void nonBolt() {calls.push_back(165);}
struct {void (*FX_UpdateNonBolt)();void (*FX_UpdateBolt)();} ri={nonBolt,bolt};
'''+source+r'''
int main() {
    for(int i=0;i<64;++i) {R_UpdateEffectsBolt();R_UpdateEffectsNonBolt();}
    assert(calls.size()==128);
    for(int i=0;i<128;++i)assert(calls[i]==(i%2?165:166));
    puts("PASS: 128 actual effect callback forwards; both retail tail-jump operands pin the correct imports");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_effect_callbacks_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
