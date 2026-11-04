#!/usr/bin/env python3
"""meter.py VER CMPJSON SHATXT MATCHEDBYTES: write meter-VER.json from the referee outputs (run from the target root).
CMPJSON = per-fn referee json (1.0 build/exp.json, 1.3 build/cmp13.json), SHATXT = tools/shameter.py output,
MATCHEDBYTES = the referee's matched-fn byte count (1.0 cov.py unique bytes, 1.3 cmp13_sum.py)."""
import json, os, re, subprocess, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from inplace import functions

ver, cmpf, shaf, mbytes = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
rows = json.load(open(cmpf))
matched = [x for x in rows if x['hits']]

sha = open(shaf).read()
sec = {}
for m in re.finditer(r'^(\.\w+)\s+raw\s+(\d+)/\s*(\d+)\s+vsize\s+(\d+)/\s*(\d+).*same\s+(\d+)', sha, re.M):
    sec[m.group(1)] = {'same_offset': int(m.group(6)), 'raw': int(m.group(3)), 'vsize': int(m.group(5))}
allm = re.search(r'ALL sections same-offset (\d+)/(\d+)', sha)

tus = [l.split('#')[0].split() for l in open('workspace/tus.txt')]
tus = [t[0] for t in tus if t]
in_src = [t for t in tus if os.path.exists('src/' + t)]
anchor = 'windows/%s/CoD2MP_s.exe' % ver
anchor_file = os.environ.get('ANCHOR', '../binaries/' + anchor)
# a function is identical if the referee matches it or its bytes sit unchanged at the anchor's offset
hit = {x['name'] for x in rows if x['hits']}
fns = [(obj, same or any(n in hit for n in names))
       for _, _, names, obj, same in functions('build/release/CoD2MP_s.exe', 'build/release/CoD2MP_s.map', anchor_file)]
objs = {}
for obj, ok in fns: objs.setdefault(obj, []).append(ok)
tuobj = {t: os.path.splitext(os.path.basename(t))[0] + '.obj' for t in tus}
tu_ok = {t: all(objs.get(o, [False])) for t, o in tuobj.items()}  # a TU with no code in .text is never verified
bad = [t for t in in_src if not tu_ok[t]]
libs = [o for o in objs if o not in set(tuobj.values())]
m = {
    'name': 'client ' + ver, 'binary': 'CoD2MP_s.exe', 'version': ver, 'anchor': anchor,
    'sha_identical': open('build/release/CoD2MP_s.exe', 'rb').read() == open(anchor_file, 'rb').read(),
    'text_bytes': sec['.text']['vsize'], 'matched_bytes': mbytes,
    'file_bytes': int(allm.group(2)), 'same_offset_bytes': int(allm.group(1)),
    'game_functions': len(rows), 'matched_functions': len(matched),
    'tus_total': len(tus), 'tus_matched': len(in_src), 'unverified_in_src': len(bad),
    'functions_identical': sum(ok for _, ok in fns), 'functions_total': len(fns),
    'tus_identical': sum(tu_ok.values()), 'lib_objs_identical': sum(all(objs[o]) for o in libs), 'lib_objs_total': len(libs),
    'text_same_offset_bytes': sec['.text']['same_offset'],
    'sections': {k: ({'matched': mbytes} if k == '.text' else {}) | {'same_offset': v['same_offset']} for k, v in sec.items()},
    'commit': subprocess.run(['git', 'rev-parse', '--short', 'HEAD'], capture_output=True, text=True).stdout.strip(),
    'note': 'matched_bytes/matched_functions = referee; functions_identical = referee match or same bytes at the same offset '
            '(every .text map symbol); tus_identical = source TUs whose functions are all identical (CRT/lib objs separate); '
            'tus_matched = TUs in src/; same-offset over all sections (shameter)',
}
json.dump(m, open('meter-%s.json' % ver, 'w'), indent=1)
print('meter-%s.json: matched-fn %d B, same-offset %d/%d, fns identical %d/%d, TUs identical %d/%d, src TUs %d (unverified %d), lib objs %d/%d' % (
    ver, mbytes, m['same_offset_bytes'], m['file_bytes'], m['functions_identical'], len(fns), m['tus_identical'], len(tus),
    len(in_src), len(bad), m['lib_objs_identical'], len(libs)))
for t in tus:
    if tu_ok[t] and t not in in_src: print('  identical, not in src:', t)
for t in bad: print('  unverified in src:', t)
