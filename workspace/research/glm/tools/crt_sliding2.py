#!/usr/bin/env python3
"""crt_sliding2.py — mass-match DLL .text against static-lib symbols.

Wildcard-aware: 0xAA on either side (a relocation-masked position) is a don't-care.
Exact match = every byte equal or wild on at least one side.
"""
import json, os, sys

GLM = "/home/nawaf/cod2/test/dev/glm"
sys.path.insert(0, f"{GLM}/tools")
import match_gfx as m
from crt_match import parse_archive, LIBS
from crt_sliding import lib_syms

def build_norm():
    secs = m.SECS
    tva, tvs, tra, trs = secs[".text"]
    text = m._d[tra:tra+trs]
    mask = set()
    for p in m.PE_RELOCS:
        if tra <= p < tra + trs:
            for k in range(4):
                mask.add(p - tra + k)
    # e8/e9 with .text targets (relocation-free rel32) — accepted as wild anyway,
    # so keep this mask (it only adds wildcards, which the matcher tolerates)
    i = 0
    while i < len(text) - 5:
        if text[i] in (0xE8, 0xE9):
            disp = int.from_bytes(text[i+1:i+5], "little", signed=True)
            trva = tva + i + 5 + disp
            if tva <= trva < tva + tvs:
                for k in range(4):
                    mask.add(i + 1 + k)
        i += 5 if text[i] in (0xE8, 0xE9) else 1
    return text, m.normalize(text, mask), tva

def wc_equal_all(pos, ntext, pat):
    for k in range(len(pat)):
        a = ntext[pos + k]
        b = pat[k]
        if a != b and a != 0xAA and b != 0xAA:
            return k
    return -1

if __name__ == "__main__":
    text, ntext, tva = build_norm()
    syms = [s for s in lib_syms() if len(s[3]) >= 12]
    # dedupe lib pairs (libc vs libcmt twins)
    seen_pat = {}
    uniq_syms = []
    for l, mn, nm, pat in syms:
        key = bytes(pat)
        if key in seen_pat:
            continue
        seen_pat[key] = True
        uniq_syms.append((l, mn, nm, pat))
    print(f"{len(uniq_syms)} unique lib symbols")
    hits = {}
    for l, mn, nm, pat in uniq_syms:
        n = len(pat)
        probe = bytes(pat[:12])
        start = 0
        while True:
            pos = ntext.find(probe, start)
            if pos < 0:
                break
            # wildcard-aware full check
            ok = True
            for k in range(n):
                a = ntext[pos + k] if pos + k < len(ntext) else 0x100
                b = pat[k]
                if a != b and a != 0xAA and b != 0xAA:
                    ok = False
                    break
            if ok:
                if pos not in hits or n > hits[pos][0]:
                    hits[pos] = (n, l, mn, nm)
            start = pos + 1
    hs = sorted(hits.items())
    print(f"{len(hs)} exact lib-symbol matches in DLL .text")
    for pos, (n, l, mn, nm) in hs:
        print(f"  {tva+pos:#010x} len={n:<4} {mn} :: {nm}")
    json.dump([[tva + p, n, l, mn, nm] for p, (n, l, mn, nm) in hs],
              open(f"{GLM}/data/crt_symbols_recovered.json", "w"), indent=1)
    print("saved data/crt_symbols_recovered.json")
