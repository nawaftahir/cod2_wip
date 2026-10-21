#!/usr/bin/env python3
"""Progress meters. Run after verify.py --all (and link.py for the whole-file number).

  meter.py           print and write build/meter.json + build/summary.md
  meter.py --gate    also fail if any number is below the committed ledger/meter.json
  meter.py --update  also write the new numbers to ledger/meter.json (only if none went down)

Numbers: matched functions, .text matched bytes % (source matches; library code counted
separately), whole-file same-offset % against retail, and whether the SHA-256 is identical.
"""
import hashlib
import json
import pathlib
import sys

BASE = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE / "tools"))
import match_radiant as m

RETAIL = BASE / "binaries" / "CoD2Radiant.exe"
OURS = BASE / "build" / "CoD2Radiant.exe"
COMMITTED = BASE / "ledger" / "meter.json"
# gated: these may never drop. same_offset_bytes is reported only: real code can shift chance matches
KEYS = ("matched_functions", "matched_bytes")


def whole_file():
    retail = RETAIL.read_bytes()
    if not OURS.exists():
        return 0, False
    ours = OURS.read_bytes()
    same = sum(1 for a, b in zip(ours, retail) if a == b)
    return same, hashlib.sha256(ours).digest() == hashlib.sha256(retail).digest()


def measure():
    verify = json.loads((BASE / "build" / "verify.json").read_text())
    lib_path = BASE / "data" / "lib_funcs.tsv"
    lib_rows = [l.split("\t") for l in lib_path.read_text().splitlines()[1:]] if lib_path.exists() else []
    same, identical = whole_file()
    text = m.SECTIONS[".text"]["vs"]
    libs = {r[0] for r in lib_rows}
    tu_rows = [l.split("\t") for l in (BASE / "data" / "tu_map.tsv").read_text().splitlines()[1:]]
    game = [r for r in tu_rows if r[0] not in libs]
    return {
        "game_functions": len(game),
        "game_bytes": sum(int(r[1]) for r in game),
        "placed_functions": sum(1 for r in game if r[3] in ("PINNED", "SUPPORTED")),
        "lib_functions": len(libs),
        "matched_functions": verify["matched"],
        "failed_rows": verify["failed"],
        "order_warnings": verify.get("order_warnings", 0),
        "unverified_in_src": verify.get("unverified_in_src", 0),
        "matched_bytes": verify["matched_bytes"],
        "lib_bytes": sum(int(r[1]) for r in lib_rows),
        "text_bytes": text,
        "same_offset_bytes": same,
        "file_bytes": RETAIL.stat().st_size,
        "sha_identical": identical,
    }


def pct(a, b):
    return 100.0 * a / b if b else 0.0


def summary(now, before):
    def delta(k):
        d = now[k] - before.get(k, 0)
        return " (%+d)" % d if before and d else ""
    lines = [
        "| meter | value |", "|---|---|",
        "| **SHA goal: rebuilt exe bytes in place** | %.3f%%%s |" % (pct(now["same_offset_bytes"], now["file_bytes"]), delta("same_offset_bytes")),
        "| game functions matched from source | %d / %d (%.2f%%)%s |" % (now["matched_functions"], now["game_functions"], pct(now["matched_functions"], now["game_functions"]), delta("matched_functions")),
        "| game code bytes matched | %.2f%% (%d / %d bytes) |" % (pct(now["matched_bytes"], now["game_bytes"]), now["matched_bytes"], now["game_bytes"]),
        "| game functions with a known source file | %d / %d |" % (now["placed_functions"], now["game_functions"]),
        "| MFC/CRT library functions identified (linked, not written; not counted as done) | %d |" % now["lib_functions"],
        "| SHA-256 identical | %s |" % ("YES" if now["sha_identical"] else "no"),
        "| failing ledger rows | %d |" % now["failed_rows"],
        "| emit-order warnings | %d |" % now["order_warnings"],
        "| unverified functions in src/ (must not grow) | %d |" % now["unverified_in_src"],
    ]
    return "\n".join(lines) + "\n"


def main():
    now = measure()
    before = json.loads(COMMITTED.read_text()) if COMMITTED.exists() else {}
    text = summary(now, before)
    (BASE / "build" / "meter.json").write_text(json.dumps(now, indent=1))
    (BASE / "build" / "summary.md").write_text(text)
    print(text)
    down = [k for k in KEYS if now[k] < before.get(k, 0)]
    if "unverified_in_src" in before and now["unverified_in_src"] > before["unverified_in_src"]:
        down.append("unverified_in_src (went up)")
    if down:
        print("WENT DOWN: " + ", ".join(down))
    if ("--gate" in sys.argv or "--update" in sys.argv) and (down or now["failed_rows"]):
        return 1
    if "--update" in sys.argv:
        COMMITTED.write_text(json.dumps(now, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
