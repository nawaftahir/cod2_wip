#!/usr/bin/env python3
"""Bounded omitted-tail discovery from hashed objects; candidates need boundary review."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path

from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check, is_function


def main():
    m = load_matcher()
    packet = json.loads((HERE / 'jpeg_dependency_packet.json').read_text())
    known = {r['address'] for r in packet['functions']}
    entries = sorted(int(a, 16) for a in m['INV'])
    targets = [a for a in entries if 0x10046000 <= a < 0x10058400 and hex(a) not in known]
    matches = []
    for run_name in ('baseline_jpeg_ux9623q1', 'baseline_jpeg_yd16dq0p'):
        run = HERE / run_name
        inputs = json.loads((run / 'inputs.json').read_text())
        assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
        reference = Path(inputs['reference'])
        for name, digest in inputs['dependencies'].items():
            assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
        for row in json.loads((run / 'results.json').read_text()):
            if row['status'] == 'COMPILE_DEFER':
                continue
            obj = run / (row['job'] + '.obj')
            raw = obj.read_bytes()
            assert hashlib.sha256(raw).hexdigest() == row['object_sha256']
            coff = m['parse_coff'](raw)
            for symbol in coff['symbols']:
                if symbol['sec'] <= 0 or not is_function(raw, symbol):
                    continue
                section = coff['sections'][symbol['sec'] - 1]
                size = section['rawsize']
                if symbol['value'] or size < 16:
                    continue
                for address in targets:
                    meta = m['INV'][f'{address:x}']
                    old = meta['size']
                    next_entry = next(a for a in entries if a > address)
                    if not 0 < size - old <= 64 or address + size > next_entry:
                        continue
                    meta['size'] = size
                    log = io.StringIO()
                    try:
                        with redirect_stdout(log):
                            check(address, obj, symbol['name'], matcher=m)
                            if m['cmd_diff'](hex(address), str(obj), symbol['name']) != 100:
                                continue
                        matches.append(dict(address=hex(address), old_inventory_size=old,
                            bytes=size, next_inventory_entry=hex(next_entry), source=row['source'],
                            symbol=symbol['name'], object=str(obj), command=row['command'],
                            source_sha256=row['source_sha256'], object_sha256=row['object_sha256'],
                            diagnostics=log.getvalue()))
                    except (ValueError, KeyError, StopIteration):
                        pass
                    finally:
                        meta['size'] = old
    output = dict(status='BOUNDARY-DISCOVERY-ONLY', anchor_sha256=EXPECTED,
                  maximum_extension=64, candidates=matches,
                  independent_review=False, whole_file_identity=False)
    (HERE / 'jpeg_boundary_discovery.json').write_text(json.dumps(output, indent=2) + '\n')
    print('Dual-checker candidates:', len(matches), 'unique bytes:',
          sum({r['address']: r['bytes'] for r in matches}.values()))
    for row in matches:
        print(row['address'], row['source'], row['symbol'], row['old_inventory_size'], '->', row['bytes'])


if __name__ == '__main__':
    main()
