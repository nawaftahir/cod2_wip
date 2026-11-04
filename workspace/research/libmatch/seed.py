#!/usr/bin/env python3
"""Print data/symbols.tsv rows for unmatched functions of files whose function count equals retail's:
seed.py <src file>...  (pairs by position: definition order = address order)"""
import sys, pathlib
sys.path.insert(0, "tools")
import link, verify
L = verify.Linked()
known = {r["addr"] for r in link.read_tsv("ledger/matches.tsv") + link.read_tsv("data/symbols.tsv")}
tu = [l.split("\t") for l in pathlib.Path("data/tu_map.tsv").read_text().splitlines()[1:]]
for src in sys.argv[1:]:
    retail = [r[0] for r in tu if r[2] in (src[4:], src)]
    ours = [s for va, s in sorted((va, s) for s, va in L.syms.items() if s in L.of_source(src))]
    if len(retail) != len(ours):
        print("# %s: %d ours vs %d retail, skipped" % (src, len(ours), len(retail)), file=sys.stderr)
        continue
    for addr, sym in zip(retail, ours):
        if addr not in known:
            print("%s\t%s\tposition %d of %d in %s, same count as retail" % (addr, sym, retail.index(addr) + 1, len(retail), src))
