#!/usr/bin/env python3
"""Print runs of game functions with no file, between the files around them (data/tu_map.tsv)."""
import sys
rows = [l.rstrip("\n").split("\t") for l in open("data/tu_map.tsv")][1:]
run, prev = [], None
def flush(nxt):
    if run:
        b = sum(int(r[1]) for r in run)
        print("%s-%s  %4d fns %7d B  after %-32s before %s" % (run[0][0], hex(int(run[-1][0], 16) + int(run[-1][1])), len(run), b, prev, nxt))
for a, size, tu, ev in rows:
    if ev == "LIB":
        continue
    if not tu:
        run.append((a, size))
        continue
    flush(tu); run = []; prev = tu
flush(None)
