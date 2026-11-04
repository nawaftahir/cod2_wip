#!/usr/bin/env python3
"""Find functions that come from the MSVC 7.1 static libraries (MFC, CRT, C++ std).

Every function symbol in every member of the given .lib files is compared with every
inventory function of the same size, masking relocations on both sides.
Matches go to data/lib_funcs.tsv: these are linked from the library, never rewritten.
Exact duplicates inside the exe are reported too (identical code, two addresses).
Run inside the toolchain image: python3 tools/lib_sweep.py [lib ...]
Owner tool: agents don't edit its output.
"""
import collections
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m
import link

DEFAULT_LIBS = [
    "/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib",
    "/opt/msvc710/Vc7/lib/libcmt.lib",
    "/opt/msvc710/Vc7/lib/libcpmt.lib",
    "/opt/msvc710/Vc7/lib/oldnames.lib",
]


def archive_members(path):
    data = open(path, "rb").read()
    if not data.startswith(b"!<arch>\n"):
        return
    off, longnames = 8, b""
    while off + 60 <= len(data):
        header = data[off:off + 60]
        size = int(header[48:58].decode().strip())
        member = data[off + 60:off + 60 + size]
        raw = header[:16]
        if raw.startswith(b"//"):
            longnames = member
        elif raw.startswith(b"/") and raw[1:].strip().isdigit():
            start = int(raw[1:].strip())
            yield longnames[start:longnames.find(b"\0", start)].decode(errors="replace"), member
        elif not raw.startswith(b"/"):
            yield raw.split(b"/")[0].decode(errors="replace"), member
        off += 60 + size + (size & 1)


def lib_functions(paths):
    by_size = collections.defaultdict(list)
    for path in paths:
        lib = os.path.basename(path).lower()
        for member, data in archive_members(path):
            try:
                _, symbols = m.parse_coff(data)
            except Exception:
                continue
            for sym in symbols:
                name = sym["name"]
                if sym["section"] <= 0 or sym["class"] not in (2, 3) or not name or name[0] in ".$":
                    continue
                try:
                    payload, mask, _ = m.object_function(data, name)
                except Exception:
                    continue
                if len(payload) >= 2:
                    by_size[len(payload)].append((payload, mask, name, lib, member))
    return by_size


GAME_END = 0x4d0c40  # first MFC function; game code and the VC6 P4 API sit before it


def same(a, amask, b, bmask):
    mask = amask | bmask
    return all(x == y for i, (x, y) in enumerate(zip(a, b)) if i not in mask)


def main():
    libs = sys.argv[1:] or DEFAULT_LIBS
    by_size = lib_functions(libs)
    print("library functions: %d" % sum(map(len, by_size.values())), file=sys.stderr)
    found, targets = [], {}
    for addr, meta in sorted(m.FUNCTIONS.items()):
        if meta.get("thunk"):
            continue
        target, _ = m.carve(addr)
        va = int(addr, 16)
        tmask = m.absolute_masks(target, m.pe_relocations(va, len(target), target))
        targets[addr] = (target, tmask)
        # MFC/CRT link after the game and P4 objects; a hit before them is header code or chance
        if va < GAME_END:
            continue
        for payload, omask, name, lib, member in by_size.get(len(target), ()):
            if same(target, tmask, payload, omask):
                found.append((addr, len(target), lib, member, name))
                break
    fixed = {r["addr"]: r for r in link.read_tsv("data/lib_overrides.tsv")}
    found = [(a, n, lib, fixed[a]["member"], fixed[a]["symbol"]) if a in fixed else (a, n, lib, mem, name)
             for a, n, lib, mem, name in found]
    libbed = {f[0] for f in found}
    # identical code at two addresses (e.g. folded templates); a hint, not a library match
    groups = collections.defaultdict(list)
    for addr, (target, tmask) in targets.items():
        if addr not in libbed and len(target) >= 8:
            groups[m.normalize(target, tmask)].append(addr)
    out = os.path.join(m.BASE_DIR, "data", "lib_funcs.tsv")
    with open(out, "w") as f:
        f.write("addr\tsize\tlib\tmember\tsymbol\n")
        for row in found:
            f.write("%s\t%d\t%s\t%s\t%s\n" % row)
    with open(os.path.join(m.BASE_DIR, "data", "duplicates.tsv"), "w") as f:
        f.write("addrs\tsize\n")
        for addrs in groups.values():
            if len(addrs) > 1:
                f.write("%s\t%d\n" % (",".join(addrs), len(targets[addrs[0]][0])))
    text = m.SECTIONS[".text"]["vs"]
    total = sum(r[1] for r in found)
    print("lib matches %d functions, %d bytes (%.1f%% of .text)" % (len(found), total, 100.0 * total / text))


if __name__ == "__main__":
    main()
