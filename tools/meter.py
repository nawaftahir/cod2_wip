#!/usr/bin/env python3
"""meter.py VER CMPJSON SHATXT MATCHEDBYTES: write meter-VER.json from the referee outputs (run from the target root).
CMPJSON = per-fn referee json (1.0 build/exp.json, 1.3 build/cmp13.json), SHATXT = tools/shameter.py output,
MATCHEDBYTES = the referee's matched-fn byte count (1.0 cov.py unique bytes, 1.3 cmp13_sum.py)."""
import json, os, re, subprocess, sys

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
objs = {}
for x in rows: objs.setdefault(x['obj'], []).append(bool(x['hits']))
bad = [t for t in in_src if not all(objs.get(os.path.splitext(os.path.basename(t))[0] + '.obj', [False]))]

anchor = 'windows/%s/CoD2MP_s.exe' % ver
m = {
    'name': 'client ' + ver, 'binary': 'CoD2MP_s.exe', 'version': ver, 'anchor': anchor,
    'sha_identical': open('build/release/CoD2MP_s.exe', 'rb').read() == open('../binaries/' + anchor, 'rb').read(),
    'text_bytes': sec['.text']['vsize'], 'matched_bytes': mbytes,
    'file_bytes': int(allm.group(2)), 'same_offset_bytes': int(allm.group(1)),
    'game_functions': len(rows), 'matched_functions': len(matched),
    'tus_total': len(tus), 'tus_matched': len(in_src), 'unverified_in_src': len(bad),
    'sections': {k: ({'matched': mbytes} if k == '.text' else {}) | {'same_offset': v['same_offset']} for k, v in sec.items()},
    'commit': subprocess.run(['git', 'rev-parse', '--short', 'HEAD'], capture_output=True, text=True).stdout.strip(),
    'note': 'matched_bytes = referee matched-fn bytes; same-offset over all sections (shameter)',
}
json.dump(m, open('meter-%s.json' % ver, 'w'), indent=1)
print('meter-%s.json: matched-fn %d B, same-offset %d/%d, src TUs %d/%d (unverified %d)' % (
    ver, mbytes, m['same_offset_bytes'], m['file_bytes'], len(in_src), len(tus), len(bad)))
for t in bad: print('  unverified in src:', t)
