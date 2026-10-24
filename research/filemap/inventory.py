#!/usr/bin/env python3
"""Find function starts the Ghidra inventory misses: call targets, vtable/message-map entries, and code
after alignment padding. Writes research/filemap/missing.tsv: addr  size  how"""
import bisect, os, struct, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from ev import read, secs, funcs, B
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

tlo, thi = secs[".text"][0], secs[".text"][0] + secs[".text"][2]["vs"]
code = read(tlo, thi - tlo)
known = {a for a, _ in funcs}
starts = sorted(known)
cover = sorted(funcs)

def inside(a):
    i = bisect.bisect_right(starts, a) - 1
    return i >= 0 and a < cover[i][0] + cover[i][1]

cand = {}
# 1. direct call targets
for j in range(len(code) - 5):
    if code[j] == 0xE8:
        d = (tlo + j + 5 + struct.unpack_from("<i", code, j + 1)[0]) & 0xFFFFFFFF
        if tlo <= d < thi and d not in known:
            cand.setdefault(d, "call")
# 2. pointers to .text stored in .rdata/.data (vtables, message maps, tables)
for sec in (".rdata", ".data"):
    lo, hi, s = secs[sec]
    blob = read(lo, s["raw"])
    for o in range(0, len(blob) - 3, 4):
        p = struct.unpack_from("<I", blob, o)[0]
        if tlo <= p < thi and p not in known and not inside(p):
            cand.setdefault(p, "ptr")
# 3. code after padding: a 16-aligned address preceded by CC/90 fill that no function covers
for a in range(tlo, thi, 16):
    if a in known or inside(a):
        continue
    o = a - tlo
    if code[o] not in (0xCC, 0x90, 0x00) and o > 0 and code[o - 1] in (0xCC, 0x90):
        cand.setdefault(a, "pad")
md = Cs(CS_ARCH_X86, CS_MODE_32)
out = []
nexts = sorted(known | set(cand))
for a, how in sorted(cand.items()):
    if how == "call" and inside(a):
        how = "call-inside"   # call into the middle of a known function: Ghidra merged two functions?
    # size: decode until ret/jmp followed by padding or the next start
    nxt = nexts[bisect.bisect_right(nexts, a)] if bisect.bisect_right(nexts, a) < len(nexts) else thi
    size = 0
    for ins in md.disasm(read(a, nxt - a), a):
        size = ins.address + ins.size - a
        if ins.mnemonic in ("ret", "jmp") and (ins.address + ins.size == nxt or read(ins.address + ins.size, 1) in (b"\xcc", b"\x90")):
            break
    out.append((a, size, how))
with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "missing.tsv"), "w") as f:
    f.write("addr\tsize\thow\n")
    for a, size, how in out:
        f.write("0x%08x\t%d\t%s\n" % (a, size, how))
import collections
print(collections.Counter(h for _, _, h in out))
