#!/usr/bin/env python3
# callscan13.py EXE MAP ANCHOR: functions at equal addresses whose direct-call target lists differ from retail.
import re, sys, capstone, pefile
def text(p):
    pe = pefile.PE(p, fast_load=True); s = pe.sections[0]
    return s.get_data(), pe.OPTIONAL_HEADER.ImageBase + s.VirtualAddress
ours, base = text(sys.argv[1]); ret, rbase = text(sys.argv[3]); assert base == rbase
names = {}
for l in open(sys.argv[2], errors='replace'):
    m = re.match(r' 0001:\w+\s+(\S+)\s+([0-9a-f]{8}) f', l)
    if m: names.setdefault(int(m[2], 16), m[1])
addrs = sorted(names)
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
def calls(d, a, n):
    return [i[3] for i in md.disasm_lite(d[a - base:a - base + n], a) if i[2] == 'call' and i[3].startswith('0x')]
def nm(t):
    v = int(t, 16); return names.get(v, t).split('@@')[0].lstrip('?')
for a, b in zip(addrs, addrs[1:]):
    n = b - a
    if ours[a - base:b - base] == ret[a - base:b - base]: continue
    o, r = calls(ours, a, n), calls(ret, a, n)
    if o == r: continue
    x, y = [nm(t) for t in o], [nm(t) for t in r]
    if sorted(x) == sorted(y): tag = 'order'
    else: tag = 'set'
    ox = [t for t in x if t not in y]; ry = [t for t in y if t not in x]
    print(f'{tag} {a:x} {n} {names[a][:40]} calls {len(o)}/{len(r)} ours-only {ox[:6]} retail-only {ry[:6]}')
