#!/usr/bin/env python3
"""Everything an agent needs about one retail function: show.py <addr>

Prints its source file (TU), the matched functions before/after it in that file
(your code goes between them), the retail disassembly with call targets and strings
resolved, and the Ghidra decompile if data/decomp has one.
"""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

BASE = m.BASE_DIR


def tsv(path):
    path = os.path.join(BASE, path)
    if not os.path.exists(path):
        return []
    lines = [l.rstrip("\n").split("\t") for l in open(path) if l.strip() and not l.startswith("#")]
    return [dict(zip(lines[0], r)) for r in lines[1:]]


def cstring(va):
    try:
        off = m.rva_to_offset(va - m.IMAGE_BASE)
    except ValueError:
        return None
    end = m._image.find(b"\0", off, off + 200)
    raw = m._image[off:end]
    if len(raw) >= 2 and all(32 <= c < 127 or c in (9, 10) for c in raw):
        return raw.decode()
    return None


def main():
    addr = sys.argv[1].lower()
    addr = "0x%08x" % int(addr, 16)
    code, meta = m.carve(addr)
    va = int(addr, 16)
    names = {int(r["addr"], 16): r["name"] for r in tsv("ledger/matches.tsv")}
    names.update({int(r["addr"], 16): r["symbol"] + " [lib]" for r in tsv("data/lib_funcs.tsv")})
    tu_rows = tsv("data/tu_map.tsv")
    tu = next((r for r in tu_rows if r["addr"] == addr), None)
    print("function %s  size %d  file %s (%s)" % (addr, len(code), tu and tu["tu"] or "?", tu and tu["evidence"] or "unknown"))

    if tu and tu["tu"]:
        same = [r for r in tu_rows if r["tu"] == tu["tu"]]
        matched = {r["addr"]: r for r in tsv("ledger/matches.tsv")}
        before = [r for r in same if r["addr"] < addr and r["addr"] in matched]
        after = [r for r in same if r["addr"] > addr and r["addr"] in matched]
        src = tu["tu"] if tu["tu"].startswith("src/") else "src/" + tu["tu"]
        print("source   %s" % src)
        print("place it after  %s" % (matched[before[-1]["addr"]]["name"] if before else "(start of file)"))
        print("place it before %s" % (matched[after[0]["addr"]]["name"] if after else "(end of file)"))
    print()

    for ins in Cs(CS_ARCH_X86, CS_MODE_32).disasm(code, va):
        note = ""
        for tok in ins.op_str.replace("[", " ").replace("]", " ").replace(",", " ").split():
            if tok.startswith("0x"):
                v = int(tok, 16)
                if v in names:
                    note = names[v]
                elif ins.mnemonic == "call" and ins.op_str.startswith("0x"):
                    note = "FUN_%08x" % v
                elif ins.mnemonic == "call":
                    note = "imported function (pointer at 0x%08x)" % v
                else:
                    s = cstring(v) if m.IMAGE_BASE <= v < m.IMAGE_END else None
                    if s:
                        note = repr(s)
        if ins.mnemonic == "push" and ins.op_str.startswith("0x") and not note:
            n = int(ins.op_str, 16)
            if n < 5000:
                note = "%d (an assert line number if next to a file string)" % n
        print("  %08x  %-24s %-6s %-30s %s" % (ins.address, ins.bytes.hex(), ins.mnemonic, ins.op_str, ("; " + note) if note else ""))

    decomp = os.path.join(BASE, "data", "decomp", addr[2:] + ".c")
    if os.path.exists(decomp):
        print("\n--- Ghidra decompile (a hint only: names and types are guesses) ---")
        print(open(decomp).read())


if __name__ == "__main__":
    main()
