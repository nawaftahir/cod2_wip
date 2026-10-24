#!/usr/bin/env python3
"""Side-by-side disassembly, retail vs ours as linked: side.py <addr>=<symbol>... [-n lines]"""
import sys
sys.path.insert(0, "tools")
import verify, match_radiant as m
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
md = Cs(CS_ARCH_X86, CS_MODE_32)
n = int(sys.argv[sys.argv.index("-n") + 1]) if "-n" in sys.argv else 30
L = verify.Linked()
for arg in [a for a in sys.argv[1:] if "=" in a]:
    addr, sym = arg.split("=")
    t, _ = m.carve(addr); va, o = L.code(sym)
    A = ["%s %s" % (i.mnemonic, i.op_str) for i in md.disasm(t, int(addr, 16))]
    B = ["%s %s" % (i.mnemonic, i.op_str) for i in md.disasm(o, va)]
    print("==", sym, len(t), len(o))
    for i in range(min(n, max(len(A), len(B)))):
        a = A[i] if i < len(A) else ""; b = B[i] if i < len(B) else ""
        print("%s %-44s %s" % (" " if a == b else "*", a[:44], b[:44]))
