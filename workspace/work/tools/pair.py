#!/usr/bin/env python3
"""pair.py: pair unplaced retail game functions with our unmatched source by callee fingerprint.

Retail callees come from the Ghidra export; ours from our DLL. Prints retail addr, size,
best candidate, ours size, shared/total callees. Unpaired rows have no source yet.
"""
import json, re
import capstone, pefile

B = 'build/codex_boundsoutside_1016_02/'
bind = json.load(open(B + 'bind.json'))
cmp_ = {x['name']: x for x in json.load(open(B + 'cmp.json'))}
placed = {int(v['t'], 16): k for k, v in bind.items()}
h = lambda x: int(x, 16) if x and ':' not in x else None
retail = {}
for line in open('work/proof/retail/ghidra_funcs.tsv'):
    a, n, _, _, ce = (line.rstrip('\n').split('\t') + [''] * 5)[:5]
    if h(a) is not None:
        retail[h(a)] = (int(n), {placed[c] for c in map(h, ce.split(',')) if c in placed})
game = lambda a: 0x10001000 <= a < 0x10041db0 or 0x10057990 <= a < 0x10062200
mapf = open(B + 'gfx.map').read()
sym = {}
for m in re.finditer(r'^ 0001:\S+\s+(\S+)\s+([0-9a-f]{8}) ', mapf, re.M):
    sym.setdefault(m.group(1), int(m.group(2), 16))
at = {a: s for s, a in sym.items()}
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ours = pefile.PE(B + 'gfx.dll', fast_load=True).get_memory_mapped_image()
mine = {}
for name, row in cmp_.items():
    if ':' in row['obj'] or row['hits'] or name not in sym:
        continue
    a = sym[name]
    calls = {at.get(int(i.op_str, 16)) for i in md.disasm(ours[a - 0x10000000:a - 0x10000000 + row['size']], a)
             if i.mnemonic == 'call' and i.op_str.startswith('0x')}
    mine[name] = (row['size'], calls - {None})
for a in sorted(a for a in retail if game(a) and a not in placed):
    size, callees = retail[a]
    best, score = None, 0
    for name, (osize, ocalls) in mine.items():
        if not callees and not ocalls:
            continue
        s = len(callees & ocalls) / max(1, len(callees | ocalls)) - abs(osize - size) / max(size, osize) * 0.5
        if s > score:
            best, score = name, s
    print('0x%x\t%d\t%s\t%s\t%.2f' % (a, size, best.split('@')[0].lstrip('?') if best else '-',
                                       mine[best][0] if best else '-', score))
