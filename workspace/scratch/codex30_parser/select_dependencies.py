#!/usr/bin/env python3
"""Exclude source-replaced SDK definitions from a private dependency archive.

This changes dependency selection, not retail bytes or reconstructed objects.
All retained SDK code remains an opaque external dependency with zero credit.
"""
import hashlib
import json
from pathlib import Path
import struct
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'gfx/tools'), str(ROOT / 'codex/renderer')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
from check_shape import is_function


def main():
    sdk = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
    assert hashlib.sha256(sdk.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    run = ROOT / 'gfx/target/build/codex30_parser'
    output = run / 'dependencies'
    output.mkdir(parents=True, exist_ok=True)
    m = load_matcher()
    replacements = {}
    for obj in (run / 'libraries').glob('*.obj'):
        if obj.stem not in ('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants'):
            continue
        raw = obj.read_bytes()
        c = m['parse_coff'](raw)
        for s in c['symbols']:
            if s['sec'] > 0 and is_function(raw, s):
                assert s['name'] not in replacements
                replacements[s['name']] = hashlib.sha256(raw).hexdigest()
    assert len(replacements) == 40
    removed, paths, inputs = [], [], {}
    for index, original in enumerate(members(sdk.read_bytes())):
        if original[:2] != b'\x4c\x01':
            continue
        raw = bytearray(original)
        c = m['parse_coff'](original)
        syms = {s['idx']: s for s in c['symbols']}
        sections = {s['sec'] for s in syms.values() if s['sec'] > 0 and s['name'] in replacements}
        symptr = struct.unpack_from('<I', raw, 8)[0]
        for number in sections:
            sec = c['sections'][number - 1]
            assert sec['flags'] & 0x1020 == 0x1020
            functions = [s for s in syms.values() if s['sec'] == number and is_function(original, s)]
            assert len(functions) == 1 and functions[0]['name'] in replacements and functions[0]['value'] == 0
            # Other sections may call the replaced public function, never its local labels.
            for other_number, other in enumerate(c['sections'], 1):
                if other_number not in sections:
                    for r in other['relocs']:
                        s = syms[r['sym']]
                        assert s['sec'] != number or s['name'] == functions[0]['name']
            header = 20 + struct.unpack_from('<H', raw, 16)[0] + (number - 1) * 40
            struct.pack_into('<IIIIIIHHI', raw, header + 8, 0, 0, 0, 0, 0, 0, 0, 0, sec['flags'] & ~0x1000)
            for s in syms.values():
                if s['sec'] != number:
                    continue
                offset = symptr + s['idx'] * 18
                struct.pack_into('<I', raw, offset + 8, 0)
                if s['name'] == functions[0]['name']:
                    struct.pack_into('<h', raw, offset + 12, 0)
                    assert s['sclass'] == 2 and s['naux'] == 0
                elif s['naux']:
                    assert s['name'] == '.text' and s['naux'] == 1
                    raw[offset + 18:offset + 36] = bytes(18)
            removed.append({'member': index, 'section': number, 'symbol': functions[0]['name']})
        path = output / ('member_%04d.obj' % index)
        path.write_bytes(raw)
        paths.append('build\\codex30_parser\\dependencies\\' + path.name)
        inputs[path.name] = {'original': hashlib.sha256(original).hexdigest(),
                             'selected': hashlib.sha256(raw).hexdigest()}
    assert {r['symbol'] for r in removed} == replacements.keys()
    (output / 'members.rsp').write_text('\n'.join(paths) + '\n')
    (HERE / 'dependency_selection.json').write_text(json.dumps({
        'source_credit': 0, 'sdk_sha256': hashlib.sha256(sdk.read_bytes()).hexdigest(),
        'source_objects': replacements, 'removed_definitions': removed, 'members': inputs,
        'note': 'Generated private SDK dependency selection; never a reconstructed library.'
    }, indent=2) + '\n')
    print('Selected dependency members:', len(paths), '; source-supplied definitions:', len(replacements))


if __name__ == '__main__':
    main()
