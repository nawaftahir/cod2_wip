#!/usr/bin/env python3
"""Hand an agent its next batch: claim.py <agent> <level> [--rows N] | claim.py --release <agent>

Claims a whole source file (TU) so two agents never edit the same file. The lock is a
directory in queue/claims/ (mkdir is atomic), shared by every worktree.
  cheap: queue rows of tier 1-2 (smallest first)
  mid:   deferred rows (cheap agents gave up) and tier 3
Prints one 'addr<TAB>source<TAB>note' line per row; prints nothing if there is no work.
"""
import os
import shutil
import sys

ROOT = os.environ.get("RADIANT_ROOT") or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CLAIMS = os.path.join(ROOT, "queue", "claims")


def tsv(path):
    path = os.path.join(ROOT, path)
    if not os.path.exists(path):
        return []
    lines = [l.rstrip("\n").split("\t") for l in open(path) if l.strip() and not l.startswith("#")]
    return [dict(zip(lines[0], r)) for r in lines[1:]]


def lock_name(source):
    return source.replace("/", "__")


def release(agent):
    if not os.path.isdir(CLAIMS):
        return
    for name in os.listdir(CLAIMS):
        owner = os.path.join(CLAIMS, name, "agent")
        if os.path.exists(owner) and open(owner).read().strip() == agent:
            shutil.rmtree(os.path.join(CLAIMS, name))


def main():
    if sys.argv[1] == "--release":
        return release(sys.argv[2])
    agent, level = sys.argv[1], sys.argv[2]
    limit = int(sys.argv[sys.argv.index("--rows") + 1]) if "--rows" in sys.argv else 5
    done = {r["addr"] for r in tsv("ledger/matches.tsv")}
    deferred = {r["addr"]: r["reason"] for r in tsv("ledger/defer.tsv")}
    queue = tsv("queue/queue.tsv")
    if level == "cheap":
        rows = [(r["addr"], r["source"], "") for r in queue
                if int(r["tier"]) <= 2 and r["addr"] not in done and r["addr"] not in deferred]
    else:
        tu = {r["addr"]: r["tu"] for r in tsv("data/tu_map.tsv")}
        rows = [(a, tu[a] if tu.get(a, "").startswith("src/") else "src/" + tu.get(a, "?"), "deferred: " + why)
                for a, why in deferred.items() if a not in done]
        rows += [(r["addr"], r["source"], "") for r in queue
                 if int(r["tier"]) == 3 and r["addr"] not in done and r["addr"] not in deferred]
    # files with real reference source first: verified server source, then CoD2rev, then Q3Radiant
    rank = {}
    for r in tsv("data/refs.tsv"):
        src = r["tu"] if r["tu"].startswith("src/") else "src/" + r["tu"]
        rank[src] = min(rank.get(src, 9), int(r["rank"]))
    rows.sort(key=lambda r: rank.get(r[1], 9))
    os.makedirs(CLAIMS, exist_ok=True)
    tried = set()
    for _, source, _ in rows:
        if source in tried:
            continue
        tried.add(source)
        lock = os.path.join(CLAIMS, lock_name(source))
        try:
            os.mkdir(lock)
        except FileExistsError:
            continue
        open(os.path.join(lock, "agent"), "w").write(agent + "\n")
        for addr, src, note in [r for r in rows if r[1] == source][:limit]:
            print("%s\t%s\t%s" % (addr, src, note))
        return 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
