#!/usr/bin/env python3
# addrruns13.py EXE MAP ANCHOR: for .text functions whose only differences are image-address operands, group them by the data
# symbol (in our map) their differing addresses point at, with the delta retail-ours. Prints runs: fns, differing bytes, symbol, deltas.
import bisect, collections, re, struct, sys, pefile
exe, mapf, anc = sys.argv[1:4]
a, b = open(exe, 'rb').read(), open(anc, 'rb').read()
pe = pefile.PE(exe, fast_load=True); base = pe.OPTIONAL_HEADER.ImageBase
lo, hi = base, base + pe.OPTIONAL_HEADER.SizeOfImage
t = pe.sections[0]; t0, t1, trva = t.PointerToRawData, t.PointerToRawData + t.SizeOfRawData, t.VirtualAddress
syms = sorted((int(m[2], 16), m[1], bool(m[3])) for m in
              (re.match(r'\s*[0-9a-f]{4}:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8})\s+(f\s)?', l) for l in open(mapf, errors='replace')) if m)
keys = [s[0] for s in syms]
def sym(va):
    i = bisect.bisect_right(keys, va) - 1
    return syms[i] if i >= 0 else (0, '?', False)
fns = [s for s in syms if s[2] and base + trva <= s[0] < base + trva + t.SizeOfRawData]
runs = collections.defaultdict(lambda: [set(), 0, collections.Counter()])
for (fa, fname, _), nxt in zip(fns, fns[1:]):
    o0 = fa - base - trva + t0; o1 = nxt[0] - base - trva + t0
    diff = [i for i in range(o0, o1) if a[i] != b[i]]
    if not diff: continue
    covered, hits = set(), []
    for i in range(o0, o1 - 3):
        va, vb = struct.unpack_from('<I', a, i)[0], struct.unpack_from('<I', b, i)[0]
        if va != vb and lo <= va < hi and lo <= vb < hi and any(i <= d < i + 4 for d in diff):
            covered.update(j for j in range(i, i + 4) if a[j] != b[j]); hits.append((va, vb))
    if not hits or any(d not in covered for d in diff): continue  # some byte is not an address difference
    for va, vb in hits:
        s = sym(va)[1]; r = runs[s]; r[0].add(fname); r[2][vb - va] += 1
    runs[sym(hits[0][0])[1]][1] += len(diff)
tot_f = set(); tot_b = 0
for s, (f, nb, dl) in sorted(runs.items(), key=lambda kv: -kv[1][1]):
    tot_f |= f; tot_b += nb
    print(f'{len(f):4d} fns {nb:5d} B  {s[:48]:48s} delta ' + ' '.join(f'{d:+d}x{c}' for d, c in dl.most_common(3)))
print(f'total {len(tot_f)} fns, {tot_b} differing bytes (bytes counted once per fn, under its first run)')
