#!/usr/bin/env python3
"""Link the whole exe from day one: link.py (run inside the toolchain image; make build).

Compiles every source file that exists, in retail link order (link/order.txt, then any src/
file not listed yet), and links with the retail settings read off the PE header (RULES.md):
base 0x400000, fixed, GUI 4.0, /DEBUG with the retail PDB name, OLEACC delay-loaded, MFC/CRT
static libs and the 13 import libs. Missing functions are allowed (/FORCE:UNRESOLVED) until the
tree is complete. Output: build/CoD2Radiant.exe, scored by meter.py and sections.py.
"""
import os
import pathlib
import subprocess
import sys

BASE = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE / "tools"))
import verify

LIBS = ("nafxcw.lib libcmt.lib libcpmt.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib "
        "advapi32.lib shell32.lib comctl32.lib shlwapi.lib ole32.lib oleaut32.lib uuid.lib ws2_32.lib "
        "winmm.lib oleacc.lib delayimp.lib").split()
FLAGS = ["/NOLOGO", "/SUBSYSTEM:WINDOWS,4.0", "/FIXED", "/BASE:0x400000", "/DEBUG",
         "/PDB:e:\\trees\\cod2\\bin\\CoD2Radiant.pdb", "/PDBPATH:none",
         "/DELAYLOAD:OLEACC.dll", "/FORCE:UNRESOLVED", "/LTCG"]
# no /OPT: retail keeps 238 groups of identical functions apart (no ICF); /DEBUG defaults to NOREF+NOICF


def sources():
    listed = []
    for line in (BASE / "link" / "order.txt").read_text().splitlines():
        if line and not line.startswith("#"):
            tu = line.split("\t")[0]
            listed.append(tu if tu.startswith("src/") else "src/" + tu)
    present = [s for s in listed if (BASE / s).exists()]
    extra = sorted(str(p.relative_to(BASE)) for p in (BASE / "src").rglob("*.c*")
                   if str(p.relative_to(BASE)) not in listed)
    return present + extra


def main():
    objs = []
    for src in sources():
        obj = verify.obj_path(src)
        if not verify.compile_source(src, obj):
            print("compile failed:", src)
            return 1
        objs.append(str(obj))
    # the exe records the retail PDB path; Wine's E: points into build/ so that path exists
    edrive = BASE / "build" / "edrive"
    (edrive / "trees" / "cod2" / "bin").mkdir(parents=True, exist_ok=True)
    dos = pathlib.Path(os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine"))) / "dosdevices" / "e:"
    if not dos.exists():
        dos.symlink_to(edrive)
    rsp = BASE / "build" / "link.rsp"
    rsp.write_text("\n".join(FLAGS + ["/OUT:build/CoD2Radiant.exe", "/MAP:build/CoD2Radiant.map"] + objs + LIBS) + "\n")
    cmd = ["wine", "/opt/msvc710/Vc7/bin/link.exe", "@build/link.rsp"]
    res = subprocess.run(cmd, cwd=BASE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    out = res.stdout.splitlines()
    unresolved = sum(1 for l in out if "unresolved external" in l and "LNK2001" in l or "LNK2019" in l)
    errors = [l for l in out if "error" in l and "LNK2001" not in l and "LNK2019" not in l and "LNK1120" not in l]
    print("objects %d, unresolved symbols %d" % (len(objs), unresolved))
    for l in errors[:10]:
        print(l)
    exe = BASE / "build" / "CoD2Radiant.exe"
    if not exe.exists():
        print("link produced no exe")
        return 1
    print("built %s (%d bytes)" % (exe.relative_to(BASE), exe.stat().st_size))
    return 0


if __name__ == "__main__":
    sys.exit(main())
