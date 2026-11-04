#!/usr/bin/env python3
"""Extract the retail 1.0 refexport table from GetRefAPI's decompile and join with
opencod2-derived slot names (kReV60: refexport_t[v59] -> v60 slot).

Empirical facts from the binary (authoritative over any reference guesses):
  - REF_API_VERSION expected = 0x3b (59)
  - refimport table copied = 0xa9 (169) dwords
  - refexport table @ 0x1076a880, 0x6c (108) slots, 86..95 left zero
"""
import json, re, sys

DEC = "/home/nawaf/cod2/test/dev/glm/data/decomp/10013270_GetRefAPI.c"
V60 = json.load(open("/home/nawaf/cod2/test/dev/glm/data/v60_api.json"))

BASE = 0x1076A880
src = open(DEC).read()

# match: _DAT_1076aXXX = &LAB_... / FUN_... / &DAT_...
stores = {}
for m in re.finditer(r"_?DAT_(10[0-9a-f]{6})\s*=\s*&?(LAB_|FUN_|DAT_)?(10[0-9a-f]{6}|_10[0-9a-f]{6})", src):
    tgt_slot = int(m.group(1), 16)
    kind = m.group(2) or ""
    tgt = "0x" + m.group(3).lstrip("_")
    if tgt_slot >= BASE:
        slot = (tgt_slot - BASE) // 4
        if slot < 108:
            stores[slot] = (kind, tgt)

print(f"stores parsed: {len(stores)} slots of 108; unfilled: {sorted(set(range(108)) - set(stores))}")

named = {s["slot"]: s["name"] for s in V60["refexport_v60"] if s.get("name")}
out = []
for slot in range(108):
    kind, tgt = stores.get(slot, (None, None))
    nm = named.get(slot)
    if slot <= 85 or slot >= 96:
        conf = "binary+map" if (nm and tgt) else ("binary" if tgt else "empty")
    else:
        conf = "zero-filled (unused)" if not tgt else "binary"
    out.append({"slot": slot, "func": tgt, "kind": (kind or "").rstrip("_"), "name": nm, "confidence": conf})

json.dump({
    "_meta": {
        "refexport_table_va": hex(BASE), "slots": 108, "zero_slots": list(range(86, 96)),
        "ref_api_version": "0x3b (59)", "refimport_copied_slots": 169,
        "source": "decompile of GetRefAPI @ 0x10013270 + opencod2 kReV60 name map",
    },
    "slots": out,
}, open("/home/nawaf/cod2/test/dev/glm/data/refexport_gfx10.json", "w"), indent=1)

bound = sum(1 for s in out if s["func"])
nm_ct = sum(1 for s in out if s["func"] and s["name"] and not str(s["name"]).startswith("UNK"))
print(f"slots bound to code: {bound}/108, named: {nm_ct}")
for s in out[:30]:
    if s["func"]:
        print(f"  slot {s['slot']:>3} {s['func']} {s['kind']:<4} {s['name'] or '?'}")
