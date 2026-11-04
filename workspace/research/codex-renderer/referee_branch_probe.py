#!/usr/bin/env python3
"""Proposed instruction-aware legacy mask adapter. Diagnostic, not acceptance."""
from contextlib import redirect_stdout
import io
import json
import hashlib
from pathlib import Path

from audit_legacy import load_matcher
from check_shape import branch_fields, self_check


def proposed_mask(m, fn_off, size, code, address):
    if len(code) != size:
        raise ValueError('incomplete function input')
    positions = {p - fn_off for p in m['PE_RELOCS']
                 if fn_off <= p < fn_off + size}
    if any(p + 4 > size for p in positions):
        raise ValueError('truncated absolute relocation')
    positions.update(branch_fields(code, address))
    return {p + byte for p in positions for byte in range(4)}


def main():
    self_check()
    synthetic = {'PE_RELOCS': set()}
    assert proposed_mask(synthetic, 0, 7, bytes.fromhex('b8 e8 00 01 00 00 c3'), 0x1000) == set()
    assert proposed_mask(synthetic, 0, 5, bytes.fromhex('e9 00 01 00 00'), 0x1000) == {1, 2, 3, 4}
    modrm = bytes.fromhex('81 e9 e0 00 00 00 89 74 24 14 c3')
    assert proposed_mask(synthetic, 0, len(modrm), modrm, 0x1000) == set()
    m = load_matcher()
    corrected = load_matcher(instruction_aware=True)
    assert corrected['pe_mask_for'](0, len(modrm), modrm, 0x1000) == set()
    assert corrected['pe_mask_for'](0, 5, bytes.fromhex('e9 00 01 00 00'), 0x1000) == {1, 2, 3, 4}
    try:
        proposed_mask({'PE_RELOCS': {105}}, 100, 7,
                      bytes.fromhex('b8 00 00 00 00 90 c3'), 0x1000)
    except ValueError as error:
        assert 'truncated absolute relocation' in str(error)
    else:
        raise AssertionError('truncated relocation accepted')
    original_bytes = bytes.fromhex('b8 e8 00 01 00 00 c3')
    changed_bytes = bytes.fromhex('b8 e8 01 01 00 00 c3')
    mask = proposed_mask(synthetic, 0, len(original_bytes), original_bytes, 0x1000)
    assert m['normalize'](original_bytes, mask) != m['normalize'](changed_bytes, mask)
    changed_modrm = bytearray(modrm)
    changed_modrm[2] ^= 1
    assert m['normalize'](modrm, set()) != m['normalize'](changed_modrm, set())
    assert proposed_mask({'PE_RELOCS': {101}}, 100, 7,
                         bytes.fromhex('b8 00 00 00 00 90 c3'), 0x1000) == {1, 2, 3, 4}
    original = m['pe_mask_for']
    cases = [
        ('0x10020d50', 'baseline_jpeg_ndwi4wbp/job000.obj', '_Renderer_SubmitFrame'),
        ('0x10021f90', 'baseline_jpeg_n2weway4/job000.obj', '_R_EndFrame'),
        ('0x10022040', 'baseline_jpeg_arnc6688/job000.obj', '_R_EndDebugFrame'),
        ('0x10021ff0', 'baseline_jpeg_arnc6688/job000.obj', '_R_BeginDebugFrame'),
    ]
    from batch_existing import HERE
    for address, path, symbol in cases:
        with redirect_stdout(io.StringIO()):
            before = m['cmd_diff'](address, str(HERE / path), symbol)
        m['pe_mask_for'] = lambda off, size, code, addr: proposed_mask(m, off, size, code, addr)
        try:
            with redirect_stdout(io.StringIO()):
                after = m['cmd_diff'](address, str(HERE / path), symbol)
        finally:
            m['pe_mask_for'] = original
        assert after == 100
        print(f'{address} {symbol}: original={before} proposed={after}; DIAGNOSTIC ONLY')
    run = HERE / 'baseline_jpeg_mi1di9r9'
    inputs = json.loads((run / 'inputs.json').read_text())
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((Path(inputs['reference']) / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    assert hashlib.sha256((run / 'job000.obj').read_bytes()).hexdigest() == row['object_sha256']
    cases = [(entry['address'], entry['symbol'], entry['bytes'])
             for entry in row['matches']]
    cases += [('0x1004bf10', '_jinit_color_deconverter', 452),
              ('0x10050600', '_jinit_merged_upsampler', 120),
              ('0x1004bab0', '_build_ycc_rgb_table', 195),
              ('0x10050080', '_merged_build_ycc_rgb_table', 195),
              ('0x10050150', '_start_pass_merged_upsample', 21),
              ('0x1004bf00', '_start_pass_dcolor', 1),
              ('0x1004bdb0', '_ycck_cmyk_convert', 330)]
    changed = []
    for address, symbol, size in cases:
        key = f'{int(address, 16):x}'
        previous = m['INV'].get(key)
        m['INV'][key] = dict(name=symbol, addr=key, size=size, thunk=False)
        try:
            with redirect_stdout(io.StringIO()):
                before = m['cmd_diff'](address, str(run / 'job000.obj'), symbol)
            m['pe_mask_for'] = lambda off, length, code, addr: proposed_mask(
                m, off, length, code, addr)
            with redirect_stdout(io.StringIO()):
                after = m['cmd_diff'](address, str(run / 'job000.obj'), symbol)
            assert after == 100, (address, symbol, before, after)
            if before != after:
                changed.append((address, symbol, before, after))
        finally:
            m['pe_mask_for'] = original
            if previous is None:
                del m['INV'][key]
            else:
                m['INV'][key] = previous
    print(f'JPEG diagnostic regression: {len(cases)} complete object sections PASS')
    for address, symbol, before, after in changed:
        print(f'{address} {symbol}: original={before} proposed={after}; DIAGNOSTIC ONLY')
    print('No GLM edits, no acceptance gate replacement, no new byte credit.')


if __name__ == '__main__':
    main()
