#!/usr/bin/env python3
"""find_ipra.py - detect functions that read callee-saved registers (ebx, esi,
edi) before defining them => they consume caller-assigned args (IPRA style)
and must be reconstructed inside the same translation unit as their callers.

Usage: python3 tools/find_ipra.py [limit]
Output: build/ipra_consumers.tsv  (addr, name, size, regs, status)
"""
import os, sys, json

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402
from capstone import Cs, CS_ARCH_X86, CS_MODE_32  # noqa: E402

CALLEE_SAVED = {"ebx": "b", "esi": "e", "edi": "d"}
# mov r32, r/m32 encodings that READ ebx/esi/edi early (8b /r with reg field target)
LIMIT = int(sys.argv[1]) if len(sys.argv) > 1 else 24  # instructions to scan


def scan(fn_bytes):
    md = Cs(CS_ARCH_X86, CS_MODE_32)
    defined = set()
    n = 0
    for i in md.disasm(fn_bytes[:160], 0):
        n += 1
        if n > LIMIT:
            break
        m = i.mnemonic
        ops = i.op_str
        if m.startswith("j") or m == "call":
            continue
        parts = [p.strip() for p in ops.split(",")]
        if not parts or not parts[0]:
            continue
        dst = parts[0]
        # source operands: flag reads of callee-saved regs not yet defined
        for src in parts[1:]:
            toks = src.replace("[", " ").replace("]", " ").replace("*", " ").replace("+", " ").split()
            for tk in toks:
                if tk in CALLEE_SAVED and tk not in defined:
                    return CALLEE_SAVED[tk]
        if parts[0] in CALLEE_SAVED:
            defined.add(parts[0])
        if dst in CALLEE_SAVED or any(dst.endswith(r) for r in CALLEE_SAVED.values()):
            defined.add(dst)
    return ""


def main():
    inv = {f["addr"]: f for f in json.load(open(os.path.join(BASE, "data/functions_gfx10.json")))["functions"]}
    rows = []
    for line in open(os.path.join(BASE, "data/manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) < 5 or p[0] == "addr" or p[2] != "iw":
            continue
        addr, name, status = p[0], p[1], p[3]
        try:
            fn, _ = M.carve(addr)
        except KeyError:
            continue
        letter = scan(fn)
        if letter:
            rows.append((addr, name, inv.get(addr, {}).get("size", len(fn)), letter, status))
    out = open(os.path.join(BASE, "build/ipra_consumers.tsv"), "w")
    out.write("addr\tname\tsize\tregs\tstatus\n")
    for r in sorted(rows, key=lambda x: x[0]):
        out.write("\t".join(map(str, r)) + "\n")
    out.close()
    from collections import Counter
    c = Counter(r[4] for r in rows)
    print(f"IPRA consumers: {len(rows)}  by status: {dict(c)}")
    print("top sizes:", sorted([(r[2], r[1]) for r in rows])[:8])


if __name__ == "__main__":
    main()
