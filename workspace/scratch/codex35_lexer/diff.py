"""Compare SDK/source instructions for named lexer methods; diagnostic only."""
import difflib
from pathlib import Path
import sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members

matcher = load_matcher()
decoder = Cs(CS_ARCH_X86, CS_MODE_32)
def bodies(raw):
    coff = matcher['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    result = {}
    for symbol in symbols.values():
        if symbol['sec'] <= 0 or '@CTokenize@' not in symbol['name']:
            continue
        section = coff['sections'][symbol['sec'] - 1]
        relocations = {r['vaddr']: symbols[r['sym']]['name'] for r in section['relocs']}
        lines = []
        for ins in decoder.disasm(raw[section['rawptr']:section['rawptr'] + section['rawsize']], 0):
            names = [name for offset, name in relocations.items() if ins.address <= offset < ins.address + ins.size]
            lines.append('%03x %s %s%s' % (ins.address, ins.mnemonic, ins.op_str,
                         ' -> ' + ','.join(names) if names else ''))
        result[symbol['name']] = lines
    return result

sdk = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))[93]
old, new = bodies(sdk), bodies((HERE / 'obj/lexer.obj').read_bytes())
for name in old:
    if name in new and any(name.startswith('?' + n + '@') for n in sys.argv[1:]):
        print('\n' + name)
        print('\n'.join(difflib.unified_diff(old[name], new[name], fromfile='SDK', tofile='source', n=2)))
