#!/usr/bin/env python3
"""PE certification for the gfx track anchor: sections, Rich header, imports, exports."""
import hashlib, struct, sys

PATH = sys.argv[1] if len(sys.argv) > 1 else "/home/nawaf/cod2/test/dev/reverse/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll"
d = open(PATH, "rb").read()

print(f"file: {PATH}")
print(f"size: {len(d)}")
print(f"sha256: {hashlib.sha256(d).hexdigest()}")

e_lfanew = struct.unpack("<I", d[0x3C:0x40])[0]
assert d[e_lfanew:e_lfanew+4] == b"PE\0\0", "not a PE"
machine, nsec, timestamp, _, _, optsz, chars = struct.unpack("<HHIIIHH", d[e_lfanew+4:e_lfanew+24])
import datetime
print(f"machine: {machine:#06x} (0x14c=i386)  nsec: {nsec}  timestamp: {timestamp} ({datetime.datetime.utcfromtimestamp(timestamp)} UTC)")
print(f"characteristics: {chars:#06x}  (0x2000=DLL)" )

opt = e_lfanew + 24
magic = struct.unpack("<H", d[opt:opt+2])[0]
print(f"opt magic: {magic:#06x} (0x10b=PE32)")
linker_maj, linker_min = d[opt+2], d[opt+3]
print(f"linker version: {linker_maj}.{linker_min}  (7.10 = MSVC .NET 2003)")
entry = struct.unpack("<I", d[opt+16:opt+20])[0]
imgbase = struct.unpack("<I", d[opt+28:opt+32])[0]
sectalign, filealign = struct.unpack("<II", d[opt+32:opt+40])
print(f"entry RVA: {entry:#x}  imagebase: {imgbase:#x}  sectalign: {sectalign:#x}  filealign: {filealign:#x}")

# Rich header
RICH_IDS = {1: "import", 0: "base", 15: "objs", 256: "linker", 257: "cvtres",
            258: "cvtres", 259: "cvtres", 260: "cvtres", 261: "cvtres", 262: "cvtres",
            263: "cvtres", 264: "linker", 265: "linker", 266: "linker", 267: "linker",
            268: "linker", 269: "linker", 278: "cvtres", 279: "cvtres",
            0x7D1: "reserved1", 2000: "reserved2"}
end = d.find(b"Rich")
if end > 0:
    key = struct.unpack("<I", d[end+4:end+8])[0]
    dans = struct.pack("<I", 0x536E6144 ^ key)  # "DanS" XORed with key
    start = d.rfind(dans, 0, end)
    print(f"\nRich header: {start:#x}..{end:#x}  key={key:#x}")
    pos = start
    vals = []
    while pos < end:
        v, c = struct.unpack("<II", d[pos:pos+8])
        v ^= key
        vals.append((v >> 16, v & 0xFFFF, c ^ key))
        pos += 8
    for prodid, build, count in vals:
        if prodid == 0 and count == 0:
            continue
        print(f"  prodid={prodid:<4} build={build:<6} count={count}   ({RICH_IDS.get(prodid, '?')})")
else:
    print("\nRich header: none")

# Sections
print(f"\nsections ({nsec}):")
sec_off = opt + optsz
sections = {}
for k in range(nsec):
    s = d[sec_off+k*40: sec_off+k*40+40]
    name = s[:8].rstrip(b"\0").decode("ascii", "replace")
    vs, va, rs, ra = struct.unpack("<IIII", s[8:24])
    sections[name] = (va, vs, ra, rs)
    chars_s = struct.unpack("<I", s[36:40])[0]
    flags = []
    if chars_s & 0x20: flags.append("code")
    if chars_s & 0x40: flags.append("idata")
    if chars_s & 0x80: flags.append("udata")
    if chars_s & 0x40000000: flags.append("exec")
    if chars_s & 0xC0000000: flags.append("rw" if chars_s & 0x80000000 else "r")
    print(f"  {name:<8} VA={va:#010x} VS={vs:#9x} RAW={ra:#9x}/{rs:#9x} {'|'.join(flags)}")

# Data directories
dd_off = opt + 96
names = ["export","import","resource","exception","security","basereloc","debug",
         "copyright","globalptr","tls","loadcfg","boundimp","iat","delayimp","comdesc","reserved"]
for i, n in enumerate(names):
    rva, sz = struct.unpack("<II", d[dd_off+i*8: dd_off+i*8+8])
    if rva:
        print(f"dir {n:<10} RVA={rva:#x} size={sz:#x}")

# Exports
exp_rva = struct.unpack("<I", d[dd_off:dd_off+4])[0]
def rva2off(rva):
    for name, (va, vs, ra, rs) in sections.items():
        if va <= rva < va + max(vs, rs):
            return ra + (rva - va)
    return None
if exp_rva:
    eo = rva2off(exp_rva)
    nfun, nnam = struct.unpack("<II", d[eo+20:eo+28])
    ord_base = struct.unpack("<I", d[eo+16:eo+20])[0]
    print(f"\nexports: {nfun} functions, {nnam} names, ordinal base {ord_base}")
    addr_rva, name_rva, ord_rva = struct.unpack("<III", d[eo+28:eo+40])
    for i in range(min(nnam, 20)):
        nrva = struct.unpack("<I", d[rva2off(name_rva)+i*4:rva2off(name_rva)+i*4+4])[0]
        frva = struct.unpack("<I", d[rva2off(addr_rva)+i*4:rva2off(addr_rva)+i*4+4])[0]
        nm = d[rva2off(nrva):d.index(b"\0", rva2off(nrva))].decode()
        print(f"  {nm}  RVA={frva:#x}  ordinal={ord_base+i}")

# Imports
imp_rva = struct.unpack("<I", d[dd_off+8:dd_off+12])[0]
if imp_rva:
    io = rva2off(imp_rva)
    print("\nimports:")
    while True:
        oft, ts, fc, name_r, fthunk = struct.unpack("<IIIII", d[io:io+20])
        if name_r == 0:
            break
        dll = d[rva2off(name_r):d.index(b"\0", rva2off(name_r))].decode()
        cnt = 0
        t = rva2off(oft if oft else fthunk)
        while struct.unpack("<I", d[t+cnt*4:t+cnt*4+4])[0]:
            cnt += 1
        print(f"  {dll:<24} {cnt} functions")
        io += 20
