#!/usr/bin/env python3
"""test_cmp.py REFEREE EXE MAP: self-check of the per-fn referee (tools/cmp.py or tools/cmp13.py).
Known-good: our image against itself matches a function at its own address. Broken: one flipped
non-relocation byte (the first opcode byte) makes it unmatched. Every row is scored or has a reason,
and alias and short rows exist and follow that rule."""
import json, os, shutil, subprocess, sys, tempfile
import pefile

ref, exe, mapf = sys.argv[1:4]
d = tempfile.mkdtemp()

def run(target):
    out = os.path.join(d, 'out.json')
    subprocess.run([sys.executable, ref, exe, mapf, target, out], check=True, stdout=subprocess.DEVNULL)
    return json.load(open(out))

pe = pefile.PE(exe, fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
va = {}
for l in open(mapf, errors='replace'):
    p = l.split()
    if len(p) > 3 and p[0].startswith('0001:') and p[3] == 'f': va.setdefault(p[1], int(p[2], 16))

rows = run(exe)
assert all(x['hits'] or x.get('reason') for x in rows), 'row with no hit and no reason'
assert any(x.get('alias') or x.get('reason') == 'alias' for x in rows), 'no alias row'
assert any(0 < x['size'] < 6 and not x.get('alias') for x in rows), 'no short row'
fn = next(x for x in rows if x['size'] >= 32 and not x.get('alias') and x['hits'] == [hex(va.get(x['name'], -1))])

tmp = os.path.join(d, 'flip.exe')
shutil.copyfile(exe, tmp)
off = pe.get_offset_from_rva(va[fn['name']] - base)
with open(tmp, 'r+b') as f:
    f.seek(off); b = f.read(1); f.seek(off); f.write(bytes([b[0] ^ 0xff]))
# identical-in-place rule (cmp13 'sameva'): a short fn credited only at its own address; one flipped byte drops it
ip = next((x for x in rows if x.get('sameva') and x['size'] >= 6 and x['hits'] == [hex(va.get(x['name'], -1))]), None)
assert ip or '13' not in os.path.basename(ref), 'no identical-in-place row'
if ip:
    off = pe.get_offset_from_rva(va[ip['name']] - base)
    with open(tmp, 'r+b') as f:
        f.seek(off); b = f.read(1); f.seek(off); f.write(bytes([b[0] ^ 0xff]))
out = {x['name']: x for x in run(tmp)}
assert not out[fn['name']]['hits'], 'flipped byte still matched'
assert not ip or not out[ip['name']]['hits'], 'flipped in-place fn still credited'
print('referee self-check OK: %s matches itself, flipped copy does not; in-place %s; %d rows all scored or reasoned' % (
    fn['name'], ip['name'] + ' credited, flipped copy not' if ip else 'n/a', len(rows)))
