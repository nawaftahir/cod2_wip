#!/usr/bin/env python3
"""Check every ledger row inside the linked exe: linkcheck.py (after link.py).

The per-object referee (verify.py) compiles one file alone. For the /GL files the final code comes
from link-time codegen, so the real proof is the linked exe: find each ledger symbol in
build/CoD2Radiant.map, carve that many bytes from build/CoD2Radiant.exe, and compare with retail at
the row's address. Call/jump targets and absolute addresses are masked on both sides (they differ
until the whole layout matches). Writes build/linkcheck.json.
"""
import json
import pathlib
import re
import struct
import sys

import pefile
from capstone import CS_ARCH_X86, CS_MODE_32, Cs
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

BASE = pathlib.Path(__file__).resolve().parent.parent
LO, HI = 0x400000, 0x1300000


def load(path):
    pe = pefile.PE(str(path), fast_load=True)
    return pe, pe.OPTIONAL_HEADER.ImageBase


def carve(pe, base, va, size):
    return pe.get_data(va - base, size)


def mask(code, va):
    out = set()
    for ins in Cs(CS_ARCH_X86, CS_MODE_32).disasm(code, va):
        raw = bytes(ins.bytes)
        for op in Cs(CS_ARCH_X86, CS_MODE_32).disasm(raw, ins.address) and []:
            pass
        rel = ins.mnemonic == "call" or ins.mnemonic.startswith("j")
        if rel and ins.size >= 5 and raw[0] in (0xE8, 0xE9) or (rel and raw[0] == 0x0F and ins.size >= 6):
            out.update(range(ins.address - va + ins.size - 4, ins.address - va + ins.size))
            continue
        # any 4-byte field that holds an in-image address (data refs, vtables, strings, imports)
        for k in range(ins.size - 3):
            v = struct.unpack_from("<I", raw, k)[0]
            if LO <= v < HI:
                out.update(range(ins.address - va + k, ins.address - va + k + 4))
    return out


def map_symbols(path):
    syms = {}
    for line in path.read_text(errors="replace").splitlines():
        m = re.match(r"\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s", line)
        if m:
            syms.setdefault(m.group(1), int(m.group(2), 16))
    return syms


def main():
    rows = [l.split("\t") for l in (BASE / "ledger" / "matches.tsv").read_text().splitlines()[1:] if l.strip()]
    retail, rbase = load(BASE / "binaries" / "CoD2Radiant.exe")
    ours, obase = load(BASE / "build" / "CoD2Radiant.exe")
    syms = map_symbols(BASE / "build" / "CoD2Radiant.map")
    results, ok = [], 0
    for addr, size, source, symbol, name, *_ in rows:
        va, size = int(addr, 16), int(size)
        want = carve(retail, rbase, va, size)
        if symbol not in syms:
            results.append((addr, name, "NOT-LINKED", "symbol not in the map (dropped or inlined by the linker)"))
            continue
        got = carve(ours, obase, syms[symbol], size)
        m = mask(want, va) | mask(got, syms[symbol])
        diff = next((i for i in range(size) if i not in m and want[i] != got[i]), None)
        if diff is None:
            ok += 1
            results.append((addr, name, "MATCH", "at 0x%08x" % syms[symbol]))
        else:
            results.append((addr, name, "DIFF", "first difference at +0x%x (ours at 0x%08x)" % (diff, syms[symbol])))
    for r in results:
        if r[2] != "MATCH":
            print("%-10s %s %s  %s" % (r[2], r[0], r[1], r[3]))
    print("linkcheck: %d/%d ledger rows match inside the linked exe" % (ok, len(rows)))
    (BASE / "build" / "linkcheck.json").write_text(json.dumps({"rows": len(rows), "match": ok, "results": results}, indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
