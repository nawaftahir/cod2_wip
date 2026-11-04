#!/usr/bin/env python3
"""Replay source slice sizing, full switch data, bindings and volume mock test."""
import hashlib
import json
from pathlib import Path
import subprocess

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_image_memory_size import verify_local_switch


def main():
    run = HERE / 'baseline_jpeg_t8vfcrgk'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    source = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    proof = verify_local_switch(load_matcher(), obj, '_Image_SourceSliceSize',
                                0x1000e840, 135, 187, b'\x90', 5)
    rows = verify_local_switch(load_matcher(), obj, '_Image_CopyUploadRows',
                               0x1000e900, 226, 274, b'\x8b\xff', 14)
    test = HERE / 'test_image_volume.c'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-DIMAGE_CREATE_SOURCE=' + json.dumps(str(source / 'j_wavelet.c')),
               '-Wno-unused-parameter', str(test), '-o', str(run / 'volume_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'volume_fixture32')], check=True)
    row_command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
        '-Wno-unused-parameter', '-ffunction-sections', '-DIMAGE_VOLUME_SOURCE',
        '-DIMAGE_CREATE_SOURCE=' + json.dumps(str(source / 'j_wavelet.c')),
        str(HERE / 'test_image_upload_rows.c'), '-Wl,--gc-sections',
        '-o', str(run / 'rows_fixture32')]
    subprocess.run(row_command, check=True)
    subprocess.run([str(run / 'rows_fixture32')], check=True)
    fixtures = {name: hashlib.sha256((HERE / name).read_bytes()).hexdigest()
                for name in ('test_image_volume.c', 'test_image_memory.c', 'test_image_create.c', 'test_image_upload_rows.c')}
    packet = dict(status='REVIEWABLE', address='0x1000e840', slice_code_bytes=135,
        row_code_bytes=226, rows=rows,
        jump_table_bytes=20, format_table_bytes=31, alignment_bytes=1,
        anchor_sha256=EXPECTED, image=IMAGE, inputs=inputs, proof=proof,
        object_sha256=row['object_sha256'], fixtures=fixtures, fixture_command=command,
        row_fixture_command=row_command, fixture_passed=True, independent_review=False, whole_file_identity=False)
    (HERE / 'image_slice_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: slice135 + row226 code; complete switch tables, both referees, all13 bindings, negative and volume fixture')


if __name__ == '__main__':
    main()
