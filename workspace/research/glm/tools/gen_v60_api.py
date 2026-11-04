#!/usr/bin/env python3
"""Generate the 1.0 (v60) engine<->renderer API slot tables from opencod2 sources.

Sources (read-only):
  src/headers/common_types.h                          - refexport_t / refimport_t member order (v59 names)
  src/PC/client_mp/gfx_dll_v60_map.h                  - kV60ToV59[181] refimport slot map
  src/PC/client_mp/gfx_dll_v60_re_map.h               - kReV60[88] refexport slot map
  src/PC/win32/gfx_dll_v60.c                          - engine-side adapter: what the RETAIL 1.0 DLL expects (authoritative for refimport)
  src/PC/gfx_d3d/r_getrefapi_v60.c                    - renderer-side adapter: known v60 refexport slots > 87

Output:
  data/v60_api.json   - machine-readable (slot -> name/source/confidence)
  data/v60_api_tables.md - human table
"""
import json, re, sys

ROOT = "/home/nawaf/cod2/test/Refrences/opencod2/src"
OUT_JSON = "/home/nawaf/cod2/test/dev/glm/data/v60_api.json"
OUT_MD = "/home/nawaf/cod2/test/dev/glm/data/v60_api_tables.md"

def read(p):
    return open(p, encoding="utf-8", errors="replace").read()

ct = read(f"{ROOT}/headers/common_types.h")

def struct_members(name):
    m = re.search(rf"struct {name} \{{(.*?)\n\}};", ct, re.S)
    body = m.group(1)
    members = []
    for line in body.splitlines():
        line = line.strip()
        if not line or line.startswith("/*") or line.startswith("//"):
            continue
        fm = re.match(r".*?\(\*(\w+)\)\s*\(", line)
        if fm:
            members.append({"kind": "fn", "name": fm.group(1)})
            continue
        vm = re.match(r"[\w\s\*]+?\b(\w+)\s*(\[[^\]]*\])?\s*;", line)
        if vm:
            members.append({"kind": "data", "name": vm.group(1)})
    return members

re_members = struct_members("refexport_t")
ri_members = struct_members("refimport_t")

def parse_array(path, name):
    src = read(path)
    m = re.search(rf"static const short {name}\[\d+\] = \{{(.*?)\}};", src, re.S)
    return [int(x.strip()) for x in m.group(1).split(",") if x.strip()]

kV60ToV59 = parse_array(f"{ROOT}/PC/client_mp/gfx_dll_v60_map.h", "kV60ToV59")
kReV60 = parse_array(f"{ROOT}/PC/client_mp/gfx_dll_v60_re_map.h", "kReV60")

# --- refimport v60 (retail DLL expectations), authoritative = gfx_dll_v60.c ---
# base fill: dst[k] = src[kV60ToV59[k]] or thunk
ri_v60 = []
for k in range(181):
    v59 = kV60ToV59[k]
    if 0 <= v59 < len(ri_members):
        ri_v60.append({"slot": k, "name": ri_members[v59]["name"], "source": "refimport_t[%d]" % v59, "confidence": "mapped"})
    else:
        ri_v60.append({"slot": k, "name": f"UNK_THUNK_{k}", "source": "gfxV60Thunks", "confidence": "thunk"})

# explicit overrides from gfx_dll_v60.c (retail-facing; highest confidence)
RI_OVERRIDES = {
    18: "HiAlloc", 19: "HiSetOffset", 20: "HiOffToPtr",
    21: ri_members[18]["name"] if len(ri_members) > 18 else "v59_18",
    22: "ShowWindow", 23: "HideWindow", 24: "PumpMessages", 25: "Dvar_FindVar",
    112: "GetThreadData", 113: "CurThreadId", 114: "IsWorker", 115: "ResumeWorker",
    116: "InitWorker", 117: "UNK_m114", 118: "UNK_m115", 119: "UNK_m116",
    120: "UNK_m117", 121: "UNK_m118", 122: "UNK_m119", 123: "UNK_m120",
    124: "UNK_m121", 125: "UNK_m122",
    111: ri_members[107]["name"] if len(ri_members) > 107 else "v59_107",
    159: "CM_GetPlaneNum",
}
for k, nm in RI_OVERRIDES.items():
    ri_v60[k] = {"slot": k, "name": nm, "source": "gfx_dll_v60.c override", "confidence": "certain"}

# --- refexport v60: retail DLL FILLS this table (our naming target inside the DLL) ---
# x86 table size = 768 bytes = 192 slots (per r_getrefapi_v60.c comment)
# kReV60 direction: rdst[v59] = rsrc[kReV60[v59]]  =>  kReV60[v59_slot] = v60_slot
N_RE = 192
re_v60 = [{"slot": i, "name": None, "source": None, "confidence": "unknown"} for i in range(N_RE)]
for v59, v60 in enumerate(kReV60):
    if 0 <= v60 < N_RE and 0 <= v59 < len(re_members):
        if re_members[v59]["kind"] == "fn":
            re_v60[v60] = {"slot": v60, "name": re_members[v59]["name"], "source": "kReV60: refexport_t[%d]->v60" % v59, "confidence": "mapped"}
# specials documented in r_getrefapi_v60.c
RE_SPECIALS = {
    20: ("R_AddRefEntityToScene", "v60 adapter: dst[20] = R_AddRefEntityToScene", "certain"),
    22: ("ri[178] callback", "v60 adapter: dst[22] = rimp[178]", "certain"),
    23: ("ri[177] callback", "v60 adapter: dst[23] = rimp[177]", "certain"),
    24: ("noop (v60: unused)", "v60 adapter: dst[24] = v60_noop", "certain"),
    26: (re_members[20]["name"] if len(re_members) > 20 else "?", "dst[26] = re59[20]", "certain"),
    27: (re_members[21]["name"] if len(re_members) > 21 else "?", "dst[27] = re59[21]", "certain"),
    81: (re_members[75]["name"] if len(re_members) > 75 else "?", "dst[81] = src[75] (dup)", "certain"),
    97: ("R_LoadXModelSurfsSurface", "v60 adapter: dst[97]", "certain"),
    98: ("R_RegisterXModelSurfs", "v60 adapter: dst[98]", "certain"),
}
for k, (nm, src, conf) in RE_SPECIALS.items():
    if k < N_RE:
        re_v60[k] = {"slot": k, "name": nm, "source": src, "confidence": conf}

json.dump({
    "_meta": {
        "refexport_slots": N_RE, "refimport_slots": 181,
        "refexport_v59_members": len(re_members), "refimport_v59_members": len(ri_members),
        "note": "refexport = table the retail 1.0 DLL fills in GetRefAPI (768B=192 slots on x86); refimport = table the engine passes in (181 slots). Slot names recovered from opencod2 v60 adapters.",
    },
    "refexport_v60": re_v60,
    "refimport_v60": ri_v60,
}, open(OUT_JSON, "w"), indent=1)

named_re = sum(1 for s in re_v60 if s["name"] and not s["name"].startswith("UNK"))
named_ri = sum(1 for s in ri_v60 if s["confidence"] in ("mapped", "certain"))
print(f"refexport v59 members: {len(re_members)} (fn: {sum(1 for m in re_members if m['kind']=='fn')})")
print(f"refimport v59 members: {len(ri_members)}")
print(f"refexport_v60: {named_re}/{N_RE} slots named, kReV60 len={len(kReV60)}")
print(f"refimport_v60: {named_ri}/181 slots named")

with open(OUT_MD, "w") as f:
    f.write("# v60 (1.0) Engine <-> Renderer API Slot Tables\n\n")
    f.write("Recovered from `Refrences/opencod2` v60 adapters. ")
    f.write("`refexport` is the table the **retail 1.0 DLL fills** in `GetRefAPI` (768 bytes = 192 slots). ")
    f.write("`refimport` is the table the engine passes **to** the DLL (181 slots).\n\n")
    f.write("## refexport_v60 (renderer -> engine callable; naming target inside the DLL)\n\n")
    f.write("| slot | name | source | confidence |\n|---|---|---|---|\n")
    for s in re_v60:
        f.write(f"| {s['slot']} | {s['name'] or '**UNKNOWN**'} | {s['source'] or ''} | {s['confidence']} |\n")
    f.write("\n## refimport_v60 (engine -> renderer callbacks the DLL calls through)\n\n")
    f.write("| slot | name | source | confidence |\n|---|---|---|---|\n")
    for s in ri_v60:
        f.write(f"| {s['slot']} | {s['name']} | {s['source']} | {s['confidence']} |\n")
print(f"wrote {OUT_JSON} and {OUT_MD}")
