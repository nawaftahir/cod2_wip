#!/usr/bin/env python3
"""Working view for the file map. Usage: view.py LO HI
Columns: addr size file/evidence class | strings | callers' files (<) | callees' files (>)"""
import bisect, collections, os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from ev import funcs, tu, info
here = os.path.dirname(os.path.abspath(__file__))
cls = {}
for l in open(os.path.join(here, "classes.tsv")).read().splitlines()[1:]:
    a, c, _ = l.split("\t")
    cls[int(a, 16)] = c
starts = [a for a, _ in funcs]
import json
_cache = os.path.join(here, "cache.json")
if os.path.exists(_cache):
    calls = {int(k): v for k, v in json.load(open(_cache)).items()}
else:
    calls = {a: info(a, s) for a, s in funcs}
    json.dump({a: v for a, v in calls.items()}, open(_cache, "w"))
callers = collections.defaultdict(list)
for a, (s, c) in calls.items():
    for d in c:
        callers[d].append(a)

def short(a):
    t, ev = tu.get(a, ("", ""))
    if ev == "LIB":
        return "lib"
    t = t.replace("radiant/", "").replace("src/", "").replace(".cpp", "")
    return t or ("?" + cls.get(a, "%x" % a)[:12])

def summ(addrs):
    c = collections.Counter(short(a) for a in addrs)
    return ",".join(k + ("x%d" % n if n > 1 else "") for k, n in c.most_common(4))

if __name__ == "__main__":
    lo, hi = int(sys.argv[1], 16), int(sys.argv[2], 16)
    for a, size in funcs:
        if lo <= a < hi:
            t, ev = tu.get(a, ("", ""))
            s, c = calls[a]
            if ev == "LIB":
                t = "lib"
            print("%08x %5d %-22s %-3s %-16s %s  <%s  >%s" % (
                a, size, t.replace("radiant/", "").replace("src/", "")[:22], ev[:3], cls.get(a, "")[:16],
                " | ".join(x[:36].replace("\n", " ") for x in s[:3]), summ(callers[a]),
                summ([d for d in c if d in tu and tu[d][1] != "LIB"])))
