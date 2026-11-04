#!/usr/bin/env python3
"""For each unmatched retail function of a file, the closest of our functions in it: near.py <src file>..."""
import sys, pathlib
sys.path.insert(0, "tools")
import link, verify
L = verify.Linked(); names = verify.known_names()
done = {r["addr"] for r in link.read_tsv("ledger/matches.tsv")}
mine = {r["symbol"] for r in link.read_tsv("ledger/matches.tsv")}
tu = [l.split("\t") for l in pathlib.Path("data/tu_map.tsv").read_text().splitlines()[1:]]
for src in sys.argv[1:]:
    ours = [s for s in L.of_source(src) if s not in mine]
    for r in tu:
        if r[2] in (src[4:], src) and r[0] not in done:
            best = max(((verify.check(L, r[0], s, names), s) for s in ours),
                       key=lambda x: int(x[0][1].split("%")[0]) if x[0][0] == "MISMATCH" else (100 if x[0][0] != "NOT-LINKED" else -1),
                       default=(("-", "0%"), "-"))
            print(r[0], r[1], best[1], *best[0])
