#!/usr/bin/env python3
# residue13.py EXE MAP ANCHOR: same-offset differing bytes grouped by the owning symbol of our map, sorted by bytes.
import bisect, collections, re, sys, pefile
exe, mapf, anc = sys.argv[1:4]
a, b = open(exe, 'rb').read(), open(anc, 'rb').read()
pe = pefile.PE(exe, fast_load=True); base = pe.OPTIONAL_HEADER.ImageBase
def off2va(o):
    for s in pe.sections:
        if s.PointerToRawData <= o < s.PointerToRawData + s.SizeOfRawData:
            return base + s.VirtualAddress + o - s.PointerToRawData, s.Name.rstrip(b'\0').decode()
    return None, 'header'
syms = sorted((int(m[2], 16), m[1]) for m in
              (re.match(r'\s*[0-9a-f]{4}:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8})\s', l) for l in open(mapf, errors='replace')) if m)
keys = [s[0] for s in syms]
grp = collections.defaultdict(lambda: [0, []])
n = min(len(a), len(b)); i = 0
while i < n:
    if a[i] == b[i]: i += 1; continue
    j = i
    while j < n and a[j] != b[j]: j += 1
    va, sec = off2va(i)
    if va is None: name = 'PE header'
    else:
        k = bisect.bisect_right(keys, va) - 1
        name = f'{sec} {syms[k][1] if k >= 0 else "?"}'
    g = grp[name]; g[0] += j - i; g[1].append(f'{va or i:#x}+{j - i}')
    i = j
tot = sum(g[0] for g in grp.values())
print(f'| bytes | owner (section, our map symbol) | ranges (va+len) |\n|---:|---|---|')
for name, (nb, r) in sorted(grp.items(), key=lambda kv: -kv[1][0]):
    print(f'| {nb} | {name[:70]} | {" ".join(r[:6])}{" ..." if len(r) > 6 else ""} |')
print(f'\ntotal {tot} differing bytes in {len(grp)} owners (file size ours {len(a)}, anchor {len(b)})')
