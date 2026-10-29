"""Check live memory-function literals, imports and shared-state identities."""
import csv
import runpy
from pathlib import Path
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

model = runpy.run_path('research/codex_order/test_model.py')
verify, image, md = model['verify'], model['image'], model['md']
retail, ours = model['retail'], model['ours']
rows = [row for row in csv.DictReader(Path('ledger/matches.tsv').read_text().splitlines(), delimiter='\t')
        if row['source'] == 'src/universal/com_memory.cpp']
state = {}
literals = imports = 0
for row in rows:
    assert verify.check(image, row['addr'], row['symbol'], verify.known_names())[0] == 'MATCH'
    target, _ = verify.matcher.carve(row['addr'])
    start, code = image.code(row['symbol'])
    for original, actual in zip(md.disasm(target, int(row['addr'], 16)), md.disasm(code, start)):
        for operand, replacement in zip(original.operands, actual.operands):
            if operand.type == X86_OP_MEM:
                pointer = operand.mem.disp
                if pointer in model['retail_imports']:
                    assert model['actual_imports'][replacement.mem.disp] == model['retail_imports'][pointer]
                    imports += 1
                elif 0x58f800 <= pointer < 0x1400000:
                    assert state.setdefault(pointer, replacement.mem.disp) == replacement.mem.disp, (row['addr'], hex(pointer))
            if original.mnemonic == 'push' and operand.type == X86_OP_IMM and 0x52720e < operand.imm < 0x58f800:
                expected = retail.get_data(operand.imm - retail.OPTIONAL_HEADER.ImageBase, 256).split(b'\0', 1)[0]
                got = ours.get_data(replacement.imm - ours.OPTIONAL_HEADER.ImageBase, 256).split(b'\0', 1)[0]
                assert expected == got, (row['addr'], expected, got)
                literals += 1
assert len(rows) == 44 and literals >= 20 and imports >= 5 and len(state) >= 10, (len(rows), literals, imports, len(state))
assert len(set(state.values())) == len(state), 'distinct retail state addresses were aliased'
print('PASS: %d memory routines, %d literals, %d import accesses, %d shared-state identities' % (len(rows), literals, imports, len(state)))
