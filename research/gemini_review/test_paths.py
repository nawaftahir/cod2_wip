"""Check actual imported APIs and literals in the reviewed MRU/path subset."""
import runpy
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

model = runpy.run_path('research/codex_order/test_model.py')
verify, image, md = model['verify'], model['image'], model['md']
retail, ours = model['retail'], model['ours']
sources = {'src/radiant/mru.cpp', 'src/radiant/CapDialog.cpp',
           'src/radiant/points.cpp', 'src/universal/win_common.cpp'}
rows = [row for row in verify.read_tsv('ledger/matches.tsv') if row['source'] in sources]
imports = literals = 0
state = {}
for row in rows:
    assert verify.check(image, row['addr'], row['symbol'], verify.known_names())[0] == 'MATCH', row
    target, _ = verify.matcher.carve(row['addr'])
    start, code = image.code(row['symbol'])
    for original, actual in zip(md.disasm(target, int(row['addr'], 16)), md.disasm(code, start)):
        for operand, replacement in zip(original.operands, actual.operands):
            if operand.type == X86_OP_MEM:
                pointer = operand.mem.disp
                if pointer in model['retail_imports']:
                    assert model['actual_imports'][replacement.mem.disp] == model['retail_imports'][pointer], row
                    imports += 1
                elif 0x58f800 <= pointer < 0x1400000:
                    assert state.setdefault(pointer, replacement.mem.disp) == replacement.mem.disp, row
            if original.mnemonic == 'push' and operand.type == X86_OP_IMM and 0x52720e < operand.imm < 0x58f800:
                expected = retail.get_data(operand.imm - retail.OPTIONAL_HEADER.ImageBase, 256).split(b'\0', 1)[0]
                got = ours.get_data(replacement.imm - ours.OPTIONAL_HEADER.ImageBase, 256).split(b'\0', 1)[0]
                assert expected == got, (row['addr'], expected, got)
                literals += 1
assert len(rows) >= 28 and imports >= 10 and literals >= 5, (len(rows), imports, literals)
print('PASS: %d MRU/path game rows, %d import accesses, %d literals, %d consistent state references' % (len(rows), imports, literals, len(state)))
