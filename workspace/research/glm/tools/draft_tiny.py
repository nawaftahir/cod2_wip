#!/usr/bin/env python3
"""draft_tiny.py - bulk-draft C from the Ghidra decomp corpus for small,
standard-convention functions; mass-compile under flag variants and byte-diff.

Usage: python3 tools/draft_tiny.py [--compile]
Drafts land in src/draft/<addr>_<name>.c; results in build/draft_hits.tsv.
"""
import json, os, re, subprocess, sys, hashlib

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402

DRAFTDIR = os.path.join(BASE, "src", "draft")
OBJDIR = "build/objs_draft"
HITS = os.path.join(BASE, "build", "draft_hits.tsv")
FLAGSETS = {"a": "/O2", "b": "/O2 /Oy-", "c": "/O1", "d": "/O1 /Oy-"}
MIN_SIZE = int(os.environ.get("DT_MIN", "4"))
MAX_SIZE = int(os.environ.get("DT_MAX", "60"))

TYPEMAP = [
    (r"\bundefined4\b", "unsigned int"),
    (r"\bundefined2\b", "unsigned short"),
    (r"\bundefined1\b", "unsigned char"),
    (r"\bundefined8\b", "unsigned long long"),
    (r"\bundefined\b", "unsigned int"),
    (r"\buint\b", "unsigned int"),
    (r"\buchar\b", "unsigned char"),
    (r"\bushort\b", "unsigned short"),
    (r"\buint\b", "unsigned int"),
    (r"\blonglong\b", "long long"),
    (r"\bulonglong\b", "unsigned long long"),
    (r"\bfloat\d*\b", "float"),
    (r"\bdouble\d*\b", "double"),
    (r"\bbool\b", "unsigned char"),
    (r"\bcode\s*\*", "void *"),
    (r"\(code \*\)", "(void *)"),
]


def cache_globals(text):
    """Rewrite repeated DAT_x reads to use one cached local per global.

    Proven fix (engine_facts #24): MSVC keeps a single load in a register;
    decomp-style re-reads break store/load scheduling and SIB encodings.
    Byte-diff gates correctness, so wrong caching simply fails promotion."""
    m = re.search(r"\)[\s\S]*?\{", text)
    if not m:
        return text
    body_start = m.end()
    head, body = text[:body_start], text[body_start:]
    decls = []
    for g in sorted(set(re.findall(r"\bDAT_[0-9a-fA-F]{6,8}\b", body))):
        n = len(re.findall(r"\b" + g + r"\b", body))
        if n > 1:
            local = "g" + g[3:].lower()
            first = re.search(r"(^[ \t]*[^\n]*\b" + g + r"\b[^\n]*$)", body, re.M)
            if not first:
                continue
            # Insert declaration at first use position
            decls.append((first.end(), f"\n\tint {local} = {g};"))
            # Replace all OTHER occurrences (skip the declaration line we'll insert)
            lines = body.splitlines(keepends=True)
            # Find the line containing the first occurrence
            first_line_idx = -1
            for i, line in enumerate(lines):
                if g in line:
                    first_line_idx = i
                    break
            if first_line_idx >= 0:
                # Replace g with local in all lines EXCEPT the first occurrence line
                for i, line in enumerate(lines):
                    if i != first_line_idx:
                        lines[i] = line.replace(g, local)
            body = "".join(lines)
    for pos, d in sorted(decls, reverse=True):
        body = body[:pos] + d + body[pos:]
    return head + body


def clean_decomp(text):
    out = []
    for line in text.splitlines():
        if line.startswith("//") or line.startswith("#"):
            continue
        for pat, rep in TYPEMAP:
            line = re.sub(pat, rep, line)
        out.append(line)
    return cache_globals("\n".join(out))


def externs_for(text):
    """Generate forward declarations for every referenced symbol."""
    names = set()
    names |= set(re.findall(r"\bFUN_[0-9a-fA-F]{6,8}\b", text))
    own = re.search(r"\b(FUN_[0-9a-fA-F]{6,8}|\w+)\s*\(", text)
    names.discard(own.group(1) if own else "")
    names |= set(re.findall(r"\b(DAT_[0-9a-fA-F]{6,8})\b", text))
    names |= set(re.findall(r"\b(s|ptr|u|UNK)_\w{3,}\b", text))
    lines = []
    for n in sorted(names):
        if n.startswith("FUN_"):
            lines.append(f"extern int {n}();")
        elif n.startswith("DAT_"):
            lines.append(f"extern unsigned int {n};")
        else:
            lines.append(f"extern unsigned char {n}[1];")
    return "\n".join(lines)


def collect():
    inv = {f["addr"]: f for f in json.load(open(os.path.join(BASE, "data/functions_gfx10.json")))["functions"]}
    pool = []
    for line in open(os.path.join(BASE, "data/manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) < 5 or p[0] == "addr" or p[2] != "iw":
            continue
        f = inv.get(p[0])
        if not f or f["size"] > MAX_SIZE or f["size"] < MIN_SIZE:
            continue
        dp = os.path.join(BASE, "data/decomp/%s_%s.c" % (p[0], p[1]))
        if not os.path.isfile(dp):
            continue
        t = open(dp).read()
        if re.search(r"\bin_[A-Z]+|\bunaff_", t):
            continue
        # matched rows only matter if held by transplants; todo always matters
        pool.append((p[0], p[1], p[3]))
    return pool


def main():
    do_compile = "--compile" in sys.argv
    os.makedirs(DRAFTDIR, exist_ok=True)
    pool = collect()
    print(f"candidates: {len(pool)}")
    jobs = []
    for addr, name, status in pool:
        dp = os.path.join(BASE, "data/decomp/%s_%s.c" % (addr, name))
        body = clean_decomp(open(dp).read())
        src = externs_for(body) + "\n\n" + body + "\n"
        path = os.path.join(DRAFTDIR, "%s_%s.c" % (addr, name))
        open(path, "w").write(src)
    if not do_compile:
        return
    os.makedirs(os.path.join(BASE, OBJDIR), exist_ok=True)
    lines = []
    relroot = os.path.relpath(DRAFTDIR, BASE).replace("\\", "/")
    for addr, name, status in pool:
        for vk, flags in FLAGSETS.items():
            lines.append(
                f"cl {flags} {relroot}/{addr}_{name}.c /Fo{OBJDIR}/{vk}_{addr}.obj"
            )
    have = set(os.listdir(os.path.join(BASE, OBJDIR)))
    lines = [l for l in lines if l.rsplit("/", 1)[-1][3:] not in have or True]
    jf = os.path.join(BASE, OBJDIR, "_jobs.txt")
    open(jf, "w").write("\n".join(lines))
    script = (
        "xargs -P 8 -n 1 -I {} sh -c '{}' < " + OBJDIR + "/_jobs.txt >/dev/null 2>&1; true"
    )
    subprocess.run(
        ["docker", "run", "--rm", "-v", f"{BASE}:/work", "-w", "/work",
         "cod2-msvc71", "sh", "-c", script],
        capture_output=True, text=True)
    done = len([x for x in os.listdir(os.path.join(BASE, OBJDIR)) if x.endswith(".obj")])
    print(f"objs present: {done}/{len(lines)}")

    # index obj symbols by normalized bytes
    index = {}
    objs = sorted(os.listdir(os.path.join(BASE, OBJDIR)))
    for oi, o in enumerate(objs):
        blob = open(os.path.join(BASE, OBJDIR, o), "rb").read()
        try:
            coff = M.parse_coff(blob)
        except Exception:
            continue
        secs = coff["sections"]
        execs = {k + 1: s for k, s in enumerate(secs) if s["flags"] & 0x20 and s["rawsize"] > 0}
        relmap = {}
        for sn, s in execs.items():
            m = set()
            for rr in s.get("relocs", []):
                for k in range(4):
                    m.add(rr["vaddr"] + k)
            relmap[sn] = m
        for s in coff["symbols"]:
            if s["sec"] not in execs or s["naux"]:
                continue
            ss = execs[s["sec"]]
            v = s["value"]
            nxt = ss["rawsize"]
            for s2 in coff["symbols"]:
                if s2["sec"] == s["sec"] and not s2["naux"] and s2["value"] > v:
                    nxt = min(nxt, s2["value"])
            fnb = blob[ss["rawptr"] + v: ss["rawptr"] + nxt]
            om = {p - v for p in relmap[s["sec"]] if p >= v}
            nb = M.normalize(fnb, om)
            if len(nb) == 0:
                continue
            index.setdefault(len(nb), {}).setdefault(hashlib.sha1(nb).hexdigest(), []).append(o)
    print(f"indexed {sum(len(v) for vv in index.values() for v in vv.values())} symbols")

    hits = 0
    out = open(HITS, "w")
    out.write("addr\tname\tstatus\tobj\n")
    for addr, name, status in pool:
        try:
            tfn, _ = M.carve(addr)
        except KeyError:
            continue
        off = M.rva2off(int(addr, 16) - 0x10000000)
        pm = M.pe_mask_for(off, len(tfn), tfn, int(addr, 16) - 0x10000000)
        tb = M.normalize(tfn, pm)
        found = index.get(len(tb), {}).get(hashlib.sha1(tb).hexdigest())
        if found:
            hits += 1
            out.write(f"{addr}\t{name}\t{status}\t{found[0]}\n")
    out.close()
    print(f"HITS: {hits} -> build/draft_hits.tsv")


if __name__ == "__main__":
    main()
