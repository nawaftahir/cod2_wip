#!/usr/bin/env python3
"""Full parser source, local tables, SDK dependency identity and boundary proof."""
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
CLEAN = '--clean' in sys.argv
SOURCES = ROOT / 'gfx/target/src/codex_parsers' if CLEAN else HERE
OBJECTS = ROOT / 'gfx/target/build/codex30_parser/libraries' if CLEAN else HERE / 'obj'
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher, EXPECTED
from check_shape import branch_fields, is_function
from check_dxerr_dependency import members


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def equal(a, b):
    if a != b:
        raise ValueError('complete source or dependency differs')


def binding(actual, base, addend):
    if actual != (base + addend) & 0xffffffff:
        raise ValueError('wrong symbol binding')


def negative(function, *args):
    try:
        function(*args)
    except ValueError:
        return
    raise AssertionError('negative accepted')


def main():
    compiler = HERE.parent / 'codex19_dxerr/check.py'
    assert sha(compiler) == '2d2436d55793b71298193896b144d66405aa3a1ec564e68d61c85c947b21afae'
    spec = importlib.util.spec_from_file_location('compiler_proof', compiler)
    prior = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(prior)
    assert all(sha(compiler.parent / 'compiler' / n) == h for n, h in prior.COMPILER.items())
    sdk = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
    assert sha(sdk) == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    oracle = list(members(sdk.read_bytes()))
    discovery_path = HERE.parent / 'codex35_sdk/discovery.json'
    discovery = json.loads(discovery_path.read_text())
    refs = {n: r for r in discovery for n in r['symbols']}
    m = load_matcher()
    pe = pefile.PE(data=m['_d'])
    d = Cs(CS_ARCH_X86, CS_MODE_32)
    rows = []
    for prefix, code_bytes in [('d3dxtok', 1128), ('d3dxasm', 1263), ('d3dxshader', 3691)]:
        name = '?' + prefix + '_parse@D3DXShader@@YGHXZ'
        ref = refs[name]
        address, = [int(v, 16) for v in ref['placements']]
        obj = OBJECTS / (prefix + '.obj')
        raw = obj.read_bytes()
        c = m['parse_coff'](raw)
        symbols = {s['idx']: s for s in c['symbols']}
        fn, = [s for s in symbols.values() if s['name'] == name and s['sec'] > 0]
        assert fn['value'] == 0 and is_function(raw, fn)
        sec = c['sections'][fn['sec'] - 1]
        assert sec['flags'] & 32
        assert sum(is_function(raw, s) for s in symbols.values() if s['sec'] == fn['sec']) == 1
        body = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
        original = oracle[ref['member']]
        oc = m['parse_coff'](original)
        onames = {s['idx']: s for s in oc['symbols']}
        os = oc['sections'][ref['section'] - 1]
        assert sec['rawsize'] == os['rawsize'] == ref['section_bytes']
        fields = {r['vaddr']: r['type'] for r in sec['relocs']}
        assert fields == {r['vaddr']: r['type'] for r in os['relocs']}
        assert len(fields) == len(sec['relocs']) == len(os['relocs'])
        retail = pe.get_data(address - 0x10000000, len(body))
        a, b = bytearray(body), bytearray(retail)
        o = bytearray(original[os['rawptr']:os['rawptr'] + os['rawsize']])
        branches = branch_fields(retail[:code_bytes], address)
        start = m['rva2off'](address - 0x10000000)
        expected = {p - start: 6 for p in m['PE_RELOCS'] if start <= p < start + len(body)}
        expected.update({p: 20 for p in branches})
        assert fields == expected
        old_reloc = {r['vaddr']: r for r in os['relocs']}
        bases, section_bases, proofs = {}, {}, []
        for r in sec['relocs']:
            p = r['vaddr']
            symbol = symbols[r['sym']]
            old = onames[old_reloc[p]['sym']]
            addend = struct.unpack_from('<I', body, p)[0]
            target = branches[p] if r['type'] == 20 else struct.unpack_from('<I', retail, p)[0]
            if symbol['sec'] == fn['sec']:
                base = address + symbol['value']
                assert old['sec'] == ref['section']
                assert symbol['value'] + addend == old['value'] + struct.unpack_from('<I', o, p)[0]
                kind = 'SOURCE-LOCAL-CODE-OR-TABLE'
            else:
                assert symbol['name'] == old['name']
                base = (target - addend) & 0xffffffff
                if symbol['name'].startswith('??_C@'):
                    ss = c['sections'][symbol['sec'] - 1]
                    assert symbol['sec'] > 0 and not ss['relocs'] and symbol['value'] == 0
                    equal(raw[ss['rawptr']:ss['rawptr'] + ss['rawsize']],
                          pe.get_data(base - 0x10000000, ss['rawsize']))
                    kind = 'SOURCE-STRING'
                elif is_function(original, old):
                    dep = refs[symbol['name']]
                    assert base in [int(v, 16) for v in dep['placements']]
                    depraw = oracle[dep['member']]
                    depc = m['parse_coff'](depraw)
                    deps = depc['sections'][dep['section'] - 1]
                    depretail = pe.get_data(base - 0x10000000, deps['rawsize'])
                    x = bytearray(depraw[deps['rawptr']:deps['rawptr'] + deps['rawsize']])
                    y = bytearray(depretail)
                    for rr in deps['relocs']:
                        x[rr['vaddr']:rr['vaddr'] + 4] = y[rr['vaddr']:rr['vaddr'] + 4] = bytes(4)
                    equal(x, y)
                    kind = 'AUTHENTIC-SDK-CALLEE-IDENTITY-ZERO-CREDIT'
                else:
                    assert old['sec'] > 0
                    ds = oc['sections'][old['sec'] - 1]
                    assert not ds['flags'] & 32 and not ds['relocs']
                    section_base = base - old['value']
                    assert section_bases.setdefault(old['sec'], section_base) == section_base
                    if ds['flags'] & 128:
                        region, = [s for s in pe.sections if s.VirtualAddress <= section_base - 0x10000000
                                   and section_base - 0x10000000 + ds['rawsize'] <= s.VirtualAddress + s.Misc_VirtualSize]
                        assert region.Characteristics & 0x80000000
                        # PE has no file bytes for this zero-initialized storage.
                        backed = max(0, min(ds['rawsize'], region.SizeOfRawData -
                                           (section_base - 0x10000000 - region.VirtualAddress)))
                        equal(pe.get_data(section_base - 0x10000000, backed), bytes(backed))
                    else:
                        equal(original[ds['rawptr']:ds['rawptr'] + ds['rawsize']],
                              pe.get_data(section_base - 0x10000000, ds['rawsize']))
                    kind = 'AUTHENTIC-SDK-GLOBAL-STORAGE-ZERO-CREDIT'
            assert bases.setdefault(symbol['name'], base) == base
            binding(target, base, addend)
            negative(binding, target, base + 1, addend)
            proofs.append({'offset': p, 'symbol': symbol['name'], 'base': hex(base),
                           'addend': addend, 'kind': kind})
            a[p:p + 4] = b[p:p + 4] = o[p:p + 4] = bytes(4)
        equal(a, b)
        equal(a, o)
        changed = bytearray(a)
        changed[0] ^= 1
        negative(equal, changed, b)
        changed = bytearray(a)
        changed[code_bytes - 1] ^= 1
        negative(equal, changed, b)
        ins = list(d.disasm(retail[:code_bytes], address))
        assert sum(i.size for i in ins) == code_bytes and ins[-1].mnemonic == 'ret'
        starts = {i.address for i in ins}
        for i in ins:
            if i.mnemonic.startswith('j') and i.op_str.startswith('0x'):
                assert int(i.op_str, 16) in starts
        assert (len(body) - code_bytes) % 4 == 0
        assert any(s['sec'] == fn['sec'] and s['value'] == code_bytes for s in symbols.values())
        for p in range(code_bytes, len(body), 4):
            assert fields[p] == 6
            assert struct.unpack_from('<I', retail, p)[0] in starts
        m['INV'][f'{address:x}']['size'] = len(body)
        with contextlib.redirect_stdout(io.StringIO()):
            assert m['cmd_diff'](hex(address), str(obj), name) == 100
        assert all(p.stat().st_mtime <= obj.stat().st_mtime for p in
                   [SOURCES / (prefix + '.cpp'), SOURCES / (prefix + '_actions.inc'), SOURCES / 'parser_core.h'])
        rows.append({'symbol': name, 'address': hex(address), 'bytes': code_bytes,
                     'section_bytes': len(body), 'excluded_table_bytes': len(body) - code_bytes,
                     'source': str((SOURCES / (prefix + '.cpp')).relative_to(ROOT)),
                     'object': str(obj.relative_to(ROOT)), 'bindings': proofs,
                     'original_referee_match': 100})
    paths = [sdk, discovery_path, *[p for p in HERE.iterdir()
             if p.suffix in ('.cpp', '.h', '.inc', '.py', '.sh', '.mk')],
             *[p for p in SOURCES.iterdir() if p.suffix in ('.cpp', '.h', '.inc')],
             *(OBJECTS / (n + '.obj') for n in ('d3dxtok', 'd3dxasm', 'd3dxshader'))]
    packet = {'status': 'REVIEWABLE', 'whole_file_identity': False,
              'anchor_sha256': EXPECTED, 'source_class': 'reconstructed SDK parser C++; SDK dependencies external',
              'compiler_files': prior.COMPILER, 'rows': rows,
              'build_image': ('sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131'
                              if CLEAN else 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'),
              'compile_flags': '/O1 /Oy- /hotpatch /MT /Gy',
              'verified_instruction_bytes': sum(r['bytes'] for r in rows),
              'negative_tests_passed': True,
              'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
    (HERE / ('clean_packet.json' if CLEAN else 'packet.json')).write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(rows), 'complete source parser bodies;', packet['verified_instruction_bytes'], 'instruction bytes')


if __name__ == '__main__':
    main()
