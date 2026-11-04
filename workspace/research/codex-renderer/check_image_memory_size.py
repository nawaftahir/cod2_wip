#!/usr/bin/env python3
"""Audit a complete source-generated switch section without treating tables as code."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import struct
import subprocess

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check, binding_target


def verify_local_switch(m, obj, name, address, code_size, section_size, alignment, padding, callees=None):
    """Verify code and all source-generated local switch data without disk edits."""
    raw = obj.read_bytes()
    parse = m['parse_coff']
    coff = parse(raw)
    symbol = next(s for s in coff['symbols'] if s['name'] == name and s['sec'] > 0)
    section = coff['sections'][symbol['sec'] - 1]
    assert symbol['value'] == 0 and section['rawsize'] == section_size
    target = raw_target(m, address, section_size + padding)
    assert target[code_size - 1] == 0xc3
    assert target[code_size:code_size + len(alignment)] == alignment
    assert target[section_size:] == b'\xcc' * padding
    data = bytearray(raw[section['rawptr']:section['rawptr'] + section_size])
    names = {s['idx']: s for s in coff['symbols']}
    bindings, sites = {}, []
    pe_start = m['rva2off'](address - 0x10000000)
    expected_sites = {p - pe_start for p in m['PE_RELOCS'] if pe_start <= p < pe_start + section_size}
    assert expected_sites == {r['vaddr'] for r in section['relocs'] if r['type'] == 6}
    assert len({r['vaddr'] for r in section['relocs']}) == len(section['relocs'])
    for reloc in section['relocs']:
        local = names[reloc['sym']]
        assert reloc['type'] in (6, 20)
        if local['sec'] == symbol['sec']:
            assert 0 <= local['value'] < section_size
            symbol_address = address + local['value']
        else:
            assert callees and local['name'] in callees
            symbol_address = callees[local['name']]
        addend = struct.unpack_from('<I', data, reloc['vaddr'])[0]
        resolved = binding_target(symbol_address, addend, reloc['type'])
        target_operand = struct.unpack_from('<I', target, reloc['vaddr'])[0]
        if reloc['type'] == 20:
            target_operand = (address + reloc['vaddr'] + 4 + target_operand) & 0xffffffff
            operand = (resolved - address - reloc['vaddr'] - 4) & 0xffffffff
        else:
            operand = resolved
        assert resolved == target_operand
        struct.pack_into('<I', data, reloc['vaddr'], operand)
        bindings[local['name']] = symbol_address
        sites.append(dict(offset=reloc['vaddr'], symbol=local['name'], target=hex(resolved)))
    assert data == target[:section_size]

    def code_only(contents):
        parsed = parse(contents)
        selected = parsed['sections'][symbol['sec'] - 1]
        assert selected['rawsize'] == section_size
        selected['rawsize'] = code_size
        selected['relocs'] = [r for r in selected['relocs'] if r['vaddr'] < code_size]
        selected['nrel'] = len(selected['relocs'])
        return parsed

    assert m['INV'][f'{address:x}']['size'] == code_size
    log = io.StringIO()
    with redirect_stdout(log):
        check(address, obj, name, matcher=dict(m, parse_coff=code_only), bindings=bindings)
    wrong = {key: value + 1 for key, value in bindings.items()}
    try:
        with redirect_stdout(io.StringIO()):
            check(address, obj, name, matcher=dict(m, parse_coff=code_only), bindings=wrong)
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong switch binding accepted')
    try:
        m['INV'][f'{address:x}']['size'] = section_size
        with redirect_stdout(log):
            assert m['cmd_diff'](hex(address), str(obj), name) == 100
    finally:
        m['INV'][f'{address:x}']['size'] = code_size
    return dict(code_bytes=code_size, section_bytes=section_size, sites=sites,
                bindings=bindings, diagnostics=log.getvalue(), wrong_binding_rejected=True)


def main(run=None):
    run = run or HERE / 'baseline_jpeg_v9fqhj84'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    source = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    raw = obj.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == row['object_sha256']
    m = load_matcher()
    parse = m['parse_coff']
    coff = parse(raw)
    symbol = next(s for s in coff['symbols'] if s['name'] == '_Image_GetMipMemoryAmount' and s['sec'] > 0)
    section = coff['sections'][symbol['sec'] - 1]
    assert symbol['value'] == 0 and section['rawsize'] == 219
    candidate = bytearray(raw[section['rawptr']:section['rawptr'] + 219])
    target = raw_target(m, 0x1000ef40, 224)
    assert target[148] == 0xc3 and target[149:152] == bytes.fromhex('8d4900')
    assert target[219:] == b'\xcc' * 5
    names = {s['idx']: s for s in coff['symbols']}
    bindings = {}
    sites = []
    assert [r['vaddr'] for r in section['relocs']] == [23, 30, 152, 156, 160, 164]
    for reloc in section['relocs']:
        local = names[reloc['sym']]
        assert local['sec'] == symbol['sec'] and reloc['type'] == 6
        address = 0x1000ef40 + local['value']
        addend = struct.unpack_from('<I', candidate, reloc['vaddr'])[0]
        expected = binding_target(address, addend, 6)
        assert expected == struct.unpack_from('<I', target, reloc['vaddr'])[0]
        struct.pack_into('<I', candidate, reloc['vaddr'], expected)
        bindings[local['name']] = address
        sites.append(dict(offset=reloc['vaddr'], symbol=local['name'], target=hex(expected)))
    assert candidate == target[:219]  # Includes every jump and format-table byte.

    # Strict instruction checker sees only the independently audited 149-byte body.
    # The full object is neither edited nor truncated on disk; tables checked above.
    def code_only(data):
        parsed = parse(data)
        selected = parsed['sections'][symbol['sec'] - 1]
        assert selected['rawsize'] == 219
        selected['rawsize'] = 149
        selected['relocs'] = [r for r in selected['relocs'] if r['vaddr'] < 149]
        selected['nrel'] = len(selected['relocs'])
        return parsed

    log = io.StringIO()
    with redirect_stdout(log):
        check(0x1000ef40, obj, symbol['name'], matcher=dict(m, parse_coff=code_only), bindings=bindings)
    wrong = dict(bindings)
    wrong[names[section['relocs'][0]['sym']]['name']] += 1
    try:
        with redirect_stdout(io.StringIO()):
            check(0x1000ef40, obj, symbol['name'], matcher=dict(m, parse_coff=code_only), bindings=wrong)
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong switch-table binding accepted')
    with redirect_stdout(log):
        m['INV']['1000ef40']['size'] = 219
        assert m['cmd_diff']('0x1000ef40', str(obj), symbol['name']) == 100
    test = HERE / 'test_image_memory.c'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-DIMAGE_CREATE_SOURCE=' + json.dumps(str(source / 'j_wavelet.c')),
               '-Wno-unused-parameter', str(test), '-o', str(run / 'image_memory_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'image_memory_fixture32')], check=True)
    packet = dict(status='REVIEWABLE', address='0x1000ef40', code_bytes=149,
        jump_table_bytes=16, format_table_bytes=51, alignment_bytes=3,
        anchor_sha256=EXPECTED, image=IMAGE, inputs=inputs,
        object_sha256=row['object_sha256'], sites=sites, diagnostics=log.getvalue(),
        fixture_command=command, fixture_sha256=hashlib.sha256(test.read_bytes()).hexdigest(),
        included_fixture_sha256=hashlib.sha256((HERE / 'test_image_create.c').read_bytes()).hexdigest(),
        wrong_binding_rejected=True,
        fixture_passed=True, independent_review=False, whole_file_identity=False)
    (HERE / 'image_memory_size_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: strict149-byte code; original referee full219-byte section; all6 bindings and67 table bytes')
    return packet


if __name__ == '__main__':
    main()
