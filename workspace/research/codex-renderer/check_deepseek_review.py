#!/usr/bin/env python3
"""Independent bounded review of DeepSeek image mission 1; no worker edits."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import subprocess
import sys

from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    run = Path(sys.argv[1]).resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    source = Path(inputs['reference']).resolve()
    assert source in [HERE / 'scratch' / name for name in
                      ('deepseek_image_1', 'deepseek_cubemap_2', 'deepseek_rounding_3',
                       'deepseek_campaign_4')]
    cubemap = source.name != 'deepseek_image_1'
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    assert (run / 'job000.status').read_text().strip() == '0'
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    m = load_matcher()
    cases = [
        (0x1000c910, '_Image_Release', 87, 9,
         {'_image_card_memory': 0x101d0a74}),
        (0x10010680, '_Image_GenerateLightGridWeights', 43, 5,
         {'__chkstk': 0x100f8830, '_Image_GenerateCubemapFunction': 0x10010160,
          '_Image_GetLightGridWeightsForVector': 0x100104a0}),
        (0x100107b0, '_Image_GenerateSunHalfAngle', 46, 2,
         {'_ri_hunk_allocate': 0x101d49d8, '_ri_hunk_free': 0x101d49f8,
          '_Image_GenerateCubemapFunction': 0x10010160,
          '_Image_GetSunHalfAngleForVector': 0x100106b0}),
    ]
    diagnostics = io.StringIO()
    for address, symbol, size, padding, bindings in cases:
        data = raw_target(m, address, size + padding)
        assert data[size - 1] == 0xc3 and data[size:] == b'\xcc' * padding
        old_size = m['INV'][f'{address:x}']['size']
        try:
            m['INV'][f'{address:x}']['size'] = size
            with redirect_stdout(diagnostics):
                check(address, obj, symbol, matcher=m, bindings=bindings)
                assert m['cmd_diff'](hex(address), str(obj), symbol) == 100
            for name in bindings:
                try:
                    with redirect_stdout(io.StringIO()):
                        check(address, obj, symbol, matcher=m,
                              bindings=dict(bindings, **{name: bindings[name] + 4}))
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                else:
                    raise AssertionError('wrong binding accepted: ' + name)
        finally:
            m['INV'][f'{address:x}']['size'] = old_size
    assert 'UNRESOLVED binding' not in diagnostics.getvalue()
    fixture = source / 'test_cubemap_generate.c' if cubemap else HERE / 'test_deepseek_release.c'
    command = ['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-Wno-unused-parameter', str(fixture), '-lm', '-o', str(run / 'review_fixture32')]
    subprocess.run(command, check=True)
    subprocess.run([str(run / 'review_fixture32')], check=True)
    packet = dict(status='DEFER-NEW-CUBEMAP-SOURCE' if cubemap else 'INDEPENDENT-REVIEW-PASS',
                  new_unique_code_bytes=0 if cubemap else 176,
                  retained_reviewed_code_bytes=176 if cubemap else 0,
                  anchor_sha256=EXPECTED, inputs=inputs,
                  object_sha256=row['object_sha256'], diagnostics=diagnostics.getvalue(),
                  every_bound_symbol_negative_tested=True, fixture_passed=True,
                  fixture_command=command,
                  fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  worker_fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  complete_dependency_closure=False, canonical_acceptance=False,
                  whole_file_identity=False,
                  correction='Image_Alloc complete target code is109, not125.',
                  caveats=['Remaining mismatch causes are hypotheses, not proven exclusively TU context.',
                           'Host fixture tests real drafts with mocked external services; it is not retail runtime proof.',
                           'Lightmap formula oracle shares host math with source; independent retail comparison remains pending.'])
    (run / 'independent_deepseek_review.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: independent fresh3/176-byte proof, all bindings/negative tests, '
          'executed source fixture; ' + ('retained only, new cubemap DEFER' if cubemap
          else 'new mission1 bytes') + '; no V4/canonical promotion')


if __name__ == '__main__':
    main()
