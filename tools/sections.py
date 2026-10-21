#!/usr/bin/env python3
"""Whole-file distance to retail: sections.py [ours.exe] (default build/CoD2Radiant.exe).
Per section: size ours/retail and bytes identical at the same offset; also headers and the total.
Ported from claude_client/shameter.py."""
import hashlib
import pathlib
import sys

import pefile

BASE = pathlib.Path(__file__).resolve().parent.parent
ours_path = sys.argv[1] if len(sys.argv) > 1 else BASE / "build" / "CoD2Radiant.exe"
da, db = open(ours_path, "rb").read(), (BASE / "binaries" / "CoD2Radiant.exe").read_bytes()
pa, pb = pefile.PE(data=da), pefile.PE(data=db)


def same(x, y):
    return sum(1 for a, b in zip(x, y) if a == b)


print("file   ours %9d  retail %9d  sha %s" % (len(da), len(db),
      "IDENTICAL" if hashlib.sha256(da).digest() == hashlib.sha256(db).digest() else "differs"))
h = pb.OPTIONAL_HEADER.SizeOfHeaders
print("header %-26s same %d/%d" % ("", same(da[:h], db[:h]), h))
ours = {s.Name.rstrip(b"\0").decode(): s for s in pa.sections}
for r in pb.sections:
    n = r.Name.rstrip(b"\0").decode()
    s = ours.get(n)
    y = r.get_data()
    if not s:
        print("%-6s missing in ours (retail %d)" % (n, len(y)))
        continue
    x = s.get_data()
    print("%-6s raw %8d/%8d  va %08x/%08x  same %8d (%.2f%%)" % (
        n, len(x), len(y), s.VirtualAddress, r.VirtualAddress, same(x, y), 100.0 * same(x, y) / max(1, len(y))))
for n in ours:
    if n not in {r.Name.rstrip(b"\0").decode() for r in pb.sections}:
        print("%-6s only in ours" % n)
print("whole file same-offset %d/%d = %.3f%%" % (same(da, db), len(db), 100.0 * same(da, db) / len(db)))
