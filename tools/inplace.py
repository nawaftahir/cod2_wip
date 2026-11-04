#!/usr/bin/env python3
"""inplace.py EXE MAP ANCHOR: per-function same-offset check. A function [start, next_start) is
identical in place when our exact file bytes equal the anchor's at the same RVA (relocations included)."""
import re, sys
import pefile

def text(path):
    pe = pefile.PE(path, fast_load=True)
    s = next(s for s in pe.sections if s.Name.rstrip(b'\0') == b'.text')
    return s.VirtualAddress, s.Misc_VirtualSize, s.get_data()[:s.Misc_VirtualSize]

def functions(exe, mapf, anchor):
    """[(rva, size, names, obj, same)] for every distinct .text address in the map."""
    va, vsize, ours = text(exe)
    rva_a, _, theirs = text(anchor)
    syms = {}
    for m in re.finditer(r'^ 0001:([0-9a-f]{8})\s+(\S+)\s+[0-9a-f]{8}\s+(.*)$', open(mapf, errors='replace').read(), re.M):
        off = int(m.group(1), 16)
        e = syms.setdefault(off, [[], m.group(3).split()[-1]])
        e[0].append(m.group(2))
    offs = sorted(o for o in syms if o < vsize)
    out = []
    for i, o in enumerate(offs):
        end = offs[i + 1] if i + 1 < len(offs) else vsize
        a = o + va - rva_a  # same RVA in the anchor
        same = 0 <= a and theirs[a:a + end - o] == ours[o:end]
        out.append((va + o, end - o, syms[o][0], syms[o][1], same))
    return out

if __name__ == '__main__':
    fs = functions(*sys.argv[1:4])
    bad = [f for f in fs if not f[4]]
    print('functions %d, identical in place %d, differ %d' % (len(fs), len(fs) - len(bad), len(bad)))
    for rva, size, names, obj, _ in bad: print('  %08x %6d %-24s %s' % (rva + 0x400000, size, obj, names[0]))
