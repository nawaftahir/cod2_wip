#!/usr/bin/env python3
"""Replay actual-caller loader match; no credit before dependency closure."""
import hashlib
import argparse
import io
import json
from contextlib import redirect_stdout
from pathlib import Path
import subprocess
from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import check


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_6wvslmqa')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    parent, = json.loads((HERE / 'baseline_jpeg_uo3oxv1l/results.json').read_text())
    assert {r['address'] for r in parent['matches']} <= {r['address'] for r in row['matches']}
    m = load_matcher()
    log = io.StringIO()
    with redirect_stdout(log):
        for previous in parent['matches']:
            address = int(previous['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                          size=previous['bytes'], thunk=False)
            check(address, obj, previous['symbol'], matcher=m)
        check(0x10014940, obj, '_R_LoadJpg', matcher=m)
        assert m['cmd_diff']('0x10014940', str(obj), '_R_LoadJpg') == 100
    (run / 'raw_loader_probe.log').write_text(log.getvalue())
    native = json.loads((HERE / 'jpeg_image_loader_native_packet.json').read_text())
    fixture = HERE / ('test_jpeg_image_loader_services.c' if reference.name in
                      ('codex_jpeg_service_abi', 'codex_jpeg_source_callbacks')
                      else 'test_jpeg_image_loader.c')
    command = [arg.replace(native['source_reference'], str(reference)).replace(
        'scratch/codex_jpeg_master_api', str(reference.relative_to(HERE))).replace(
        str(HERE / 'test_jpeg_image_loader.c'), str(fixture)) for arg in native['command']]
    command[-1] = str(run / 'raw_loader_fixture32')
    build = subprocess.run(command, capture_output=True, text=True)
    (run / 'raw_loader_native_build.log').write_text(build.stdout + build.stderr)
    build.check_returncode()
    test = subprocess.run([command[-1]], capture_output=True, text=True)
    (run / 'raw_loader_native_test.log').write_text(test.stdout + test.stderr)
    test.check_returncode()
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  source_root=str(reference), object_sha256=sha(obj),
                  inputs_sha256=sha(run / 'inputs.json'), checker_sha256=sha(__file__),
                  loader_bytes=785, original_referee_score=100, parent_shapes=len(parent['matches']),
                  unresolved='Loader relocation bindings/dependency closure; Image_LoadRaw164 vs169',
                  probe_log_sha256=sha(run / 'raw_loader_probe.log'), native_command=command,
                  fixture_sha256=sha(fixture),
                  native_build_log_sha256=sha(run / 'raw_loader_native_build.log'),
                  native_test_log_sha256=sha(run / 'raw_loader_native_test.log'),
                  byte_match_credit=0, whole_file_identity=False)
    (run / 'raw_loader_probe_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: actual-caller loader785 original/strict MATCH, 131 parent shapes, native JPEG fixture; no credit yet')


if __name__ == '__main__':
    main()
