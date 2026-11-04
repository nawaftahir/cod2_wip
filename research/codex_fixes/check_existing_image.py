"""Compare the existing math-trial image with original and draft extent readers."""
import functools
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

sys.path.insert(0, "tools")
import link
import verify

spec = importlib.util.spec_from_file_location("verify_fixed", "research/codex_fixes/verify_fixed.py")
fixed = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixed)
fixed.BASE = verify.BASE
verify.masks = functools.lru_cache(None)(verify.masks)
fixed.masks = verify.masks
verify.matcher.carve = functools.lru_cache(None)(verify.matcher.carve)
verify.Linked.code = functools.lru_cache(None)(verify.Linked.code)
fixed.Linked.code = functools.lru_cache(None)(fixed.Linked.code)
before, after = verify.Linked(), fixed.Linked()
names = verify.known_names()
changes = []
old_hits = new_hits = 0
for row in link.read_tsv("ledger/matches.tsv"):
    old = verify.check(before, row["addr"], row["symbol"], names)
    new = fixed.check(after, row["addr"], row["symbol"], names)
    old_hits += old[0] == "MATCH"
    new_hits += new[0] == "MATCH"
    if old != new:
        changes.append(dict(addr=row["addr"], name=row["name"], before=old, after=new))
report = dict(exe_sha256=hashlib.sha256(link.EXE.read_bytes()).hexdigest(),
              old_hits=old_hits, new_hits=new_hits, changes=changes)
Path("research/codex_fixes/existing_image_proof.json").write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps(report, indent=2))
