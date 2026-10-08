#!/usr/bin/env python3
# ready.py <out.tsv> [bind.json]: unverified game fns with their retail call targets.
# nopen = callees in game code that are not verified yet (0 = ready to port).
import json, sys, collections
from pathlib import Path
import pefile, capstone
DEV = Path(__file__).resolve().parents[2]
GAME = ((0x10001000, 0x10041db0), (0x10057990, 0x10062200))
def game(a): return any(lo <= a < hi for lo, hi in GAME)
fs = {int(f['addr'], 16): f for f in json.load(open(DEV / 'glm/data/functions_gfx10.json'))['functions'] if not f['thunk']}
bind = sys.argv[2] if len(sys.argv) > 2 else DEV / 'gfx/target/build/v/bind.json'
ok = {int(x['t'], 16) for x in json.load(open(bind)).values() if x.get('why') == []}
pe = pefile.PE(str(DEV / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'), fast_load=True)
img, base = pe.get_memory_mapped_image(), pe.OPTIONAL_HEADER.ImageBase
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
callers = collections.defaultdict(set)
for a, f in fs.items():
    f['calls'] = {int(i.op_str, 16) for i in md.disasm(img[a - base:a - base + f['size']], a)
                  if i.mnemonic == 'call' and i.op_str.startswith('0x')}
    for c in f['calls']: callers[c].add(a)
rows = []
for a, f in fs.items():
    if not game(a) or a in ok: continue
    open_ = [c for c in f['calls'] if game(c) and c not in ok]
    rows.append((len(open_), a, f['size'], f['name'], len(callers[a]), len([c for c in callers[a] if c in ok]),
                 ' '.join(hex(c) for c in open_[:6])))
with open(sys.argv[1], 'w') as w:
    w.write('nopen\tva\tsize\tname\tncallers\tverified_callers\topen_callees\n')
    for r in sorted(rows, key=lambda r: (r[0], -r[2])): w.write('%d\t0x%x\t%d\t%s\t%d\t%d\t%s\n' % r)
z = [r for r in rows if r[0] == 0]
print(f'ready {len(z)} fns {sum(r[2] for r in z)} B; open total {sum(r[2] for r in rows)} B')
