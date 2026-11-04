#!/usr/bin/env python3
"""Replay source-built frame-end bytes and its mock behavioral check."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess

from audit_legacy import load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    run = HERE / 'baseline_jpeg_n2weway4'
    inputs = json.loads((run / 'inputs.json').read_text())
    source = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    obj = run / 'job000.obj'
    row, = json.loads((run / 'results.json').read_text())
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    bindings = {n: int(a, 0) for n, a in json.loads((source / 'bindings.json').read_text()).items()}
    m = load_matcher()
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x10021f90, obj, '_R_EndFrame', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x10021f90', str(obj), '_R_EndFrame') == 100
    assert 'UNRESOLVED binding' not in log.getvalue()
    assert raw_target(m, 0x10021fe5, 11) == b'\xc3' + b'\xcc' * 10
    for name in bindings:
        try:
            with redirect_stdout(io.StringIO()):
                check(0x10021f90, obj, '_R_EndFrame', matcher=m,
                      bindings=dict(bindings, **{name: bindings[name] + 4}))
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError(name)
    fixture = HERE / 'test_frame_end.c'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
               str(fixture), '-o', str(run / 'frame_end_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'frame_end_fixture32')], check=True)
    packet = dict(status='REVIEWABLE', code_bytes=86, inputs=inputs,
                  object_sha256=row['object_sha256'], bindings=bindings,
                  diagnostics=log.getvalue(), fixture_command=command,
                  fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  fixture_passed=True, negative_bindings_passed=True,
                  independent_review=False, whole_file_identity=False)
    (run / 'frame_end_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: frame-end86 bytes, both referees/all bindings/negative checks/32-bit fixture; not V4')


if __name__ == '__main__':
    main()
