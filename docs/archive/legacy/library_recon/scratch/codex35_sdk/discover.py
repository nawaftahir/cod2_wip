#!/usr/bin/env python3
"""Name original SDK sections in the anchor. Opaque objects earn zero source credit."""
import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'gfx/tools'), str(ROOT / 'codex/renderer')]
from check_dxerr_dependency import members
from audit_legacy import load_matcher
from check_shape import is_function
import pefile

lib = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
assert hashlib.sha256(lib.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
m = load_matcher()
pe = pefile.PE(data=m['_d'])
text = next(s for s in pe.sections if s.Name.startswith(b'.text'))
body = text.get_data()
base = pe.OPTIONAL_HEADER.ImageBase + text.VirtualAddress
rows = []
for member_index, raw in enumerate(members(lib.read_bytes())):
    if raw[:2] != b'\x4c\x01':
        continue
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    for number, sec in enumerate(coff['sections'], 1):
        if not sec['flags'] & 32 or sec['rawsize'] < 16:
            continue
        names = [s['name'] for s in symbols.values()
                 if s['sec'] == number and not s['value'] and is_function(raw, s)]
        if not names:
            continue
        source = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
        fields = {r['vaddr']: r['type'] for r in sec['relocs']}
        masked = {p + n for p in fields for n in range(4)}
        spans, start = [], 0
        for p in range(len(source) + 1):
            if p == len(source) or p in masked:
                spans.append((p - start, start))
                start = p + 1
        length, start = max(spans)
        if length < 8:
            continue
        literal = source[start:start + length]
        offset = body.find(literal)
        placements = []
        while offset >= 0:
            position = offset - start
            offset = body.find(literal, offset + 1)
            if position < 0 or position + len(source) > len(body):
                continue
            a, b = bytearray(source), bytearray(body[position:position + len(source)])
            for p in fields:
                a[p:p + 4] = b[p:p + 4] = bytes(4)
            if a == b:
                placements.append(hex(base + position))
        if placements:
            rows.append({'symbols': names, 'member': member_index, 'section': number,
                         'section_bytes': len(source), 'placements': placements,
                         'relocation_symbols': sorted({symbols[r['sym']]['name'] for r in sec['relocs']})})
rows.sort(key=lambda r: -r['section_bytes'])
(HERE / 'discovery.json').write_text(json.dumps(rows, indent=2) + '\n')
print('Discovery only:', len(rows), 'SDK sections. Source coverage credit: 0.')
for r in rows[:15]:
    print(r['section_bytes'], r['placements'], r['symbols'])
