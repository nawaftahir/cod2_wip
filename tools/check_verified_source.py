"""Validate the verified-only source snapshot against its pinned build evidence."""
from pathlib import Path
import hashlib
import json

root = Path(__file__).resolve().parents[1]
proof = root / 'proof/verified_source_20261102'
manifest = json.loads((proof / 'manifest.json').read_text())
for name, expected in manifest['proof_hashes'].items():
    assert hashlib.sha256((proof / name).read_bytes()).hexdigest() == expected, name
expected_files = {row['path'] for row in manifest['files']}
actual_files = {p.relative_to(root).as_posix() for p in (root / 'src').rglob('*')
                if p.is_file() and p.suffix in ('.c', '.cpp', '.h', '.inc', '.inl')}
assert actual_files == expected_files, ('unexpected or missing source', actual_files ^ expected_files)
count = 0
for row in manifest['files']:
    files = row.get('proof_files', dict(bind='bind.json', cmp='cmp.json', coverage='source_coverage.json'))
    bindings = json.loads((proof / files['bind']).read_text())
    compared = json.loads((proof / files['cmp']).read_text())
    coverage = json.loads((proof / files['coverage']).read_text())
    path = root / row['path']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == row['sha256'], row['path']
    relative = Path(row['working_source']).relative_to('target/work/src').as_posix()
    assert coverage['source_sha256'][relative] == row['sha256'], relative
    emitted = {r['name']: r for r in compared if r['obj'] == path.stem + '.obj'}
    accepted = {r['name']: r for r in row['emitted_functions']}
    assert emitted.keys() == accepted.keys() and emitted, row['path']
    for name, extent in accepted.items():
        assert extent['why'] == [] and bindings[name] == {k: v for k, v in extent.items() if k != 'name'}, name
        assert emitted[name]['hits'] == [extent['t']] and emitted[name]['size'] == extent['n'], name
    for name in row['source_definitions']:
        assert any(symbol.startswith('?' + name + '@@') for symbol in accepted), name
    count += len(accepted)
print('PASS:', len(expected_files), 'verified source files;', count, 'matched emitted functions; no extra source')
