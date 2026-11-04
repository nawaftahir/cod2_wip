#!/usr/bin/env python3
"""cluster_graph.py — map IPRA register-arg relationships across the inventory.

Scans data/decomp/*.c for incoming-register variables (in_EAX, in_ECX, in_ESI,
unaff_*), then links each consumer to the callers that set those registers for
it (callers whose disassembly ends in mov reg / push patterns — approximated by
matching wrapper shapes in the PE bytes: a caller is linked when its last
instruction before `call target` writes the register the callee reads).

Output: build/cluster_graph.tsv (callee, reg_read, caller, confidence)
        stdout summary of clusters that must be reconstructed together.
"""
import json
import os
import re
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

DECOMP = os.path.join(BASE, "data", "decomp")

REG_READ = re.compile(r"\bin_(EAX|ECX|EDX|ESI|EDI)\b|\bunaff_(EAX|ECX|EDX|ESI|EDI)\b")


def main():
    inv = json.load(open(os.path.join(BASE, "data", "functions_gfx10.json")))["functions"]
    consumers = {}  # addr -> set(regs read at entry)
    for f in inv:
        p = os.path.join(DECOMP, "%s_%s.c" % (f["addr"], f["name"]))
        if not os.path.isfile(p):
            continue
        regs = set(m.group(1) or m.group(2) for m in REG_READ.finditer(open(p).read()))
        # only entry-time reads matter; filter obvious locals-only matches
        if regs:
            consumers[f["addr"].lower()] = regs

    print(f"{len(consumers)} functions read incoming registers")

    # find callers: scan every function's bytes for E8 rel32; resolve target;
    # check the <=10 bytes before call for reg-writes (mov r32, r/m32 / xor / lea)
    edges = []
    for f in inv:
        try:
            fn, meta = M.carve(f["addr"])
        except KeyError:
            continue
        base = int(f["addr"], 16)
        i = 0
        n = len(fn)
        while i < n - 5:
            if fn[i] == 0xE8:
                disp = int.from_bytes(fn[i + 1:i + 5], "little", signed=True)
                tgt = base + i + 5 + disp
                k = "%x" % tgt
                if k in consumers:
                    window = fn[max(0, i - 10):i]
                    for reg, opcodes in (("EAX", (0x89, 0x8B, 0x31, 0x33)),
                                         ("ECX", (0x89, 0x8B, 0x31, 0x33)),
                                         ("ESI", (0x89, 0x8B, 0x31, 0x33))):
                        pass  # refined below
                    # simple heuristic: last byte pair writing the reg
                    tail = fn[max(0, i - 6):i]
                    regs = consumers[k]
                    conf = "weak"
                    for reg in list(regs):
                        idx = {0x89: "mov", 0x8B: "mov", 0x31: "xor"}.get(tail[0]) if tail else None
                        if tail and tail[0] in (0x89, 0x8B) and ((tail[1] >> 3) & 7) == \
                           {"EAX": 0, "ECX": 1, "EDX": 2, "ESI": 6, "EDI": 7}.get(reg, 9):
                            edges.append((k, reg, f["addr"].lower(), "strong"))
                            break
                    else:
                        if tail and tail[-1] == 0x50 + {"EAX": 0, "ECX": 1, "EDX": 2}.get(
                                sorted(regs)[0] if regs else "X", 9):
                            edges.append((k, sorted(regs)[0], f["addr"].lower(), "push"))
                        else:
                            edges.append((k, ",".join(sorted(regs)), f["addr"].lower(), conf))
                i += 5
                continue
            i += 1

    with open(os.path.join(BASE, "build", "cluster_graph.tsv"), "w") as out:
        out.write("callee\treg\tcaller\tconfidence\n")
        for e in sorted(edges):
            out.write("\t".join(e) + "\n")
    strong = [e for e in edges if e[3] == "strong"]
    print(f"edges: {len(edges)} total, {len(strong)} strong reg-write links")
    print("top clusters (callee <- callers):")
    agg = {}
    for c, r, caller, conf in edges:
        agg.setdefault((c, r), []).append(caller)
    for (c, r), callers in sorted(agg.items(), key=lambda kv: -len(kv[1]))[:15]:
        print(f"  {c} [{r}] <- {len(callers)} callers, e.g. {callers[:4]}")


if __name__ == "__main__":
    main()
