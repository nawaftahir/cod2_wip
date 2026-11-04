#!/usr/bin/env python3
"""Batch full-section SetTyped diagnostics. No source acceptance or credit."""
import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
from check_shape import is_function

m = load_matcher()
sdk = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))
refs = {n: r for r in json.loads((HERE.parent / 'codex35_sdk/discovery.json').read_text())
        for n in r['symbols']}
obj = HERE / 'obj' / (sys.argv[1] if len(sys.argv) > 1 else 'set_typed.obj')
source = HERE / (sys.argv[2] if len(sys.argv) > 2 else 'set_typed.cpp')
raw = obj.read_bytes()
coff = m['parse_coff'](raw)
rows = []
for fn in coff['symbols']:
    if fn['sec'] <= 0 or not is_function(raw, fn) or fn['name'] not in refs:
        continue
    ref = refs[fn['name']]
    sec = coff['sections'][fn['sec'] - 1]
    a = bytearray(raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']])
    original = sdk[ref['member']]
    old = m['parse_coff'](original)['sections'][ref['section'] - 1]
    b = bytearray(original[old['rawptr']:old['rawptr'] + old['rawsize']])
    fields = {r['vaddr']: r['type'] for r in sec['relocs']}
    expected = {r['vaddr']: r['type'] for r in old['relocs']}
    for body, relocs in ((a, sec['relocs']), (b, old['relocs'])):
        for r in relocs:
            body[r['vaddr']:r['vaddr'] + 4] = bytes(4)
    first = next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), None)
    row = {'symbol': fn['name'], 'object_bytes': len(a), 'target_bytes': len(b),
           'first_difference': first, 'full_masked_equal': a == b and fields == expected,
           'source_credit': 0}
    rows.append(row)
    print(row['full_masked_equal'], len(a), '/', len(b), first, fn['name'])
(HERE / ('probe.json' if len(sys.argv) == 1 else 'probe_' + obj.stem + '.json')).write_text(json.dumps({'status': 'DISCOVERY ONLY', 'rows': rows,
    'source': str(source.relative_to(ROOT)),
    'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
    'object_sha256': hashlib.sha256(raw).hexdigest()}, indent=2) + '\n')
