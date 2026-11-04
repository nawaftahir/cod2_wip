#!/usr/bin/env python3
"""Pair our functions with retail by order inside each file and check them: pair.py <src file>...
Run in the image after make build. Prints a ledger row for every MATCH (definition order = address order)."""
import os, re, sys, pathlib
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
    # build/<file>_names.tsv (name, retail addr) pins callees, so a wrapper can't pair with a look-alike
    known = pathlib.Path("build/%s_names.tsv" % pathlib.Path(src).stem)
    if known.exists():
        by_name = {s.lstrip("_?").split("@")[0]: s for _, s in ours}
        for l in known.read_text().split("\n"):
            if l.strip() and l.split()[0] in by_name:
                names[int(l.split()[1], 16)] = by_name[l.split()[0]]
    hit, claimed, matched, rows = 0, set(), set(), []
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
                rows.append((addr, size, sym))
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
                    rows.append((addr, size, sym))
                    break
    # look-alike bodies (one-line wrappers) can pair with the wrong address; a pair that breaks the file's order is dropped
    text = pathlib.Path(src).read_text(errors="replace").split("\n")
    def line(sym):
        name = sym.lstrip("_?").split("@")[0]
        return next((i for i, l in enumerate(text) if re.match(r"[A-Za-z_].*\b%s\s*\(" % name, l) and not l.rstrip().endswith(";")), -1)
    inv = lambda r, q: (line(r[2]) - line(q[2])) * (int(r[0], 16) - int(q[0], 16)) < 0
    bad, keep = set(), list(rows)
    while True:
        worst = max(keep, key=lambda r: sum(inv(r, q) for q in keep), default=None)
        if worst is None or not any(inv(worst, q) for q in keep):
            break
        bad.add(worst)
        keep.remove(worst)
    for addr, size, sym in rows:
        name = sym.lstrip("_").split("@")[0].lstrip("?")
        if (addr, size, sym) in bad:
            hit -= 1
            print("# order: %s at %s is out of file order, dropped" % (name, addr), file=sys.stderr)
        elif addr not in done:
            print("%s\t%d\t%s\t%s\t%s\tSUPPORTED" % (addr, size, src, sym, name))
    print("# %s: %d ours, %d retail, %d match" % (src, len(ours), len(retail), hit), file=sys.stderr)
