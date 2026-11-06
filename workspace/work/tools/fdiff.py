#!/usr/bin/env python3
"""fdiff.py <name> <retail hex addr> [retail size]: side-by-side asm of our build vs retail.

Absolute addresses are normalized to A; differing rows are marked with *.
"""
import re, sys, itertools
import capstone, pefile

B = 'build/codex_boundsoutside_1016_02/'
name, ra = sys.argv[1], int(sys.argv[2], 16)
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
mapf = open(B + 'gfx.map').read()
syms = [(int(m.group(2), 16), m.group(1)) for m in re.finditer(r'^ 0001:\S+\s+(\S+)\s+([0-9a-f]{8}) ', mapf, re.M)]
oa = next(a for a, s in syms if s.startswith('?' + name + '@') or s == '_' + name)
osize = min(a for a, s in syms if a > oa) - oa
rsize = int(sys.argv[3]) if len(sys.argv) > 3 else osize
ours = pefile.PE(B + 'gfx.dll', fast_load=True).get_memory_mapped_image()
ret = pefile.PE('/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll',
                fast_load=True).get_memory_mapped_image()
norm = lambda i: (i.mnemonic + ' ' + re.sub(r'0x[0-9a-f]{5,}', 'A', i.op_str)) if i else ''
O = list(md.disasm(ours[oa - 0x10000000:oa - 0x10000000 + osize], oa))
R = list(md.disasm(ret[ra - 0x10000000:ra - 0x10000000 + rsize], ra))
print(f'ours {osize} B, retail {rsize} B')
for o, r in itertools.zip_longest(O, R):
    a, b = norm(o), norm(r)
    print('%s %4s %-42s %4s %s' % ('*' if a != b else ' ', '%x' % (o.address - oa) if o else '',
                                   a, '%x' % (r.address - ra) if r else '', b))
