#!/usr/bin/env python3
"""Check proposals against the inventory: starts on real functions, no overlaps, coverage.
Usage: merge.py A.tsv C.tsv ...  (prints problems; --write writes data/file_map.tsv from them)"""
import json, os, sys
B = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
inv = sorted((int(f["addr"], 16), f["size"]) for f in json.load(open(os.path.join(B, "data/functions_cod2radiant.json")))["functions"])
starts = {a for a, _ in inv}
lib = {int(l.split("\t")[0], 16) for l in open(os.path.join(B, "data/lib_funcs.tsv")).read().splitlines()[1:]}
rows = []
for p in [x for x in sys.argv[1:] if not x.startswith("--")]:
    for l in open(p):
        if l.startswith(("#", "start")) or not l.strip():
            continue
        c = l.rstrip("\n").split("\t")
        rows.append((int(c[0], 16), int(c[1], 16), c[2], c[3], c[4] if len(c) > 4 else "", os.path.basename(p)))
rows.sort()
for r in rows:
    if r[0] not in starts:
        print("start not a function: 0x%08x %s (%s)" % (r[0], r[2], r[5]))
for a, b in zip(rows, rows[1:]):
    if a[1] > b[0]:
        print("overlap: 0x%08x-0x%08x %s (%s) / 0x%08x-0x%08x %s (%s)" % (a[0], a[1], a[2], a[5], b[0], b[1], b[2], b[5]))
lo, hi = rows[0][0], rows[-1][1]
import bisect
rs = [r[0] for r in rows]
unc = []
for a, s in inv:
    if lo <= a < hi and a not in lib:
        i = bisect.bisect_right(rs, a) - 1
        if i < 0 or a >= rows[i][1]:
            unc.append(a)
print("ranges %d  0x%08x-0x%08x  uncovered non-lib functions %d: %s" % (len(rows), lo, hi, len(unc), " ".join("%x" % a for a in unc[:30])))
if "--write" in sys.argv:
    with open(os.path.join(B, "data/file_map.tsv"), "w") as f:
        f.write("# File ranges with evidence (research/filemap/README.md). Owner-reviewed; tools/tu_map.py applies them.\nstart\tend\ttu\ttag\tevidence\n")
        for r in rows:
            f.write("0x%08x\t0x%08x\t%s\t%s\t%s\n" % r[:5])
