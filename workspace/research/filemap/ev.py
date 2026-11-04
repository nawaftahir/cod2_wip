#!/usr/bin/env python3
"""Per-function evidence from the retail exe: referenced strings and direct calls.
Usage: ev.py LO HI   (prints functions in [LO,HI) with their strings)"""
import bisect, os, re, struct, sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "tools"))
import match_radiant as m
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

img = m._image
B = m.IMAGE_BASE
secs = {n: (B + s["va"], B + s["va"] + max(s["vs"], s["raw"]), s) for n, s in m.SECTIONS.items()}
funcs = sorted((int(a, 16), int(f["size"])) for a, f in m.FUNCTIONS.items())
starts = [a for a, _ in funcs]
tu = {}
for l in open("data/tu_map.tsv").read().splitlines()[1:]:
    a, size, t, ev = l.split("\t")
    tu[int(a, 16)] = (t, ev)

def read(va, n):
    for lo, hi, s in secs.values():
        if lo <= va < hi:
            off = s["ptr"] + va - lo
            return img[off:off + n]
    return b""

def cstr(va):
    b = read(va, 200)
    if not b:
        return None
    end = b.find(b"\0")
    if end < 3:
        return None
    s = b[:end]
    if all(32 <= c < 127 or c in (9, 10, 13) for c in s):
        return s.decode()
    return None

md = Cs(CS_ARCH_X86, CS_MODE_32)
md.skipdata = True
md.detail = True

def info(addr, size):
    code = read(addr, size)
    strs, calls = [], []
    for ins in md.disasm(code, addr):
        if ins.id == 0:
            continue
        for op in ins.operands:
            v = op.imm if op.type == 2 else (op.mem.disp if op.type == 3 else None)
            if v is None:
                continue
            v &= 0xFFFFFFFF
            if ins.mnemonic == "call" and op.type == 2:
                calls.append(v)
                continue
            if secs[".rdata"][0] <= v < secs[".data"][1]:
                s = cstr(v)
                if s:
                    strs.append(s)
    return strs, calls

if __name__ == "__main__":
    lo, hi = int(sys.argv[1], 16), int(sys.argv[2], 16)
    for a, size in funcs:
        if lo <= a < hi:
            t, ev = tu.get(a, ("", ""))
            s, c = info(a, size)
            print("%08x %5d %-28s %s" % (a, size, (t + ":" + ev) if t else "", " | ".join(x[:60] for x in s[:6])))
