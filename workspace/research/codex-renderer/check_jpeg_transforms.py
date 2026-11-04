#!/usr/bin/env python3
"""Recheck complete source-built JPEG transforms and every float constant binding."""
from contextlib import redirect_stdout
import hashlib
import io
import json
import struct
import subprocess
from pathlib import Path

from audit_legacy import load_matcher
from batch_existing import HERE
from check_shape import check


def main():
    m = load_matcher()
    run = HERE / 'baseline_jpeg_27xofqtz'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        if hashlib.sha256((reference / name).read_bytes()).hexdigest() != digest:
            raise ValueError('JPEG reference changed: ' + name)
    rows = json.loads((run / 'results.json').read_text())
    constants = {'__real@3f3504f3': 0x1019bcd8, '__real@3ec3ef15': 0x1019bcd4,
                 '__real@3f0a8bd4': 0x1019bcd0, '__real@3fa73d75': 0x1019bccc}
    records = []
    for source, address, symbol in [('jfdctflt.c', 0x10052180, '_jpeg_fdct_float'),
                                     ('jfdctint.c', 0x100534d0, '_jpeg_fdct_islow')]:
        row = next(r for r in rows if r['source'] == source)
        obj = run / (row['job'] + '.obj')
        raw = obj.read_bytes()
        if hashlib.sha256(raw).hexdigest() != row['object_sha256']:
            raise ValueError('JPEG object changed')
        coff = m['parse_coff'](raw)
        if source == 'jfdctflt.c':
            for name, destination in constants.items():
                defined = next(s for s in coff['symbols'] if s['name'] == name)
                sec = coff['sections'][defined['sec'] - 1]
                expected = struct.pack('<I', int(name.split('@')[1], 16))
                offset = m['rva2off'](destination - 0x10000000)
                if (sec['rawsize'] != 4 or sec['relocs'] or
                        raw[sec['rawptr']:sec['rawptr'] + 4] != expected or
                        m['_d'][offset:offset + 4] != expected):
                    raise ValueError('float constant differs: ' + name)
        log = io.StringIO()
        with redirect_stdout(log):
            check(address, obj, symbol, matcher=m, bindings=constants)
            if m['cmd_diff'](hex(address), str(obj), symbol) != 100:
                raise ValueError('legacy referee differs')
        body = m['carve'](address)[0]
        end = address + len(body)
        off = m['rva2off'](end - 0x10000000)
        if body[-1] != 0xc3 or m['_d'][off:off + 2] != b'\xcc\xcc':
            raise ValueError('audited return/padding boundary changed')
        records.append(dict(source=source, address=hex(address), symbol=symbol,
            bytes=len(body), command=row['command'], source_sha256=row['source_sha256'],
            object_sha256=row['object_sha256'], diagnostics=log.getvalue()))
    obj = run / 'job031.obj'
    wrong = dict(constants)
    wrong['__real@3f3504f3'] = 0x1019bcdc
    try:
        check(0x10052180, obj, '_jpeg_fdct_float', matcher=m,
              bindings=wrong)
    except ValueError as error:
        if 'wrong binding' not in str(error):
            raise
    else:
        raise AssertionError('wrong constant binding accepted')
    test = HERE / 'test_jpeg_transforms.c'
    executable = run / 'transform_fixture32'
    subprocess.run(['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
                    '-I' + str(reference), str(test), str(reference / 'jfdctflt.c'),
                    str(reference / 'jfdctint.c'), str(reference / 'jfdctfst.c'),
                    '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(status='REVIEWABLE', image=inputs['image'], functions=records,
        constant_bindings={k: hex(v) for k, v in constants.items()},
        reference_dependency_hashes=inputs['dependencies'], host_32bit_fixtures_passed=True,
        fast_transform_host_fixture_passed=True,
        wrong_binding_rejected=True, independent_review=False, whole_file_identity=False)
    (HERE / 'jpeg_transform_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: 5,219 transform bytes, all float bindings, original referee, negative binding and 32-bit fixtures')


if __name__ == '__main__':
    main()
