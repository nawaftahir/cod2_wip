#!/usr/bin/env python3
"""Compile every source file and link the whole exe: link.py (run inside the toolchain image; make build).

Every game file is its own /GL object and the exe is linked /LTCG (RULES.md), so machine code only
exists after the link. Sources compile in retail link order (link/order.txt, then any src/ file not
listed yet), only when stale. Link settings are the retail ones read off the PE header (RULES.md):
base 0x400000, fixed, GUI 4.0, /DEBUG with the retail PDB name, OLEACC delay-loaded, MFC/CRT static
libs and the 13 import libs. Missing functions are allowed (/FORCE:UNRESOLVED) until the tree is
complete. Output: build/CoD2Radiant.exe + .map, scored by verify.py, meter.py and sections.py.
"""
import fnmatch
import os
import pathlib
import struct
import subprocess
import sys

BASE = pathlib.Path(__file__).resolve().parent.parent
IMAGE = os.environ.get("RADIANT_IMAGE", "cod2-radiant-msvc71")
RETAIL = BASE / "binaries" / "CoD2Radiant.exe"
EXE = BASE / "build" / "CoD2Radiant.exe"
MAP = BASE / "build" / "CoD2Radiant.map"

LIBS = ("nafxcw.lib libcmt.lib libcpmt.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib "
        "advapi32.lib shell32.lib comctl32.lib shlwapi.lib ole32.lib oleaut32.lib uuid.lib ws2_32.lib "
        "winmm.lib oleacc.lib delayimp.lib").split()
FLAGS = ["/NOLOGO", "/SUBSYSTEM:WINDOWS,4.0", "/FIXED", "/BASE:0x400000", "/DEBUG",
         "/PDB:e:\\trees\\cod2\\bin\\CoD2Radiant.pdb", "/PDBPATH:none",
         "/DELAYLOAD:OLEACC.dll", "/FORCE:UNRESOLVED", "/LTCG"]
# no /OPT: retail keeps 238 groups of identical functions apart (no ICF); /DEBUG defaults to NOREF+NOICF


def read_tsv(path):
    path = BASE / path
    if not path.exists():
        return []
    lines = [l.rstrip("\n").split("\t") for l in path.read_text().splitlines() if l.strip() and not l.startswith("#")]
    return [dict(zip(lines[0], row)) for row in lines[1:]]


def flags_for(source):
    for row in read_tsv("data/flags.tsv"):
        if fnmatch.fnmatch(str(source), row["glob"]):
            return row["flags"].split()
    raise SystemExit("no flags row matches %s (data/flags.tsv)" % source)


def obj_path(source):
    return pathlib.Path("build") / "obj" / pathlib.Path(source).with_suffix(".obj")


def in_image():
    # everything runs inside the toolchain image; from the host, rerun this script there
    if not os.environ.get("RADIANT_IN_IMAGE"):
        os.execvp("docker", ["docker", "run", "--rm", "-v", "%s:/w" % BASE, "-w", "/w", "-e", "RADIANT_IN_IMAGE=1",
                             IMAGE, "python3", "tools/" + pathlib.Path(sys.argv[0]).name] + sys.argv[1:])


def run(cmd):
    try:
        return subprocess.run(cmd, shell=True, cwd=BASE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                              text=True, timeout=900)
    except subprocess.TimeoutExpired:
        return subprocess.CompletedProcess(cmd, 1, "timed out: %s" % cmd)


TREE = BASE / "build" / "edrive" / "trees" / "cod2src"


def edrive():
    """Wine's E: is build/edrive, holding retail's tree e:\\trees\\cod2src (links into src/)."""
    for name, target in (("radiant", "radiant"), ("common", "common"), ("libs", "libs")):
        link_to(TREE / name, BASE / "src" / target)
    for d in (BASE / "src").iterdir():
        if d.is_dir() and d.name not in ("radiant", "common", "libs", "res"):
            link_to(TREE / "src" / d.name, d)
    dos = pathlib.Path(os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine"))) / "dosdevices" / "e:"
    if not dos.exists():
        dos.symlink_to(BASE / "build" / "edrive")


def link_to(path, target):
    path.parent.mkdir(parents=True, exist_ok=True)
    if not path.is_symlink():
        path.symlink_to(os.path.relpath(target, path.parent))


def compile_source(source, obj):
    # retail ran cl from the radiant folder as .\\X.cpp, and on everything else as \\trees\\cod2src\\...;
    # __FILE__ in asserts records exactly that (RULES.md)
    (BASE / obj).parent.mkdir(parents=True, exist_ok=True)
    rel = pathlib.Path(source).relative_to("src")
    if rel.parts[0] == "radiant":
        cwd, arg = TREE / "radiant", ".\\" + "\\".join(rel.parts[1:])
    else:
        top = () if rel.parts[0] in ("common", "libs") else ("src",)
        cwd, arg = TREE, "\\trees\\cod2src\\" + "\\".join(top + rel.parts)
    out = "Z:" + str(BASE / obj).replace("/", "\\")
    res = subprocess.run(["wine", "/opt/msvc710/Vc7/bin/cl.exe", "/nologo", "/c"] + flags_for(source) + ["/Fo" + out, arg],
                         cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=900)
    if res.returncode != 0:
        print(res.stdout, file=sys.stderr)
        return False
    return True


def sources():
    listed = []
    for line in (BASE / "link" / "order.txt").read_text().splitlines():
        if line and not line.startswith("#"):
            tu = line.split("\t")[0]
            listed.append(tu if tu.startswith("src/") else "src/" + tu)
    present = [s for s in listed if (BASE / s).exists()]
    extra = sorted(str(p.relative_to(BASE)) for p in (BASE / "src").rglob("*.c*")
                   if str(p.relative_to(BASE)) not in listed and p.suffix in (".c", ".cpp"))
    return present + extra


def stale(source, obj, headers):
    obj = BASE / obj
    return not obj.exists() or obj.stat().st_mtime < max((BASE / source).stat().st_mtime, headers)


def extlib_calls():
    """Targets of rel32 calls/jumps made from non-/GL code (data/file_map.tsv extlib/ ranges, e.g. the P4 API)."""
    image = RETAIL.read_bytes()
    out = set()
    for r in read_tsv("data/file_map.tsv"):
        if not r["tu"].startswith("extlib/"):
            continue
        lo, hi = int(r["start"], 16), int(r["end"], 16)
        for va in range(lo, hi - 4):
            off = va - 0x400000  # .text raw offset == RVA in this image
            if image[off] in (0xE8, 0xE9):
                out.add((va + 5 + struct.unpack_from("<i", image, off + 1)[0]) & 0xFFFFFFFF)
    return out


def address_taken(addresses):
    """Retail functions referenced from outside the /GL code: address stored in the image, or called by extlib code."""
    image = RETAIL.read_bytes()
    ext = extlib_calls()
    # Retail 0x410000 has no executable literal reference; its raw PE matches
    # are unrelated byte patterns. Its real caller uses the optimized register form.
    ignored_raw_hits = {0x00410000}
    return {a for a in addresses
            if a in ext or (a not in ignored_raw_hits and image.find(struct.pack("<I", a)) != -1)}

def ledger_includes():
    # LTCG gives a function with no visible caller register arguments; retail keeps the stack form for any
    # function referenced from outside the /GL code (workspace/research/filemap/probe/addr). Until that code is written
    # or linked, /INCLUDE stands in for the reference. data/symbols.tsv names in-tree functions with no ledger row yet.
    rows = read_tsv("ledger/matches.tsv") + read_tsv("data/symbols.tsv")
    taken = address_taken({int(r["addr"], 16) for r in rows})
    return sorted({r["symbol"] for r in rows if int(r["addr"], 16) in taken})


def resources():
    # src/res/CoD2Radiant.rc + image assets taken from retail into build/res (never committed)
    rc = BASE / "src" / "res" / "CoD2Radiant.rc"
    if not rc.exists():
        return []
    out = BASE / "build" / "res"
    subprocess.run([sys.executable, str(BASE / "tools" / "rc_extract.py"), "--assets-only"], cwd=BASE, check=True,
                   stdout=subprocess.DEVNULL)
    (out / rc.name).write_bytes(rc.read_bytes())
    r = subprocess.run(["wine", "/opt/msvc710/Vc7/bin/rc.exe", "/fo", "radiant.res", rc.name], cwd=out,
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if r.returncode != 0 or not (out / "radiant.res").exists():
        print(r.stdout)
        raise SystemExit("rc.exe failed")
    return ["build/res/radiant.res"]


def function_order():
    """Keep reconstructed first-file code before compiler header helpers."""
    first = sources()[0]
    rows = [row for row in read_tsv("ledger/matches.tsv") if row["source"] == first]
    rows.sort(key=lambda row: int(row["addr"], 16))
    path = BASE / "build" / "function_order.txt"
    path.write_text("\n".join(row["symbol"] for row in rows) + "\n")
    return "/ORDER:@build/function_order.txt"


def build(includes=(), quiet=False):
    """Compile stale sources and link. Returns True when an exe was produced."""
    # a header or flag change rebuilds everything
    headers = max([p.stat().st_mtime for p in (BASE / "src").rglob("*.h")] + [(BASE / "data" / "flags.tsv").stat().st_mtime])
    edrive()
    objs = []
    for src in sources():
        obj = obj_path(src)
        if stale(src, obj, headers) and not compile_source(src, obj):
            print("compile failed:", src)
            return False
        objs.append(str(obj))
    # the exe records the retail PDB path; Wine's E: points into build/ so that path exists
    (BASE / "build" / "edrive" / "trees" / "cod2" / "bin").mkdir(parents=True, exist_ok=True)
    res = resources()
    EXE.unlink(missing_ok=True)
    inc = ["/INCLUDE:%s" % s for s in sorted(set(ledger_includes()) | set(includes))]
    (BASE / "build" / "link.rsp").write_text("\n".join(FLAGS + [function_order()] + inc + ["/OUT:build/CoD2Radiant.exe",
                                             "/MAP:build/CoD2Radiant.map"] + objs + res + LIBS) + "\n")
    out = run("wine /opt/msvc710/Vc7/bin/link.exe @build/link.rsp").stdout.splitlines()
    unresolved = sum(1 for l in out if "LNK2001" in l or "LNK2019" in l)
    errors = [l for l in out if "error" in l and not any(c in l for c in ("LNK2001", "LNK2019", "LNK1120"))]
    if not quiet:
        print("objects %d, unresolved symbols %d" % (len(objs), unresolved))
    for l in errors[:10]:
        print(l)
    if not EXE.exists():
        print("link produced no exe")
        return False
    return True


def main():
    in_image()
    if not build():
        return 1
    print("built %s (%d bytes)" % (EXE.relative_to(BASE), EXE.stat().st_size))
    return 0


if __name__ == "__main__":
    sys.exit(main())
