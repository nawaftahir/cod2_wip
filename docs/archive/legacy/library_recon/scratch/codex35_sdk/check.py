#!/usr/bin/env python3
"""Certify complete source-built SDK helpers and independently anchored names."""
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import struct
import sys

import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
TARGET = ROOT / 'gfx/target'
RUN = TARGET / 'build/codex35_sdk'
sys.path[:0] = [str(ROOT / 'gfx/tools'), str(ROOT / 'codex/renderer')]
from check_dxerr_dependency import members
from audit_legacy import load_matcher, EXPECTED
from check_shape import branch_fields, is_function


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def equal(a, b):
    if a != b:
        raise ValueError('complete source/body mismatch')


def negative(a, b):
    try:
        equal(a, b)
    except ValueError:
        return
    raise AssertionError('negative comparison accepted')


def main():
    compiler_check = HERE.parent / 'codex19_dxerr/check.py'
    assert sha(compiler_check) == '2d2436d55793b71298193896b144d66405aa3a1ec564e68d61c85c947b21afae'
    spec = importlib.util.spec_from_file_location('original_sdk_compiler', compiler_check)
    prior = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(prior)
    for name, digest in prior.COMPILER.items():
        assert sha(compiler_check.parent / 'compiler' / name) == digest
    sdk = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
    assert sha(sdk) == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    original = list(members(sdk.read_bytes()))
    discovery = json.loads((HERE / 'discovery.json').read_text())
    refs = {name: row for row in discovery for name in row['symbols']}
    m = load_matcher()
    pe = pefile.PE(data=m['_d'])
    dis = Cs(CS_ARCH_X86, CS_MODE_32)

    # The original creation routine independently fixes the callback names.
    carrier, = [r for r in discovery if r['symbols'][0].startswith('?Create@CConstant@')]
    address, = [int(v, 16) for v in carrier['placements']]
    carrier_address = address
    raw = original[carrier['member']]
    coff = m['parse_coff'](raw)
    names = {s['idx']: s for s in coff['symbols']}
    section = coff['sections'][carrier['section'] - 1]
    code = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
    retail = pe.get_data(address - 0x10000000, len(code))
    branches = branch_fields(retail, address)
    start = m['rva2off'](address - 0x10000000)
    fields = {p - start: 6 for p in m['PE_RELOCS'] if start <= p < start + len(code)}
    fields.update({p: 20 for p in branches})
    assert fields == {r['vaddr']: r['type'] for r in section['relocs']}
    a, b = bytearray(code), bytearray(retail)
    callbacks = {}
    for relocation in section['relocs']:
        p = relocation['vaddr']
        symbol = names[relocation['sym']]['name']
        addend = struct.unpack_from('<I', code, p)[0]
        value = branches[p] if relocation['type'] == 20 else struct.unpack_from('<I', retail, p)[0]
        if symbol.startswith('?Set@?$SetShaderConstant@'):
            target = (value - addend) & 0xffffffff
            assert callbacks.setdefault(symbol, target) == target
            assert target in [int(v, 16) for v in refs[symbol]['placements']]
            prior.require_binding(value, target, addend)
            try:
                prior.require_binding(value, target + 1, addend)
            except ValueError:
                pass
            else:
                raise AssertionError('wrong callback binding accepted')
        a[p:p + 4] = b[p:p + 4] = bytes(4)
    equal(a, b)

    rows, files = [], {}
    for stem, expected_count in [('instruction_predicates', 25), ('shader_native_constants', 12)]:
        source = TARGET / 'src/codex_libraries' / (stem + '.cpp')
        obj = RUN / 'libraries' / (stem + '.obj')
        assert source.stat().st_mtime <= obj.stat().st_mtime
        raw = obj.read_bytes()
        coff = m['parse_coff'](raw)
        names = {s['idx']: s for s in coff['symbols']}
        functions = [s for s in names.values() if s['sec'] > 0 and is_function(raw, s)]
        assert len(functions) == expected_count
        for fn in functions:
            sec = coff['sections'][fn['sec'] - 1]
            assert fn['value'] == 0 and sec['flags'] & 32 and not sec['relocs']
            assert sum(is_function(raw, s) for s in names.values() if s['sec'] == fn['sec']) == 1
            code = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
            ref = refs[fn['name']]
            assert len(code) == ref['section_bytes']
            oracle_raw = original[ref['member']]
            oracle_coff = m['parse_coff'](oracle_raw)
            oracle_sec = oracle_coff['sections'][ref['section'] - 1]
            oracle_fn, = [s for s in oracle_coff['symbols']
                          if s['name'] == fn['name'] and s['sec'] == ref['section']]
            assert oracle_fn['value'] == 0 and is_function(oracle_raw, oracle_fn)
            assert not oracle_sec['relocs']
            equal(code, oracle_raw[oracle_sec['rawptr']:oracle_sec['rawptr'] + oracle_sec['rawsize']])
            if stem == 'shader_native_constants':
                address = callbacks[fn['name']]
            else:
                address, = [int(v, 16) for v in ref['placements']]
            retail = pe.get_data(address - 0x10000000, len(code))
            equal(code, retail)
            assert not branch_fields(retail, address)
            start = m['rva2off'](address - 0x10000000)
            assert not any(start <= p < start + len(code) for p in m['PE_RELOCS'])
            instructions = list(dis.disasm(retail, address))
            assert sum(i.size for i in instructions) == len(code)
            assert instructions[-1].mnemonic == 'ret'
            starts = {i.address for i in instructions}
            for ins in instructions:
                if ins.mnemonic.startswith('j') and ins.op_str.startswith('0x'):
                    assert int(ins.op_str, 16) in starts
            changed = bytearray(code)
            changed[0] ^= 1
            negative(changed, retail)
            changed = bytearray(code)
            changed[-1] ^= 1
            negative(changed, retail)
            key = f'{address:x}'
            m['INV'][key] = {'addr': key, 'name': fn['name'], 'size': len(code), 'thunk': False}
            with contextlib.redirect_stdout(io.StringIO()):
                assert m['cmd_diff'](hex(address), str(obj), fn['name']) == 100
            rows.append({'symbol': fn['name'], 'address': hex(address), 'bytes': len(code),
                         'source': str(source.relative_to(ROOT)), 'object': str(obj.relative_to(ROOT)),
                         'original_referee_match': 100, 'bindings': {},
                         'identity': 'SDK typed section' if stem == 'instruction_predicates'
                                     else 'SDK creation routine callback relocation'})
        files[str(source.relative_to(ROOT))] = sha(source)
        files[str(obj.relative_to(ROOT))] = sha(obj)
    ordered = sorted((int(r['address'], 16), r['bytes']) for r in rows)
    assert all(a + n <= b for (a, n), (b, _) in zip(ordered, ordered[1:]))
    for path in [Path(__file__), HERE / 'discovery.json', HERE / 'build.sh', HERE / 'link.mk',
                 TARGET / 'src/codex_libraries/shader_build.mk', sdk,
                 *(ROOT / 'sdk/sum2004/Include').glob('*.h'),
                 *(ROOT / 'sdk/sum2004/Include').glob('*.inl')]:
        files[str(path.relative_to(ROOT))] = sha(path)
    packet = {'status': 'REVIEWABLE', 'whole_file_identity': False,
              'anchor_sha256': EXPECTED,
              'image': 'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131',
              'compiler_files': prior.COMPILER, 'files': files, 'rows': rows,
              'verified_instruction_bytes': sum(r['bytes'] for r in rows),
              'negative_tests_passed': True,
              'callback_identity_carrier': {'address': hex(carrier_address), 'source_credit': 0,
                                          'callbacks': {n: hex(v) for n, v in callbacks.items()}},
              'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'}
    (HERE / 'packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(rows), 'complete SDK source methods,', packet['verified_instruction_bytes'],
          'instruction bytes; opaque callback carrier receives zero source credit')


if __name__ == '__main__':
    main()
