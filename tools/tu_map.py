#!/usr/bin/env python3
"""Map functions to original source files (TUs) and derive the .obj link order.

Evidence: assert calls push the __FILE__ string. Any function that references a
source-file string is PINNED to that file. Functions between two pinned functions
of the same file are SUPPORTED (no /GL, so a TU's code stays contiguous).
Library functions (data/lib_funcs.tsv) are tagged LIB.
Owner evidence on top (research/filemap/README.md):
- data/file_map.tsv: address ranges per file with a tag and written evidence. Inside a range every
  function gets that file; an assert pin for another file inside it is reported, never silently kept.
- data/auto_funcs.tsv: code the compiler emits by itself inside the unit (MFC/ATL header inlines and
  templates, scalar deleting destructors). Tagged AUTO: nobody writes them by hand.

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


def load_ranges():
    path = os.path.join(BASE, "data", "file_map.tsv")
    out = []
    if os.path.exists(path):
        for line in open(path):
            if line.startswith(("#", "start")) or not line.strip():
                continue
            lo, hi, tu, tag, why = line.rstrip("\n").split("\t")[:5]
            out.append((int(lo, 16), int(hi, 16), tu, tag))
    out.sort()
    for a, b in zip(out, out[1:]):
        if a[1] > b[0]:
            sys.exit("file_map.tsv: ranges overlap: %s / %s" % (a[2], b[2]))
    return out


def load_auto():
    path = os.path.join(BASE, "data", "auto_funcs.tsv")
    if not os.path.exists(path):
        return {}
    return {int(l.split("\t")[0], 16): l.split("\t")[2] for l in open(path)
            if l.strip() and not l.startswith(("#", "addr"))}


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

    # owner ranges override the inferred rows; header code keeps its range's file but is tagged AUTO
    ranges, headers, conflicts = load_ranges(), load_auto(), []
    starts_r = [r[0] for r in ranges]
    for row in rows:
        addr = row[0]
        if row[3] == "LIB":
            continue
        i = bisect.bisect_right(starts_r, addr) - 1
        if i < 0 or addr >= ranges[i][1]:
            continue
        lo, hi, rtu, tag = ranges[i]
        pins = pinned.get(addr, set())
        if pins and rtu not in pins:
            conflicts.append("0x%08x in %s range has assert pin(s) %s" % (addr, rtu, ",".join(sorted(pins))))
            row[2:] = [rtu, "OUTLIER"]
        elif addr in headers:
            row[2:] = [rtu, "AUTO"]
        else:
            # PINNED needs the function's own assert; a pinned range alone is SUPPORTED
            row[2:] = [rtu, "PINNED" if rtu in pins else ("SUPPORTED" if tag == "PINNED" else tag)]
    for row in rows:
        if row[0] in headers and row[3] not in ("LIB", "AUTO"):
            row[3] = "AUTO"

    with open(os.path.join(BASE, "data", "tu_map.tsv"), "w") as out:
        out.write("addr\tsize\ttu\tevidence\n")
        for addr, size, tu, ev in rows:
            out.write("0x%08x\t%d\t%s\t%s\n" % (addr, size, tu, ev))

    # link order = first appearance of each TU by address; ranges help spot interleaving
    order, span = [], {}
    for addr, size, tu, ev in rows:
        # linker/ = EH funclets and initializers grouped at the end of .text, not an object
        if ev in ("PINNED", "SUPPORTED", "HYPOTHESIS", "AUTO", "EXTLIB") and tu and not tu.startswith("linker/"):
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
    print("AUTO %d  HYPOTHESIS %d" % (count("AUTO"), count("HYPOTHESIS")))
    for c in conflicts:
        print("conflict: " + c)
    overlaps = [(a, b) for a, b in zip(order, order[1:]) if span[a][1] > span[b][0]]
    for a, b in overlaps:
        print("interleaved: %s / %s" % (a, b))


if __name__ == "__main__":
    main()
