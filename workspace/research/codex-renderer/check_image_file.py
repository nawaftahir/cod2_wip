#!/usr/bin/env python3
"""Replay complete file loader and its retained matched source dependencies."""
from contextlib import redirect_stdout
import io
import json

from audit_legacy import load_matcher
from batch_existing import HERE
from check_image_path_formatter import main as verify_formatter
from check_jpeg_dependencies import raw_target
from check_shape import check


def main(run=None, fixture='test_image_reload.c'):
    run = HERE / 'baseline_jpeg_qqtw3j8j' if run is None else run
    dependencies = verify_formatter(run, fixture)
    m = load_matcher()
    obj = run / 'job000.obj'
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    bindings = {'_Renderer_FormatPath': 0x10060c10, '_Renderer_Print': 0x10061c80,
        '_ri_image_read_file': 0x101d4afc, '_ri_image_free_file': 0x101d4b00,
        '_Image_CheckFileHeader': 0x1000f2a0, '_Image_LoadFromData': 0x1000f900}
    for address in (0x1019396c, 0x10193964, 0x1019395c, 0x10193938, 0x10193918, 0x101938f4):
        text = raw_target(m, address, 128).split(b'\0', 1)[0] + b'\0'
        found = []
        for symbol in coff['symbols']:
            if symbol['sec'] > 0 and symbol['name'].startswith('??_C@'):
                sec = coff['sections'][symbol['sec'] - 1]
                start = sec['rawptr'] + symbol['value']
                if raw[start:start + len(text)] == text:
                    found.append(symbol['name'])
        assert len(found) == 1
        bindings[found[0]] = address
    assert raw_target(m, 0x1000fa40, 240)[239] == 0xc3
    log = io.StringIO()
    with redirect_stdout(log):
        check(0x1000fa40, obj, '_Image_LoadFromFile', matcher=m, bindings=bindings)
        assert m['cmd_diff']('0x1000fa40', str(obj), '_Image_LoadFromFile') == 100
    try:
        with redirect_stdout(io.StringIO()):
            check(0x1000fa40, obj, '_Image_LoadFromFile', matcher=m,
                  bindings=dict(bindings, _ri_image_free_file=0x101d4b04))
    except ValueError as error:
        assert 'wrong binding' in str(error)
    else:
        raise AssertionError('wrong file-free slot accepted')
    packet = dict(status='REVIEWABLE', new_code_bytes=240, retained=dependencies,
        bindings=bindings, diagnostics=log.getvalue(), wrong_binding_rejected=True,
        dependency_closure=False, independent_review=False, whole_file_identity=False)
    (HERE / 'image_file_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: file loader240, both referees/all16 bindings/full strings/negative and source-selected fixture')
    return packet


if __name__ == '__main__':
    main()
