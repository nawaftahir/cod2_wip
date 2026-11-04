#!/usr/bin/env python3
"""Wave pipeline for gfx_d3d_mp_x86_s.dll reconstruction.

Manifest (data/manifest.tsv): addr  name  region  status  src
  region: iw | crt | thunk   status: todo | wip | match | fail | skip

Commands:
  init                       (re)build manifest from Ghidra inventory
  diff [--all|addr ...]      batch-diff compiled objs vs targets, update manifest
  status                     summary counts
"""
import json, os, re, subprocess, sys

GLM = "/home/nawaf/cod2/test/dev/glm"
MAN = f"{GLM}/data/manifest.tsv"
INV = f"{GLM}/data/functions_gfx10.json"
OBJS = f"{GLM}/build/objs"
SRC = f"{GLM}/src"

CRT_BOUNDARY = 0x100F0000  # >= this: CRT/linker territory (heuristic; refine per function)

def load_inv():
    return json.load(open(INV))["functions"]

def region_of(f):
    if f["thunk"] or f["name"].startswith("thunk_"):
        return "thunk"
    a = int(f["addr"], 16)
    if a >= CRT_BOUNDARY:
        return "crt"
    return "iw"

def cmd_init():
    rows = []
    for f in load_inv():
        rows.append([f["addr"], f["name"], region_of(f), "todo", ""])
    with open(MAN, "w") as fh:
        fh.write("addr\tname\tregion\tstatus\tsrc\n")
        for r in rows:
            fh.write("\t".join(r) + "\n")
    print(f"manifest: {len(rows)} functions")

def load_manifest():
    lines = open(MAN).read().splitlines()
    hdr = lines[0].split("\t")
    return [dict(zip(hdr, l.split("\t"))) for l in lines[1:] if l.strip()]

def save_manifest(rows):
    with open(MAN, "w") as fh:
        fh.write("addr\tname\tregion\tstatus\tsrc\n")
        for r in rows:
            fh.write("\t".join([r["addr"], r["name"], r["region"], r["status"], r.get("src", "")]) + "\n")

def src_for_addr(rows, addr):
    for r in rows:
        if r["addr"] == addr.lstrip("0x").lower().lstrip("0") or r["addr"] == addr.lower().replace("0x", ""):
            return r
    # normalize: manifest stores bare lowercase hex without leading zeros? inventory format: '1000c8d0'
    key = addr.lower().replace("0x", "")
    for r in rows:
        if r["addr"] == key:
            return r
    return None

def cmd_diff(addrs=None, all_flag=False):
    sys.path.insert(0, f"{GLM}/tools")
    import match_gfx as m
    rows = load_manifest()
    # gather objs present
    by_addr = {}
    for fn in os.listdir(OBJS):
        if not fn.endswith(".obj"):
            continue
        # obj name convention: <addr8>_<safename>.obj  OR legacy <name>.obj (manifest src col resolves)
        by_addr[fn[:-4]] = os.path.join(OBJS, fn)
    checked = matched = 0
    results = []
    for r in rows:
        addr = r["addr"]
        if r["region"] != "iw" or r["status"] in ("skip",):
            continue
        if not all_flag:
            if addrs and ("%x" % int(addr, 16)) not in [a.lower().replace("0x", "") for a in addrs]:
                continue
            if not addrs and not r.get("src"):
                continue
        src = r.get("src") or ""
        objname = os.path.basename(src).replace(".c", ".obj") if src else ""
        key = objname[:-4] if objname else f"{addr}_{r['name']}"
        objpath = by_addr.get(key)
        if not objpath:
            continue
        try:
            # run diff inline (import module once)
            m.obj_bytes_global = open(objpath, "rb").read()
            fnb, meta = m.carve("0x" + addr)
            coff = m.parse_coff(m.obj_bytes_global)
            cbytes, cmask, cname, cval = m.coff_function_bytes(coff)
            cfn = cbytes[cval:]
            pe_mask = m.pe_mask_for(m.rva2off(int(addr, 16) - 0x10000000), len(fnb), fnb, int(addr, 16) - 0x10000000)
            a = m.normalize(fnb, pe_mask)
            b = m.normalize(cfn, {p for p in cmask if p >= cval})
            n = min(len(a), len(b))
            eq = sum(1 for i in range(n) if a[i] == b[i])
            score = eq * 100 // max(len(a), len(b), 1)
            checked += 1
            if score == 100 and len(a) == len(b):
                r["status"] = "match"
                matched += 1
            else:
                r["status"] = "fail" if score < 50 else "wip"
            results.append((addr, r["name"], score, len(a), len(b), r["status"]))
        except Exception as e:
            results.append((addr, r["name"], -1, 0, 0, f"ERR {e}"))
    save_manifest(rows)
    for addr, name, score, la, lb, st in sorted(results, key=lambda x: -(x[2] if x[2] >= 0 else 999)):
        print(f"{addr} {st:<6} {score:>3}% pe={la:<4} obj={lb:<4} {name}")
    print(f"\nchecked={checked} matched={matched}")

def cmd_status():
    rows = load_manifest()
    from collections import Counter
    c = Counter((r["region"], r["status"]) for r in rows)
    for (reg, st), n in sorted(c.items()):
        print(f"{reg:<6} {st:<6} {n}")
    iw_bytes = 0
    iw_match = 0
    inv = {f["addr"]: f["size"] for f in load_inv()}
    for r in rows:
        if r["region"] == "iw":
            sz = inv.get(r["addr"], 0)
            iw_bytes += sz
            if r["status"] == "match":
                iw_match += sz
    print(f"IW region: {iw_match}/{iw_bytes} bytes matched ({iw_match*100//max(iw_bytes,1)}%)")

if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "status"
    if cmd == "init":
        cmd_init()
    elif cmd == "diff":
        args = sys.argv[2:]
        cmd_diff(addrs=args, all_flag="--all" in args)
    elif cmd == "status":
        cmd_status()
