#!/usr/bin/env python3
"""Replay saved source-group objects; report matches and regressions without promotion."""
import argparse
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_image_memory_size import verify_local_switch
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_6t3n_63q')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    source = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    raw = obj.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == row['object_sha256']
    m = load_matcher()
    coff = m['parse_coff'](raw)
    bindings = {'_renderer_device': 0x101d1bf8, '_can_mip_cubemaps': 0x101d496b,
        '_Renderer_ErrorDescription@4': 0x100efe3c, '_Renderer_Error': 0x100138c0,
        '_Image_GetMipMemoryAmount': 0x1000ef40, '_Wavelet_DecodeValue': 0x10010c00,
        '_waveletDecodeAlpha': 0x1018a988}
    # Creator literal ownership is verified against complete target strings.
    for address in (0x101935d4, 0x10193598, 0x10193560):
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
    proofs, deferred = [], []
    for name, address, size, extent, alignment, padding in (
        ('_Image_GetMipMemoryAmount', 0x1000ef40, 149, 219, bytes.fromhex('8d4900'), 5),
        ('_Image_SourceSliceSize', 0x1000e840, 135, 187, b'\x90', 5),
        ('_Image_CopyUploadRows', 0x1000e900, 226, 274, b'\x8b\xff', 14)):
        try:
            proof = verify_local_switch(m, obj, name, address, size, extent, alignment, padding)
            proofs.append(dict(symbol=name, address=hex(address), bytes=size, proof=proof))
        except (AssertionError, ValueError) as error:
            deferred.append(dict(symbol=name, reason=str(error) or 'complete switch proof failed'))
    for name, address, size, padding in (
        ('_Image_Create2DTexture', 0x1000ce80, 113, 15),
        ('_Image_Create3DTexture', 0x1000cf00, 130, 14),
        ('_Image_CreateCubeTexture', 0x1000cf90, 119, 9),
        ('_Image_GetCardMemoryAmount', 0x1000f020, 135, 9),
        ('_Wavelet_ApplyDelta', 0x10010cb0, 134, 10)):
        data = raw_target(m, address, size + padding)
        assert data[size - 1] == 0xc3 and data[size:] == b'\xcc' * padding
        m['INV'][f'{address:x}']['size'] = size
        log = io.StringIO()
        try:
            with redirect_stdout(log):
                check(address, obj, name, matcher=m, bindings=bindings)
                assert m['cmd_diff'](hex(address), str(obj), name) == 100
            proofs.append(dict(symbol=name, address=hex(address), bytes=size, diagnostics=log.getvalue()))
        except (AssertionError, ValueError) as error:
            deferred.append(dict(symbol=name, reason=str(error) or 'original referee differs'))
    packet = dict(status='REPLAY-ONLY', run=str(run), anchor_sha256=EXPECTED,
        inputs=inputs, object_sha256=row['object_sha256'], matches=proofs, deferred=deferred,
        matched_code_bytes=sum(p['bytes'] for p in proofs), independent_review=False,
        dependency_closure=False, host_fixture_run=False, whole_file_identity=False)
    (run / 'image_family_replay.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('REPLAY:', len(proofs), 'bodies /', packet['matched_code_bytes'], 'code bytes;', len(deferred), 'deferred')
    for item in deferred:
        print('DEFER:', item['symbol'], item['reason'])


if __name__ == '__main__':
    main()
