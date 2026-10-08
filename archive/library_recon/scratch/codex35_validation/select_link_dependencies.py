"""Expanded existing strict SDK selector; add byte-identical CompareHash46 callback.

Reused hash-verified selector chain, not a new selection algorithm.
"""
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
    run = ROOT / 'gfx/target/build/codex35_validation'
    output = run / 'dependencies'
    output.mkdir(parents=True, exist_ok=True)
    m = load_matcher()
    replacements = {}
    owners = {}
    coalesced = []
    for obj in (run / 'libraries').glob('*.obj'):
        if obj.stem not in ('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants', 'read_typed', 'shader_version', 'instruction_copy', 'shader_profiles', 'cparse_cast', 'nodes', 'asm_nodes', 'assembler', 'alloc', 'errors', 'lexer', 'preprocessor', 'compiler', 'types', 'program', 'flow', 'varying', 'pruning', 'strip', 'sort', 'duplicates', 'instructions', 'merge', 'coalesce', 'helpers', 'cleanup', 'order', 'transform', 'driver', 'predicate', 'program_order', 'pool_helpers', 'drivers', 'diagnostics', 'special_literals', 'swizzle', 'argument_helpers', 'register_split', 'output_groups', 'argument_alloc', 'validation'):
            continue
        raw = obj.read_bytes()
        c = m['parse_coff'](raw)
        for s in c['symbols']:
            if s['sec'] > 0 and is_function(raw, s):
                if s['name'] in replacements:
                    assert s['name'] == '??_GCArgument@D3DXShader@@QAEPAXI@Z'
                    previous_raw, previous_coff, previous_symbol, previous_path = owners[s['name']]
                    left = previous_coff['sections'][previous_symbol['sec'] - 1]
                    right = c['sections'][s['sec'] - 1]
                    assert previous_symbol['value'] == s['value'] == 0
                    assert previous_symbol['sclass'] == s['sclass'] == 2
                    assert left['rawsize'] == right['rawsize'] == 32
                    assert left['flags'] == right['flags'] and left['flags'] & 0x1000
                    assert previous_raw[left['rawptr']:left['rawptr'] + 32] == raw[right['rawptr']:right['rawptr'] + 32]
                    ls = {symbol['idx']: symbol for symbol in previous_coff['symbols']}
                    rs = {symbol['idx']: symbol for symbol in c['symbols']}
                    def edges(section, symbols):
                        return [(rel['vaddr'], rel['type'], symbols[rel['sym']]['name'], symbols[rel['sym']]['value']) for rel in section['relocs']]
                    assert edges(left, ls) == edges(right, rs)
                    assert {edge[2] for edge in edges(right, rs)} == {'??1CArgument@D3DXShader@@QAE@XZ', '??3CArgument@D3DXShader@@SGXPAX@Z'}
                    coalesced.append({'symbol': s['name'], 'bytes': 32, 'owner': previous_path, 'duplicate': str(obj), 'duplicate_sha256': hashlib.sha256(raw).hexdigest(), 'source_credit': 0})
                    continue
                replacements[s['name']] = hashlib.sha256(raw).hexdigest()
                owners[s['name']] = (raw, c, s, str(obj))
    assert len(replacements) == 287
    assert len(coalesced) == 1
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
                    private_helpers = {
                        '?CompareDuplicateInstructions@D3DXShader@@YGHIIPBX@Z': 415,
                        '?CompareDuplicateInstructionsStable@D3DXShader@@YGHIIPBX@Z': 44}
                    if s['name'] in private_helpers:
                        assert s['sclass'] == 3 and s['naux'] == 0
                        replacement = (run / 'libraries/instructions.obj').read_bytes()
                        rc = m['parse_coff'](replacement)
                        rsymbols = {fn['idx']: fn for fn in rc['symbols']}
                        rf, = [fn for fn in rc['symbols'] if fn['name'] == s['name'] and fn['sec'] > 0]
                        rs = rc['sections'][rf['sec'] - 1]
                        size = private_helpers[s['name']]
                        assert rf['sclass'] == 3 and rf['naux'] == 0 and rf['value'] == 0
                        assert sec['rawsize'] == rs['rawsize'] == size
                        assert original[sec['rawptr']:sec['rawptr'] + size] == replacement[rs['rawptr']:rs['rawptr'] + size]
                        assert [(r['vaddr'], r['type'], syms[r['sym']]['name']) for r in sec['relocs']] == [(r['vaddr'], r['type'], rsymbols[r['sym']]['name']) for r in rs['relocs']]
                        # The source TU owns every caller of these private helpers.
                        for other_number, other in enumerate(c['sections'], 1):
                            if other_number not in sections:
                                assert not any(syms[r['sym']]['sec'] == number for r in other['relocs'])
                        # Unreferenced original static symbol; never expose a different ABI.
                        raw[offset:offset + 18] = bytes(18)
                    elif s['sclass'] == 3:
                        callbacks = {'?CompareHash@D3DXShader@@YGHIIPBX@Z': ('argument_helpers.obj', 46),'?ComparePredicate@D3DXShader@@YGHIIPBX@Z': ('predicate.obj', 573),'?CompareDependency@D3DXShader@@YGHIIPBX@Z': ('order.obj', 59),
                            '?CompareIndex@D3DXShader@@YGHIIPBX@Z': ('flow.obj', 26),
                            '?CompareValue@D3DXShader@@YGHIIPBX@Z': ('duplicates.obj', 79),
                            '?CompareRegister@D3DXShader@@YGHIIPBX@Z': ('duplicates.obj', 142)}
                        assert s['name'] in callbacks and s['naux'] == 0
                        owner, size = callbacks[s['name']]
                        replacement = (run / 'libraries' / owner).read_bytes()
                        rc = m['parse_coff'](replacement)
                        rf, = [fn for fn in rc['symbols'] if fn['name'] == s['name'] and fn['sec'] > 0]
                        rs = rc['sections'][rf['sec'] - 1]
                        assert rf['value'] == 0 and rf['sclass'] == 2 and rf['naux'] == 0
                        assert sec['rawsize'] == rs['rawsize'] == size
                        assert not sec['relocs'] and not rs['relocs']
                        assert original[sec['rawptr']:sec['rawptr'] + size] == replacement[rs['rawptr']:rs['rawptr'] + size]
                        # Only a fully identical callback becomes a source-bound reference.
                        raw[offset + 16] = 2
                    else:
                        assert s['sclass'] == 2 and s['naux'] == 0
                elif s['naux']:
                    assert s['name'] == '.text' and s['naux'] == 1
                    raw[offset + 18:offset + 36] = bytes(18)
            removed.append({'member': index, 'section': number, 'symbol': functions[0]['name']})
        path = output / ('member_%04d.obj' % index)
        path.write_bytes(raw)
        paths.append('build\\codex35_validation\\dependencies\\' + path.name)
        inputs[path.name] = {'original': hashlib.sha256(original).hexdigest(),
                             'selected': hashlib.sha256(raw).hexdigest()}
    assert {r['symbol'] for r in removed} == replacements.keys()
    (output / 'members.rsp').write_text('\n'.join(paths) + '\n')
    (HERE / 'link_dependency_selection.json').write_text(json.dumps({
        'source_credit': 0, 'sdk_sha256': hashlib.sha256(sdk.read_bytes()).hexdigest(),
        'source_objects': replacements, 'coalesced_existing_source': coalesced, 'removed_definitions': removed, 'members': inputs,
        'note': 'Generated private SDK dependency selection; never a reconstructed library.'
    }, indent=2) + '\n')
    print('Selected dependency members:', len(paths), '; source-supplied definitions:', len(replacements))


if __name__ == '__main__':
    main()

