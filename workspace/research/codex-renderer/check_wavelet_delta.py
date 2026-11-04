#!/usr/bin/env python3
"""Replay complete alpha-delta helper; generic decoder remains unmatched."""
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
from check_wavelet_tables import main as check_tables
from verify_wavelet_initializers import recheck_packet


def main():
    run = HERE / 'baseline_jpeg_1v2df6oy'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    m = load_matcher()
    assert m['INV']['10010cb0']['size'] == 120
    extent = raw_target(m, 0x10010cb0, 144)
    assert extent[133] == 0xc3 and extent[134:] == b'\xcc' * 10
    m['INV']['10010cb0']['size'] = 134
    bindings = {'_Wavelet_DecodeValue': 0x10010c00, '_waveletDecodeAlpha': 0x1018a988}
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x10010cb0, obj, '_Wavelet_ApplyDelta', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x10010cb0', str(obj), '_Wavelet_ApplyDelta') == 100
    try:
        with redirect_stdout(io.StringIO()):
            check(0x10010cb0, obj, '_Wavelet_ApplyDelta', matcher=m,
                  bindings=dict(bindings, _Wavelet_DecodeValue=0x10010c01))
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong decoder destination accepted')
    check_tables()
    compiled_tables = recheck_packet(m, reference / 'common_types.h')
    test = HERE / 'test_wavelet_reference.c'
    executable = run / 'delta_fixture32'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror', '-Wno-unused-parameter',
               '-DWAVELET_SOURCE=' + json.dumps(str(reference / 'j_wavelet.c')),
               '-DWAVELET_CLUSTER_TEST', '-DWAVELET_DELTA_TEST', str(test), '-o', str(executable)]
    subprocess.run(command, check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(status='REVIEWABLE-FULL-BODY', address='0x10010cb0', bytes=134,
        old_inventory_size=120, anchor_sha256=EXPECTED, image=IMAGE,
        source=str(reference / 'j_wavelet.c'), dependencies=inputs['dependencies'],
        object_sha256=row['object_sha256'], command=row['command'], diagnostics=log.getvalue(),
        bindings={k: hex(v) for k, v in bindings.items()},
        decoder_dependency_status='PINNED-DESTINATION-UNMATCHED-BODY',
        source_table_compilation_verified=True, compiled_table_proof=compiled_tables,
        linked_symbol_ownership_verified=False, fixture_command=command,
        fixture_sha256=hashlib.sha256(test.read_bytes()).hexdigest(),
        host_fixture_passed=True, wrong_binding_rejected=True,
        independent_review=False, whole_file_identity=False)
    (HERE / 'wavelet_delta_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: full134-byte alpha-delta helper, both checkers, bindings, negative binding and32-bit fixtures')
    print('Generic decoder169 vs168 and outer1459 vs1471 remain DEFER; not V4')


if __name__ == '__main__':
    main()
