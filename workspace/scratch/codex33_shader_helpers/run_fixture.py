"""CPU differential tests for five native shader helpers; zero accounting credit."""
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
assert proof['verified_instruction_bytes'] == 616 and len(proof['rows']) == 5
selection = json.loads((HERE / 'fixture_dependency_selection.json').read_text())
assert set(selection['source_objects']) == {r['symbol'] for r in proof['rows']}
obj = TARGET / 'build/codex33_shader_helpers/libraries/native_helpers.obj'
assert set(selection['source_objects'].values()) == {sha(obj)}
inputs = [ROOT / p for p in proof['files']]
inputs += [HERE / p for p in ('run_fixture.py', 'test_helpers.cpp', 'test_helpers.obj',
    'compile_fixture.sh', 'clean_packet.json', 'fixture_dependency_selection.json',
    'helper_dependencies.lib', 'helpers.h')]
inputs += [HERE / (m + s) for m in ('original', 'source') for s in ('.exe', '.map')]
identities = {str(p): sha(p) for p in inputs}
assert all(sha(ROOT / p) == h for p, h in proof['files'].items())
assert (HERE / 'test_helpers.cpp').stat().st_mtime_ns <= (HERE / 'test_helpers.obj').stat().st_mtime_ns
assert sha(HERE / 'helpers.h') == sha(TARGET / 'src/codex_shader_native_helpers/helpers.h')
assert (HERE / 'helpers.h').stat().st_mtime_ns <= (HERE / 'test_helpers.obj').stat().st_mtime_ns

def run(mode):
    exe = HERE / (mode + '.exe')
    relevant = [HERE / 'test_helpers.obj', HERE / 'compile_fixture.sh']
    relevant += [obj, HERE / 'helper_dependencies.lib'] if mode == 'source' else [ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime_ns for p in relevant) <= exe.stat().st_mtime_ns
    mapping = (HERE / (mode + '.map')).read_text().splitlines()
    for row in proof['rows']:
        lines = [line for line in mapping if row['symbol'] in line]
        assert len(lines) == 1, (mode, row['symbol'], lines)
        expected = 'native_helpers.obj' if mode == 'source' else None
        if expected:
            assert lines[0].split()[-1] == expected, lines
        else:
            assert lines[0].split()[-1].startswith('d3dx9:'), lines
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex33_shader_helpers/' + exe.name], capture_output=True)
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    (HERE / (mode + '_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stdout[-3000:], result.stderr[-1000:])
    lines = result.stdout.splitlines()
    assert lines[-1].startswith(b'CASES ')
    count = int(lines[-1].split()[1])
    assert count == 13952 and len(lines) == count + 1
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
    'first_differences': diffs[:12], 'source_owned_methods': 5,
    'scope': 'CPU-only five source-owned methods:1296 write masks over eight versions; pool initialization/copy/self-copy/null preserving all observed fields;512 pool/register/remap restrictions;2048 capability setups preserving an oversized access record. Every return and output field compared. No SDK allocation-size, GPU, game-boot or whole-file proof.',
    'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(diffs), 'differences /', original[1], 'cases; zero accounting credit')
assert not diffs
