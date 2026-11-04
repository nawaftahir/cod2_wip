#!/usr/bin/env python3
"""Check the entire MT free body, including its embedded finally funclet."""
from contextlib import redirect_stdout
import hashlib
import io
import json

from audit_legacy import load_matcher, ROOT
from check_shape import check
from check_crt_block import HERE


def main():
    m = load_matcher()
    start, end = 0x100f84d0, 0x100f8541
    run = HERE / 'authcrt_k7o2adah'
    row = next(r for r in json.loads((run / 'results.json').read_text())
               if r['source'] == 'free.c')
    obj = run / row['object']
    for path, digest in [(obj, row['object_sha256']),
                         (ROOT / 'glm/crt71/free.c', row['source_sha256'])]:
        if hashlib.sha256(path.read_bytes()).hexdigest() != digest:
            raise ValueError('recorded input changed: ' + str(path))
    if m['INV'][f'{start:x}']['size'] != 104 or f'{end:x}' not in m['INV']:
        raise ValueError('audited inventory boundaries changed')
    # The old size sums disjoint ranges; it is not the contiguous byte extent.
    m['INV'][f'{start:x}']['size'] = end - start
    log = io.StringIO()
    with redirect_stdout(log):
        check(start, obj, '_free', matcher=m)
    packet = dict(status='FULL-BODY-SHAPE-MATCH', start=hex(start), end=hex(end),
                  bytes=end - start, old_inventory_size=104,
                  embedded_finally_start='0x100f8523', embedded_finally_bytes=9,
                  source='glm/crt71/free.c', source_sha256=row['source_sha256'],
                  object_sha256=row['object_sha256'], flags=row['flags'],
                  diagnostics=log.getvalue(), bindings_reviewed=False,
                  independent_review=False)
    (HERE / 'crt_free_body.json').write_text(json.dumps(packet, indent=2) + '\n')
    print(log.getvalue(), end='')


if __name__ == '__main__':
    main()
