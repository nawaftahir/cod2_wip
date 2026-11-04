"""Actual nine-command registration order and callback identities."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import json
import re
import subprocess
import tempfile
import pefile
import capstone
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_cmds.cpp')
source = text[text.index('void R_RegisterCmds()'):]
source = source[:source.index('// PINNED 10005360:')]
retail = pefile.PE(str(retail_anchor()))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
names = []
for ins in decoder.disasm(retail.get_data(0x52c0,151),0x100052c0):
    if ins.mnemonic=='push' and ins.op_str.startswith('0x1019'):
        names.append(retail.get_string_at_rva(int(ins.op_str,16)-0x10000000).decode())
callbacks = ['R_ScreenShot_f','R_ScreenShotJpeg_f','R_ImageList_f','R_ApplyPicmip_f','Material_ReloadTextures_f','R_LoadSun_f','R_SaveSun_f','R_StaticModelCacheStats_f','R_StaticModelCacheFlush_f']
assert len(names)==len(callbacks)==9
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
typedef void (*Callback)();
int calls,invoked[9];
''' + '\n'.join('void %s(){++invoked[%d];}' % (name,index) for index,name in enumerate(callbacks)) + r'''
Callback expected[]={''' + ','.join(callbacks) + r'''};
const char *names[]={''' + ','.join(json.dumps(name) for name in names) + r'''};
Callback registered[9];
void add(const char *name,Callback fn){assert(calls<9&&!strcmp(name,names[calls])&&fn==expected[calls]);registered[calls++]=fn;}
struct {void (*Cmd_AddCommand)(const char*,Callback);} ri={add};
''' + source + r'''
int main(){R_RegisterCmds();assert(calls==9);for(int i=0;i<9;++i){registered[i]();assert(invoked[i]==1);}puts("PASS: actual nine-command registration, retail names/order and distinct callback identities; callback bodies tested separately");}
'''
with tempfile.TemporaryDirectory(prefix='gfx_command_registration_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

symbols = {}
for line in (work / 'layout/current.map').read_text().splitlines():
    fields = line.split()
    if len(fields)>=3 and re.fullmatch(r'[0-9a-fA-F]{8}',fields[2]):
        symbols[fields[1]] = int(fields[2],16)
current = pefile.PE(str(work.parent / 'build/codex_boundsoutside_1016_02/gfx.dll'))
address = symbols['?R_RegisterCmds@@YAXXZ']
instructions = list(decoder.disasm(current.get_data(address-current.OPTIONAL_HEADER.ImageBase,151),address))
pushes = [int(ins.op_str,16) for ins in instructions if ins.mnemonic=='push' and ins.op_str.startswith('0x')]
calls = [ins.op_str for ins in instructions if ins.mnemonic=='call']
ri = symbols['?ri@@3Urefimport_t@@A']

def validate(pushes,calls):
    assert len(pushes)==18 and len(calls)==9
    for index,name in enumerate(names):
        assert pushes[index*2] == symbols['?'+callbacks[index]+'@@YAXXZ']
        assert current.get_string_at_rva(pushes[index*2+1]-current.OPTIONAL_HEADER.ImageBase).decode() == name
        assert calls[index] == 'dword ptr [0x%x]' % (ri+0x104)

validate(pushes,calls)
bad = pushes.copy();bad[0]=pushes[2]
try:validate(bad,calls)
except AssertionError:pass
else:raise AssertionError('wrong callback accepted')
bad = calls.copy();bad[0]='dword ptr [0x%x]' % (ri+0x108)
try:validate(pushes,bad)
except AssertionError:pass
else:raise AssertionError('wrong import slot accepted')
print('PASS: linked DLL has all nine actual callback addresses, names and RI+104 command import; callback/import-slot corruptions rejected')
