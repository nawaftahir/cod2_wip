#!/usr/bin/env python3
"""Replay fresh texture-creator objects, bindings, strings and 32-bit COM fixture."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    run = HERE / 'baseline_jpeg_4un7pbxe'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    raw = obj.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == row['object_sha256']
    m = load_matcher()
    coff = m['parse_coff'](raw)
    bindings = {'_renderer_device': 0x101d1bf8,
                '_Renderer_ErrorDescription@4': 0x100efe3c,
                '_Renderer_Error': 0x100138c0, '_can_mip_cubemaps': 0x101d496b}
    strings = []
    for text, address in (
        (b'Create2DTexture( %s, %i, %i, %i, %i ) failed: %08x = %s\0', 0x101935d4),
        (b'Create3DTexture( %s, %i, %i, %i, %i, %i ) failed: %08x = %s\0', 0x10193598),
        (b'CreateCubeTexture ( %s, %i, %i, %i ) failed: %08x = %s\0', 0x10193560)):
        assert raw_target(m, address, len(text)) == text
        found = []
        for symbol in coff['symbols']:
            if symbol['sec'] <= 0 or not symbol['name'].startswith('??_C@'):
                continue
            section = coff['sections'][symbol['sec'] - 1]
            start = section['rawptr'] + symbol['value']
            if raw[start:start + len(text)] == text:
                found.append(symbol['name'])
        assert len(found) == 1
        bindings[found[0]] = address
        strings.append(dict(symbol=found[0], address=hex(address), bytes=len(text)))
    log = io.StringIO()
    for address, symbol, size, padding in (
        (0x1000ce80, '_Image_Create2DTexture', 113, 15),
        (0x1000cf00, '_Image_Create3DTexture', 130, 14),
        (0x1000cf90, '_Image_CreateCubeTexture', 119, 9)):
        target = raw_target(m, address, size + padding)
        assert target[size - 1] == 0xc3 and target[size:] == b'\xcc' * padding
        with redirect_stdout(log):
            check(address, obj, symbol, matcher=m, bindings=bindings)
            assert m['cmd_diff'](hex(address), str(obj), symbol) == 100
        try:
            with redirect_stdout(io.StringIO()):
                check(address, obj, symbol, matcher=m,
                      bindings=dict(bindings, _renderer_device=0x101d1bfc))
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError('wrong device binding accepted')
    test = HERE / 'test_image_create.c'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-Wno-unused-parameter', str(test), '-o', str(run / 'image_create_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'image_create_fixture32')], check=True)
    packet = dict(status='REVIEWABLE', family_text_bytes=362, new_since_checkpoint21=130, independent_review=False,
        whole_file_identity=False, real_gpu_runtime=False, anchor_sha256=EXPECTED,
        image=IMAGE, inputs=inputs, object_sha256=row['object_sha256'],
        bindings={k: hex(v) for k, v in bindings.items()}, strings=strings,
        diagnostics=log.getvalue(),
        fixture_sha256=hashlib.sha256(test.read_bytes()).hexdigest(),
        fixture_command=command, host_fixture_passed=True, wrong_binding_rejected=True,
        error_dependencies='PINNED destinations and ABI; unmatched bodies')
    (HERE / 'image_create_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: 2D113 + 3D130 + cube119, both referees, all bindings/strings and stdcall fixture')


if __name__ == '__main__':
    main()
