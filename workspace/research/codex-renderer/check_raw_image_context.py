#!/usr/bin/env python3
"""Replay the real raw-image caller; unmatched upload dependencies earn no credit."""
import hashlib
import argparse
import io
import json
from contextlib import redirect_stdout
from pathlib import Path

from audit_legacy import load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_nwvfxb62')
    run = parser.parse_args().run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    m = load_matcher(instruction_aware=True)
    bindings = dict(_R_LoadJpg=0x10014940, _Image_Setup=0x1000ee30,
                    _Image_Upload3D_CopyData_PC=0x1000ec00,
                    _Image_Upload2D_CopyData_PC=0x1000ea20,
                    _image_renderer_free_temp=0x101d49f8,
                    _jpeg_renderer_free_file=0x101d4b00)
    m['INV']['1000fc30'] = dict(name='Image_LoadRaw', addr='1000fc30',
                               size=169, thunk=False)
    check(0x1000fc30, obj, '_Image_LoadRaw', matcher=m, bindings=bindings)
    assert m['cmd_diff']('0x1000fc30', str(obj), '_Image_LoadRaw') == 100
    for name in bindings:
        bad = dict(bindings)
        bad[name] += 4
        try:
            with redirect_stdout(io.StringIO()):
                check(0x1000fc30, obj, '_Image_LoadRaw', matcher=m, bindings=bad)
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError('wrong binding accepted: ' + name)
    parent, = json.loads((HERE / 'baseline_jpeg_uo3oxv1l/results.json').read_text())
    for previous in parent['matches']:
        address = int(previous['address'], 16)
        m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                      size=previous['bytes'], thunk=False)
        with redirect_stdout(io.StringIO()):
            check(address, obj, previous['symbol'], matcher=m)
    print('PASS: raw caller169; six negative bindings; 131 parent shapes; zero new credit')


if __name__ == '__main__':
    main()
