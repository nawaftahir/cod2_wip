#!/usr/bin/env python3
"""Verify header API and complete input dispatcher; exclude switch data credit."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from contextlib import redirect_stdout
import io

from capstone import Cs, CS_ARCH_X86, CS_MODE_32, CS_GRP_JUMP, CS_OP_IMM
from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check, is_function
from check_jpeg_dependencies import raw_target


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    run = HERE / 'baseline_jpeg_6c1izr_2'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert reference == HERE / 'scratch/codex_jpeg_input_api'
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher()
    assert sha(m['DLL']) == EXPECTED
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    prior_path = HERE / 'jpeg_dependency_packet.json'
    prior = json.loads(prior_path.read_text())
    assert prior['anchor_sha256'] == EXPECTED and prior['image'] == IMAGE
    dependency, = [r for r in prior['functions'] if r['symbol'] == '_default_decompress_parms']
    assert dependency['unresolved'] == 0 and dependency['bytes'] == 393
    bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                for s in dependency['sites']}
    assert bindings == {'__real@3ff0000000000000': 0x1019bc88}
    constant, = [s for s in symbols.values() if s['name'] == '__real@3ff0000000000000' and s['sec'] > 0]
    data = coff['sections'][constant['sec'] - 1]
    offset = data['rawptr'] + constant['value']
    assert constant['value'] + 8 <= data['rawsize'] and not data['relocs']
    assert raw[offset:offset + 8] == raw_target(m, 0x1019bc88, 8) == struct.pack('<d', 1.0)
    check(0x10049fa0, obj, '_default_decompress_parms', matcher=m, bindings=bindings)
    assert m['cmd_diff']('0x10049fa0', str(obj), '_default_decompress_parms') == 100
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    decoder.detail = True
    records = []
    for name, address, code_size, block_size in [('_jpeg_consume_input', 0x1004a1d0, 149, 183),
                                                ('_jpeg_read_header', 0x1004a130, 147, 147)]:
        function, = [s for s in symbols.values() if s['name'] == name and s['sec'] > 0]
        section = coff['sections'][function['sec'] - 1]
        assert function['value'] == 0 and is_function(raw, function)
        assert sum(s['sec'] == function['sec'] and is_function(raw, s)
                   for s in symbols.values()) == 1
        assert section['rawsize'] == block_size
        target = raw_target(m, address, block_size)
        candidate = raw[section['rawptr']:section['rawptr'] + block_size]
        instructions = list(decoder.disasm(target[:code_size], address))
        assert sum(i.size for i in instructions) == code_size and instructions[-1].mnemonic == 'ret'
        starts = {i.address for i in instructions}
        for instruction in instructions:
            if instruction.group(CS_GRP_JUMP) and instruction.operands[0].type == CS_OP_IMM:
                assert instruction.operands[0].imm in starts
        if block_size != code_size:
            assert target[149:152] == candidate[149:152] == bytes.fromhex('8d4900')
            assert target[172:] == candidate[172:] and len(target[172:]) == 11
            assert max(target[172:]) < 5
            for offset in range(152, 172, 4):
                assert struct.unpack_from('<I', target, offset)[0] in starts
            assert target[19:26] == b'\x0f\xb6\x80' + struct.pack('<I', address + 172)
            assert target[26:33] == b'\xff\x24\x85' + struct.pack('<I', address + 152)
        assert raw_target(m, address + block_size, (-address - block_size) % 16) == b'\xcc' * ((-address - block_size) % 16)
        bindings = {}
        for relocation in section['relocs']:
            symbol = symbols[relocation['sym']]
            if symbol['sec'] == function['sec']:
                base = address + symbol['value']
                assert base in starts or base in (address + 152, address + 172)
            else:
                assert symbol['name'] in ('_default_decompress_parms', '_jpeg_consume_input')
                base = {'_default_decompress_parms': 0x10049fa0, '_jpeg_consume_input': 0x1004a1d0}[symbol['name']]
            bindings[symbol['name']] = base
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=block_size, thunk=False)
        check(address, obj, name, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
        for symbol, base in bindings.items():
            wrong = dict(bindings)
            wrong[symbol] = base + 4
            try:
                check(address, obj, name, matcher=m, bindings=wrong)
            except ValueError as error:
                assert 'wrong binding' in str(error)
            else:
                raise AssertionError('wrong input binding accepted')
        records.append(dict(symbol=name, address=hex(address), code_bytes=code_size,
                            block_bytes=block_size, bindings=bindings, negative_tests=len(bindings)))
    parent = HERE / 'baseline_jpeg_96y3u0mv/results.json'
    regression_rows, = json.loads(parent.read_text())
    log = io.StringIO()
    with redirect_stdout(log):
        for previous in regression_rows['matches']:
            address = int(previous['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                           size=previous['bytes'], thunk=False)
            check(address, obj, previous['symbol'], matcher=m)
            assert m['cmd_diff'](hex(address), str(obj), previous['symbol']) == 100
    (run / 'input_regression.log').write_text(log.getvalue())
    fixture = HERE / 'test_jpeg_renderer_bridge.c'
    executable = run / 'input_fixture32'
    subprocess.run(['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra', '-Werror',
                    '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
                    '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
                    '-DJPEG_SOURCE_ROOT=scratch/codex_jpeg_input_api', str(fixture),
                    '-Wl,--gc-sections', '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, object_sha256=sha(obj),
                  inputs_sha256=sha(run / 'inputs.json'), run=str(run), functions=records,
                  closed_code_bytes=296, noncode_bytes_excluded=34,
                  checker_sha256=sha(__file__), fixture_sha256=sha(fixture),
                  base_packet_sha256=sha(prior_path), regression_functions=len(regression_rows['matches']),
                  regression_log_sha256=sha(run / 'input_regression.log'),
                  held='startup241 source shape only; master_selection dependency not closed')
    (HERE / 'jpeg_input_block_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: input149 + header147, switch34 excluded, 82 parent shapes retained; not V4')


if __name__ == '__main__':
    main()
