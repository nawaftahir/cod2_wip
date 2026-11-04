#!/usr/bin/env python3
"""Recheck the target-adapted JPEG allocation source family and slop tables."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import struct
import subprocess

from audit_legacy import load_matcher
from batch_existing import HERE
from check_shape import check


def main():
    run = HERE / 'baseline_jpeg_a1_gw6ay'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        if hashlib.sha256((reference / name).read_bytes()).hexdigest() != digest:
            raise ValueError('overlay input changed: ' + name)
    row = json.loads((run / 'results.json').read_text())[0]
    obj = run / (row['job'] + '.obj')
    raw = obj.read_bytes()
    if hashlib.sha256(raw).hexdigest() != row['object_sha256']:
        raise ValueError('object changed')
    m = load_matcher()
    coff = m['parse_coff'](raw)
    bindings = {'_first_pool_slop': 0x101910dc, '_extra_pool_slop': 0x101910e4,
                '_alloc_small': 0x10054d40, '_alloc_large': 0x10054e90}
    for name, values in [('_first_pool_slop', [1600, 16000]), ('_extra_pool_slop', [0, 5000])]:
        symbol = next(s for s in coff['symbols'] if s['name'] == name)
        section = coff['sections'][symbol['sec'] - 1]
        offset = m['rva2off'](bindings[name] - 0x10000000)
        expected = struct.pack('<2I', *values)
        start = section['rawptr'] + symbol['value']
        if (section['relocs'] or raw[start:start + 8] != expected or
                m['_d'][offset:offset + 8] != expected):
            raise ValueError('slop table differs: ' + name)
    records = []
    for address, symbol in [(0x10054d40, '_alloc_small'), (0x10054e90, '_alloc_large'),
                            (0x10054f50, '_alloc_sarray'), (0x10055000, '_alloc_barray')]:
        log = io.StringIO()
        with redirect_stdout(log):
            check(address, obj, symbol, matcher=m, bindings=bindings)
            if m['cmd_diff'](hex(address), str(obj), symbol) != 100:
                raise ValueError('original referee differs')
        records.append(dict(address=hex(address), symbol=symbol, bytes=m['INV'][f'{address:x}']['size'],
                            diagnostics=log.getvalue()))
    try:
        check(0x10054f50, obj, '_alloc_sarray', matcher=m,
              bindings=dict(bindings, _alloc_small=0x10054d41))
    except ValueError as error:
        if 'wrong binding' not in str(error):
            raise
    else:
        raise AssertionError('wrong allocator callee accepted')
    test = HERE / 'test_jpeg_allocators.c'
    executable = run / 'allocator_fixture32'
    host_command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra', '-Werror', '-Wno-unused-parameter',
                    '-I' + str(reference), str(test), str(reference / 'jmemnobs.c'),
                    str(reference / 'jutils.c'),
                    '-o', str(executable)]
    subprocess.run(host_command, check=True)
    subprocess.run([str(executable)], check=True)
    (HERE / 'jpeg_allocator_packet.json').write_text(json.dumps(dict(status='REVIEWABLE',
        image=inputs['image'], command=row['command'], functions=records,
        source_sha256=row['source_sha256'], object_sha256=row['object_sha256'],
        dependencies=inputs['dependencies'], callback_offsets={'alloc': 24, 'free': 28},
        host_command=host_command, test_sha256=hashlib.sha256(test.read_bytes()).hexdigest(),
        bindings={k: hex(v) for k, v in bindings.items()}, host_32bit_fixtures_passed=True,
        wrong_binding_rejected=True, independent_review=False, whole_file_identity=False), indent=2) + '\n')
    print('PASS: four JPEG allocation bodies/844 bytes, bindings, negative test and 32-bit fixtures')


if __name__ == '__main__':
    main()
