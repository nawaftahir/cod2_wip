#!/usr/bin/env python3
"""Compare every resource in a compiled .res with retail: rescheck.py [file.res] (default build/res/radiant.res)."""
import collections
import pathlib
import struct
import sys

import pefile

BASE = pathlib.Path(__file__).resolve().parent.parent
RT = {v: k for k, v in pefile.RESOURCE_TYPE.items()}


def ident(d, o):
    w = struct.unpack_from("<H", d, o)[0]
    if w == 0xFFFF:
        return str(struct.unpack_from("<H", d, o + 2)[0]), o + 4
    e = o
    while d[e:e + 2] != b"\0\0":
        e += 2
    return d[o:e].decode("utf-16-le"), e + 2


def read_res(path):
    d = path.read_bytes()
    out, o = {}, 0
    while o + 8 <= len(d):
        size, hsize = struct.unpack_from("<II", d, o)
        t, p = ident(d, o + 8)
        n, p = ident(d, p)
        p = (p + 3) & ~3
        lang = struct.unpack_from("<H", d, p + 6)[0]
        if size:
            out[(t, n, lang)] = d[o + hsize:o + hsize + size]
        o = (o + hsize + size + 3) & ~3
    return out


def main():
    res = read_res(pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else BASE / "build" / "res" / "radiant.res")
    pe = pefile.PE(str(BASE / "binaries" / "CoD2Radiant.exe"))
    stats = collections.defaultdict(lambda: [0, 0])
    bad = []
    for t in pe.DIRECTORY_ENTRY_RESOURCE.entries:
        tid = str(t.id) if t.name is None else str(t.name)
        for e in t.directory.entries:
            nid = str(e.id) if e.name is None else str(e.name)
            for l in e.directory.entries:
                want = pe.get_data(l.data.struct.OffsetToData, l.data.struct.Size)
                got = res.get((tid, nid, l.id))
                kind = RT.get(t.id, tid)
                stats[kind][1] += 1
                if got == want:
                    stats[kind][0] += 1
                else:
                    first = next((i for i, (a, b) in enumerate(zip(got or b"", want)) if a != b), min(len(got or b""), len(want)))
                    bad.append("%s %s: %s" % (kind, nid, "missing" if got is None else "size %d/%d, first diff +%d" % (len(got), len(want), first)))
    for k, (ok, n) in sorted(stats.items()):
        print("%-16s %3d/%3d identical" % (k, ok, n))
    for b in bad[:25]:
        print("  " + b)
    print("resources identical: %d/%d" % (sum(v[0] for v in stats.values()), sum(v[1] for v in stats.values())))


if __name__ == "__main__":
    main()
