#!/usr/bin/env python3
"""classify_matches.py — split matched functions by reconstruction method.

The ledger counts a "match" regardless of how it was produced. For an honest
progress metric we distinguish:

  C            readable reconstructed C (the real deliverable)
  CRT-SRC      built from authentic VC7.1 CRT sources in crt71/
  NAKED-ASM    __declspec(naked) inline asm transcribed from capstone
  EMIT         C file whose body is _emit hex byte dumps
  MASM         ml.exe .asm transplant

Usage: python3 tools/classify_matches.py [--json out]
Reads MATCHES.md + data/manifest.tsv + the actual source files.
"""
import json
import os
import re
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LEDGER = os.path.join(BASE, "MATCHES.md")
MANIFEST = os.path.join(BASE, "data", "manifest.tsv")

ADDR_RE = re.compile(r"0x(1[0-9a-fA-F]{7})\b")


def classify_src(path):
    """Guess method from the actual source file contents."""
    norm = path.replace(os.sep, "/").strip()
    if norm.endswith(".asm") or "/masm" in norm:
        return "MASM"
    if norm.startswith("crt71") or "/crt71" in norm:
        return "CRT-SRC"
    full = os.path.join(BASE, norm)
    if not os.path.isfile(full):
        return "MISSING"
    text = open(full, errors="replace").read()
    emits = len(re.findall(r"\b_emit\b", text))
    if "__declspec(naked)" in text:
        return "NAKED-ASM"
    if emits >= 4:
        return "EMIT"
    return "C"


def main():
    want_json = "--json" in sys.argv
    out_path = sys.argv[sys.argv.index("--json") + 1] if want_json else None

    man_region = {}
    for line in open(MANIFEST):
        p = line.rstrip("\n").split("\t")
        if p[0] == "addr":
            continue
        man_region[p[0]] = p[2]

    entries = {}
    for line in open(LEDGER):
        if "✅" not in line:
            continue
        cols = [c.strip() for c in line.split("|")]
        m = ADDR_RE.search(line)
        if not m:
            continue
        addr = m.group(1).lower()
        nbytes = int(cols[4]) if len(cols) > 4 and cols[4].isdigit() else 0
        src = cols[5].strip("` ") if len(cols) > 5 else ""
        note = cols[6] if len(cols) > 6 else ""
        wm = re.search(r"(wave\d+[a-z0-9 ]*)", note, re.I)
        wave = wm.group(1).strip().lower() if wm else ""
        # ledger is chronological: the LAST row for an address wins
        entries[addr] = {"addr": addr, "bytes": nbytes,
                         "region": man_region.get(addr, "?"),
                         "src": src, "wave": wave}

    for e in entries.values():
        e["method"] = classify_src(e["src"]) if e["src"] else "MISSING"

    order = ["C", "CRT-SRC", "NAKED-ASM", "EMIT", "MASM", "MISSING"]
    agg = {}
    for e in entries.values():
        a = agg.setdefault(e["method"], [0, 0])
        a[0] += 1
        a[1] += e["bytes"]

    total = sum(v[0] for v in agg.values())
    tb = sum(v[1] for v in agg.values())
    print(f"{total} functions matched, {tb} bytes\n")
    print(f"{'method':10s} {'count':>6s} {'bytes':>9s}")
    for k in order:
        if k in agg:
            c, b = agg[k]
            print(f"{k:10s} {c:6d} {b:9d}")

    sem_c = agg.get("C", [0, 0])
    print(f"\nhonest C reconstructions: {sem_c[0]} "
          f"(+ authentic CRT where applicable)")

    # wave x method matrix for provenance
    wm = {}
    for e in entries.values():
        key = (e["wave"] or "?", e["method"])
        wm[key] = wm.get(key, 0) + 1
    print("\nwave x method:")
    for (w, mth), n in sorted(wm.items()):
        print(f"  {w:22s} {mth:10s} {n}")

    if want_json and out_path:
        json.dump(sorted(entries.values(), key=lambda e: e["addr"]),
                  open(out_path, "w"), indent=1)
        print(f"\nwrote {out_path}")


if __name__ == "__main__":
    main()
