#!/usr/bin/env python3
"""Discover complete original-source sections across the image; no coverage credit."""
import json
from pathlib import Path
import struct
import sys

import pefile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher
from check_shape import branch_fields, is_function

m = load_matcher()
pe = pefile.PE(str(ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
text = next(s for s in pe.sections if s.Name.startswith(b'.text'))
body = text.get_data()
base = pe.OPTIONAL_HEADER.ImageBase + text.VirtualAddress
found = []
for obj in sorted((HERE / 'obj').rglob('*.obj')):
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    names = {s['idx']: s for s in coff['symbols']}
    for fn in names.values():
        if fn['sec'] <= 0 or fn['value'] or not is_function(raw, fn):
            continue
        sec = coff['sections'][fn['sec'] - 1]
        if not sec['flags'] & 32 or sec['rawsize'] < 6:
            continue
        if sum(is_function(raw, s) for s in names.values() if s['sec'] == fn['sec']) != 1:
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
        if length < 6:
            continue
        literal = source[start:start + length]
        offset = body.find(literal)
        while offset >= 0:
            position = offset - start
            offset = body.find(literal, offset + 1)
            if position < 0 or position + len(source) > len(body):
                continue
            address = base + position
            retail = body[position:position + len(source)]
            a, b = bytearray(source), bytearray(retail)
            for field in fields:
                a[field:field + 4] = b[field:field + 4] = bytes(4)
            if a != b:
                continue
            try:
                branches = branch_fields(retail, address)
                branch_fields(source, address)
            except ValueError:
                continue
            target_start = m['rva2off'](address - pe.OPTIONAL_HEADER.ImageBase)
            target_fields = {p - target_start: 6 for p in m['PE_RELOCS']
                             if target_start <= p < target_start + len(source)}
            target_fields.update({p: 20 for p in branches})
            if fields != target_fields:
                continue
            bindings = {}
            for r in sec['relocs']:
                p = r['vaddr']
                target = branches[p] if p in branches else struct.unpack_from('<I', retail, p)[0]
                addend = struct.unpack_from('<I', source, p)[0]
                bindings.setdefault(names[r['sym']]['name'], set()).add((target - addend) & 0xffffffff)
            if any(len(values) != 1 for values in bindings.values()):
                continue
            found.append({'address': hex(address), 'bytes': len(source), 'symbol': fn['name'],
                          'object': str(obj.relative_to(ROOT)),
                          'bindings': {n: hex(next(iter(v))) for n, v in bindings.items()}})
found.sort(key=lambda r: (-r['bytes'], r['address'], r['object']))
(HERE / 'discovery.json').write_text(json.dumps(found, indent=2) + '\n')
unique = {r['address']: r for r in found}
print('Discovery only:', len(found), 'variants;', len(unique), 'addresses;',
      sum(r['bytes'] for r in unique.values()), 'bytes')
