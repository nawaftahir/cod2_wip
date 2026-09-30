#!/usr/bin/env python3
"""Certify the complete source-built DX error lookup, including every binding."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import struct
import sys

import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher
from check_shape import is_function

ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
ANCHOR_SHA = '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
ADDRESS, SECTION_BYTES, CODE_BYTES = 0x100cc81b, 72524, 48427
SYMBOL = '_DXGetErrorString9A@4'
COMPILER = {
    'c1.dll': '31aad0d8d776d882ce7036b9f97c98a1d10fc1b8c068ebb9a2bb22a74225b4aa',
    'c1xx.dll': '884727948209dfd638596bd7256c881ea8cc71bdc99f02bdf6e0a1274966f0eb',
    'c2.dll': '5fdc4d339dd4f9cfbcb00bd2bc79622a7363aea64204a93c4bf66485886242ae',
    'cl.exe': 'c9d1dce113f9fcb2ebbc588efebfdc146098b503e4bcdbb146fe61e00ea7d025',
    'mspdb71.dll': 'f7ffe701485813a7f10861bc61ba533b09f1386c40c882e832f71881a705c75b',
    'msvcp71.dll': '1d5a627cb700400a7de751f0e7d3bf2f024e8d79f8c4a9f11a5a20a05c73ab9f',
    'msvcr71.dll': '91961cc52149826031f1b17b65a95a5c84c89d9a42f8621a43448c0fe897a94f',
}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require_binding(target, base, addend):
    if target != (base + addend) & 0xffffffff:
        raise ValueError('incorrect relocation destination')


def require_bytes(left, right):
    if left != right:
        raise ValueError('instruction or initializer differs')


def main():
    assert sha(ANCHOR) == ANCHOR_SHA
    assert all(sha(HERE / 'compiler' / n) == h for n, h in COMPILER.items())
    source = HERE / 'group_sdk_leaf.cpp'
    obj = HERE / 'group_4035_sdk_leaf.obj'
    assert source.stat().st_mtime <= obj.stat().st_mtime
    raw = obj.read_bytes()
    m = load_matcher()
    c = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in c['symbols']}
    fn, = [s for s in symbols.values() if s['name'] == SYMBOL and s['sec'] > 0]
    sec = c['sections'][fn['sec'] - 1]
    assert fn['value'] == 0 and is_function(raw, fn) and sec['flags'] & 0x20
    assert sum(is_function(raw, s) for s in symbols.values() if s['sec'] == fn['sec']) == 1
    assert sec['rawsize'] == SECTION_BYTES and len(sec['relocs']) == 8899
    rebuilt = raw[sec['rawptr']:sec['rawptr'] + SECTION_BYTES]
    pe = pefile.PE(str(ANCHOR))
    retail = pe.get_data(ADDRESS - 0x10000000, SECTION_BYTES)
    assert len(retail) == SECTION_BYTES
    off = m['rva2off'](ADDRESS - 0x10000000)
    fields = {p - off for p in m['PE_RELOCS'] if off <= p < off + SECTION_BYTES}
    assert fields == {r['vaddr'] for r in sec['relocs']}
    assert len(fields) == len(sec['relocs'])
    bindings, sites = {}, []
    a, b = bytearray(rebuilt), bytearray(retail)
    for r in sec['relocs']:
        p, symbol = r['vaddr'], symbols[r['sym']]
        assert r['type'] == 6 and 0 <= p <= SECTION_BYTES - 4
        addend = struct.unpack_from('<I', rebuilt, p)[0]
        target = struct.unpack_from('<I', retail, p)[0]
        if symbol['sec'] == fn['sec']:
            base = ADDRESS + symbol['value']
            assert ADDRESS <= base < ADDRESS + SECTION_BYTES
            kind = 'SOURCE-LOCAL-CODE-OR-TABLE'
        else:
            assert symbol['name'].startswith('??_C@') and symbol['sec'] > 0
            data = c['sections'][symbol['sec'] - 1]
            assert data['name'] == '.rdata' and not data['relocs']
            assert symbol['value'] == 0 and not data['flags'] & 0x20
            base = (target - addend) & 0xffffffff
            value = raw[data['rawptr']:data['rawptr'] + data['rawsize']]
            assert value and value[-1] == 0
            require_bytes(value, pe.get_data(base - 0x10000000, len(value)))
            kind = 'COMPLETE-SOURCE-STRING'
        assert bindings.setdefault(symbol['name'], base) == base
        require_binding(target, base, addend)
        try:
            require_binding(target, base + 1, addend)
        except ValueError:
            pass
        else:
            raise AssertionError('wrong binding accepted')
        sites.append({'offset': p, 'symbol': symbol['name'], 'base': hex(base),
                      'addend': addend, 'kind': kind})
        a[p:p + 4] = b[p:p + 4] = bytes(4)
    require_bytes(a, b)
    wrong = bytearray(a)
    wrong[0] ^= 1
    try:
        require_bytes(wrong, b)
    except ValueError:
        pass
    else:
        raise AssertionError('corrupted object accepted')
    dis = Cs(CS_ARCH_X86, CS_MODE_32)
    decoded = list(dis.disasm(retail[:CODE_BYTES], ADDRESS))
    assert sum(i.size for i in decoded) == CODE_BYTES
    assert decoded[-1].mnemonic == 'ret' and decoded[-1].op_str == '4'
    starts = {i.address for i in decoded}
    for i in decoded:
        assert i.mnemonic != 'call'
        if i.mnemonic.startswith('j') and i.op_str.startswith('0x'):
            assert int(i.op_str, 16) in starts
    # The first table follows the final source return, without a credited data byte.
    assert min(s['value'] for s in symbols.values() if s['sec'] == fn['sec']
               and s['value'] >= CODE_BYTES) == CODE_BYTES
    for site in sites:
        if site['offset'] >= CODE_BYTES:
            assert site['kind'] == 'SOURCE-LOCAL-CODE-OR-TABLE'
            assert (int(site['base'], 16) + site['addend']) & 0xffffffff in starts
    # Recheck the original masked referee across the full source section too.
    meta = m['INV'][f'{ADDRESS:x}']
    meta['size'] = SECTION_BYTES
    with contextlib.redirect_stdout(io.StringIO()):
        assert m['cmd_diff'](hex(ADDRESS), str(obj), SYMBOL) == 100
    packet = {
        'status': 'REVIEWABLE', 'whole_file_identity': False,
        'source_class': 'reconstructed SDK-derived C++ error-name switch; not historical source',
        'anchor_sha256': ANCHOR_SHA, 'image': IMAGE, 'compiler_version': '13.10.4035',
        'compiler_files': COMPILER, 'source': str(source.relative_to(ROOT)),
        'source_sha256': sha(source), 'object': str(obj.relative_to(ROOT)),
        'object_sha256': sha(obj), 'checker_sha256': sha(Path(__file__)),
        'build_script_sha256': sha(HERE / 'compile_4035.sh'),
        'generator_sha256': sha(HERE / 'group_cases.py'),
        'mapping_sha256': sha(HERE.parent / 'codex_dxerr_rebuild/mapping.json'),
        'sdk_lib_sha256': sha(ROOT / 'sdk/sum2004/Lib/DxErr9.lib'),
        'symbol': SYMBOL, 'address': hex(ADDRESS), 'section_bytes': SECTION_BYTES,
        'code_bytes': CODE_BYTES, 'excluded_table_bytes': SECTION_BYTES - CODE_BYTES,
        'bindings': sites, 'negative_tests_passed': True, 'original_referee_match': 100,
    }
    (HERE / 'packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: complete', SECTION_BYTES, 'byte section;', CODE_BYTES,
          'instruction bytes;', len(sites), 'bound relocations; tables excluded')


if __name__ == '__main__':
    main()
