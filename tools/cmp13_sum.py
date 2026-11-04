#!/usr/bin/env python3
"""cmp13_sum.py cmp13.json: matched fns / bytes. Unique = one hit (or a 16-aligned one among several, as cov.py)."""
import json, sys
r = json.load(open(sys.argv[1]))
for x in r:
    if len(x["hits"]) > 1 and ":" not in x["obj"]:
        a = [h for h in x["hits"] if int(h, 16) % 16 == 0]
        if a: x["hits"] = a
u = [x for x in r if len(x["hits"]) == 1]
cov = set()
for x in u:
    a = int(x["hits"][0], 16); cov.update(range(a, a + x["size"]))
print("cmp13: fns %d matched %d unique %d | matched-fn bytes %d (unique, union)" % (len(r), sum(1 for x in r if x["hits"]), len(u), len(cov)))
