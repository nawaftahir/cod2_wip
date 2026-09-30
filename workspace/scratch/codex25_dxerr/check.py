#!/usr/bin/env python3
"""Certify complete sibling lookup source sections, bindings and code boundaries."""
import contextlib
import hashlib
import io
import importlib.util
import json
from pathlib import Path
import struct
import sys

import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
spec = importlib.util.spec_from_file_location('codex19_lookup_check', HERE.parent / 'codex19_dxerr/check.py')
prior = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prior)
from audit_legacy import load_matcher
from check_shape import is_function

SPECS = (
    ('name_w', '_DXGetErrorString9W@4', 0x100de367, 72405, 48462, 8889),
    ('description_a', '_DXGetErrorDescription9A@4', 0x100efe3c, 11497, 9617, 1051),
    ('description_w', '_DXGetErrorDescription9W@4', 0x100f2b25, 11497, 9617, 1051),
)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def certify(stem, symbol_name, address, section_bytes, code_bytes, relocation_count, clean=False):
    source, obj = HERE / (stem + '.cpp'), HERE / (stem + '.obj')
    if clean:
        source = ROOT / 'gfx/target/src/codex_libraries' / ('dxerr9_' + stem + '.cpp')
        obj = ROOT / 'gfx/target/build/codex25_dxerr/libraries' / ('dxerr9_' + stem + '.obj')
        original = HERE.parent / 'codex19_dxerr/group_sdk_leaf.cpp' if stem == 'name' else HERE / (stem + '.cpp')
        assert sha(source) == sha(original)
    assert source.stat().st_mtime <= obj.stat().st_mtime
    raw = obj.read_bytes()
    m = load_matcher()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    fn, = [s for s in symbols.values() if s['name'] == symbol_name and s['sec'] > 0]
    sec = coff['sections'][fn['sec'] - 1]
    assert fn['value'] == 0 and is_function(raw, fn) and sec['flags'] & 0x20
    assert sum(is_function(raw, s) for s in symbols.values() if s['sec'] == fn['sec']) == 1
    assert sec['rawsize'] == section_bytes and len(sec['relocs']) == relocation_count
    rebuilt = raw[sec['rawptr']:sec['rawptr'] + section_bytes]
    pe = pefile.PE(str(prior.ANCHOR))
    retail = pe.get_data(address - 0x10000000, section_bytes)
    assert len(retail) == section_bytes
    off = m['rva2off'](address - 0x10000000)
    fields = {p - off for p in m['PE_RELOCS'] if off <= p < off + section_bytes}
    assert fields == {r['vaddr'] for r in sec['relocs']}
    assert len(fields) == relocation_count
    bindings, sites = {}, []
    a, b = bytearray(rebuilt), bytearray(retail)
    for relocation in sec['relocs']:
        p, symbol = relocation['vaddr'], symbols[relocation['sym']]
        assert relocation['type'] == 6 and 0 <= p <= section_bytes - 4
        addend = struct.unpack_from('<I', rebuilt, p)[0]
        target = struct.unpack_from('<I', retail, p)[0]
        if symbol['sec'] == fn['sec']:
            base = address + symbol['value']
            assert address <= base < address + section_bytes
            kind = 'SOURCE-LOCAL-CODE-OR-TABLE'
        else:
            assert symbol['name'].startswith('??_C@') and symbol['sec'] > 0
            data = coff['sections'][symbol['sec'] - 1]
            assert data['name'] == '.rdata' and not data['relocs']
            assert symbol['value'] == 0 and not data['flags'] & 0x20
            base = (target - addend) & 0xffffffff
            value = raw[data['rawptr']:data['rawptr'] + data['rawsize']]
            assert value and value[-1] == 0
            if stem.endswith('_w'):
                assert len(value) % 2 == 0 and value[-2:] == b'\0\0'
            prior.require_bytes(value, pe.get_data(base - 0x10000000, len(value)))
            kind = 'COMPLETE-SOURCE-STRING'
        assert bindings.setdefault(symbol['name'], base) == base
        prior.require_binding(target, base, addend)
        try:
            prior.require_binding(target, base + 1, addend)
        except ValueError:
            pass
        else:
            raise AssertionError('wrong binding accepted')
        sites.append({'offset': p, 'symbol': symbol['name'], 'base': hex(base),
                      'addend': addend, 'kind': kind})
        a[p:p + 4] = b[p:p + 4] = bytes(4)
    prior.require_bytes(a, b)
    wrong = bytearray(a)
    wrong[0] ^= 1
    try:
        prior.require_bytes(wrong, b)
    except ValueError:
        pass
    else:
        raise AssertionError('corrupted object accepted')
    decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(retail[:code_bytes], address))
    assert sum(i.size for i in decoded) == code_bytes
    assert decoded[-1].mnemonic == 'ret' and decoded[-1].op_str == '4'
    starts = {i.address for i in decoded}
    for instruction in decoded:
        assert instruction.mnemonic != 'call'
        if instruction.mnemonic.startswith('j') and instruction.op_str.startswith('0x'):
            assert int(instruction.op_str, 16) in starts
    assert min(s['value'] for s in symbols.values()
               if s['sec'] == fn['sec'] and s['value'] >= code_bytes) == code_bytes
    for site in sites:
        if site['offset'] >= code_bytes:
            assert site['kind'] == 'SOURCE-LOCAL-CODE-OR-TABLE'
            assert (int(site['base'], 16) + site['addend']) & 0xffffffff in starts
    meta = m['INV'][f'{address:x}']
    meta['size'] = section_bytes
    with contextlib.redirect_stdout(io.StringIO()):
        assert m['cmd_diff'](hex(address), str(obj), symbol_name) == 100
    return {'symbol': symbol_name, 'stem': stem, 'address': hex(address),
            'section_bytes': section_bytes, 'code_bytes': code_bytes,
            'excluded_table_bytes': section_bytes - code_bytes,
            'source_sha256': sha(source), 'object_sha256': sha(obj),
            'source': str(source.relative_to(ROOT)), 'object': str(obj.relative_to(ROOT)),
            'bindings': sites, 'negative_tests_passed': True, 'original_referee_match': 100}


def main():
    assert sha(prior.ANCHOR) == prior.ANCHOR_SHA
    assert sha(Path(prior.__file__)) == '2d2436d55793b71298193896b144d66405aa3a1ec564e68d61c85c947b21afae'
    assert all(sha(HERE.parent / 'codex19_dxerr/compiler' / n) == h
               for n, h in prior.COMPILER.items())
    rows = [certify(*spec, clean=True) for spec in SPECS]
    clean_rows = [certify('name', prior.SYMBOL, prior.ADDRESS, prior.SECTION_BYTES,
                          prior.CODE_BYTES, 8899, clean=True)]
    clean_rows.extend(rows)
    clean_summary = [{k: v for k, v in row.items() if k != 'bindings'}
                     | {'binding_count': len(row['bindings'])} for row in clean_rows]
    packet = {
        'status': 'REVIEWABLE', 'whole_file_identity': False,
        'source_class': 'reconstructed SDK-derived C++ lookups; not historical Microsoft source',
        'anchor_sha256': prior.ANCHOR_SHA, 'image': prior.IMAGE,
        'compiler_version': '13.10.4035', 'compiler_files': prior.COMPILER,
        'checker_sha256': sha(Path(__file__)), 'prior_checker_sha256': sha(Path(prior.__file__)),
        'build_script_sha256': sha(HERE / 'compile.sh'),
        'generator_sha256': sha(HERE / 'generate.py'),
        'sdk_lib_sha256': sha(ROOT / 'sdk/sum2004/Lib/DxErr9.lib'),
        'oracle_packet_sha256': sha(HERE / 'oracle_packet.json'),
        'mappings': {stem: sha(HERE / (stem + '_mapping.json')) for stem, *_ in SPECS},
        'clean_build_image': 'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131',
        'clean_build_module_sha256': sha(ROOT / 'gfx/target/src/codex_libraries/build.mk'),
        'clean_rows': clean_summary,
        'rows': rows, 'verified_instruction_bytes': sum(row['code_bytes'] for row in rows),
    }
    (HERE / 'packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(rows), 'complete source lookup bodies;', packet['verified_instruction_bytes'],
          'instruction bytes;', sum(len(row['bindings']) for row in rows),
          'relocation bindings; tables excluded')


if __name__ == '__main__':
    main()
