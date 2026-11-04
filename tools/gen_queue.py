#!/usr/bin/env python3
"""Build workspace/queue/queue.tsv: the functions agents may work on, easiest first.

In the queue: functions whose source file is known (tu_map PINNED/SUPPORTED), not library,
not matched yet, not deferred. Functions with an unknown file stay out until the TU map
places them, so every match lands in the right file at the right spot.
Tier 1 = leaf (calls nothing), tier 2 = calls only matched/library functions, tier 3 = the rest.
Inside a tier: smallest first. Owner tool.
"""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

BASE = m.BASE_DIR


def tsv(path, key="addr"):
    path = os.path.join(BASE, path)
    if not os.path.exists(path):
        return {}
    lines = [l.rstrip("\n").split("\t") for l in open(path) if l.strip() and not l.startswith("#")]
    return {dict(zip(lines[0], r))[key].lower(): dict(zip(lines[0], r)) for r in lines[1:]}


def src_path(tu):
    return tu if tu.startswith("src/") else "src/" + tu


def callees(addr, code):
    va = int(addr, 16)
    out = set()
    for ins in Cs(CS_ARCH_X86, CS_MODE_32).disasm(code, va):
        if ins.mnemonic == "call" and ins.op_str.startswith("0x"):
            out.add(int(ins.op_str, 16))
        elif ins.mnemonic == "call":
            out.add(-1)  # indirect: unknown target
    return out


def main():
    tu = tsv("data/tu_map.tsv")
    done = set(tsv("ledger/matches.tsv")) | set(tsv("data/lib_funcs.tsv")) | set(tsv("ledger/defer.tsv"))
    known = {int(a, 16) for a in set(tsv("ledger/matches.tsv")) | set(tsv("data/lib_funcs.tsv"))}
    decomp = os.path.join(BASE, "data", "decomp")
    rows = []
    for addr, row in tu.items():
        if row["evidence"] not in ("PINNED", "SUPPORTED") or addr in done:
            continue
        code, meta = m.carve(addr)
        calls = callees(addr, code)
        tier = 1 if not calls else 2 if calls <= known else 3
        hint = "data/decomp/%s.c" % addr[2:] if os.path.exists(os.path.join(decomp, addr[2:] + ".c")) else ""
        rows.append((tier, int(row["size"]), addr, src_path(row["tu"]), hint))
    rows.sort()
    os.makedirs(os.path.join(BASE, "queue"), exist_ok=True)
    with open(os.path.join(BASE, "queue", "queue.tsv"), "w") as f:
        f.write("tier\tsize\taddr\tsource\tdecomp\n")
        for r in rows:
            f.write("%d\t%d\t%s\t%s\t%s\n" % r)
    counts = [sum(1 for r in rows if r[0] == t) for t in (1, 2, 3)]
    print("queue: %d rows (tier1 %d, tier2 %d, tier3 %d)" % (len(rows), *counts))


if __name__ == "__main__":
    main()
