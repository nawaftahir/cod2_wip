#!/usr/bin/env python3
"""Complete source/binding proofs for the sequential/progressive entropy group."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import struct
import subprocess
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check, branch_fields
from check_jpeg_dependencies import raw_target


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    run = HERE / 'baseline_jpeg_mi1di9r9'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert reference == HERE / 'scratch/codex_jpeg_entropy_api'
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    raw = obj.read_bytes()
    m = load_matcher()
    assert sha(m['DLL']) == EXPECTED
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    definitions = {s['name']: s for s in symbols.values() if s['sec'] > 0}
    expected = {'_jpeg_make_d_derived_tbl': (0x1004c5e0, 712),
                '_jpeg_huff_decode': (0x1004c9d0, 211),
                '_decode_mcu': (0x1004cb30, 1064),
                '_decode_mcu_DC_first': (0x10050980, 578),
                '_decode_mcu_AC_first': (0x10050bd0, 573),
                '_decode_mcu_DC_refine': (0x10050e10, 234),
                '_decode_mcu_AC_refine': (0x10050f00, 1056),
                '_start_pass_huff_decoder': (0x1004c490, 331),
                '_start_pass_phuff_decoder': (0x10050680, 614),
                '_jinit_huff_decoder': (0x1004cf60, 62),
                '_jinit_phuff_decoder': (0x10051320, 109)}
    prior_path = HERE / 'jpeg_dependency_packet.json'
    prior = json.loads(prior_path.read_text())
    assert prior['anchor_sha256'] == EXPECTED and prior['image'] == IMAGE
    old = {int(r['address'], 16): r for r in prior['functions'] if r['unresolved'] == 0}
    assert not {address for address, size in expected.values()} & set(old)
    dependencies = {'_jpeg_fill_bit_buffer': (0x1004c8b0, 286),
                    '_sequential_huff_restart': (0x1004cab0, 127),
                    '_process_restart': (0x100508f0, 134)}
    for name, (address, size) in dependencies.items():
        proof = old[address]
        assert proof['bytes'] == size
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                    for s in proof['sites']}
        check(address, obj, name, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
    locations = {name: address for name, (address, size) in expected.items()}
    locations.update({name: address for name, (address, size) in dependencies.items()})
    data_sizes = {'_extend_test': 64, '_extend_offset': 64,
                  '_progressive_extend_test': 64, '_progressive_extend_offset': 64,
                  '_jpeg_natural_order': 320}
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    records = []
    negative_log = io.StringIO()
    for name, (address, size) in expected.items():
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        target = raw_target(m, address, size)
        decoded = list(decoder.disasm(target, address))
        assert sum(i.size for i in decoded) == size and decoded[-1].mnemonic == 'ret'
        padding = (-address - size) % 16
        assert raw_target(m, address + size, padding) == b'\xcc' * padding
        section = coff['sections'][definitions[name]['sec'] - 1]
        candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
        branches = branch_fields(target, address)
        bindings = {}
        for relocation in section['relocs']:
            item = symbols[relocation['sym']]
            callee = item['name']
            offset = relocation['vaddr']
            if callee in locations:
                base = locations[callee]
            else:
                assert callee in data_sizes and relocation['type'] == 6
                destination = struct.unpack_from('<I', target, offset)[0]
                addend = struct.unpack_from('<I', candidate, offset)[0]
                base = (destination - addend) & 0xffffffff
                data = coff['sections'][item['sec'] - 1]
                start = data['rawptr'] + item['value']
                assert item['value'] + data_sizes[callee] <= data['rawsize']
                assert not any(item['value'] <= r['vaddr'] < item['value'] + data_sizes[callee]
                               for r in data['relocs'])
                assert raw[start:start + data_sizes[callee]] == raw_target(m, base, data_sizes[callee])
            if callee in bindings:
                assert bindings[callee] == base
            bindings[callee] = base
        check(address, obj, name, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
        with redirect_stdout(negative_log):
            for callee, base in bindings.items():
                wrong = dict(bindings)
                wrong[callee] = base + 4
                try:
                    check(address, obj, name, matcher=m, bindings=wrong)
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                    print('REJECTED', name, callee, str(error))
                else:
                    raise AssertionError('wrong entropy binding accepted')
        records.append(dict(symbol=name, address=hex(address), bytes=size, bindings=bindings,
                            negative_tests=len(bindings), unresolved=0))
    (run / 'entropy_negatives.log').write_text(negative_log.getvalue())
    parent, = json.loads((HERE / 'baseline_jpeg_0rckeoeb/results.json').read_text())
    regression = io.StringIO()
    with redirect_stdout(regression):
        for previous in parent['matches']:
            address = int(previous['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                           size=previous['bytes'], thunk=False)
            check(address, obj, previous['symbol'], matcher=m)
            assert m['cmd_diff'](hex(address), str(obj), previous['symbol']) == 100
    (run / 'entropy_regression.log').write_text(regression.getvalue())
    subprocess.run(['python3', str(HERE / 'check_jpeg_image_loader.py'), '--run', str(run)], check=True)
    native_path = run / 'image_loader_native_packet.json'
    native = json.loads(native_path.read_text())
    assert native['status'] == 'NATIVE-SOURCE-INTEGRATION-PASS' and native['source_reference'] == str(reference)
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run), object_sha256=sha(obj),
                  inputs_sha256=sha(run / 'inputs.json'), functions=records,
                  code_bytes=sum(r['bytes'] for r in records), data_sizes=data_sizes,
                  base_packet_sha256=sha(prior_path), checker_sha256=sha(__file__),
                  native_packet_sha256=sha(native_path), regression_functions=len(parent['matches']),
                  negative_log_sha256=sha(run / 'entropy_negatives.log'),
                  regression_log_sha256=sha(run / 'entropy_regression.log'), whole_file_identity=False)
    (HERE / 'jpeg_entropy_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: eleven entropy functions /5544 code bytes; all122 parent shapes retained; not V4')


if __name__ == '__main__':
    main()
