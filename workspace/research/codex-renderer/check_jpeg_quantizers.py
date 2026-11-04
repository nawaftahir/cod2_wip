#!/usr/bin/env python3
"""Close six quantizer functions and their four small real callbacks."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import branch_fields, check
from check_jpeg_dependencies import raw_target


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    run = HERE / 'baseline_jpeg_0rckeoeb'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert reference == HERE / 'scratch/codex_jpeg_master_api'
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
    definitions = {s['name']: s for s in symbols.values() if s['sec'] > 0}
    expected = {'_quantize_ord_dither': (0x10055fc0, 287),
                '_quantize_fs_dither': (0x10056200, 436),
                '_start_pass_1_quant': (0x10056400, 234),
                '_jinit_1pass_quantizer': (0x10056520, 148),
                '_start_pass_2_quant': (0x10057710, 285),
                '_jinit_2pass_quantizer': (0x10057840, 296),
                '_finish_pass_1_quant': (0x100564f0, 1),
                '_new_color_map_1_quant': (0x10056500, 21),
                '_new_color_map_2_quant': (0x10057830, 15),
                '_finish_pass2': (0x10057700, 1)}
    prior_path = HERE / 'jpeg_dependency_packet.json'
    prior = json.loads(prior_path.read_text())
    assert prior['anchor_sha256'] == EXPECTED and prior['image'] == IMAGE
    old = {r['symbol']: r for r in prior['functions'] if r['unresolved'] == 0}
    assert not {address for address, size in expected.values()} & {int(r['address'], 16) for r in old.values()}
    dependencies = set()
    for name in expected:
        section = coff['sections'][definitions[name]['sec'] - 1]
        dependencies.update(symbols[r['sym']]['name'] for r in section['relocs'])
    dependencies -= set(expected)
    assert dependencies <= set(old)
    # Revalidate every directly referenced prior body on this new object.
    for name in sorted(dependencies):
        proof = old[name]
        address = int(proof['address'], 16)
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=proof['bytes'], thunk=False)
        bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                    for s in proof['sites']}
        check(address, obj, name, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    references = {int.from_bytes(m['_d'][offset:offset + 4], 'little') for offset in m['PE_RELOCS']}
    references.update(branch_fields(raw_target(m, 0x1004fc90, 442), 0x1004fc90).values())
    records = []
    negative_log = io.StringIO()
    for name, (address, size) in expected.items():
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        assert address in references
        target = raw_target(m, address, size)
        decoded = list(decoder.disasm(target, address))
        assert sum(i.size for i in decoded) == size
        if name == '_new_color_map_1_quant':
            assert decoded[-1].mnemonic == 'jmp' and target[-2:] == bytes.fromhex('ff22')
        else:
            assert decoded[-1].mnemonic == 'ret'
        padding = (-address - size) % 16
        assert raw_target(m, address + size, padding) == b'\xcc' * padding
        section = coff['sections'][definitions[name]['sec'] - 1]
        bindings = {}
        for relocation in section['relocs']:
            callee = symbols[relocation['sym']]['name']
            bindings[callee] = expected[callee][0] if callee in expected else int(old[callee]['address'], 16)
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
                    raise AssertionError('wrong quantizer binding accepted')
        records.append(dict(symbol=name, address=hex(address), bytes=size, bindings=bindings,
                            negative_tests=len(bindings), unresolved=0))
    (run / 'quantizer_negatives.log').write_text(negative_log.getvalue())
    parent = HERE / 'baseline_jpeg_2z946zv0/results.json'
    parent_row, = json.loads(parent.read_text())
    regression_log = io.StringIO()
    with redirect_stdout(regression_log):
        for previous in parent_row['matches']:
            address = int(previous['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                           size=previous['bytes'], thunk=False)
            check(address, obj, previous['symbol'], matcher=m)
            assert m['cmd_diff'](hex(address), str(obj), previous['symbol']) == 100
    (run / 'quantizer_regression.log').write_text(regression_log.getvalue())
    fixture = HERE / 'test_jpeg_quantizers.c'
    executable = run / 'quantizer_fixture32'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
               '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
               str(fixture), '-Wl,--gc-sections', '-o', str(executable)]
    subprocess.run(command, check=True)
    subprocess.run([str(executable)], check=True)
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run), object_sha256=sha(obj),
                  inputs_sha256=sha(run / 'inputs.json'), functions=records,
                  code_bytes=sum(r['bytes'] for r in records), dependencies_rechecked=sorted(dependencies),
                  base_packet_sha256=sha(prior_path), checker_sha256=sha(__file__),
                  fixture_sha256=sha(fixture), fixture_command=command,
                  fixture='real 1/2-pass quantizers; grayscale/color, 3 dithering modes; fixture clamp lookup',
                  regression_functions=len(parent_row['matches']),
                  negatives_log_sha256=sha(run / 'quantizer_negatives.log'),
                  regression_log_sha256=sha(run / 'quantizer_regression.log'), whole_file_identity=False)
    (HERE / 'jpeg_quantizer_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: six quantizer functions +four callbacks /1724 code bytes; not V4')


if __name__ == '__main__':
    main()
