#!/usr/bin/env python3
"""The referee. Compile with MSVC 7.1 and compare against CoD2Radiant.exe.

  verify.py <source> <addr> [--symbol S]   one function (agents use this while drafting)
  verify.py --all                          every row in ledger/matches.tsv (make verify, CI)

A row passes only if all hold:
  bytes   relocation-normalized 100% equal to the retail function
  callees every call to an already-known function (ledger or lib) names that function
  order   inside a source file, functions are defined in retail address order
  clean   no inline asm, _emit, naked functions or byte-array code in src/
Writes build/verify.json in --all mode.
"""
import argparse
import collections
import fnmatch
import json
import os
import pathlib
import re
import struct
import subprocess
import sys

BASE = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE / "tools"))
import match_radiant as matcher

IMAGE = os.environ.get("RADIANT_IMAGE", "cod2-radiant-msvc71")
PAD = b"\xcc\x90"
BANNED = re.compile(r"__asm|_emit|__declspec\s*\(\s*naked|\{\s*(0x[0-9a-fA-F]{2}\s*,\s*){16}")


def read_tsv(path):
    path = BASE / path
    if not path.exists():
        return []
    lines = [l.rstrip("\n").split("\t") for l in path.read_text().splitlines() if l.strip() and not l.startswith("#")]
    head = lines[0]
    return [dict(zip(head, row)) for row in lines[1:]]


def flags_for(source):
    for row in read_tsv("data/flags.tsv"):
        if fnmatch.fnmatch(str(source), row["glob"]):
            return row["flags"].split()
    raise SystemExit("no flags row matches %s (data/flags.tsv)" % source)


def compile_source(source_rel, obj_rel):
    (BASE / obj_rel).parent.mkdir(parents=True, exist_ok=True)
    cl = "wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c %s /Fo%s %s" % (
        " ".join(flags_for(source_rel)), obj_rel, source_rel)
    if os.environ.get("RADIANT_IN_IMAGE"):
        cmd = ["sh", "-c", cl]
    else:
        cmd = ["docker", "run", "--rm", "-v", "%s:/w" % BASE, "-w", "/w", IMAGE, "sh", "-c", cl]
    try:
        res = subprocess.run(cmd, cwd=BASE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=120)
    except subprocess.TimeoutExpired:
        print("compile timed out: %s" % source_rel, file=sys.stderr)
        return False
    if res.returncode != 0:
        print(res.stdout, file=sys.stderr)
        return False
    return True


def known_names():
    names = {}
    for row in read_tsv("data/lib_funcs.tsv"):
        names[int(row["addr"], 16)] = row["symbol"]
    for row in read_tsv("ledger/matches.tsv"):
        names[int(row["addr"], 16)] = row["symbol"]
    return names


def check(obj_data, address, symbol, names):
    """Returns (status, detail, symbol_used)."""
    target, meta = matcher.carve(address)
    va = int(address, 16)
    tmask = matcher.absolute_masks(target, matcher.pe_relocations(va, len(target), target))
    if symbol:
        candidates = [symbol]
    else:
        sections, symbols = matcher.parse_coff(obj_data)
        candidates = [s["name"] for s in symbols if s["section"] > 0 and s["class"] in (2, 3)
                      and not s["name"].startswith(".") and sections[s["section"] - 1]["flags"] & 0x20]
    best = ("MISMATCH", "no function symbol in object", None)
    best_score = -1
    for name in candidates:
        try:
            cand, cmask, cname, calls = matcher.object_function(obj_data, name, target_hint=target, with_calls=True)
        except Exception:
            continue
        # without the size hint: the hint cuts a too-long candidate down to the retail size
        full = matcher.object_function(obj_data, name)[0]
        tail_ok = len(full) >= len(target) and all(b in PAD for b in full[len(target):])
        mask = tmask | cmask
        n = max(len(target), len(cand))
        same = sum(1 for i, (a, b) in enumerate(zip(target, cand)) if a == b or i in mask)
        score = same * 100 // n if n else 100
        if not tail_ok:
            score = min(score, 99)
        if len(cand) == len(target) and same == n and tail_ok:
            for pos, callee in calls:
                dest = (va + pos + 4 + struct.unpack_from("<i", target, pos)[0]) & 0xFFFFFFFF
                if dest in names and names[dest] != callee:
                    return ("CALLEE", "+0x%x calls %s but retail calls %s (0x%08x)" % (pos, callee, names[dest], dest), cname)
            return ("MATCH", "", cname)
        if score > best_score:
            first = next((i for i, (a, b) in enumerate(zip(target, cand)) if a != b and i not in mask), min(len(target), len(cand)))
            best = ("MISMATCH", "%d%%, sizes %d/%d, first difference at +0x%x" % (score, len(cand), len(target), first), cname)
            best_score = score
    return best


def obj_path(source):
    return pathlib.Path("build") / "obj" / pathlib.Path(source).with_suffix(".obj")


def definition_order(obj_data):
    # (section, offset) follows definition order, whether or not each function has its own section
    sections, symbols = matcher.parse_coff(obj_data)
    return {s["name"]: (s["section"], s["value"]) for s in symbols if s["section"] > 0 and s["class"] == 2
            and sections[s["section"] - 1]["flags"] & 0x20}


def banned_sources():
    bad = []
    for path in sorted((BASE / "src").rglob("*")):
        if path.suffix.lower() in (".c", ".cpp", ".h", ".inl") and BANNED.search(path.read_text(errors="replace")):
            bad.append(str(path.relative_to(BASE)))
    return bad


def verify_all():
    rows = read_tsv("ledger/matches.tsv")
    names = known_names()
    by_source = collections.defaultdict(list)
    for row in rows:
        by_source[row["source"]].append(row)
    results, failed, extras = [], 0, []
    for source, group in sorted(by_source.items()):
        ok = (BASE / source).exists() and source.startswith("src/") and compile_source(source, obj_path(source))
        data = (BASE / obj_path(source)).read_bytes() if ok else b""
        order = definition_order(data) if ok else {}
        # functions in src/ with no ledger row: unverified code in the clean tree
        mine = {r["symbol"] for r in group}
        extras += ["%s %s" % (source, name) for name in sorted(order) if name not in mine]
        for row in group:
            if not ok:
                status, detail = "COMPILE", "missing or failed to compile"
            else:
                status, detail, _ = check(data, row["addr"], row["symbol"], names)
            results.append(dict(row, status=status, detail=detail))
        # shortcut: emit order is only a warning until the MSVC 7.1 emit rule is pinned; then make it fail
        placed = sorted(((int(r["addr"], 16), order.get(r["symbol"]), r) for r in group), key=lambda x: x[0])
        for (a1, s1, r1), (a2, s2, r2) in zip(placed, placed[1:]):
            if s1 and s2 and s1 > s2:
                for res in results:
                    if res["addr"] == r2["addr"]:
                        res["order"] = "compiler emits it before %s, retail has it after" % r1["name"]
    for path in banned_sources():
        results.append({"addr": "-", "size": "0", "source": path, "symbol": "-", "name": "-",
                        "tag": "-", "status": "BANNED", "detail": "inline asm/_emit/naked/byte array"})
    for res in results:
        if res["status"] != "MATCH":
            failed += 1
            print("%-8s %s %s %s  %s" % (res["status"], res["addr"], res["name"], res["source"], res["detail"]))
        if res.get("order"):
            print("%-8s %s %s %s  %s" % ("WARN-ORD", res["addr"], res["name"], res["source"], res["order"]))
    for e in extras:
        print("UNVERIFIED %s" % e)
    matched = [r for r in results if r["status"] == "MATCH"]
    summary = {"rows": len(rows), "matched": len(matched), "failed": failed,
               "order_warnings": sum(1 for r in results if r.get("order")),
               "unverified_in_src": len(extras),
               "matched_bytes": sum(int(r["size"]) for r in matched), "results": results}
    (BASE / "build").mkdir(exist_ok=True)
    (BASE / "build" / "verify.json").write_text(json.dumps(summary, indent=1))
    print("verify: %d/%d rows match, %d failures" % (len(matched), len(rows), failed))
    return failed == 0


def verify_one(source, addresses, symbol):
    source = pathlib.Path(source)
    if source.is_absolute():
        source = source.relative_to(BASE)
    obj = obj_path(source)
    if not compile_source(str(source).replace("\\", "/"), obj):
        return False
    data = (BASE / obj).read_bytes()
    names = known_names()
    ok = True
    tries = BASE / "build" / "tries"
    tries.mkdir(parents=True, exist_ok=True)
    for addr in addresses:
        status, detail, cname = check(data, addr, symbol if len(addresses) == 1 else None, names)
        print("%s %s %s %s" % (status, addr, cname or "", detail))
        # the lander only accepts a deferral after 8 recorded tries
        with open(tries / ("0x%08x" % int(addr, 16)), "a") as log:
            log.write("%s %s\n" % (status, detail))
        ok &= status == "MATCH"
    return ok


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("source", nargs="?")
    ap.add_argument("address", nargs="?", help="hex address, or several comma-separated")
    ap.add_argument("--symbol")
    ap.add_argument("--all", action="store_true")
    args = ap.parse_args()
    if args.all:
        return 0 if verify_all() else 1
    if not (args.source and args.address):
        ap.error("need <source> <address> or --all")
    addrs = [a.strip() for a in args.address.split(",") if a.strip()]
    return 0 if verify_one(args.source, addrs, args.symbol) else 1


if __name__ == "__main__":
    sys.exit(main())
