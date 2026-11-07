#!/usr/bin/env python3
"""chunks.py [out.md]: retail .text chunks (game range) that no bound symbol of ours occupies.

Starts come from int3 padding, so tiny functions the inventory misses are included.
Each row: retail addr, slot size, our TU of the preceding bound function, first instructions.
"""
import bisect, json, sys
import capstone, pefile

B = 'build/codex_boundsoutside_1016_02/'
ANCHOR = '/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
bind = json.load(open(B + 'bind.json'))
img = pefile.PE(ANCHOR, fast_load=True).get_memory_mapped_image()
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
placed = {int(v['t'], 16): (k.split('@')[0].lstrip('?'), v['obj']) for k, v in bind.items()}
order = sorted(placed)
lo, hi = 0x10001000, 0x10041db0
starts = [a for a in range(lo, hi, 16)
          if img[a - 0x10000000] != 0xcc and (a == lo or img[a - 0x10000000 - 1] == 0xcc)] + [hi]
rows = []
for i, a in enumerate(starts[:-1]):
    if a in placed:
        continue
    size = starts[i + 1] - a
    j = bisect.bisect_left(order, a)
    prev = placed[order[j - 1]] if j else ('?', '?')
    ins = '; '.join(x.mnemonic + ' ' + x.op_str for x in md.disasm(img[a - 0x10000000:a - 0x10000000 + min(size, 40)], a)
                    if x.mnemonic != 'int3')
    rows.append((prev[1], a, size, prev[0], ins[:90]))
out = open(sys.argv[1], 'w') if len(sys.argv) > 1 else sys.stdout
out.write('| TU (prev bound fn) | retail | slot | after | first instructions |\n|---|---|---|---|---|\n')
for obj, a, size, after, ins in rows:
    out.write('| %s | 0x%x | %d | %s | `%s` |\n' % (obj, a, size, after, ins.replace('|', '/')))
print(len(rows), 'chunks', file=sys.stderr)
