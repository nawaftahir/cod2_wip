#!/usr/bin/env python3
"""Index-paired check of every unmatched function in the given files: miss.py <src file>..."""
import sys, pathlib
sys.path.insert(0, "tools")
import link, verify
L = verify.Linked(); names = verify.known_names()
done = {r["addr"] for r in link.read_tsv("ledger/matches.tsv")}
tu = [l.split("\t") for l in pathlib.Path("data/tu_map.tsv").read_text().splitlines()[1:]]
for src in sys.argv[1:]:
    rel = src[4:]
    retail = [r[0] for r in tu if r[2] in (rel, src)]
    ours = [s for va, s in sorted((va, s) for s, va in L.syms.items() if s in L.of_source(src))]
    for addr, sym in zip(retail, ours):
        if addr not in done:
            print(addr, sym, *verify.check(L, addr, sym, names))
