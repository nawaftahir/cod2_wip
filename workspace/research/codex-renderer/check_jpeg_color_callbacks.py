#!/usr/bin/env python3
"""Original-referee proof for the row-copy helper and grayscale callback."""
import hashlib
import io
import json
from contextlib import redirect_stdout
from pathlib import Path
import subprocess

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    run = HERE / 'baseline_jpeg_uo3oxv1l'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    parent = HERE / 'baseline_jpeg_mi1di9r9/results.json'
    previous, = json.loads(parent.read_text())
    current = {r['address']: r for r in row['matches']}
    m = load_matcher()
    log = io.StringIO()
    with redirect_stdout(log):
        for prior in previous['matches']:
            entry = current[prior['address']]
            assert entry['bytes'] == prior['bytes']
            address = int(entry['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=entry['symbol'], addr=f'{address:x}',
                                          size=entry['bytes'], thunk=False)
            check(address, obj, entry['symbol'], matcher=m)
    functions = []
    for address, symbol, size, padding, bindings in [
        (0x10057990, '_jcopy_sample_rows', 58, 6, {}),
        (0x1004bd20, '_grayscale_convert', 39, 9, {'_jcopy_sample_rows': 0x10057990}),
    ]:
        m['INV'][f'{address:x}'] = dict(name=symbol, addr=f'{address:x}', size=size, thunk=False)
        target = raw_target(m, address, size)
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target, address))
        assert sum(i.size for i in instructions) == size and instructions[-1].mnemonic == 'ret'
        assert raw_target(m, address + size, padding) == b'\xcc' * padding
        check(address, obj, symbol, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), symbol) == 100
        if bindings:
            try:
                with redirect_stdout(io.StringIO()):
                    check(address, obj, symbol, matcher=m,
                          bindings={'_jcopy_sample_rows': 0x10057994})
            except ValueError as error:
                assert 'wrong binding' in str(error)
            else:
                raise AssertionError('wrong helper binding accepted')
        functions.append(dict(address=hex(address), symbol=symbol, bytes=size, bindings=bindings))
    native = json.loads((HERE / 'jpeg_image_loader_native_packet.json').read_text())
    old_reference = native['source_reference']
    command = [arg.replace(old_reference, str(reference)).replace(
        'scratch/codex_jpeg_master_api', 'scratch/codex_jpeg_color_inline') for arg in native['command']]
    command[-1] = str(run / 'color_fixture32')
    build = subprocess.run(command, capture_output=True, text=True)
    (run / 'color_native_build.log').write_text(build.stdout + build.stderr)
    build.check_returncode()
    test = subprocess.run([command[-1]], capture_output=True, text=True)
    (run / 'color_native_test.log').write_text(test.stdout + test.stderr)
    test.check_returncode()
    (run / 'color_parent_regression.log').write_text(log.getvalue())
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  object_sha256=sha(obj), inputs_sha256=sha(run / 'inputs.json'),
                  checker_sha256=sha(__file__), functions=functions, code_bytes=97,
                  parent_shapes=len(previous['matches']), parent_results_sha256=sha(parent),
                  regression_log_sha256=sha(run / 'color_parent_regression.log'),
                  negative_tests=1, native_command=command,
                  fixture_sha256=sha(HERE / 'test_jpeg_image_loader.c'),
                  native_build_log_sha256=sha(run / 'color_native_build.log'),
                  native_test_log_sha256=sha(run / 'color_native_test.log'),
                  whole_file_identity=False)
    (HERE / 'jpeg_color_callbacks_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: 97 code bytes, original referee, 129 parent shapes, native JPEG fixture; not V4')


if __name__ == '__main__':
    main()
