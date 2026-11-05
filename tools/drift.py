#!/usr/bin/env python3
"""Offset drift: where each retail game function lands in our linked exe.
drift.py [map] (default build/CoD2Radiant.map). Reads data/tu_map.tsv (retail address, size, TU)
and ledger/matches.tsv (retail address -> symbol); FUN_<addr> names carry their retail address.
Prints functions at the retail offset, missing ones, and the first drift points in retail order."""
import csv, pathlib, re, sys

BASE = pathlib.Path(__file__).resolve().parent.parent
MAP = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else BASE / "build" / "CoD2Radiant.map"


def tsv(name):
    with open(BASE / name, newline="") as fh:
        return list(csv.DictReader(fh, delimiter="\t"))


ours = {}  # symbol -> our address
for line in MAP.read_text(errors="replace").splitlines():
    m = re.match(r"\s*0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8})\s", line)
    if m:
        ours.setdefault(m.group(1), int(m.group(2), 16))
by_retail = {}  # retail address -> our address
for sym, va in ours.items():
    m = re.search(r"FUN_([0-9a-fA-F]{8})", sym)
    if m:
        by_retail.setdefault(int(m.group(1), 16), va)
for row in tsv("ledger/matches.tsv"):
    if row["symbol"] in ours:
        by_retail[int(row["addr"], 16)] = ours[row["symbol"]]

rows = tsv("data/tu_map.tsv")
kinds = {}
for r in rows:
    k = r["evidence"] if r["evidence"] in ("LIB", "EXTLIB", "AUTO") else "GAME"
    n, b = kinds.get(k, (0, 0))
    kinds[k] = (n + 1, b + int(r["size"]))
print("retail functions by kind:", ", ".join(f"{k} {n} ({b} B)" for k, (n, b) in sorted(kinds.items())))
# library code is linked, not written; drift here is over game functions only
game = sorted((int(r["addr"], 16), int(r["size"]), r["tu"]) for r in rows
              if r["evidence"] not in ("LIB", "EXTLIB", "AUTO"))
same = same_bytes = 0
missing, drifts = [], []
prev = 0
for addr, size, tu in game:
    va = by_retail.get(addr)
    if va is None:
        missing.append((addr, size, tu))
        continue
    d = va - addr
    if d == 0:
        same += 1
        same_bytes += size
    if d != prev:
        drifts.append((addr, tu, prev, d))
        prev = d
total = sum(s for _, s, _ in game)
print(f"game functions at retail offset: {same}/{len(game)}, {same_bytes}/{total} bytes")
print(f"retail functions with no symbol in our exe: {len(missing)} ({sum(s for _, s, _ in missing)} bytes)")
print(f"drift changes in retail order: {len(drifts)}; first 15:")
for addr, tu, a, b in drifts[:15]:
    print(f"  0x{addr:08x} {tu:40s} drift {a:+d} -> {b:+d}")
