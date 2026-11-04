#!/usr/bin/env python3
"""Classes from RTTI: vtables (via complete object locators) and MFC message maps.
Writes research/filemap/classes.tsv: addr  class  how  (one row per text function a class owns)."""
import collections, os, struct, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from ev import read, secs, funcs, B, tu

starts = {a for a, _ in funcs}
rlo, rhi = secs[".rdata"][0], secs[".rdata"][1]
dlo, dhi = secs[".data"][0], secs[".data"][1]
tlo, thi = secs[".text"][0], secs[".text"][1]
rdata = read(rlo, rhi - rlo)
u32 = lambda va: struct.unpack("<I", read(va, 4))[0]

# type descriptors: vfptr, spare, ".?AV...@@"
names = {}
data = read(dlo, dhi - dlo)
i = data.find(b".?AV")
while i != -1:
    end = data.find(b"\0", i)
    names[dlo + i - 8] = data[i + 4:end - 2].decode("latin1")
    i = data.find(b".?AV", end)

# complete object locators: sig 0, offset, cdOffset, pTD, pCHD
cols = {}
for o in range(0, len(rdata) - 20, 4):
    sig, off, cd, td, chd = struct.unpack_from("<5I", rdata, o)
    if sig == 0 and td in names and rlo <= chd < rhi:
        nbase = struct.unpack("<I", read(chd + 8, 4))[0]
        cols[rlo + o] = (names[td], off, nbase)

# vtables: dword before vtable = COL
vt = {}
for o in range(0, len(rdata) - 8, 4):
    p = struct.unpack_from("<I", rdata, o)[0]
    if p in cols:
        cls, off, nb = cols[p]
        ents, va = [], rlo + o + 4
        while True:
            f = u32(va)
            if not (tlo <= f < thi) or (ents and (va - rlo - 4) in ()) :
                break
            ents.append(f)
            va += 4
            if (va - 4) != rlo + o + 4 and struct.unpack("<I", read(va, 4))[0] in cols:
                break
        vt[rlo + o + 4] = (cls, off, nb, ents)

# owner of a virtual = most-base class among the vtables that hold it
holders = collections.defaultdict(list)
for va, (cls, off, nb, ents) in vt.items():
    for f in ents:
        holders[f].append((nb, cls))
own = {}
for f, hs in holders.items():
    own[f] = min(hs)[1]

# MFC message maps: GetMessageMap is "mov eax, imm32; ret" in a vtable; map = {pfnGetBaseMap, lpEntries}
mm = {}
for va, (cls, off, nb, ents) in vt.items():
    for f in ents:
        b = read(f, 6)
        if len(b) == 6 and b[0] == 0xB8 and b[5] == 0xC3:
            mp = struct.unpack_from("<I", b, 1)[0]
            if rlo <= mp < rhi:
                lp = u32(mp + 4)
                if rlo <= lp < rhi:
                    mm.setdefault(cls, (mp, lp, f))
for cls, (mp, lp, f) in mm.items():
    e = lp
    while True:
        msg, code, idf, idl, sig, pfn = struct.unpack("<6I", read(e, 24))
        if msg == 0 and pfn == 0:
            break
        if tlo <= pfn < thi:
            own.setdefault(pfn, cls) if pfn not in own else None
            own[pfn] = own.get(pfn, cls)
        e += 24

with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "classes.tsv"), "w") as out:
    out.write("addr\tclass\ttu_now\n")
    for f in sorted(own):
        if f in starts:
            out.write("0x%08x\t%s\t%s\n" % (f, own[f], tu.get(f, ("", ""))[0]))
print("type descriptors %d  COLs %d  vtables %d  message maps %d  owned fns %d" % (len(names), len(cols), len(vt), len(mm), len(own)))
