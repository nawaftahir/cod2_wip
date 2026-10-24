#!/usr/bin/env python3
"""Pair our functions with retail by order inside each file and check them: pair.py <src file>...
Run in the image after make build. Prints a ledger row for every MATCH (definition order = address order)."""
import os, sys, pathlib
sys.path.insert(0, "tools")
import link, verify

L = verify.Linked()
names = verify.known_names()
done = set() if os.environ.get("ALL") else {r["addr"] for r in link.read_tsv("ledger/matches.tsv")}
tu = [l.split("\t") for l in pathlib.Path("data/tu_map.tsv").read_text().splitlines()[1:]]
for src in sys.argv[1:]:
    rel = src[4:] if src.startswith("src/") else src
    retail = [(r[0], int(r[1])) for r in tu if r[2] in (rel, src)]
    ours = sorted((va, s) for s, va in L.syms.items() if s in L.of_source(src))
    hit, claimed, matched = 0, set(), set()
    for va, sym in ours:
        for addr, size in retail:
            # identical bodies (e.g. two "return x" swaps): each retail address goes to one of ours, in order
            if addr in claimed:
                continue
            st, det = verify.check(L, addr, sym, names)
            if st == "MATCH":
                hit += 1
                claimed.add(addr)
                matched.add(sym)
                if addr not in done:
                    name = sym.lstrip("_").split("@")[0].lstrip("?")
                    print("%s\t%d\t%s\t%s\t%s\tSUPPORTED" % (addr, size, src, sym, name))
                break
    # retail takes some addresses, which keeps the stack form; retry those with /INCLUDE for our leftovers
    left = [(a, n) for a, n in retail if a not in claimed and link.address_taken({int(a, 16)})]
    spare = [s for _, s in ours if s not in matched]
    if left and spare and link.build(tuple(spare), quiet=True):
        L = verify.Linked()
        for sym in spare:
            for addr, size in left:
                if addr not in claimed and verify.check(L, addr, sym, names)[0] == "MATCH":
                    hit += 1
                    claimed.add(addr)
                    print("%s\t%d\t%s\t%s\t%s\tSUPPORTED" % (addr, size, src, sym, sym.lstrip("_").split("@")[0].lstrip("?")))
                    break
    print("# %s: %d ours, %d retail, %d match" % (src, len(ours), len(retail), hit), file=sys.stderr)
