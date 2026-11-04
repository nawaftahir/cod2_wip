"""Negative audit fixtures never modify the real build or coverage ledgers."""
import json
import subprocess
import sys
import tempfile
from pathlib import Path

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
baseline = json.loads((gfx / 'target/scratch/codex35/bind_293.json').read_text())
names = [n for n, r in baseline.items() if r['why'] == [] and r['t'] == '0x10001880']
assert names
with tempfile.TemporaryDirectory(prefix='codex35_audit_') as tmp:
    build = Path(tmp)
    (build / 'gfx.dll').touch()
    (build / 'cmp.json').write_text('[]')
    fixture = build / 'bind.json'
    fixture.write_text(json.dumps(baseline))
    command = [sys.executable, str(packet / 'regression.py'), str(fixture)]
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode == 0, result.stderr
    score = json.loads(result.stdout)['bytes']
    assert score == 94753, 'baseline executable-code accounting changed'
    for va in ['0x100390a0', '0x100390f0', '0x10039610', '0x10039670',
               '0x100236c0', '0x100348f0', '0x10034bb0', '0x10034910',
               '0x10015260', '0x10015830', '0x1000f120', '0x100399d0',
               '0x10038430', '0x100384a0', '0x10038510', '0x10038610']:
        for change in ['missing', 'truncated', 'bad_binding']:
            rows = json.loads(json.dumps(baseline))
            checked = [name for name, row in rows.items() if row['t'] == va and not row['why']]
            assert checked
            for name in checked:
                if change == 'missing':
                    del rows[name]
                elif change == 'truncated':
                    rows[name]['n'] -= 1
                else:
                    rows[name]['why'] = ['negative binding fixture']
            fixture.write_text(json.dumps(rows))
            result = subprocess.run(command, capture_output=True, text=True)
            assert result.returncode != 0 and 'checkpoint loss' in result.stderr, (va, change)
    for va in ['0x1000d090', '0x1000e840', '0x1000e900', '0x1000ef40', '0x10023800']:
        rows = json.loads(json.dumps(baseline))
        for row in rows.values():
            if row['t'] == va:
                row['n'] -= 1
        fixture.write_text(json.dumps(rows))
        result = subprocess.run(command, capture_output=True, text=True)
        assert result.returncode != 0 and 'extent changed' in result.stderr, (va, result.stderr)
    rows = json.loads(json.dumps(baseline))
    rows['matrix_table_fixture'] = {'t': '0x10038cf0', 'n': 733, 'obj': 'fixture.obj', 'why': []}
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    report = json.loads(result.stdout)
    assert result.returncode == 0 and report['bytes'] == score
    assert report['excluded_new_embedded_table_bytes'] == 403, 'embedded table gained code credit'
    for name, row in rows.items():
        if row['t'] == '0x10038cf0':
            row['n'] = 732
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode != 0 and 'shader matrix extent changed' in result.stderr
    rows = json.loads(json.dumps(baseline))
    rows['image_dispatcher_fixture'] = {'t': '0x1000f900', 'n': 316, 'obj': 'fixture.obj', 'why': []}
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    report = json.loads(result.stdout)
    assert result.returncode == 0 and report['bytes'] == score + 261
    assert report['excluded_new_embedded_table_bytes'] == 458, 'image table gained code credit'
    rows['image_dispatcher_fixture']['n'] = 315
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode != 0 and 'image dispatcher extent changed' in result.stderr
    rows = {n: r for n, r in json.loads(json.dumps(baseline)).items() if r['t'] != '0x10022710'}
    rows['format_description_fixture'] = {'t': '0x10022710', 'n': 172, 'obj': 'fixture.obj', 'why': []}
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    report = json.loads(result.stdout)
    assert result.returncode == 0 and report['bytes'] == score
    assert report['excluded_new_embedded_table_bytes'] == 403, 'format table gained code credit'
    rows['format_description_fixture']['n'] = 171
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode != 0 and 'format description extent changed' in result.stderr
    rows = json.loads(json.dumps(baseline))
    rows['??$fake@std@@fixture'] = {'t': '0x10040000', 'n': 1003, 'obj': 'test.obj', 'why': []}
    assert not any(r.get('why') == [] and r['t'] == '0x10040000' for r in baseline.values())
    fixture.write_text(json.dumps(rows))
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode == 0 and json.loads(result.stdout)['bytes'] == score, 'library credit accepted'
    for label in ['missing', 'extent', 'checkpoint', 'converter', 'hull', 'insertion', 'growth', 'clip', 'traversal', 'ambient', 'occluder', 'view', 'matrix', 'outdoor', 'image_override', 'sun_parse', 'quad', 'filter_points', 'filter_1d', 'vector4', 'shadow', 'light_fit', 'light_directional', 'light_dispatch', 'image_upload', 'wavelet_bits', 'wavelet_value', 'wavelet_delta', 'wavelet_level', 'image_header', 'mipmap_count', 'small_depth', 'format_description', 'frame_extent', 'shared_depth', 'framebuffer', 'triangle_bounds', 'cell_link', 'bounds_dispatch']:
        rows = json.loads(json.dumps(baseline))
        target = {'checkpoint':'0x100116c0', 'converter':'0x1001d720', 'hull':'0x10057a40', 'insertion':'0x10057cd0',
                  'growth':'0x10057f10', 'clip':'0x10007ef0', 'traversal':'0x10009bc0',
                  'ambient':'0x10037420', 'occluder':'0x100079d0', 'view':'0x1000a550',
                  'matrix':'0x10038cf0', 'outdoor':'0x10038fd0', 'image_override':'0x100388f0',
                  'sun_parse':'0x10003430', 'quad':'0x1003ad40',
                  'filter_points':'0x10034ca0', 'filter_1d':'0x10034ec0', 'vector4':'0x100018a0',
                  'shadow':'0x10027d00', 'light_fit':'0x100368a0',
                  'light_directional':'0x10037500', 'light_dispatch':'0x10037630',
                  'image_upload':'0x1000ed60', 'wavelet_bits':'0x10010ba0',
                  'wavelet_value':'0x10010c00', 'wavelet_delta':'0x10010cb0',
                  'wavelet_level':'0x10010d40', 'image_header':'0x1000f2a0',
                  'mipmap_count':'0x1000f320', 'small_depth':'0x100228d0',
                  'format_description':'0x10022710', 'frame_extent':'0x100227c0',
                  'shared_depth':'0x10022830', 'framebuffer':'0x10022940',
                  'triangle_bounds':'0x1002bc60', 'cell_link':'0x10008570',
                  'bounds_dispatch':'0x1002bce0'}.get(label)
        checked_names = names if target is None else [
            n for n, r in rows.items() if r['why'] == [] and r['t'] == target]
        assert checked_names
        for name in checked_names:
            if label != 'extent':
                del rows[name]
            else:
                rows[name]['n'] += 1
        fixture.write_text(json.dumps(rows))
        result = subprocess.run(command, capture_output=True, text=True)
        expected = 'checkpoint loss' if target is not None else 'baseline loss'
        assert result.returncode != 0 and expected in result.stderr, (label, result.stderr)
    fixture.write_text(json.dumps(baseline))
    (build / 'gfx.dll').touch()
    result = subprocess.run(command, capture_output=True, text=True)
    assert result.returncode != 0, 'stale evidence accepted'
print('PASS: baseline accepted; missing/changed extent, stale output, and library credit rejected')
