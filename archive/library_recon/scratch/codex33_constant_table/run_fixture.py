"""Public reflection/upload CPU comparison with fresh inputs and map ownership."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

proof = json.loads((HERE / 'clean_packet.json').read_text())
assert proof['verified_instruction_bytes'] == 3904 and len(proof['rows']) == 32
selection = json.loads((HERE / 'fixture_dependency_selection.json').read_text())
assert set(selection['source_objects']) == {r['symbol'] for r in proof['rows']}
obj = TARGET / 'build/codex33_constant_table/libraries/matched.obj'
assert set(selection['source_objects'].values()) == {sha(obj)}
inputs = [ROOT / p for p in proof['files']]
inputs += [HERE / p for p in ('run_fixture.py', 'test_constants.cpp', 'test_constants.obj',
    'compile_fixture.sh', 'clean_packet.json', 'fixture_dependency_selection.json',
    'constant_dependencies.lib')]
inputs += [HERE / (m + s) for m in ('original', 'source') for s in ('.exe', '.map')]
identities = {str(p): sha(p) for p in inputs}
assert all(sha(ROOT / p) == h for p, h in proof['files'].items())
assert (HERE / 'test_constants.cpp').stat().st_mtime_ns <= (HERE / 'test_constants.obj').stat().st_mtime_ns

def run(mode):
    exe = HERE / (mode + '.exe')
    relevant = [HERE / 'test_constants.obj', HERE / 'compile_fixture.sh']
    relevant += [obj, HERE / 'constant_dependencies.lib'] if mode == 'source' else [ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime_ns for p in relevant) <= exe.stat().st_mtime_ns
    mapping = (HERE / (mode + '.map')).read_text().splitlines()
    for row in proof['rows']:
        lines = [line for line in mapping if row['symbol'] in line]
        assert len(lines) == 1, (mode, row['symbol'], lines)
        expected = 'matched.obj' if mode == 'source' else 'd3dx9:cconstanttable.obj'
        assert lines[0].split()[-1] == expected, lines
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex33_constant_table/' + exe.name], capture_output=True)
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    (HERE / (mode + '_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stdout[-3000:], result.stderr[-1000:])
    lines = result.stdout.splitlines()
    assert sum(line.startswith(b'BUILD ') for line in lines) == 8
    assert lines[-1].startswith(b'CASES ')
    count = int(lines[-1].split()[1])
    assert count > 19000 and sum(line.startswith((b'SET ', b'DESC ', b'ABSENT ')) for line in lines) == count
    return lines, count

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
assert all(sha(Path(p)) == h for p, h in identities.items()), 'Fixture inputs changed'
assert len(original[0]) == len(source[0]) and original[1] == source[1]
diffs = [i + 1 for i, (a, b) in enumerate(zip(original[0], source[0])) if a != b]
paths = [*inputs, *(HERE / (m + s) for m in ('original', 'source')
    for s in ('_output.log', '_stderr.log'))]
packet = {'status': 'MISMATCH' if diffs else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': original[1], 'differing_cases': len(diffs),
    'first_differences': diffs[:12], 'source_owned_methods': 32,
    'scope': 'Eight shader tables, vertex/pixel and matrix packing/optimization modes; recursive/array/member/name/opaque-handle reflection and all15 typed upload methods plus defaults, counts0/1/2/4/8, success/failure device returns. Full parameter descriptions/default bytes, device-call sequence hashes and constant-table buffers compared. CPU-only mock, not GPU or whole-file identity; allocator failure not covered.',
    'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(diffs), 'differences /', original[1], 'cases; zero accounting credit')
assert not diffs
