#!/usr/bin/env python3
"""diffclass13.py EXE MAP ANCHOR [N]: split every byte that differs at the same file offset by section and cause.
  addr  : a dword that is an image address in both files (relocated operand / pointer); grouped into runs by the
          map symbol our value points at and the delta (retail - ours), e.g. the cm -8 run
  code  : other differing bytes inside a .text function (scheduling, regalloc, wrong code)
  pad   : .text bytes outside any map function (padding, int3, jump-table gaps)
  data  : other differing bytes in a non-.text section; header : before the first section
Prints totals, then the N biggest address runs (default 25)."""
import bisect, re, struct, sys
import pefile

exe, mapf, anc = sys.argv[1:4]
N = int(sys.argv[4]) if len(sys.argv) > 4 else 25
a, b = open(exe, 'rb').read(), open(anc, 'rb').read()
pe = pefile.PE(exe, fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
lo, hi = base, base + pe.OPTIONAL_HEADER.SizeOfImage
secs = [(s.PointerToRawData, s.PointerToRawData + s.SizeOfRawData, s.VirtualAddress, s.Name.rstrip(b'\0').decode()) for s in pe.sections]
syms = sorted((int(m.group(2), 16), m.group(1), bool(m.group(3))) for m in
              (re.match(r'\s*[0-9a-f]{4}:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8})\s+(f\s)?', l) for l in open(mapf, errors='replace')) if m)
keys = [s[0] for s in syms]

def sym(va):
    i = bisect.bisect_right(keys, va) - 1
    return syms[i] if i >= 0 else (0, '?', False)

def sec(off):
    for s0, s1, rva, name in secs:
        if s0 <= off < s1:
            return name, base + rva + off - s0
    return 'header', None

n = min(len(a), len(b))
diff = [i for i in range(n) if a[i] != b[i]]
diff_set = set(diff)
tot, runs, done = {}, {}, set()
for i in diff:
    if i in done:
        continue
    name, va = sec(i)
    cause = None
    for k in range(max(0, i - 3), i + 1):  # a dword covering i that is an address in both files
        if k + 4 > n:
            continue
        x, y = struct.unpack_from('<I', a, k)[0], struct.unpack_from('<I', b, k)[0]
        if x != y and lo <= x < hi and lo <= y < hi and abs(y - x) < 0x100000:
            s = sym(x)
            key = (s[1], y - x)
            r = runs.setdefault(key, [0, x, x])
            for j in range(k, k + 4):
                if j in diff_set and j not in done:
                    done.add(j); r[0] += 1
                    tot[(name, 'addr')] = tot.get((name, 'addr'), 0) + 1
            r[1], r[2] = min(r[1], x), max(r[2], x)
            cause = 'addr'
            break
    if cause:
        continue
    done.add(i)
    if name == 'header':
        c = 'header'
    elif name == '.text':
        s = sym(va)
        c = 'code' if s[2] else 'pad'
    else:
        c = 'data'
    tot[(name, c)] = tot.get((name, c), 0) + 1

print('differing bytes', len(diff), '(file size ours %d, anchor %d)' % (len(a), len(b)))
for k in sorted(tot, key=lambda k: -tot[k]):
    print('  %-8s %-6s %6d' % (k[0], k[1], tot[k]))
print('top address runs (bytes, target symbol in ours, delta retail-ours, our value range):')
for (s, d), (c, x0, x1) in sorted(runs.items(), key=lambda kv: -kv[1][0])[:N]:
    print('  %5d  %-45s %+6d  %08x..%08x' % (c, s[:45], d, x0, x1))
