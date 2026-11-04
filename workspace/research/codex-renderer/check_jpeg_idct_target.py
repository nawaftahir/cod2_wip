#!/usr/bin/env python3
"""Native x86 target/source differential test; never reconstructed byte credit."""
import hashlib
import json
import subprocess

from audit_legacy import ANCHOR, EXPECTED
from batch_existing import HERE


def main():
    assert hashlib.sha256(ANCHOR.read_bytes()).hexdigest() == EXPECTED
    reference = HERE / 'scratch/jpeg_bgr'
    fixture = HERE / 'test_jpeg_idct_target.c'
    loader = HERE / 'scratch/codex_dxerr_switch/target_oracle.c'
    sources = [reference / name for name in ('jidctint.c', 'jidctflt.c', 'jidctred.c')]
    executable = HERE / 'scratch/codex_jpeg_api/idct_target32'
    command = ['cc', '-m32', '-malign-double', '-std=c99', '-O2', '-ffloat-store',
               str(fixture), *map(str, sources), '-o', str(executable)]
    subprocess.run(command, check=True)
    output = subprocess.run([str(executable), str(ANCHOR)], check=True,
                            capture_output=True, text=True).stdout.strip()
    assert output == '288 actual-target IDCT cases; 0 differing bytes; CW027F explicitly set'
    dependencies = sources + [fixture, loader] + sorted(reference.glob('*.h'))
    packet = dict(status='NATIVE-TARGET-DIFFERENTIAL-PASS', command=command,
        anchor_sha256=EXPECTED, cases=288, differing_bytes=0, output=output,
        hashes={str(p.relative_to(HERE)): hashlib.sha256(p.read_bytes()).hexdigest()
                for p in dependencies}, source_byte_credit=0, whole_file_identity=False,
        tested_control_word='0x027f', original_runtime_control_word_observed=False,
        methods=['islow8x8', 'float8x8', 'reduced4x4'], exhaustive=False)
    (HERE / 'scratch/codex_jpeg_api/idct_target_packet.json').write_text(
        json.dumps(packet, indent=2) + '\n')
    print(output)


if __name__ == '__main__':
    main()
