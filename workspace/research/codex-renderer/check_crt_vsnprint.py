#!/usr/bin/env python3
"""Preserve strict-only CRT evidence; legacy-referee disagreement earns no credit."""
from contextlib import redirect_stdout
import hashlib
import io
import json

from audit_legacy import load_matcher, ROOT, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import check, branch_fields


def main():
    run = HERE / 'authcrt_6_oplcrm'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE
    for name, digest in inputs['dependency_hashes'].items():
        assert hashlib.sha256((ROOT / 'glm/crt71' / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / row['object']
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    m = load_matcher()
    bindings = {'__output': 0x100fa4e6, '__flsbuf': 0x100fa320}
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x100f61b9, obj, '__vsnprintf', matcher=m, bindings=bindings)
        score = m['cmd_diff']('0x100f61b9', str(obj), '__vsnprintf')
    assert score == 95  # Honest DEFER until original-referee disagreement reviewed.
    target, meta = m['carve'](0x100f61b9)
    offset = m['rva2off'](0xf61b9)
    legacy_mask = m['pe_mask_for'](offset, len(target), target, 0xf61b9)
    fields = branch_fields(target, 0x100f61b9)
    missing = {str(p): hex(address) for p, address in fields.items()
               if not all(p + i in legacy_mask for i in range(4))}
    assert '41' in missing and fields[41] == bindings['__output']
    try:
        with redirect_stdout(io.StringIO()):
            check(0x100f61b9, obj, '__vsnprintf', matcher=m,
                  bindings=dict(bindings, __output=0x100fa4e7))
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong output binding accepted')
    packet = dict(status='DEFER-REFEREE-DISAGREEMENT', credited_code_bytes=0,
        strict_code_bytes=86, original_referee_score=score, legacy_missing_fields=missing,
        anchor_sha256=EXPECTED, inputs=inputs, object_sha256=row['object_sha256'],
        bindings=bindings, diagnostics=log.getvalue(), wrong_binding_rejected=True,
        source_provenance='Microsoft SDK CRT reference, not redistributability approval',
        independent_review=False, dependency_closure=False, whole_file_identity=False)
    (HERE / 'crt_vsnprint_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('DEFER: strict86/both bindings pass; legacy95 omits actual _output call relocation+41; ZERO credit')


if __name__ == '__main__':
    main()
