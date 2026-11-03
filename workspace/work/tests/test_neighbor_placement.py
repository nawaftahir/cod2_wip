"""Require two coherent anchors and matching code, gaps and relocations."""
import ast
import bisect
from pathlib import Path

tree = ast.parse((Path(__file__).resolve().parents[3] / 'tools/bindcheck.py').read_text())
helper = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == 'neighbor_places')


def run(wrong_delta=False, missing_hit=False, wrong_gap=False, extra_reloc=False,
        foreign=False, missing_anchor=False, unknown_member=False):
    addresses = {'?left': 0x1000, '?candidate': 0x1030, '?right': 0x1050}
    rows = {n: dict(name=n, obj='engine.obj', size=19 if n == '?candidate' else 33,
                   hits=[hex(a+0x4000)]) for n, a in addresses.items()}
    rows['?candidate']['hits'] = ['0x6030'] if missing_hit else ['0x5030', '0x6030']
    placed = {n: rows[n] for n in ('?left', '?right')}
    if wrong_delta:
        placed['?right'] = dict(rows['?right'], hits=['0x5060'])
    if missing_anchor:
        del placed['?right']
    if foreign:
        addresses['foreign'] = 0x1044
    if unknown_member:
        addresses['unknown'] = 0x1044
        rows['unknown'] = dict(size=4, hits=[], obj='engine.obj')
    source = bytearray(b'\xcc' * 113)
    for name in ('?left', '?candidate', '?right'):
        offset = addresses[name]-0x1000
        source[offset:offset+rows[name]['size']] = b'\x90'*(rows[name]['size']-1)+b'\xc3'
    target = bytearray(source)
    if wrong_gap:
        target[34] = 0x90
    ns = dict(bisect=bisect, orel={0x1004}, arel={0x5004, 0x5048} if extra_reloc else {0x5004},
              masked_eq=lambda a,t,n: bytes(source[a-0x1000:a-0x1000+n]) == bytes(target[t-0x5000:t-0x5000+n]))
    exec(compile(ast.Module(body=[helper], type_ignores=[]), '<actual-neighbor-placement>', 'exec'), ns)
    return ns['neighbor_places'](rows, addresses, placed)


assert run()['?candidate']['hits'] == ['0x5030']
for option in ('wrong_delta', 'missing_hit', 'wrong_gap', 'extra_reloc',
               'foreign', 'missing_anchor', 'unknown_member'):
    assert not run(**{option: True}), option
print('PASS: full-region placement rejects inconsistent anchors, missing hits, changed gaps, relocation differences and omitted functions')
