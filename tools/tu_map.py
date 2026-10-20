#!/usr/bin/env python3
"""Map functions to original source files (TUs) and derive the .obj link order.

Evidence: assert calls push the __FILE__ string. Any function that references a
source-file string is PINNED to that file. Functions between two pinned functions
of the same file are SUPPORTED (no /GL, so a TU's code stays contiguous).
Library functions (data/lib_funcs.tsv) are tagged LIB.

Writes data/tu_map.tsv and link/order.txt. Owner tool: agents don't edit its output.
"""
import bisect
import os
import re
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m

BASE = m.BASE_DIR
img = m._image
text = m.SECTIONS[".text"]
text_off, text_va = text["ptr"], m.IMAGE_BASE + text["va"]
code = img[text_off:text_off + text["vs"]]

FILE_RE = re.compile(rb"[\x20-\x7e]{3,}?\.(?:cpp|c)\x00", re.I)


def tu_name(path):
    # e:\trees\cod2src\src\universal\dvar.cpp -> src/universal/dvar.cpp; .\XYWnd.cpp -> radiant/XYWnd.cpp
    p = path.replace("\\", "/")
    if "/cod2src/" in p:
        return p.split("/cod2src/", 1)[1]
    return "radiant/" + p.lstrip("./")


def file_strings():
    out = {}
    for sec in (".rdata", ".data"):
        s = m.SECTIONS.get(sec)
        if not s:
            continue
        blob = img[s["ptr"]:s["ptr"] + s["raw"]]
        for hit in FILE_RE.finditer(blob):
            raw = hit.group()[:-1].decode()
            raw = raw[raw.rfind("\x00") + 1:]
            if "\\" not in raw and "/" not in raw:
                continue
            va = m.IMAGE_BASE + s["va"] + hit.start()
            out[va] = tu_name(raw)
    return out


def load_libs():
    path = os.path.join(BASE, "data", "lib_funcs.tsv")
    libs = {}
    if os.path.exists(path):
        for line in open(path):
            if line.startswith("addr") or not line.strip():
                continue
            cols = line.rstrip("\n").split("\t")
            libs[int(cols[0], 16)] = cols[2] if len(cols) > 2 else "lib"
    return libs


def main():
    funcs = sorted((int(a, 16), int(f["size"])) for a, f in m.FUNCTIONS.items())
    starts = [a for a, _ in funcs]
    strings = file_strings()
    pinned = {}
    for va, tu in strings.items():
        needle = b"\x68" + struct.pack("<I", va)
        pos = code.find(needle)
        while pos != -1:
            at = text_va + pos
            i = bisect.bisect_right(starts, at) - 1
            if i >= 0 and at < funcs[i][0] + funcs[i][1]:
                pinned.setdefault(funcs[i][0], set()).add(tu)
            pos = code.find(needle, pos + 1)
    libs = load_libs()

    # a lone pin inside another file's run (prev and next pin agree) is an outlier: likely inlined or folded code
    single = [(a, next(iter(t))) for a, t in sorted(pinned.items()) if len(t) == 1]
    outliers = {single[i][0] for i in range(1, len(single) - 1)
                if single[i - 1][1] == single[i + 1][1] != single[i][1]}

    rows, last_tu, last_idx = [], None, None
    for idx, (addr, size) in enumerate(funcs):
        if addr in libs:
            rows.append([addr, size, libs[addr], "LIB"])
        elif addr in outliers:
            rows.append([addr, size, next(iter(pinned[addr])), "OUTLIER"])
        elif addr in pinned and len(pinned[addr]) == 1:
            tu = next(iter(pinned[addr]))
            # fill the gap back to the previous pin of the same file
            if tu == last_tu:
                for j in range(last_idx + 1, idx):
                    if rows[j][3] == "":
                        rows[j][2:] = [tu, "SUPPORTED"]
            rows.append([addr, size, tu, "PINNED"])
            last_tu, last_idx = tu, idx
        else:
            note = "AMBIGUOUS:" + ",".join(sorted(pinned[addr])) if addr in pinned else ""
            rows.append([addr, size, note, ""])

    with open(os.path.join(BASE, "data", "tu_map.tsv"), "w") as out:
        out.write("addr\tsize\ttu\tevidence\n")
        for addr, size, tu, ev in rows:
            out.write("0x%08x\t%d\t%s\t%s\n" % (addr, size, tu, ev))

    # link order = first appearance of each TU by address; ranges help spot interleaving
    order, span = [], {}
    for addr, size, tu, ev in rows:
        if ev in ("PINNED", "SUPPORTED"):
            if tu not in span:
                order.append(tu)
                span[tu] = [addr, addr + size]
            span[tu][1] = addr + size
    with open(os.path.join(BASE, "link", "order.txt"), "w") as out:
        out.write("# .obj link order from .text address order (tools/tu_map.py). Owner-edited only.\n")
        out.write("# tu  first_addr  end_addr\n")
        for tu in order:
            out.write("%s\t0x%08x\t0x%08x\n" % (tu, span[tu][0], span[tu][1]))

    n = len(rows)
    count = lambda e: sum(1 for r in rows if r[3] == e)
    print("functions %d  PINNED %d  SUPPORTED %d  OUTLIER %d  LIB %d  unknown %d  files %d" % (
        n, count("PINNED"), count("SUPPORTED"), count("OUTLIER"), count("LIB"), count(""), len(order)))
    overlaps = [(a, b) for a, b in zip(order, order[1:]) if span[a][1] > span[b][0]]
    for a, b in overlaps:
        print("interleaved: %s / %s" % (a, b))


if __name__ == "__main__":
    main()
