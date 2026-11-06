#!/usr/bin/env python3
"""root.py <mangled or plain name>: walk the first binding blocker to the root; print its retail address.

The retail callee address comes from pairing the i-th call of the (byte-matched) caller.
"""
import json, re, sys
import capstone, pefile

B = 'build/codex_boundsoutside_1016_02/'
bind = json.load(open(B + 'bind.json'))
cmp_ = {x['name']: x for x in json.load(open(B + 'cmp.json'))}
mapf = open(B + 'gfx.map').read()
sym = {}
for m in re.finditer(r'^ 0001:\S+\s+(\S+)\s+([0-9a-f]{8}) ', mapf, re.M):
    sym.setdefault(m.group(1), int(m.group(2), 16))
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ours = pefile.PE(B + 'gfx.dll', fast_load=True).get_memory_mapped_image()
ret = pefile.PE('/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll',
                fast_load=True).get_memory_mapped_image()


def calls(img, a, n):
    return [int(i.op_str, 16) for i in md.disasm(img[a - 0x10000000:a - 0x10000000 + n], a)
            if i.mnemonic == 'call' and i.op_str.startswith('0x')]


name = sys.argv[1]
if name not in bind:
    name = next(k for k in bind if k.startswith('?' + name + '@') or k == name)
rt = None
while name in bind and bind[name]['why']:
    v, w = bind[name], bind[name]['why'][0]
    print('%-50s %s %4d -> %s' % (name.split('@')[0], v['t'], v['n'], w[:60]))
    if not w.startswith('call '):
        break
    callee = w[5:]
    at = {a: s for s, a in sym.items()}
    for o, r in zip(calls(ours, sym[name], v['n']), calls(ret, int(v['t'], 16), v['n'])):
        if at.get(o) == callee:
            rt = r
    name = callee
print('ROOT %s ours %s B, retail 0x%x' % (name, cmp_.get(name, {}).get('size'), rt or 0))
