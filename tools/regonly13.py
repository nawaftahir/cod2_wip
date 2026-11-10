#!/usr/bin/env python3
# regonly13.py EXE MAP ANCHOR: functions at equal addresses whose bytes differ but whose code is equal once GPR names and
# image addresses are masked (pure register-renaming residues), plus the per-function register permutation seen.
import re, sys, collections, capstone, pefile
def text(p):
    pe = pefile.PE(p, fast_load=True); s = pe.sections[0]
    return s.get_data(), pe.OPTIONAL_HEADER.ImageBase + s.VirtualAddress
ours, base = text(sys.argv[1]); ret, _ = text(sys.argv[3])
names = {}
for l in open(sys.argv[2], errors='replace'):
    m = re.match(r' 0001:\w+\s+(\S+)\s+([0-9a-f]{8}) f', l)
    if m: names.setdefault(int(m[2], 16), m[1])
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
R = re.compile(r'\b(e?[abcd]x|[abcd][lh]|e?[sd]i|e?bp)\b')
def norm(d, a, n):
    out, regs = [], []
    for i in md.disasm_lite(d, a):
        if i[0] >= a + n: break
        regs.append(R.findall(i[3])); out.append(i[2] + ' ' + re.sub(r'0x[0-9a-f]{5,}', 'A', R.sub('R', i[3])))
    return out, regs
addrs = sorted(names)
for a, b in zip(addrs, addrs[1:]):
    n = b - a; o = ours[a - base:b - base]; r = ret[a - base:b - base]
    if o == r: continue
    x, xr = norm(o, a, n); y, yr = norm(r, a, n)
    if x != y: continue
    perm = collections.Counter((p, q) for u, v in zip(xr, yr) for p, q in zip(u, v) if p != q)
    print(f'{a:x} {n:5d} {names[a][:50]} ' + ' '.join(f'{p}>{q}:{c}' for (p, q), c in perm.most_common(6)))
