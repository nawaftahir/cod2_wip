#!/usr/bin/env python3
"""Differential target/source mapping test; analysis only, no match credit."""
import hashlib
import json
import random
import re
import subprocess

from audit_legacy import ANCHOR, EXPECTED
from batch_existing import HERE


def main():
    folder = HERE / 'scratch/codex_dxerr_switch'
    source = HERE / 'scratch/codex_dxerr_probe/j_100efe3c.c'
    assert hashlib.sha256(ANCHOR.read_bytes()).hexdigest() == EXPECTED
    values = {int(v, 0) for v in re.findall(
        r'(?:param_1\s*(?:==|<)|case)\s*(-?0x[0-9a-f]+)', source.read_text())}
    values = {v + delta for v in values for delta in (-1, 0, 1)}
    rng = random.Random(2005)
    values.update(rng.randrange(-2147483648, 2147483648) for _ in range(4096))
    data = ''.join(f'{v}\n' for v in sorted(values))
    driver = folder / 'source_stdin_oracle.c'
    driver.write_text('#include <stdio.h>\n#define __stdcall\n#include "' + str(source)
        + '"\nint main(void) { int n; unsigned char *p; while(scanf("%d",&n)==1) {'
        'printf("%d\\t",n);p=(unsigned char*)Renderer_ErrorDescription(n);'
        'while(*p) {printf("%02x",*p);p++;}puts("");}return 0;}\n')
    target_exe, source_exe = folder / 'target_oracle32', folder / 'source_oracle'
    subprocess.run(['cc', '-m32', '-std=c99', '-Wall', '-Wextra', '-Werror',
                    str(folder / 'target_oracle.c'), '-o', str(target_exe)], check=True)
    subprocess.run(['cc', '-std=c99', str(driver), '-o', str(source_exe)], check=True)
    target = subprocess.run([str(target_exe), str(ANCHOR)], input=data,
                            text=True, capture_output=True, check=True).stdout
    reference = subprocess.run([str(source_exe)], input=data,
                               text=True, capture_output=True, check=True).stdout
    target_rows, source_rows = target.splitlines(), reference.splitlines()
    assert len(target_rows) == len(source_rows) == len(values)
    mismatches = [(a, b) for a, b in zip(target_rows, source_rows) if a != b]
    packet = dict(status='MAPPING-PASS' if not mismatches else 'MAPPING-MISMATCH',
                  anchor_sha256=EXPECTED, input_cases=len(values),
                  source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                  target_runner_sha256=hashlib.sha256((folder / 'target_oracle.c').read_bytes()).hexdigest(),
                  mismatches=mismatches, code_byte_progress=0,
                  exhaustive=False, wide_mapping_verified=False,
                  source_note='preserved decompile oracle, not accepted reconstruction')
    (folder / 'mapping_review.json').write_text(json.dumps(packet, indent=2) + '\n')
    print(f'{len(values)} actual-target differential cases; {len(mismatches)} mismatches; zero byte credit')
    assert not mismatches


if __name__ == '__main__':
    main()
