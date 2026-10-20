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
KEYS = ("matched_functions", "matched_bytes", "lib_bytes", "same_offset_bytes")


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
    return {
        "matched_functions": verify["matched"],
        "failed_rows": verify["failed"],
        "order_warnings": verify.get("order_warnings", 0),
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
    game = now["text_bytes"] - now["lib_bytes"]
    lines = [
        "| meter | value |", "|---|---|",
        "| .text done (game code + MFC/CRT identified) | %.2f%% |" % pct(now["matched_bytes"] + now["lib_bytes"], now["text_bytes"]),
        "| game code reconstructed (MFC/CRT excluded) | %.3f%% (%d of %d bytes%s) |" % (pct(now["matched_bytes"], game), now["matched_bytes"], game, delta("matched_bytes")),
        "| functions matched from source | %d%s |" % (now["matched_functions"], delta("matched_functions")),
        "| SHA goal: whole file bytes in place | %.3f%%%s |" % (pct(now["same_offset_bytes"], now["file_bytes"]), delta("same_offset_bytes")),
        "| SHA-256 identical | %s |" % ("YES" if now["sha_identical"] else "no"),
        "| failing ledger rows | %d |" % now["failed_rows"],
        "| emit-order warnings | %d |" % now["order_warnings"],
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
    if down:
        print("WENT DOWN: " + ", ".join(down))
    if ("--gate" in sys.argv or "--update" in sys.argv) and (down or now["failed_rows"]):
        return 1
    if "--update" in sys.argv:
        COMMITTED.write_text(json.dumps(now, indent=1) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
