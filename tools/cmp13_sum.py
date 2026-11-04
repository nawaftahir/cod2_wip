#!/usr/bin/env python3
"""cmp13_sum.py cmp13.json: matched fns / bytes. Unique = one hit (or a 16-aligned one among several, as cov.py)."""
import json, sys
r = json.load(open(sys.argv[1]))
for x in r:
    if len(x["hits"]) > 1 and ":" not in x["obj"]:
        a = [h for h in x["hits"] if int(h, 16) % 16 == 0]
        if a: x["hits"] = a
u = [x for x in r if len(x["hits"]) == 1]
# k twins sharing the same k hit sites all count (as cov.py)
g = {}
for x in r:
    if 1 < len(x["hits"]) < 64: g.setdefault(tuple(sorted(x["hits"])), []).append(x)
for h, xs in g.items():
    if len(xs) == len(h) and len({x["size"] for x in xs}) == 1:
        u += xs
cov = set()
for x in u:
    for h in x["hits"]: a = int(h, 16); cov.update(range(a, a + x["size"]))
print("cmp13: fns %d matched %d unique %d | matched-fn bytes %d (unique, union)" % (len(r), sum(1 for x in r if x["hits"]), len(u), len(cov)))
