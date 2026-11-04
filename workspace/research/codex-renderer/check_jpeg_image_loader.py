#!/usr/bin/env python3
"""Native end-to-end source test; neither retail execution nor byte-match credit."""
import hashlib
import json
from pathlib import Path
import subprocess
import argparse
from batch_existing import HERE, IMAGE


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_0rckeoeb')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE
    assert reference in [HERE / 'scratch/codex_jpeg_master_api', HERE / 'scratch/codex_jpeg_entropy_api']
    assert not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    fixture = HERE / 'test_jpeg_image_loader.c'
    sources = [reference / name for name in ('jidctint.c', 'jidctfst.c', 'jidctflt.c', 'jidctred.c')]
    executable = run / 'image_loader_fixture32'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
               '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
               '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
               '-DJPEG_IMAGE_SOURCE_ROOT=' + str(reference.relative_to(HERE)),
               str(fixture)] + [str(source) for source in sources] + [
               '-Wl,--gc-sections', '-o', str(executable)]
    result = subprocess.run(command, capture_output=True, text=True)
    (run / 'image_loader_native_build.log').write_text(result.stdout + result.stderr)
    result.check_returncode()
    result = subprocess.run([str(executable)], capture_output=True, text=True)
    (run / 'image_loader_native_test.log').write_text(result.stdout + result.stderr)
    result.check_returncode()
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    packet = dict(status='NATIVE-SOURCE-INTEGRATION-PASS', source_reference=str(reference),
                  inputs_sha256=sha(run / 'inputs.json'), fixture_sha256=sha(fixture),
                  checker_sha256=sha(__file__), command=command, native_compiler='cc',
                  sources={str(source): sha(source) for source in sources},
                  cases=['colored3x2 JPEG -> BGRA163/135/100/255',
                         '8-scan progressive JPEG, DC/AC first/refine', 'missing file unchanged outputs',
                         'dimension-limit rejection', 'grayscale rejection',
                         'encoded-file ownership and balanced decoder allocations'],
                  mocked='filesystem, renderer allocator/error/print services only; actual codec and IDCT source',
                  build_log_sha256=sha(run / 'image_loader_native_build.log'),
                  test_log_sha256=sha(run / 'image_loader_native_test.log'),
                  byte_match_credit=0, original_runtime_equivalence=False, whole_file_identity=False)
    (run / 'image_loader_native_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    if reference.name == 'codex_jpeg_master_api':
        (HERE / 'jpeg_image_loader_native_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: real source-built codec/image loader; 5 image paths; zero byte-match credit')


if __name__ == '__main__':
    main()
