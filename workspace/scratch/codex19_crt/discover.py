#!/usr/bin/env python3
"""Find complete CRT-section matches, including truncated inventory extents.

Discovery only: no binding proof or coverage credit.
"""
import json
from pathlib import Path
import struct
import sys
from collections import defaultdict

import pefile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher
from check_shape import branch_fields, is_function

m = load_matcher()
pe = pefile.PE(str(ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
inv = {int(r['addr'], 16): r for r in
       json.loads((ROOT / 'glm/data/functions_gfx10.json').read_text())['functions']}
aliases = {'__alloca_probe': '__chkstk', '@__security_check_cookie@4': '__security_check_cookie'}
found = []
previous = json.loads((HERE / 'discovery.json').read_text()) if (HERE / 'discovery.json').exists() else json.loads((HERE / 'plan.json').read_text())
hints = defaultdict(set)
for row in previous:
    for name, values in row.get('code_bindings', {}).items():
        hints[name].update(int(v, 16) for v in values)
dirs = [HERE / 'obj', HERE.parent / 'codex17_crt/obj', HERE.parent / 'codex16_crt/obj',
        HERE.parent / 'codex_crt13/obj', HERE.parent / 'codex_crt14extra/obj']
for directory in dirs:
    for obj in sorted(directory.rglob('*.obj')):
        raw = obj.read_bytes()
        c = m['parse_coff'](raw)
        symbols = {s['idx']: s for s in c['symbols']}
        for fn in symbols.values():
            if fn['sec'] <= 0 or fn['value'] != 0 or not is_function(raw, fn):
                continue
            sec = c['sections'][fn['sec'] - 1]
            if not sec['flags'] & 0x20 or sec['rawsize'] < 1:
                continue
            if sum(is_function(raw, s) for s in symbols.values() if s['sec'] == fn['sec']) != 1:
                continue
            code = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
            candidates = [a for a, r in inv.items() if a >= 0x100f5000 and
                          r['name'].lstrip('_') == fn['name'].lstrip('_')]
            candidates = sorted(set(candidates) | hints[fn['name']])
            for address in candidates:
                retail = pe.get_data(address - 0x10000000, len(code))
                if len(retail) != len(code):
                    continue
                try:
                    branches = branch_fields(retail, address)
                    branch_fields(code, address)
                except ValueError:
                    continue
                start = m['rva2off'](address - 0x10000000)
                fields = {p - start: 6 for p in m['PE_RELOCS'] if start <= p < start + len(code)}
                fields.update({p: 20 for p in branches})
                if fields != {r['vaddr']: r['type'] for r in sec['relocs']}:
                    continue
                a, b = bytearray(retail), bytearray(code)
                bindings = {}
                code_bindings = {}
                for reloc in sec['relocs']:
                    p = reloc['vaddr']
                    name = symbols[reloc['sym']]['name']
                    target = branches[p] if p in branches else struct.unpack_from('<I', retail, p)[0]
                    addend = struct.unpack_from('<I', code, p)[0]
                    bindings.setdefault(name, set()).add((target - addend) & 0xffffffff)
                    if reloc['type'] == 20:
                        code_bindings.setdefault(name, set()).add((target - addend) & 0xffffffff)
                    a[p:p + 4] = b[p:p + 4] = b'\0' * 4
                if a != b:
                    continue
                next_entry = min(a for a in inv if a > address)
                tail = next_entry - address - len(code)
                boundary = 0 <= tail <= 15 and pe.get_data(address + len(code) - 0x10000000, tail) == b'\xcc' * tail
                unknown = {name: [hex(v) for v in values] for name, values in bindings.items()
                           if not all(inv.get(v, {}).get('name') == aliases.get(name, name) for v in values)}
                found.append({'address': hex(address), 'bytes': len(code), 'symbol': fn['name'],
                              'object': str(obj.relative_to(ROOT)), 'boundary': boundary,
                              'code_bindings': {n: [hex(v) for v in vs] for n, vs in code_bindings.items()},
                              'unknown_bindings': unknown})
found.sort(key=lambda r: -r['bytes'])
(HERE / 'discovery.json').write_text(json.dumps(found, indent=2) + '\n')
unique = {row['address']: row for row in found}
print('Discovery only:', len(found), 'object matches;', len(unique),
      'unique functions;', sum(row['bytes'] for row in unique.values()), 'bytes')
if '--verbose' in sys.argv:
    for row in found:
        print(row['address'], row['bytes'], row['symbol'], row['boundary'],
              row['object'], list(row['unknown_bindings']))
