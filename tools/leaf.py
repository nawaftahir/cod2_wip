#!/usr/bin/env python3
"""Rank unverified renderer/universal functions whose callees are all verified (GLM decomps)."""
import json, re, glob, os, sys
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..')
d = json.load(open(f'{ROOT}/glm/data/functions_gfx10.json'))['functions']
b = json.load(open(f'{ROOT}/gfx/target/build/v/bind.json'))
ver = {int(v['t'], 16) for v in b.values() if v.get('t') and v['why'] == []}
files = {os.path.basename(f)[:8]: f for f in glob.glob(f'{ROOT}/glm/data/decomp/*.c')}
tot = n = 0
for f in sorted(d, key=lambda f: -f['size']):
    a = int(f['addr'], 16)
    if a in ver or f['thunk'] or 0x10041db0 <= a < 0x10058000 or a >= 0x10060000:
        continue
    p = files.get(f['addr'])
    if not p:
        continue
    s = open(p).read()
    if any(int(c, 16) not in ver for c in set(re.findall(r'FUN_([0-9a-f]{8})', s)) - {f['addr']}):
        continue
    if re.search(r'in_E[ACDB]X|in_E[SD]I|unaff_|in_stack|extraout', s):
        continue
    tot += f['size']; n += 1
    if f['size'] >= int(sys.argv[1] if len(sys.argv) > 1 else 100):
        print(f['addr'], f['size'], s.split('\n')[2][:110])
print('clean leaf total', tot, n)
