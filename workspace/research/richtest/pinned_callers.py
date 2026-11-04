import sys, struct, bisect, collections
sys.path.insert(0, "/w/tools")
import match_radiant as m
text = m.SECTIONS[".text"]; code = m._image[text["ptr"]:text["ptr"] + text["vs"]]; tbase = m.IMAGE_BASE + text["va"]
funcs = sorted(int(a, 16) for a in m.FUNCTIONS)
tu = {int(l.split("\t")[0], 16): (l.split("\t")[2], l.split("\t")[3]) for l in open("/w/data/tu_map.tsv").read().splitlines()[1:]}
regf = {int(l.split("\t")[0], 16): l.split("\t")[1] for l in open("/w/data/ltcg.tsv").read().splitlines()[1:]}
# callers of register-argument functions, keeping only PINNED callers and PINNED callees
pairs = collections.Counter()
examples = {}
for j in range(len(code) - 5):
    if code[j] != 0xE8: continue
    dest = (tbase + j + 5 + struct.unpack_from("<i", code, j + 1)[0]) & 0xFFFFFFFF
    if dest not in regf: continue
    caller = funcs[bisect.bisect_right(funcs, tbase + j) - 1]
    ct, ce = tu.get(caller, ("", "")); dt, de = tu.get(dest, ("", ""))
    if ce == "PINNED" and de == "PINNED" and ct != dt:
        key = (ct, dt); pairs[key] += 1; examples.setdefault(key, (caller, dest, regf[dest]))
print("PINNED caller -> PINNED register-argument callee in another file:")
for (ct, dt), n in pairs.most_common(30):
    c, d, r = examples[(ct, dt)]
    print("  %3d  %-28s -> %-28s e.g. %x -> %x (%s)" % (n, ct, dt, c, d, r))
