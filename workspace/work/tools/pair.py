#!/usr/bin/env python3
"""pair.py: pair unplaced retail game functions with our unmatched source.

Fingerprint = names of placed callees + content of referenced data (string text or the
4 bytes of a constant). Retail refs come from the Ghidra export, ours from our DLL's
absolute operands. Prints retail addr, size, best candidate, ours size, score.
"""
import json, re
import capstone, pefile

B = 'build/codex_boundsoutside_1016_02/'
ANCHOR = '/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
bind = json.load(open(B + 'bind.json'))
cmp_ = {x['name']: x for x in json.load(open(B + 'cmp.json'))}
placed = {int(v['t'], 16): k for k, v in bind.items()}
h = lambda x: int(x, 16) if re.fullmatch(r"[0-9a-f]{8}", x or "") else None
rimg = pefile.PE(ANCHOR, fast_load=True).get_memory_mapped_image()
oimg = pefile.PE(B + 'gfx.dll', fast_load=True).get_memory_mapped_image()


def content(img, a):
    off = a - 0x10000000
    if not 0 <= off < len(img) - 4:
        return None
    s = img[off:off + 64].split(b'\0')[0]
    if len(s) >= 4 and all(32 <= c < 127 for c in s):
        return 's:' + s.decode()
    return 'c:' + img[off:off + 4].hex()


retail = {}
for line in open('work/proof/retail/ghidra_funcs.tsv'):
    a, n, _, _, ce, dr = (line.rstrip('\n').split('\t') + [''] * 6)[:6]
    if h(a) is None:
        continue
    fp = {placed[c] for c in map(h, ce.split(',')) if c in placed}
    fp |= {content(rimg, d) for d in map(h, dr.split(',')) if d and d >= 0x1010b000} - {None}
    retail[h(a)] = (int(n), fp)
game = lambda a: 0x10001000 <= a < 0x10041db0 or 0x10057990 <= a < 0x10062200
mapf = open(B + 'gfx.map').read()
sym = {}
for m in re.finditer(r'^ 0001:\S+\s+(\S+)\s+([0-9a-f]{8}) ', mapf, re.M):
    sym.setdefault(m.group(1), int(m.group(2), 16))
at = {a: s for s, a in sym.items()}
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
mine = {}
for name, row in cmp_.items():
    if ':' in row['obj'] or row['hits'] or name not in sym:
        continue
    a, fp = sym[name], set()
    for i in md.disasm(oimg[a - 0x10000000:a - 0x10000000 + row['size']], a):
        for v in re.findall(r'0x1[0-9a-f]{7}', i.op_str):
            x = int(v, 16)
            if i.mnemonic == 'call':
                fp.add(at.get(x))
            elif x >= 0x1010b000:
                fp.add(content(oimg, x))
    mine[name] = (row['size'], fp - {None})
for a in sorted(a for a in retail if game(a) and a not in placed):
    size, fp = retail[a]
    best, score = None, 0
    for name, (osize, ofp) in mine.items():
        if not fp or not ofp:
            continue
        s = len(fp & ofp) / len(fp | ofp) - abs(osize - size) / max(size, osize) * 0.3
        if s > score:
            best, score = name, s
    print('0x%x\t%d\t%s\t%s\t%.2f' % (a, size, best.split('@')[0].lstrip('?') if best else '-',
                                       mine[best][0] if best else '-', score))
