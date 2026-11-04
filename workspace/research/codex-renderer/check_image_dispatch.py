#!/usr/bin/env python3
"""Replay genuine file caller's header validator and full image dispatch section."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_image_memory_size import verify_local_switch
from check_jpeg_dependencies import raw_target
from check_shape import check


def main(run=None, fixture='test_image_file_loader.c'):
    run = run or HERE / 'baseline_jpeg_87hqwidm'
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
    dispatcher = verify_local_switch(m, obj, '_Image_LoadFromData', 0x1000f900,
        261, 316, bytes.fromhex('8d4900'), 4,
        {'_Image_LoadBitmap': 0x1000f5a0, '_Image_LoadWavelet': 0x1000f380,
         '_Image_LoadDxtc': 0x1000f7b0})
    coff = m['parse_coff'](raw)
    bindings = {'_Renderer_Print': 0x10061c80}
    for address in (0x10193974, 0x101939b0):
        text = raw_target(m, address, 128).split(b'\0', 1)[0] + b'\0'
        found = []
        for symbol in coff['symbols']:
            if symbol['sec'] > 0 and symbol['name'].startswith('??_C@'):
                sec = coff['sections'][symbol['sec'] - 1]
                start = sec['rawptr'] + symbol['value']
                if raw[start:start + len(text)] == text:
                    found.append(symbol['name'])
        assert len(found) == 1
        bindings[found[0]] = address
    extent = raw_target(m, 0x1000f2a0, 80)
    assert extent[66] == 0xc3 and extent[67:] == b'\xcc' * 13
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x1000f2a0, obj, '_Image_CheckFileHeader', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x1000f2a0', str(obj), '_Image_CheckFileHeader') == 100
    try:
        with redirect_stdout(io.StringIO()):
            check(0x1000f2a0, obj, '_Image_CheckFileHeader', matcher=m,
                  bindings=dict(bindings, _Renderer_Print=0x10061c81))
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong print binding accepted')
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
        '-DIMAGE_CREATE_SOURCE=' + json.dumps(str(source / 'j_wavelet.c')),
        '-Wno-unused-parameter', str(HERE / fixture),
        '-o', str(run / 'file_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'file_fixture32')], check=True)
    fixtures = {name: hashlib.sha256((HERE / name).read_bytes()).hexdigest() for name in
        ('test_image_file_loader.c', 'test_image_bitmap_loader.c', 'test_image_all_upload.c',
         'test_image_volume.c', 'test_image_memory.c', 'test_image_create.c',
         'test_image_path_formatter.c', fixture)}
    packet = dict(status='REVIEWABLE', new_code_bytes=328, dispatcher=dispatcher,
        header_code_bytes=67, diagnostics=log.getvalue(), header_bindings=bindings,
        anchor_sha256=EXPECTED, inputs=inputs, object_sha256=row['object_sha256'],
        fixture_command=command, fixtures=fixtures, fixture_passed=True,
        dependency_closure=False, independent_review=False, whole_file_identity=False)
    (HERE / 'image_dispatch_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: dispatch261 + header67 code, all bindings/52-byte jump table, both referees and file fixture')
    return packet


if __name__ == '__main__':
    main()
