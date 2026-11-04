#!/usr/bin/env python3
"""Name header code in the retail unit: match every function of probe objects (game flags) against
unmapped retail functions. A match must be byte-equal (relocations masked) AND every call must land
on a function the callee symbol can still be (pruned to a fixpoint).
Usage: hdrmatch.py OBJ...   -> addr size symbol (unique matches only)"""
import os, struct, sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "tools"))
import match_radiant as m
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from ev import funcs, tu

bysize = {}
for a, size in funcs:
    if tu.get(a, ("", ""))[1] != "LIB":
        bysize.setdefault(size, []).append(a)
tcache = {}
def target(a):
    if a not in tcache:
        t, _ = m.carve("0x%08x" % a)
        tcache[a] = (t, m.absolute_masks(t, m.pe_relocations(a, len(t), t)))
    return tcache[a]

cands, callsof = {}, {}
for path in sys.argv[1:]:
    data = open(path, "rb").read()
    sections, symbols = m.parse_coff(data)
    names = sorted({s["name"] for s in symbols if s["section"] > 0 and s["class"] in (2, 3)
                    and not s["name"].startswith(".") and not s["name"].startswith("$")
                    and sections[s["section"] - 1]["flags"] & 0x20})
    for n in names:
        try:
            cand, cmask, _, calls = m.object_function(data, n, with_calls=True)
        except Exception:
            continue
        while len(cand) > 1 and len(cand) not in bysize and cand[-1] in (0xCC, 0x90):
            cand = cand[:-1]
        for a in bysize.get(len(cand), []):
            t, tm = target(a)
            mask = tm | cmask
            if all(x == y or i in mask for i, (x, y) in enumerate(zip(t, cand))):
                cands.setdefault(n, set()).add(a)
                callsof[n] = calls

# prune: a pair (n, a) survives only if each call to a probed symbol lands on one of its candidates
changed = True
while changed:
    changed = False
    for n in list(cands):
        for a in list(cands[n]):
            t, _ = target(a)
            for pos, callee in callsof[n]:
                if callee in callsof or callee in cands:
                    dest = (a + pos + 4 + struct.unpack_from("<i", t, pos)[0]) & 0xFFFFFFFF
                    if dest not in cands.get(callee, ()):
                        cands[n].discard(a)
                        changed = True
                        break
        if not cands[n]:
            del cands[n]

owners = {}
for n, s in cands.items():
    for a in s:
        owners.setdefault(a, []).append(n)
for a in sorted(owners):
    ns = owners[a]
    print("0x%08x\t%d\t%s\t%s" % (a, len(target(a)[0]), ns[0] if len(ns) == 1 else "AMBIG:" + "|".join(ns[:3]), tu.get(a, ("", ""))[0]))
print("symbols matched %d  retail functions named %d" % (len(cands), len(owners)), file=sys.stderr)
