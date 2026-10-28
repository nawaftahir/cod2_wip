#!/usr/bin/env python3
"""The referee. Builds the whole exe with MSVC 7.1 (per-file /GL objects, /LTCG link) and compares
each function, inside the linked exe, with CoD2Radiant.exe.

  verify.py <source> <addr> [--symbol S]   check functions of one file (agents use this while drafting)
  verify.py --all                          every row in ledger/matches.tsv (make verify, CI)

A row passes only if all hold:
  bytes   equal to the retail function, same length; only call/jump targets that leave the
          function and absolute in-image addresses are masked (they move until the layout matches)
  callees every call to an already-known function (ledger or lib) calls that function
  order   inside a source file, functions sit in retail address order (warning for now)
  clean   no inline asm, _emit, naked functions or byte-array code in src/
LTCG decides calling conventions and inlining for the whole program, so a function is only ever
checked as linked. Writes build/verify.json in --all mode.
"""
import argparse
import collections
import json
import pathlib
import re
import struct
import sys

import pefile

BASE = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE / "tools"))
import link
import match_radiant as matcher

BANNED = re.compile(r"__asm|_emit|__declspec\s*\(\s*naked|\{\s*(0x[0-9a-fA-F]{2}\s*,\s*){16}")
PAD = b"\xcc\x90"
read_tsv = link.read_tsv


def known_names():
    names = {}
    for row in read_tsv("data/lib_funcs.tsv"):
        names[int(row["addr"], 16)] = row["symbol"]
    for row in read_tsv("ledger/matches.tsv") + read_tsv("ledger/compiler.tsv"):
        names[int(row["addr"], 16)] = row["symbol"]
    return names


class Linked:
    """build/CoD2Radiant.exe + its map: function symbols, their object and their extent."""

    def __init__(self):
        self.pe = pefile.PE(str(link.EXE), fast_load=True)
        self.base = self.pe.OPTIONAL_HEADER.ImageBase
        self.syms, self.obj, self.inline = {}, {}, set()
        starts = set()
        # every label at an address, so aliases like __alloca_probe/__chkstk both count
        self.labels = collections.defaultdict(set)
        for line in link.MAP.read_text(errors="replace").splitlines():
            m = re.match(r"\s*0001:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s", line)
            if m:
                self.labels[int(m.group(2), 16)].add(m.group(1))
            m = re.match(r"\s*0001:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8}) f\s+(i\s+)?(\S+)", line)
            if m:
                starts.add(int(m.group(2), 16))
                if m.group(3):
                    self.inline.add(m.group(1))
                self.syms.setdefault(m.group(1), int(m.group(2), 16))
                self.obj.setdefault(m.group(1), m.group(4))
        self.starts = sorted(starts)
        self.at = {}
        for name, va in self.syms.items():
            self.at.setdefault(va, name)

    def code(self, symbol):
        va = self.syms[symbol]
        i = self.starts.index(va)
        end = self.starts[i + 1] if i + 1 < len(self.starts) else va + 0x10000
        data = self.pe.get_data(va - self.base, end - va)
        return va, data.rstrip(PAD) if data.rstrip(PAD) else data

    def of_source(self, source):
        name = link.obj_path(source).name.lower()
        return [s for s, o in self.obj.items() if o.lower() == name]


def masks(code, va):
    """Byte offsets that hold an address: rel32 targets outside the function, absolute in-image values."""
    out = set(matcher.absolute_masks(code, ()))
    calls = []
    for pos in range(len(code) - 4):
        op = code[pos]
        if op in (0xE8, 0xE9) or (op == 0x0F and 0x80 <= code[pos + 1] <= 0x8F):
            field = pos + (2 if op == 0x0F else 1)
            if field + 4 > len(code):
                continue
            dest = (va + field + 4 + struct.unpack_from("<i", code, field)[0]) & 0xFFFFFFFF
            if not va <= dest < va + len(code):
                calls.append((field, dest))
    # keep only fields at real instruction boundaries
    starts = {ins.address - va for ins in matcher.Cs(matcher.CS_ARCH_X86, matcher.CS_MODE_32).disasm(code, va)}
    calls = [(f, d) for f, d in calls if f - 1 in starts or f - 2 in starts]
    for field, _ in calls:
        out.update(range(field, field + 4))
    # switch jump tables after the code hold addresses inside the function
    for pos in range(len(code) - 3):
        if va <= struct.unpack_from("<I", code, pos)[0] < va + len(code):
            out.update(range(pos, pos + 4))
    return out, dict(calls)


def check(linked, address, symbol, names):
    """Returns (status, detail)."""
    target, _ = matcher.carve(address)
    va = int(address, 16)
    if symbol not in linked.syms:
        return "NOT-LINKED", "%s is not in the linked exe (not defined, or inlined away)" % symbol
    ours_va, ours = linked.code(symbol)
    tmask, tcalls = masks(target, va)
    omask, ocalls = masks(ours, ours_va)
    mask = tmask | omask
    n = max(len(target), len(ours))
    same = sum(1 for i, (a, b) in enumerate(zip(target, ours)) if a == b or i in mask)
    if len(ours) != len(target) or same != n:
        first = next((i for i, (a, b) in enumerate(zip(target, ours)) if a != b and i not in mask),
                     min(len(target), len(ours)))
        return "MISMATCH", "%d%%, sizes %d/%d, first difference at +0x%x" % (same * 100 // n, len(ours), len(target), first)
    for field, dest in sorted(tcalls.items()):
        if dest not in names:
            continue
        got = linked.at.get(ocalls.get(field))
        if names[dest] not in linked.labels.get(ocalls.get(field), ()):
            return "CALLEE", "+0x%x calls %s but retail calls %s (0x%08x)" % (field - 1, got or "an unresolved symbol",
                                                                            names[dest], dest)
    return "MATCH", "at 0x%08x" % ours_va


def banned_sources():
    bad = []
    for path in sorted((BASE / "src").rglob("*")):
        if path.suffix.lower() in (".c", ".cpp", ".h", ".inl") and BANNED.search(path.read_text(errors="replace")):
            bad.append(str(path.relative_to(BASE)))
    return bad


def verify_all():
    rows = read_tsv("ledger/matches.tsv")
    compiler = read_tsv("ledger/compiler.tsv")
    game_addresses = {r["addr"] for r in rows}
    if {int(a, 16) for a in game_addresses} & {int(r["addr"], 16) for r in compiler}:
        raise ValueError("compiler rows must not duplicate game rows")
    names = known_names()
    ok = link.build(quiet=True)
    linked = Linked() if ok else None
    results = []
    for row in rows + compiler:
        if not ok:
            status, detail = "COMPILE", "the tree failed to compile or link"
        else:
            status, detail = check(linked, row["addr"], row["symbol"], names)
        results.append(dict(row, status=status, detail=detail))
    extras = []
    if ok:
        ledger_syms = {r["symbol"] for r in rows + compiler}
        ours = {link.obj_path(s).name.lower() for s in link.sources()}
        # "i" in the map = an inline header function, emitted in whichever file first uses it; not src code
        # header "static inline" helpers come out as local copies without the flag; also header code
        in_header = set()
        for h in (BASE / "src").rglob("*.h"):
            in_header.update(re.findall(r"\b([A-Za-z_]\w*)\s*\([^;{]*\)\s*\{", h.read_text(errors="replace")))
        extras = sorted(s for s, o in linked.obj.items() if o.lower() in ours and s not in ledger_syms
                        and s not in linked.inline and re.sub(r"^[?_]+", "", s).split("@")[0] not in in_header)
        # emit order: a file's functions must sit in retail order (warning until the 7.1 emit rule is pinned)
        by_source = collections.defaultdict(list)
        for res in results:
            if res["status"] == "MATCH" and res["addr"] in game_addresses:
                by_source[res["source"]].append(res)
        for group in by_source.values():
            group.sort(key=lambda r: int(r["addr"], 16))
            for r1, r2 in zip(group, group[1:]):
                if linked.syms[r1["symbol"]] > linked.syms[r2["symbol"]]:
                    r2["order"] = "linked before %s, retail has it after" % r1["name"]
    for path in banned_sources():
        results.append({"addr": "-", "size": "0", "source": path, "symbol": "-", "name": "-",
                        "tag": "-", "status": "BANNED", "detail": "inline asm/_emit/naked/byte array"})
    failed = 0
    for res in results:
        if res["status"] != "MATCH":
            failed += 1
            print("%-10s %s %s %s  %s" % (res["status"], res["addr"], res["name"], res["source"], res["detail"]))
        if res.get("order"):
            print("%-10s %s %s %s  %s" % ("WARN-ORD", res["addr"], res["name"], res["source"], res["order"]))
    for e in extras:
        print("UNVERIFIED %s" % e)
    matched = [r for r in results if r["status"] == "MATCH" and r["addr"] in game_addresses]
    compiler_matched = [r for r in results if r["status"] == "MATCH" and r["addr"] not in game_addresses]
    summary = {"rows": len(rows), "matched": len(matched), "failed": failed,
               "order_warnings": sum(1 for r in results if r.get("order")),
               "unverified_in_src": len(extras),
               "matched_bytes": sum(int(r["size"]) for r in matched),
               "compiler_rows": len(compiler), "compiler_matched": len(compiler_matched),
               "compiler_matched_bytes": sum(int(r["size"]) for r in compiler_matched), "results": results}
    (BASE / "build" / "verify.json").write_text(json.dumps(summary, indent=1))
    print("verify: %d/%d rows match, %d failures" % (len(matched), len(rows), failed))
    if compiler:
        print("compiler: %d/%d rows match (excluded from game coverage)" % (len(compiler_matched), len(compiler)))
    return failed == 0


def best(linked, address, candidates, names):
    found = []
    for name in candidates:
        status, detail = check(linked, address, name, names)
        if status == "MATCH":
            return name, status, detail
        score = int(detail.split("%")[0]) if status == "MISMATCH" else (100 if status == "CALLEE" else -1)
        found.append((score, name, status, detail))
    return max(found)[1:] if found else (None, "MISMATCH", "no function from this file in the linked exe")


def verify_one(source, addresses, symbol):
    source = pathlib.Path(source)
    if source.is_absolute():
        source = source.relative_to(BASE)
    if not link.build(quiet=True):
        return False
    linked = Linked()
    names = known_names()
    candidates = [symbol] if symbol else linked.of_source(source)
    ok = True
    tries = BASE / "build" / "tries"
    tries.mkdir(parents=True, exist_ok=True)
    for addr in addresses:
        name, status, detail = best(linked, addr, candidates, names)
        if status != "MATCH" and name and link.address_taken({int(addr, 16)}):
            # retail takes this function's address; stand in for the unwritten reference and relink
            if link.build((name,), quiet=True):
                linked = Linked()
                name, status, detail = best(linked, addr, [name], names)
        print("%s %s %s %s" % (status, addr, name or "", detail))
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
    link.in_image()
    if args.all:
        return 0 if verify_all() else 1
    if not (args.source and args.address):
        ap.error("need <source> <address> or --all")
    addrs = [a.strip() for a in args.address.split(",") if a.strip()]
    return 0 if verify_one(args.source, addrs, args.symbol) else 1


if __name__ == "__main__":
    sys.exit(main())
