#!/usr/bin/env python3
"""Find the files that went through link-time codegen (/GL + /LTCG): ltcg_scan.py

PINNED 2026-10-21 (scratch test): plain /O2 already passes arguments in registers to a *static*
function called from the same file. So register arguments alone prove nothing. Only LTCG can give a
function register arguments when it is called from a *different* file. This scan finds functions that
read EAX/EDX/ESI/EDI/EBX on entry, collects their callers, and flags callee/caller files that differ.
Writes data/ltcg.tsv (every register-argument function, with its caller files).
"""
import bisect
import collections
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m
from capstone import CS_ARCH_X86, CS_MODE_32, Cs
from capstone.x86 import X86_REG_EAX, X86_REG_EBX, X86_REG_EDI, X86_REG_EDX, X86_REG_ESI, X86_REG_AL, \
    X86_REG_AX, X86_REG_DL, X86_REG_DX, X86_REG_BL, X86_REG_BX, X86_REG_SI, X86_REG_DI

FAMILY = {X86_REG_EAX: "eax", X86_REG_AX: "eax", X86_REG_AL: "eax", X86_REG_EDX: "edx", X86_REG_DX: "edx",
          X86_REG_DL: "edx", X86_REG_EBX: "ebx", X86_REG_BX: "ebx", X86_REG_BL: "ebx", X86_REG_ESI: "esi",
          X86_REG_SI: "esi", X86_REG_EDI: "edi", X86_REG_DI: "edi"}
cs = Cs(CS_ARCH_X86, CS_MODE_32)
cs.detail = True


def entry_reads(code, va):
    written, reads = set(), set()
    for ins in cs.disasm(code, va):
        r, w = ins.regs_access()
        if ins.mnemonic == "push" and ins.operands and ins.operands[0].type == 1:
            written.add(FAMILY.get(ins.operands[0].reg))
            continue
        ops = [o.strip() for o in ins.op_str.split(",")]
        if ins.mnemonic in ("xor", "sub") and len(ops) == 2 and ops[0] == ops[1]:
            r = ()
        for reg in r:
            f = FAMILY.get(reg)
            if f and f not in written:
                reads.add(f)
        for reg in w:
            if FAMILY.get(reg):
                written.add(FAMILY[reg])
        if ins.mnemonic in ("ret", "jmp", "call") or ins.mnemonic.startswith("j"):
            break
    return reads


def main():
    tu = {}
    for line in open(os.path.join(m.BASE_DIR, "data", "tu_map.tsv")).read().splitlines()[1:]:
        a, size, t, ev = line.split("\t")
        tu[int(a, 16)] = t if ev in ("PINNED", "SUPPORTED", "LIB") else ""
    funcs = sorted((int(a, 16), int(f["size"])) for a, f in m.FUNCTIONS.items())
    starts = [a for a, _ in funcs]
    text = m.SECTIONS[".text"]
    code = m._image[text["ptr"]:text["ptr"] + text["vs"]]
    base = m.IMAGE_BASE + text["va"]
    callers = collections.defaultdict(set)
    for i in range(len(code) - 5):
        if code[i] == 0xE8:
            dest = (base + i + 5 + struct.unpack_from("<i", code, i + 1)[0]) & 0xFFFFFFFF
            k = bisect.bisect_right(starts, base + i) - 1
            if k >= 0:
                callers[dest].add(funcs[k][0])
    rows, cross = [], collections.Counter()
    for addr, size in funcs:
        c, _ = m.carve("0x%08x" % addr)
        reads = entry_reads(c, addr)
        if not reads:
            continue
        mine = tu.get(addr, "")
        others = sorted({tu.get(x, "") or "?" for x in callers.get(addr, ())})
        foreign = [o for o in others if o != "?" and mine and o != mine]
        if foreign:
            cross[mine] += 1
            for o in foreign:
                cross[o + " (as caller)"] += 1
        rows.append(("0x%08x" % addr, ",".join(sorted(reads)), mine or "?", ";".join(others), "CROSS" if foreign else ""))
    with open(os.path.join(m.BASE_DIR, "data", "ltcg.tsv"), "w") as f:
        f.write("addr\tregs\ttu\tcaller_tus\tcross_file\n")
        for r in rows:
            f.write("\t".join(r) + "\n")
    print("register-argument functions: %d, called across files: %d" % (len(rows), sum(1 for r in rows if r[4])))
    for k, n in cross.most_common(40):
        print("%4d  %s" % (n, k))


if __name__ == "__main__":
    main()
