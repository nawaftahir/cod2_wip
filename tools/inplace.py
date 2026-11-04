#!/usr/bin/env python3
"""inplace.py EXE MAP ANCHOR: per-symbol same-offset check. A map symbol [start, next_start) is identical
in place when our exact file bytes equal the anchor's at the same RVA (relocations included).
Covers .text (functions) and the data sections (.rdata/.data, bss as zeros)."""
import re, sys
import pefile

def image(path):
    """section index (map numbering, 1-based) -> (rva, vsize, bytes padded with zeros to vsize)"""
    pe = pefile.PE(path, fast_load=True)
    return {i + 1: (s.VirtualAddress, s.Misc_VirtualSize, s.get_data()[:s.Misc_VirtualSize].ljust(s.Misc_VirtualSize, b'\0'))
            for i, s in enumerate(pe.sections)}

def read(img, rva, n):
    for va, vs, data in img.values():
        if va <= rva and rva + n <= va + vs: return data[rva - va:rva - va + n]
    return None

def symbols(exe, mapf, anchor, secs=(1,)):
    """[(sec, rva, size, names, obj, same)] for every distinct symbol address in the given map sections."""
    ours, theirs = image(exe), image(anchor)
    syms = {}
    for m in re.finditer(r'^ (000\d):([0-9a-f]{8})\s+(\S+)\s+[0-9a-f]{8}\s+(.*)$', open(mapf, errors='replace').read(), re.M):
        sec = int(m.group(1))
        if sec in secs and sec in ours:
            e = syms.setdefault((sec, int(m.group(2), 16)), [[], m.group(4).split()[-1]])
            e[0].append(m.group(3))
    out = []
    for sec in secs:
        if sec not in ours: continue
        va, vsize, data = ours[sec]
        offs = sorted(o for s, o in syms if s == sec and o < vsize)
        for i, o in enumerate(offs):
            end = offs[i + 1] if i + 1 < len(offs) else vsize
            out.append((sec, va + o, end - o, syms[sec, o][0], syms[sec, o][1], read(theirs, va + o, end - o) == data[o:end]))
    return out

def functions(exe, mapf, anchor):
    """[(rva, size, names, obj, same)] for every distinct .text address in the map."""
    return [x[1:] for x in symbols(exe, mapf, anchor)]

if __name__ == '__main__':
    fs = functions(*sys.argv[1:4])
    bad = [f for f in fs if not f[4]]
    print('functions %d, identical in place %d, differ %d' % (len(fs), len(fs) - len(bad), len(bad)))
    for rva, size, names, obj, _ in bad: print('  %08x %6d %-24s %s' % (rva + 0x400000, size, obj, names[0]))
