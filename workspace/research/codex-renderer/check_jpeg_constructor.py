#!/usr/bin/env python3
"""Complete APP readers, marker initialization and real decoder constructor proof."""
import argparse
import hashlib
import io
import json
from contextlib import redirect_stdout
from pathlib import Path
import struct
import subprocess
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import branch_fields, check, binding_target, is_function
from check_jpeg_dependencies import raw_target


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_c4_b88se')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher(instruction_aware=True)
    legacy = load_matcher()
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    definitions = {s['name']: s for s in symbols.values() if s['sec'] > 0}
    base_path = HERE / 'jpeg_dependency_packet.json'
    old = {int(r['address'], 16): r for r in json.loads(base_path.read_text())['functions']
           if r['unresolved'] == 0}
    records = []

    def verify(name, address, size, bindings, code_size=None):
        code_size = size if code_size is None else code_size
        target = raw_target(m, address, size)
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target[:code_size], address))
        assert sum(i.size for i in decoded) == code_size and decoded[-1].mnemonic == 'ret'
        padding = (-address - size) % 16
        assert raw_target(m, address + size, padding) == b'\xcc' * padding
        for scope in (m, legacy):
            scope['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        function = definitions[name]
        section = coff['sections'][function['sec'] - 1]
        assert function['value'] == 0 and section['rawsize'] == size
        assert is_function(raw, function)
        assert sum(s['sec'] == function['sec'] and is_function(raw, s)
                   for s in symbols.values()) == 1
        assert {symbols[r['sym']]['name'] for r in section['relocs']} <= set(bindings)
        original_score = legacy['cmd_diff'](hex(address), str(obj), name)
        if code_size == size:
            check(address, obj, name, matcher=m, bindings=bindings)
            assert m['cmd_diff'](hex(address), str(obj), name) == 100
            for callee, destination in bindings.items():
                try:
                    check(address, obj, name, matcher=m,
                          bindings=dict(bindings, **{callee: destination + 4}))
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                else:
                    raise AssertionError('wrong constructor-group binding accepted')
        else:
            # Packed selector bytes are data, not instructions to be decoded.
            candidate = raw[section['rawptr']:section['rawptr'] + size]
            offset = m['rva2off'](address - 0x10000000)
            branches = branch_fields(target[:code_size], address)
            fields = {p - offset: 6 for p in m['PE_RELOCS'] if offset <= p < offset + size}
            fields.update({p: 20 for p in branches})
            assert fields == {r['vaddr']: r['type'] for r in section['relocs']}
            assert len(fields) == len(section['relocs'])
            left, right = bytearray(target), bytearray(candidate)
            for relocation in section['relocs']:
                p = relocation['vaddr']
                item = symbols[relocation['sym']]
                addend = struct.unpack_from('<I', candidate, p)[0]
                destination = branches.get(p, struct.unpack_from('<I', target, p)[0])
                assert binding_target(bindings[item['name']], addend, relocation['type']) == destination
                assert binding_target(bindings[item['name']] + 4, addend, relocation['type']) != destination
                left[p:p + 4] = right[p:p + 4] = bytes(4)
            assert left == right and original_score == 100
            assert target[563:564] == b'\x90' and len(target[628:]) == 254
            assert max(target[628:]) < 16
            starts = {i.address for i in decoded}
            assert all(struct.unpack_from('<I', target, p)[0] in starts for p in range(564, 628, 4))
        return dict(symbol=name, address=hex(address), bytes=code_size, full_block_bytes=size,
                    bindings=bindings, legacy_score=original_score, strict_score=100,
                    negative_tests=len(bindings), unresolved=0)

    log = io.StringIO()
    with redirect_stdout(log):
        locations = {}
        for address, name in [(0x1004e980, '_examine_app0'), (0x1004ebd0, '_examine_app14'),
                              (0x1004f790, '_reset_marker_reader'), (0x1004f600, '_read_restart_marker'),
                              (0x1004f040, '_skip_variable'), (0x10055840, '_jinit_memory_mgr'),
                              (0x1004d460, '_consume_markers'), (0x1004d520, '_reset_input_controller'),
                              (0x1004d400, '_inputctl_start_input_pass')]:
            proof = old[address]
            bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                        for s in proof['sites']}
            if '_start_input_pass' in bindings:
                bindings['_inputctl_start_input_pass'] = bindings.pop('_start_input_pass')
            verify(name, address, proof['bytes'], bindings)
            locations[name] = address
        marker_path = HERE / 'jpeg_marker_block_packet.json'
        marker_proof, = [r for r in json.loads(marker_path.read_text())['functions']
                         if r['symbol'] == '_read_markers']
        symbol = definitions['_read_markers']
        section = coff['sections'][symbol['sec'] - 1]
        known = {s['symbol']: int(s['base'], 16) for s in marker_proof['sites']}
        bindings = {}
        for relocation in section['relocs']:
            item = symbols[relocation['sym']]
            bindings[item['name']] = (0x1004f280 + item['value'] if item['sec'] == symbol['sec']
                                      else known[item['name']])
        verify('_read_markers', 0x1004f280, 882, bindings, code_size=563)
        locations['_read_markers'] = 0x1004f280
        for name, address, size in [('_finish_input_pass', 0x1004d440, 17),
                                    ('_get_interesting_appn', 0x1004ec80, 326),
                                    ('_save_marker', 0x1004edd0, 622),
                                    ('_jinit_marker_reader', 0x1004f7c0, 131),
                                    ('_jpeg_CreateDecompress', 0x10049e00, 310)]:
            assert address not in old
            section = coff['sections'][definitions[name]['sec'] - 1]
            bindings = {symbols[r['sym']]['name']: locations[symbols[r['sym']]['name']]
                        for r in section['relocs']}
            records.append(verify(name, address, size, bindings))
            locations[name] = address
    (run / 'constructor_checks.log').write_text(log.getvalue())
    fixture = HERE / 'test_jpeg_app_markers.c'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
               '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
               '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
               '-DJPEG_MARKER_SOURCE_ROOT=' + str(reference.relative_to(HERE)),
               str(fixture), '-Wl,--gc-sections', '-o', str(run / 'app_fixture32')]
    build = subprocess.run(command, capture_output=True, text=True)
    (run / 'app_native_build.log').write_text(build.stdout + build.stderr)
    build.check_returncode()
    test = subprocess.run([command[-1]], capture_output=True, text=True)
    (run / 'app_native_test.log').write_text(test.stdout + test.stderr)
    test.check_returncode()
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  inputs_sha256=sha(run / 'inputs.json'), object_sha256=sha(obj),
                  functions=records, code_bytes=sum(r['bytes'] for r in records),
                  checker_sha256=sha(__file__), fixture_sha256=sha(fixture), native_command=command,
                  base_packet_sha256=sha(base_path), marker_packet_sha256=sha(marker_path),
                  checks_log_sha256=sha(run / 'constructor_checks.log'),
                  native_build_log_sha256=sha(run / 'app_native_build.log'),
                  native_test_log_sha256=sha(run / 'app_native_test.log'),
                  referee_mode='instruction-aware; legacy scores retained',
                  mask_adapter_sha256=sha(HERE / 'referee_branch_probe.py'),
                  strict_checker_sha256=sha(HERE / 'check_shape.py'), whole_file_identity=False)
    (HERE / 'jpeg_constructor_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', packet['code_bytes'], 'new code bytes; real APP save/suspend/resume fixture; not V4')


if __name__ == '__main__':
    main()
