#!/usr/bin/env python3
"""meter.py VER CMPJSON SHATXT MATCHEDBYTES: write meter-VER.json from the referee outputs (run from the target root).
CMPJSON = per-fn referee json (1.0 build/exp.json, 1.3 build/cmp13.json), SHATXT = tools/shameter.py output,
MATCHEDBYTES = the referee's matched-fn byte count (1.0 cov.py unique bytes, 1.3 cmp13_sum.py)."""
import json, os, re, subprocess, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from inplace import symbols

ver, cmpf, shaf, mbytes = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
rows = json.load(open(cmpf))
matched = [x for x in rows if x['hits']]
inplace = [x for x in matched if x.get('sameva')]

sha = open(shaf).read()
sec = {}
for m in re.finditer(r'^(\.\w+)\s+raw\s+(\d+)/\s*(\d+)\s+vsize\s+(\d+)/\s*(\d+).*same\s+(\d+)', sha, re.M):
    sec[m.group(1)] = {'same_offset': int(m.group(6)), 'raw': int(m.group(3)), 'vsize': int(m.group(5))}
hm = re.search(r'^header\s+same (\d+)/(\d+)', sha, re.M)
sec['header'] = {'same_offset': int(hm.group(1)), 'raw': int(hm.group(2)), 'vsize': int(hm.group(2))}
allm = re.search(r'ALL header\+sections same-offset (\d+)/(\d+)', sha)

tus = [l.split('#')[0].split() for l in open('workspace/tus.txt')]
tus = [t[0] for t in tus if t]
in_src = [t for t in tus if os.path.exists('src/' + t)]
anchor = 'windows/%s/CoD2MP_s.exe' % ver
anchor_file = os.environ.get('ANCHOR', '../binaries/' + anchor)
# a function is identical if the referee matches it or its bytes sit unchanged at the anchor's offset
hit = {x['name'] for x in rows if x['hits']}
syms = symbols('build/release/CoD2MP_s.exe', 'build/release/CoD2MP_s.map', anchor_file, (1, 2, 3))
# libwww is linked as an archive: the map names its objs 'libwww:HTxxx.obj'
syms = [(s, a, b, n, o.replace('libwww:', ''), sm) for s, a, b, n, o, sm in syms]
fns = [(obj, same or any(n in hit for n in names)) for s, _, _, names, obj, same in syms if s == 1]
objs, dobjs = {}, {}
for obj, ok in fns: objs.setdefault(obj, []).append(ok)
for s, _, _, _, obj, same in syms:
    if s != 1: dobjs.setdefault(obj, []).append(same)
tuobj = {t: os.path.splitext(os.path.basename(t))[0] + '.obj' for t in tus}
# code TU: every function identical; data-only TU: every data symbol identical in place; empty: no symbol in the map,
# counted identical (owner 11-12: they only carry the retail LTCG obj count for the Rich header)
tu_kind = {t: 'code' if o in objs else 'data' if o in dobjs else 'empty' for t, o in tuobj.items()}
tu_ok = {t: all(objs[o]) if tu_kind[t] == 'code' else all(dobjs[o]) if tu_kind[t] == 'data' else True for t, o in tuobj.items()}
bad = [t for t in in_src if not tu_ok[t]]
# stricter: its data symbols also sit unchanged at the anchor's offset (address-dependent, so low until layout is placed)
tu_full = [t for t in tus if tu_ok[t] and all(dobjs.get(tuobj[t], []))]
libs = [o for o in objs if o not in set(tuobj.values())]
m = {
    'name': 'client ' + ver, 'binary': 'CoD2MP_s.exe', 'version': ver, 'anchor': anchor,
    'sha_identical': open('build/release/CoD2MP_s.exe', 'rb').read() == open(anchor_file, 'rb').read(),
    'text_bytes': sec['.text']['vsize'], 'matched_bytes': mbytes,
    'file_bytes': int(allm.group(2)), 'same_offset_bytes': int(allm.group(1)),
    'game_functions': len(rows), 'matched_functions': len(matched),
    # subset of matched_functions credited only by the identical-in-place rule (same VA, raw bytes equal)
    'functions_identical_in_place': len(inplace), 'bytes_identical_in_place': sum(x['size'] for x in inplace),
    'tus_total': len(tus), 'tus_matched': len(in_src), 'unverified_in_src': len(bad),
    'functions_identical': sum(ok for _, ok in fns), 'functions_total': len(fns),
    'tus_identical': sum(tu_ok.values()),
    'tus_data_only': sum(k == 'data' for k in tu_kind.values()), 'tus_data_only_identical': sum(tu_ok[t] for t in tus if tu_kind[t] == 'data'),
    'tus_identical_with_data': len(tu_full),
    'tus_empty': sum(k == 'empty' for k in tu_kind.values()), 'lib_objs_identical': sum(all(objs[o]) for o in libs), 'lib_objs_total': len(libs),
    'text_same_offset_bytes': sec['.text']['same_offset'],
    'sections': {k: ({'matched': mbytes} if k == '.text' else {}) | {'same_offset': v['same_offset']} for k, v in sec.items()},
    'commit': subprocess.run(['git', 'rev-parse', '--short', 'HEAD'], capture_output=True, text=True).stdout.strip(),
    'note': 'matched_bytes/matched_functions = referee; functions/bytes_identical_in_place = the part of that credited only by '
            'raw identity at our own VA (already inside the matched totals, never added twice);functions_identical = referee match or same bytes at the same offset '
            '(every .text map symbol); tus_identical = source TUs whose functions are all identical '
            '(data-only TUs: data identical in place; CRT/lib objs separate); tus_identical_with_data = also every data symbol in place; tus_empty = TUs with no symbol in the image (counted in tus_identical since 11-12, owner decision); '
            'tus_matched = TUs in src/; same-offset over the PE header and all sections (shameter; header counted since 11-10)',
}
json.dump(m, open('meter-%s.json' % ver, 'w'), indent=1)
print('meter-%s.json: matched-fn %d B, same-offset %d/%d, fns identical %d/%d, TUs identical %d/%d, src TUs %d (unverified %d), lib objs %d/%d' % (
    ver, mbytes, m['same_offset_bytes'], m['file_bytes'], m['functions_identical'], len(fns), m['tus_identical'], len(tus),
    len(in_src), len(bad), m['lib_objs_identical'], len(libs)))
for t in tus:
    if tu_ok[t] and t not in in_src: print('  identical, not in src:', t)
for t in bad: print('  unverified in src:', t)
