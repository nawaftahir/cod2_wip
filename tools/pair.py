#!/usr/bin/env python3
"""Side by side: retail function and ours as linked. pair.py <retail addr> <symbol> [rows]
Reads build/CoD2Radiant.exe + .map (make try first). Retail left, ours right."""
import pathlib, sys
import capstone, pefile

BASE = pathlib.Path(__file__).resolve().parent.parent
addr, sym = int(sys.argv[1], 16), sys.argv[2]
rows = int(sys.argv[3]) if len(sys.argv) > 3 else 60
ours_va = next(int(l.split()[2], 16) for l in (BASE / "build/CoD2Radiant.map").read_text(errors="replace").splitlines()
               if len(l.split()) > 2 and l.split()[1] == sym)
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)


def listing(exe, va):
    pe = pefile.PE(str(exe), fast_load=True)
    code = pe.get_data(va - pe.OPTIONAL_HEADER.ImageBase, 0x800)
    out = []
    for i in md.disasm(code, va):
        out.append(f"{i.address - va:4x} {i.mnemonic} {i.op_str}"[:52])
        if i.mnemonic == "ret" and len(out) > rows:
            break
    return out


a = listing(BASE / "binaries/CoD2Radiant.exe", addr)
b = listing(BASE / "build/CoD2Radiant.exe", ours_va)
for i in range(min(rows, max(len(a), len(b)))):
    l, r = (a[i] if i < len(a) else ""), (b[i] if i < len(b) else "")
    mark = " " if l.split(" ", 1)[-1:] == r.split(" ", 1)[-1:] else "|"
    print(f"{l:52s}{mark} {r}")
