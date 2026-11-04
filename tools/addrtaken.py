from renderer_paths import retail_anchor
# addrtaken.py: retail functions whose address is taken (reloc'd pointer to a function start) -> standard
# calling convention even under LTCG. Prints unverified ones with size and first string, largest first.
import json, glob, os, re, struct, pefile
R = str(retail_anchor())
pe = pefile.PE(R); base = pe.OPTIONAL_HEADER.ImageBase
fns = {}
for f in glob.glob('../../glm/data/decomp/*.c'):
    m = re.match(r'([0-9a-f]{8})_', os.path.basename(f))
    sz = re.search(r'size=(\d+)', open(f, errors='replace').readline())
    if m and sz: fns[int(m.group(1), 16)] = (int(sz.group(1)), f)
taken = {}
for blk in pe.DIRECTORY_ENTRY_BASERELOC:
    for e in blk.entries:
        if e.type != 3: continue
        v = struct.unpack('<I', pe.get_data(e.rva, 4))[0]
        if v in fns: taken.setdefault(v, []).append(base + e.rva)
done = {int(v['t'], 16) for v in json.load(open('build/v/bind.json')).values() if not v['why']}
rows = sorted(((fns[a][0], a) for a in taken if a not in done), reverse=True)
print(len(taken), 'address-taken;', len(rows), 'unverified,', sum(s for s, _ in rows), 'B')
for s, a in rows:
    txt = open(fns[a][1], errors='replace').read()
    st = re.findall(r'"([^"]{4,50})', txt)[:1]
    print('%x %5d %s %s' % (a, s, os.path.basename(fns[a][1])[9:-2], st[0] if st else ''))
