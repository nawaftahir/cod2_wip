#!/usr/bin/env python3
"""reconcile_manifest.py — sync data/manifest.tsv statuses with MATCHES.md.

The per-wave ledgers in MATCHES.md are authoritative for match state; the
manifest drifts whenever waves land without an orchestrator pass. This tool:

  1. collects every matched address from MATCHES.md (rows containing a 0x1... addr);
  2. flips matching manifest rows to status "match", filling the src column from
     the ledger row when the manifest entry is empty;
  3. leaves wip/fail intact for anything NOT confirmed in the ledger;
  4. prints a coverage report (count + bytes by region x size band).

Run after every accepted wave, before committing.
"""
import json
import os
import re
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MANIFEST = os.path.join(BASE, "data", "manifest.tsv")
LEDGER = os.path.join(BASE, "MATCHES.md")
INVENTORY = os.path.join(BASE, "data", "functions_gfx10.json")

ADDR_RE = re.compile(r"0x(1[0-9a-fA-F]{7})\b")


def ledger_matches():
    """addr -> (src_path, bytes, note) from MATCHES.md green rows."""
    out = {}
    for line in open(LEDGER):
        if "✅" not in line:
            continue
        cols = [c.strip() for c in line.split("|")]
        m = ADDR_RE.search(line)
        if not m:
            continue
        addr = m.group(1).lower()
        # columns: blank, status, name, addr, bytes, src, notes...
        nbytes = cols[4] if len(cols) > 4 and cols[4].isdigit() else ""
        src = cols[5] if len(cols) > 5 else ""
        note = cols[6] if len(cols) > 6 else ""
        if addr not in out or len(out[addr][0]) < len(src):
            out[addr] = (src, nbytes, note)  # prefer the most specific src path
    return out


def main():
    matched = ledger_matches()
    inv = {f["addr"].lower(): f for f in json.load(open(INVENTORY))["functions"]}

    rows = [l.rstrip("\n").split("\t") for l in open(MANIFEST)]
    header, body = rows[0], rows[1:]

    flipped = filled = 0
    seen = set()
    for r in body:
        r += [""] * (5 - len(r))
        addr, name, region, status, src = r
        seen.add(addr)
        if addr in matched:
            if status != "match":
                status, flipped = "match", flipped + 1
            if not src and matched[addr][0]:
                src, filled = matched[addr][0], filled + 1
            r[3], r[4] = status, src

    tmp = MANIFEST + ".tmp"
    with open(tmp, "w") as f:
        f.write("\t".join(header) + "\n")
        for r in body:
            f.write("\t".join(r[:5]) + "\n")
    os.replace(tmp, MANIFEST)

    # coverage report over the freshly written manifest
    bands = [(0, 50), (51, 150), (151, 10**9)]
    stats = {}
    for r in body:
        addr, name, region, status, src = r[:5]
        size = inv.get(addr, {}).get("size", 0)
        b = next(i for i, (lo, hi) in enumerate(bands) if lo <= size <= hi)
        key = (region, status, b)
        s = stats.setdefault(key, [0, 0])
        s[0] += 1
        s[1] += size

    total_f = sum(s[0] for k, s in stats.items() if k[1] == "match")
    total_b = sum(s[1] for k, s in stats.items() if k[1] == "match")
    all_b = sum(s[1] for s in stats.values())
    print(f"ledger matches: {len(matched)}   flipped->match: {flipped}   src filled: {filled}")
    print(f"coverage: {total_f}/{len(body)} functions ({100*total_f/len(body):.1f}%), "
          f"{total_b}/{all_b} function bytes ({100*total_b/max(all_b,1):.1f}%)")
    print("\nregion  status  band          count  bytes")
    names = ["<=50B", "51-150B", ">150B"]
    for (region, status, b), (cnt, byt) in sorted(stats.items()):
        print(f"{region:6s}  {status:6s}  {names[b]:10s}  {cnt:5d}  {byt:8d}")
    missing = set(matched) - seen
    if missing:
        print(f"\nWARNING: {len(missing)} ledger addrs absent from manifest: {sorted(missing)[:8]}")


if __name__ == "__main__":
    sys.exit(main())
