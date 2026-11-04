#!/usr/bin/env python3
"""Instructions around a byte offset, retail vs ours: at.py <addr>=<symbol> <offset> [before]"""
import sys
sys.path.insert(0, "tools")
import verify, match_radiant as m
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
md = Cs(CS_ARCH_X86, CS_MODE_32)
addr, sym = sys.argv[1].split("="); off = int(sys.argv[2], 16); back = int(sys.argv[3]) if len(sys.argv) > 3 else 40
L = verify.Linked()
t, _ = m.carve(addr); va, o = L.code(sym)
for code, base in ((t, int(addr, 16)), (o, va)):
    print("--")
    for i in md.disasm(code, base):
        if off - back <= i.address - base <= off + 24:
            print("+%04x %-20s %s %s" % (i.address - base, i.bytes.hex(), i.mnemonic, i.op_str))
