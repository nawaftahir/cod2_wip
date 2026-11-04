#!/usr/bin/env python3
"""dump_raws.py — write a .asm disassembly for EVERY function in the DLL.
Output: build/rawdumps/<addr>_<size>B.asm  (capstone, imagebase-relative)
This is the ground-truth reference for any reconstruction work."""
import os, sys, json
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

out = os.path.join(BASE, "build", "rawdumps")
os.makedirs(out, exist_ok=True)
inv = json.load(open(f"{BASE}/data/functions_gfx10.json"))["functions"]
md = open(f"{out}/MANIFEST.tsv", "w")
md.write("addr\tsize\tname\n")
n = 0
for f in inv:
    a = int(f["addr"], 16)
    try:
        fn, meta = M.carve(f["addr"])
    except Exception:
        continue
    with open(f"{out}/{f['addr']}_{len(fn)}B_{f['name']}.asm", "w") as h:
        for i in Cs(CS_ARCH_X86, CS_MODE_32).disasm(fn, a):
            h.write(f"{i.address:x}  {i.mnemonic} {i.op_str}\n")
    md.write(f"{f['addr']}\t{len(fn)}\t{f['name']}\n")
    n += 1
md.close()
print("dumped", n)
