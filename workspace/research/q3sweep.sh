set -u
cd /w/scratch/claude/q3try/q3radiant
ok=0; bad=0
for f in *.cpp *.CPP; do
  [ -f "$f" ] || continue
  if wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Oy- /Op /GS /GX /GR /I. /D_WINDOWS /DWIN32 /DWINVER=0x0400 /DQ3RADIANT "$f" >/dev/null 2>&1; then ok=$((ok+1)); else bad=$((bad+1)); fi
done
echo "compiled $ok, failed $bad"
cd /w && python3 - <<'EOF'
import sys, glob, os, collections
sys.path.insert(0, "tools")
import match_radiant as m
from lib_sweep import same
objs = [o for o in glob.glob("scratch/claude/q3try/q3radiant/*") if o.lower().endswith(".obj")]
by_size = collections.defaultdict(list)
for o in objs:
    d = open(o, "rb").read()
    try: _, syms = m.parse_coff(d)
    except Exception: continue
    for s in syms:
        if s["section"] > 0 and s["class"] in (2, 3) and not s["name"].startswith((".", "$", "?__")):
            try: p, mk, n = m.object_function(d, s["name"])
            except Exception: continue
            if len(p) >= 16: by_size[len(p)].append((p, mk, n, os.path.basename(o)))
hits = []
for addr in sorted(m.FUNCTIONS):
    t, _ = m.carve(addr); va = int(addr, 16)
    if len(t) < 16: continue
    tm = m.absolute_masks(t, m.pe_relocations(va, len(t), t))
    for p, mk, n, o in by_size.get(len(t), ()):
        if same(t, tm, p, mk):
            hits.append((addr, len(t), o, n)); break
with open("workspace/research/q3sweep.tsv", "w") as f:
    f.write("addr\tsize\tq3_object\tsymbol\n")
    for h in hits: f.write("%s\t%d\t%s\t%s\n" % h)
for h in hits[:25]: print("%s %5d %-14s %s" % h)
print("objects", len(objs), "functions", sum(map(len, by_size.values())), "exact matches", len(hits), "bytes", sum(h[1] for h in hits))
EOF
