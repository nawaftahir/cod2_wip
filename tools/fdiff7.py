#!/usr/bin/env python3
"""fdiff7.py <mangled-substr> <retail-addr-hex>: disasm ours (from map) vs retail, addresses masked. run from lab13/w7/target"""
import re, sys, struct, pefile, capstone, difflib
R = '/home/nawaf/cod2/test/dev/cod2engineold/binaries/windows/1.3/CoD2MP_s.exe'
def load(p):
    pe = pefile.PE(p); return pe, pe.OPTIONAL_HEADER.ImageBase
ours, ob = load('build/release/CoD2MP_s.exe'); ret, rb = load(R)
syms = []
for l in open('build/release/CoD2MP_s.map', errors='replace'):
    m = re.match(r'\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f', l)
    if m: syms.append((int(m.group(2), 16), m.group(1)))
syms.sort()
name, raddr = sys.argv[1], int(sys.argv[2], 16)
a = [s for s in syms if name in s[1]][0]
i = syms.index(a); end = syms[i + 1][0]
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
def dis(pe, base, addr, n):
    out = []
    for ins in md.disasm(pe.get_data(addr - base, n), addr):
        o = re.sub(r'0x[0-9a-f]{6,8}', 'ADDR', ins.op_str)
        out.append(f'{ins.mnemonic} {o}')
        if ins.mnemonic == 'ret' and len(out) > 3 and n > 0 and (ins.address - addr) >= n - 16: pass
    return out
def until_ret_pad(lst):
    return lst
o = dis(ours, ob, a[0], end - a[0])
r = dis(ret, rb, raddr, max(end - a[0] + 64, 64))
# trim retail at first int3 run
while o and o[-1].startswith('int3'): o.pop()
rr = []
for x in r:
    if x.startswith('int3'): break
    rr.append(x)
print(a[1], hex(a[0]), 'ours', len(o), 'retail', len(rr))
for l in difflib.unified_diff(o, rr, 'ours', 'retail', lineterm='', n=14): print(l)
