#!/usr/bin/env python3
"""Replay matched source mip chain and its complete switch dependency."""
from contextlib import redirect_stdout
import io
import json

from audit_legacy import load_matcher
from batch_existing import HERE
from check_image_memory_size import main as verify_mip
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    run = HERE / 'baseline_jpeg_olyhxdy7'
    dependency = verify_mip(run)
    m = load_matcher()
    obj = run / 'job000.obj'
    extent = raw_target(m, 0x1000f020, 144)
    assert extent[134] == 0xc3 and extent[135:] == b'\xcc' * 9
    bindings = {'_Image_GetMipMemoryAmount': 0x1000ef40}
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x1000f020, obj, '_Image_GetCardMemoryAmount', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x1000f020', str(obj), '_Image_GetCardMemoryAmount') == 100
    try:
        with redirect_stdout(io.StringIO()):
            check(0x1000f020, obj, '_Image_GetCardMemoryAmount', matcher=m,
                  bindings={'_Image_GetMipMemoryAmount': 0x1000ef41})
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong mip helper binding accepted')
    packet = dict(status='REVIEWABLE', address='0x1000f020', new_code_bytes=135,
        matched_dependency=dependency, diagnostics=log.getvalue(), bindings=bindings,
        wrong_binding_rejected=True, independent_review=False, whole_file_identity=False)
    (HERE / 'image_memory_chain_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:135-byte memory chain, both referees, both callee bindings and negative binding test')


if __name__ == '__main__':
    main()
