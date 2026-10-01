"""Full-section diagnostics only; this does not accept source coverage."""
from pathlib import Path
import difflib
import sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
sys.argv = ['probe.py', 'token.obj', 'token.cpp']
source = prior.read_text().replace('HERE = Path(__file__).resolve().parent', 'HERE = Path(__file__).resolve().parent')
exec(compile(source, str(prior), 'exec'))
ref = refs['?Token@CParse@D3DXShader@@IAEHXZ']
oracle = sdk[ref['member']]
original = m['parse_coff'](oracle)
fn = next(s for s in coff['symbols'] if s['name'] == ref['symbols'][0])
sequences = []
for data, c, section in [(oracle, original, original['sections'][ref['section'] - 1]),
                         (raw, coff, coff['sections'][fn['sec'] - 1])]:
    names = {s['idx']: s['name'] for s in c['symbols']}
    fields = {r['vaddr']: names[r['sym']] for r in section['relocs']}
    instructions = []
    for i in Cs(CS_ARCH_X86, CS_MODE_32).disasm(data[section['rawptr']:section['rawptr'] + section['rawsize'] - 148], 0):
        operand = i.op_str
        if i.mnemonic.startswith('j') and operand.startswith('0x'):
            operand = 'branch'
        if i.mnemonic == 'call':
            operand = 'call'
        bindings = [fields[p] for p in range(i.address, i.address + i.size)
                    if p in fields and not fields[p].startswith('$')]
        instructions.append(i.mnemonic + ' ' + operand + ' ' + ' '.join(bindings))
    sequences.append(instructions)
print('\n'.join(difflib.unified_diff(*sequences, n=3)))
