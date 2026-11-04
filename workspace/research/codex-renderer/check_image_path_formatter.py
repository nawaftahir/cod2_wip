#!/usr/bin/env python3
"""Replay real variadic formatter and retained dispatch/header caller proofs."""
from contextlib import redirect_stdout
import io
import json

from audit_legacy import load_matcher
from batch_existing import HERE
from check_image_dispatch import main as verify_dispatch
from check_jpeg_dependencies import raw_target
from check_shape import check


def main(run=None, fixture='test_image_path_formatter.c'):
    run = run or HERE / 'baseline_jpeg_f2h112qr'
    retained = verify_dispatch(run, fixture)
    m = load_matcher()
    obj = run / 'job000.obj'
    extent = raw_target(m, 0x10060c10, 32)
    assert extent[25] == 0xc3 and extent[26:] == b'\xcc' * 6
    bindings = {'__vsnprintf': 0x100f61b9}
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x10060c10, obj, '_Renderer_FormatPath', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x10060c10', str(obj), '_Renderer_FormatPath') == 100
    try:
        with redirect_stdout(io.StringIO()):
            check(0x10060c10, obj, '_Renderer_FormatPath', matcher=m,
                  bindings={'__vsnprintf': 0x100f61ba})
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong CRT binding accepted')
    packet = dict(status='REVIEWABLE', new_code_bytes=26, retained_dispatch=retained,
        diagnostics=log.getvalue(), bindings=bindings, wrong_binding_rejected=True,
        crt_dependency='PINNED destination; unmatched body; host test uses adapter',
        independent_review=False, whole_file_identity=False)
    (HERE / 'image_path_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:26-byte formatter, both referees/binding/negative test; actual-source termination/return fixture')
    return packet


if __name__ == '__main__':
    main()
