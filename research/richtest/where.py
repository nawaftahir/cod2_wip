import sys, struct, bisect
sys.path.insert(0, "/w/tools")
import match_radiant as m
img = m._image
text = m.SECTIONS[".text"]; code = img[text["ptr"]:text["ptr"] + text["vs"]]; tbase = m.IMAGE_BASE + text["va"]
funcs = sorted(int(a, 16) for a in m.FUNCTIONS);
tu = {int(l.split("\t")[0], 16): (l.split("\t")[2], l.split("\t")[3]) for l in open("/w/data/tu_map.tsv").read().splitlines()[1:]}
def owner(va):
    k = funcs[bisect.bisect_right(funcs, va) - 1]; return k, tu.get(k)
for s in (b"incorrect header check", b"inflate 1.1.4", b"unzip 0.15", b"invalid distance code"):
    for sec in (".rdata", ".data"):
        S = m.SECTIONS[sec]; blob = img[S["ptr"]:S["ptr"] + S["raw"]]; i = blob.find(s)
        if i < 0: continue
        va = m.IMAGE_BASE + S["va"] + i
        refs = [j for j in range(len(code) - 4) if struct.unpack_from("<I", code, j)[0] == va]
        print(s.decode(), "at %x" % va, "referenced from", ["%x %s" % owner(tbase + j) for j in refs[:4]])
print("first functions:")
for a in funcs[:12]:
    print("  %x" % a, tu.get(a))
seq = []
for a in funcs:
    t, ev = tu.get(a, ("", ""))
    lab = t if ev in ("PINNED", "SUPPORTED") else ("LIB" if ev == "LIB" else "?")
    if not seq or seq[-1][1] != lab: seq.append([a, lab, 1])
    else: seq[-1][2] += 1
print("address runs (start, file, functions), first 40 and runs of unknown > 40:")
for a, lab, n in seq[:40]:
    print("  %x %-36s %d" % (a, lab, n))
