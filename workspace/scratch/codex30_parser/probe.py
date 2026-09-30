#!/usr/bin/env python3
"""Complete-section SDK comparison; discovery diagnostics grant no coverage."""
import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members

m = load_matcher()
oracle = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))
discovery = json.loads((HERE.parent / 'codex35_sdk/discovery.json').read_text())
rows = []
for prefix in ('d3dxtok', 'd3dxasm', 'd3dxshader'):
    name = '?' + prefix + '_parse@D3DXShader@@YGHXZ'
    ref, = [r for r in discovery if r['symbols'][0] == name]
    path = HERE / 'obj' / (prefix + '.obj')
    raw = path.read_bytes()
    coff = m['parse_coff'](raw)
    fn, = [s for s in coff['symbols'] if s['name'] == name and s['sec'] > 0]
    sec = coff['sections'][fn['sec'] - 1]
    a = bytearray(raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']])
    original = oracle[ref['member']]
    oc = m['parse_coff'](original)
    os = oc['sections'][ref['section'] - 1]
    b = bytearray(original[os['rawptr']:os['rawptr'] + os['rawsize']])
    fields = {r['vaddr']: r['type'] for r in sec['relocs']}
    expected_fields = {r['vaddr']: r['type'] for r in os['relocs']}
    for body, relocations in ((a, sec['relocs']), (b, os['relocs'])):
        for r in relocations:
            body[r['vaddr']:r['vaddr'] + 4] = bytes(4)
    equal = a == b and fields == expected_fields
    first = next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), None)
    row = {'symbol': name, 'address': ref['placements'][0],
           'object_bytes': len(a), 'target_section_bytes': len(b),
           'first_difference': first, 'field_layout_equal': fields == expected_fields,
           'complete_masked_equal': equal, 'source_credit': 0,
           'object_sha256': hashlib.sha256(raw).hexdigest(),
           'target_member': ref['member'], 'target_section': ref['section']}
    rows.append(row)
    print(prefix, row['object_bytes'], '/', row['target_section_bytes'],
          'complete masked equal', equal, 'first difference', first)
    if first is not None:
        print('source:', a[max(0, first-8):first+32].hex(' '))
        print('target:', b[max(0, first-8):first+32].hex(' '))
inputs = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
          for p in HERE.iterdir() if p.suffix in ('.cpp', '.h', '.inc', '.py', '.sh')}
(HERE / 'probe.json').write_text(json.dumps({'status': 'DISCOVERY ONLY', 'inputs': inputs,
                                            'rows': rows}, indent=2) + '\n')
