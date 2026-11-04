"""Pin both parser declarations to the PC field offsets used by token pushback."""
from pathlib import Path
import hashlib
import re
import subprocess
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
gfx = work.parents[1]
anchor = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
image = pefile.PE(str(anchor))
md = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
code = list(md.disasm(image.get_data(0x5f3f0,82),0x1005f3f0))
assert any(i.mnemonic=='mov' and i.op_str=='eax, dword ptr [0x101aac78]' for i in code)
assert any(i.mnemonic=='mov' and i.op_str=='dword ptr [0x101aac74], eax' for i in code)
source_token_call = next(md.disasm(image.get_data(0x192d1,5),0x100192d1))
assert source_token_call.mnemonic=='call' and source_token_call.op_str=='0x1005fa50'

program = '#include <stddef.h>\n#define MAX_TOKEN_CHARS 1024\n#define MAX_QPATH 64\n#define MAX_PARSE_INFO 16\ntypedef unsigned char Bool;\n'
types = (gfx/'target/src/opencod2/headers/cod2_types.h').read_text()
assert '#include "cod2_defs.h"' in types and '#include "PC/universal/com_types.h"' in types
for namespace,paths in [('engine',[work/'src/universal/q_shared.h']),('renderer',[gfx/'target/src/opencod2/headers/cod2_defs.h',gfx/'target/src/opencod2/headers/PC/universal/com_types.h'])]:
    text = '\n'.join(path.read_text() for path in paths)
    program += 'namespace '+namespace+' {\n'
    for name in ['parseInfo_t','ParseThreadInfo']:
        declaration = re.search(r'struct\s+'+name+r'\s*\{.*?\n\};',text,re.S)
        assert declaration, (paths,name)
        program += declaration.group(0)+'\n'
    program += '''static_assert(sizeof(parseInfo_t)==0x45c,"PC parse record");
static_assert(offsetof(parseInfo_t,lines)==0x400,"PC current line");
static_assert(offsetof(parseInfo_t,ungetToken)==0x404,"PC pushback flag");
static_assert(offsetof(parseInfo_t,backup_lines)==0x414,"PC saved line");
static_assert(offsetof(parseInfo_t,backup_text)==0x418,"PC saved input");
static_assert(offsetof(ParseThreadInfo,parseInfoNum)==0x45c0,"PC parser index");
static_assert(offsetof(ParseThreadInfo,tokenPos)==0x45c4,"PC current token");
static_assert(offsetof(ParseThreadInfo,prevTokenPos)==0x45c8,"PC previous token");
}\n'''
subprocess.run(['g++','-m32','-std=c++11','-fsyntax-only','-x','c++','-'],input=program,text=True,check=True)
print('PASS: both actual parser declarations match PC record/index/token offsets; retail load78/store74 pinned')
