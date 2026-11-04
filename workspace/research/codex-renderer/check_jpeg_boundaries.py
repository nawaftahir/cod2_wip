#!/usr/bin/env python3
"""Replay audited full-body JPEG boundaries without editing GLM inventory."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path

from audit_legacy import ROOT, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check


def main():
    run = HERE / 'baseline_jpeg_ux9623q1'
    inputs = json.loads((run / 'inputs.json').read_text())
    results = {r['job']: r for r in json.loads((run / 'results.json').read_text())}
    assert inputs['image'] == IMAGE
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    m = load_matcher()
    retail = (ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll').read_bytes()
    rows = []
    for source, symbol, address, old, size, next_start in (
        ('jquant1.c', '_make_odither_array', 0x10055d80, 102, 114, 0x10055e00),
        ('jquant1.c', '_select_ncolors', 0x10055960, 225, 234, 0x10055a50),
        ('jquant2.c', '_update_box', 0x100566a0, 991, 1003, 0x10056a90),
        ('jdinput.c', '_initial_setup', 0x1004cfa0, 510, 516, 0x1004d1b0),
        ('jcmaster.c', '_validate_script', 0x10046000, 961, 967, 0x100463d0),
        ('jcphuff.c', '_encode_mcu_AC_first', 0x10047ec0, 495, 506, 0x100480c0),
        ('jdcoefct.c', '_consume_data', 0x1004ada0, 549, 552, 0x1004afd0),
        ('jdcoefct.c', '_decompress_data', 0x1004afd0, 409, 417, 0x1004b180),
        ('jdmainct.c', '_set_bottom_pointers', 0x1004d880, 157, 160, 0x1004d920),
        ('jdsample.c', '_h2v2_fancy_upsample', 0x10051ae0, 293, 296, 0x10051c10),
        ('jfdctfst.c', '_jpeg_fdct_ifast', 0x100532c0, 507, 516, 0x100534d0),
        ('jmemmgr.c', '_free_pool', 0x100556f0, 260, 263, 0x10055800),
        ('jquant1.c', '_create_colorindex', 0x10055c10, 347, 358, 0x10055d80),
    ):
        job = next(j for j in inputs['jobs'] if j['source'] == source)
        obj = run / (job['job'] + '.obj')
        assert hashlib.sha256(obj.read_bytes()).hexdigest() == results[job['job']]['object_sha256']
        assert m['INV'][f'{address:x}']['size'] == old
        if symbol not in ('_select_ncolors', '_encode_mcu_AC_first',
                          '_set_bottom_pointers', '_free_pool'):
            assert f'{next_start:x}' in m['INV']
        # Full disassembly shows omitted loop/return tails; padding ends at next entry.
        m['INV'][f'{address:x}']['size'] = next_start - address
        extent, _ = m['carve'](address)
        assert extent[size - 1] == 0xc3 and extent[size:] == b'\xcc' * (next_start-address-size)
        m['INV'][f'{address:x}']['size'] = size
        bindings = {'_base_dither_matrix': 0x101910f0} if symbol == '_make_odither_array' else {}
        raw = obj.read_bytes()
        coff = m['parse_coff'](raw)
        if symbol == '_select_ncolors':
            bindings = {s['name']: 0x101911f0 for s in coff['symbols'] if 'RGB_order' in s['name']}
        for name, target in bindings.items():
            sym = next(s for s in coff['symbols'] if s['name'] == name and s['sec'] > 0)
            sec = coff['sections'][sym['sec'] - 1]
            count = 256 if name == '_base_dither_matrix' else 12
            begin = sym['value']
            assert begin + count <= sec['rawsize']
            assert not any(begin <= r['vaddr'] < begin + count for r in sec['relocs'])
            data = raw[sec['rawptr'] + begin:sec['rawptr'] + begin + count]
            offset = m['rva2off'](target - 0x10000000)
            assert data == retail[offset:offset + len(data)]
        log = io.StringIO()
        with redirect_stdout(log):
            check(address, obj, symbol, matcher=m, bindings=bindings)
            assert m['cmd_diff'](hex(address), str(obj), symbol) == 100
        rows.append(dict(address=hex(address), old_inventory_size=old, bytes=size,
                         padding_end=hex(next_start), source=source, symbol=symbol,
                         command=job['command'], object_sha256=results[job['job']]['object_sha256'],
                         bindings=bindings, diagnostics=log.getvalue()))
    packet = dict(status='REVIEWABLE-FULL-BODY', run=str(run), image=IMAGE,
                  functions=rows, bytes=sum(r['bytes'] for r in rows),
                  independent_review=False, whole_file_identity=False)
    (HERE / 'jpeg_boundary_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(rows), 'complete bodies /', packet['bytes'],
          'bytes, both checkers and source data bindings; not V4')
    return packet


if __name__ == '__main__':
    main()
