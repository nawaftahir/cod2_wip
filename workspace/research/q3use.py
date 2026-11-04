import sys, os, csv, collections, re
sys.path.insert(0, "/w/tools")
import match_radiant as m
from capstone import CS_ARCH_X86, CS_MODE_32, Cs

def cstr(va):
    try: o = m.rva_to_offset(va - m.IMAGE_BASE)
    except ValueError: return None
    e = m._image.find(b"\0", o, o + 300); s = m._image[o:e]
    if len(s) >= 6 and all(32 <= c < 127 or c in (9, 10) for c in s):
        return s.decode()
    return None

rd = lambda p: list(csv.DictReader((l for l in open(p) if not l.startswith("#")), delimiter="\t"))
tu = [r for r in rd("/w/data/tu_map.tsv") if r["tu"].startswith(("radiant/", "src/", "libs/", "common/")) and not r["tu"].startswith("src/zlib")]
cs = Cs(CS_ARCH_X86, CS_MODE_32)

def load(root, exts=(".cpp", ".c", ".h")):
    files = {}
    for dp, _, fs in os.walk(root):
        for f in fs:
            if f.lower().endswith(exts):
                try: files[os.path.join(dp, f)] = open(os.path.join(dp, f), errors="replace").read()
                except Exception: pass
    return files

refs = {"q3radiant": load("/refs/Quake-III-Arena/q3radiant"), "iw3xo": load("/refs/iw3xo-radiant/src")}
def escaped(s):
    # C source writes \n, \t, \\ and \" as escapes
    return s.replace("\\", "\\\\").replace("\n", "\\n").replace("\t", "\\t").replace('"', '\\"')

per = collections.defaultdict(lambda: {"funcs": 0, "bytes": 0, "withstr": 0, "q3": 0, "q3b": 0, "iw": 0, "iwb": 0, "either": 0, "eb": 0})
q3files = collections.defaultdict(collections.Counter)
cache = {}
def hit(name, s):
    k = (name, s)
    if k not in cache:
        e = escaped(s)
        cache[k] = next((p for p, txt in refs[name].items() if e in txt), None)
    return cache[k]

for r in tu:
    code, _ = m.carve(r["addr"])
    strs = set()
    for ins in cs.disasm(code, int(r["addr"], 16)):
        for tok in re.findall(r"0x[0-9a-f]+", ins.op_str):
            v = int(tok, 16)
            if 0x528000 <= v < 0x1300000:
                s = cstr(v)
                if s and not s.startswith(("\\trees", ".\\", "e:\\")):
                    strs.add(s)
    p = per[r["tu"]]; size = int(r["size"])
    p["funcs"] += 1; p["bytes"] += size
    if not strs: continue
    p["withstr"] += 1
    q = [hit("q3radiant", s) for s in strs]; w = [hit("iw3xo", s) for s in strs]
    if any(q):
        p["q3"] += 1; p["q3b"] += size
        for f in q:
            if f: q3files[r["tu"]][os.path.basename(f)] += 1
    if any(w): p["iw"] += 1; p["iwb"] += size
    if any(q) or any(w): p["either"] += 1; p["eb"] += size

tot = collections.Counter()
print("file\tfuncs\tbytes\twith_strings\tq3_funcs\tiw3xo_funcs\teither_bytes\ttop_q3_files")
for t, p in sorted(per.items(), key=lambda kv: -kv[1]["eb"]):
    for k, v in p.items(): tot[k] += v
    top = ",".join("%s:%d" % kv for kv in q3files[t].most_common(2))
    print("%s\t%d\t%d\t%d\t%d\t%d\t%d\t%s" % (t, p["funcs"], p["bytes"], p["withstr"], p["q3"], p["iw"], p["eb"], top))
print("TOTAL funcs %d bytes %d | with strings %d | q3radiant hit %d funcs %d B | iw3xo hit %d funcs %d B | either %d funcs %d B"
      % (tot["funcs"], tot["bytes"], tot["withstr"], tot["q3"], tot["q3b"], tot["iw"], tot["iwb"], tot["either"], tot["eb"]))
