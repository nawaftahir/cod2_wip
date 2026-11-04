#!/usr/bin/env python3
"""Verify the complete CRT locale helper across two erroneous Ghidra ranges."""
from contextlib import redirect_stdout
import hashlib
import io
import json

from audit_legacy import load_matcher
from check_shape import check
from check_crt_block import HERE


def main():
    m = load_matcher()
    first, second, end = 0x100f7cf3, 0x100f7d16, 0x100f7db2
    first_size = m['INV'][f'{first:x}']['size']
    second_size = m['INV'][f'{second:x}']['size']
    if first + first_size != second or second + second_size != end:
        raise ValueError('inventory ranges are not the audited contiguous split')
    run = HERE / 'baseline_p9txpec2'
    row = next(r for r in json.loads((run / 'results.json').read_text()) if r['address'] == first)
    obj = run / (row['job'] + '.obj')
    if hashlib.sha256(obj.read_bytes()).hexdigest() != row['object_sha256']:
        raise ValueError('recorded object changed')
    if hashlib.sha256((HERE.parents[1] / 'glm' / row['source']).read_bytes()).hexdigest() != row['source_sha256']:
        raise ValueError('recorded source changed')
    # Boundaries are corrected only in this in-memory analysis view. No DB/ledger edits.
    m['INV'][f'{first:x}']['size'] = first_size + second_size
    output = io.StringIO()
    with redirect_stdout(output):
        check(first, obj, '__setlocale_get_all', matcher=m)
    packet = dict(status='FULL-BODY-SHAPE-MATCH', function='__setlocale_get_all',
                  start=hex(first), end=hex(end), bytes=end - first,
                  old_ranges=[dict(start=hex(first), bytes=first_size),
                              dict(start=hex(second), bytes=second_size)],
                  source=row['source'], source_sha256=row['source_sha256'],
                  object_sha256=row['object_sha256'], flags=row['flags'],
                  diagnostics=output.getvalue(), bindings_reviewed=False)
    (HERE / 'crt_locale_body.json').write_text(json.dumps(packet, indent=2) + '\n')
    print(output.getvalue(), end='')
    print('COMPLETE BODY: 191 bytes, not a 35-byte prefix; two contiguous inventory ranges.')
    print('Correction: _strcats at 0x100f7b6a already matches; this was _setlocale_get_all.')


if __name__ == '__main__':
    main()
