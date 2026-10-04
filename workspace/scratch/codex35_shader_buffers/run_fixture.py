"""CPU-only comparison of all four buffer callbacks against the original SDK bodies."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
OBJ = TARGET / 'build/codex35_shader_buffers/libraries/buffers.obj'
proof = json.loads((HERE / 'clean_packet.json').read_text())
assert proof['verified_instruction_bytes'] == 308 and len(proof['rows']) == 4
inputs = [ROOT / p for p in proof['files']]
inputs += [HERE / p for p in ('test_buffers.cpp', 'test_buffers.obj',
    'compile_fixture.sh', 'clean_packet.json', 'run_fixture.py')]
inputs += [HERE.parent / 'codex19_dxerr/compiler' / p for p in ('cl.exe', 'c1xx.dll', 'c2.dll')]
inputs += [HERE / (mode + suffix) for mode in ('original', 'source') for suffix in ('.exe', '.map')]

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

identities = {str(p): sha(p) for p in inputs}
assert all(sha(ROOT / p) == digest for p, digest in proof['files'].items())
assert (HERE / 'test_buffers.cpp').stat().st_mtime_ns <= (HERE / 'test_buffers.obj').stat().st_mtime_ns

def run(mode):
    exe = HERE / (mode + '.exe')
    relevant = [HERE / 'test_buffers.obj', HERE / 'compile_fixture.sh']
    relevant += [OBJ] if mode == 'source' else [ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime_ns for p in relevant) <= exe.stat().st_mtime_ns
    mapping = (HERE / (mode + '.map')).read_text()
    for row in proof['rows']:
        lines = [line for line in mapping.splitlines() if row['symbol'] in line]
        assert len(lines) == 1, (mode, row['symbol'], lines)
        assert lines[0].split()[-1] == ('buffers.obj' if mode == 'source' else 'd3dx9:cconstanttable.obj'), lines
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex35_shader_buffers/' + exe.name], capture_output=True)
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    (HERE / (mode + '_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stderr[-2000:])
    lines = result.stdout.splitlines()
    assert len(lines) == 257 and lines[-1] == b'CASES 256', lines[-2:]
    return lines

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
assert all(sha(Path(p)) == digest for p, digest in identities.items()), 'Fixture input mutation'
diffs = [i + 1 for i, (a, b) in enumerate(zip(original, source)) if a != b]
paths = [*inputs, *(HERE / (m + suffix) for m in ('original', 'source')
    for suffix in ('_output.log', '_stderr.log'))]
packet = {'status': 'MISMATCH' if diffs else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 256, 'differing_cases': len(diffs), 'first_differences': diffs[:10],
    'scope': 'Four source-selected buffer callbacks vs original SDK; full input, scratch and destination buffers, HRESULT and GetBufferPointer call count; zero/vector counts, scratch aliasing, integer/float bit patterns including NaN/Inf. Mock buffer is CPU-only, not GPU or whole-file proof.',
    'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(diffs), 'differences / 256 cases; zero new accounting credit')
assert not diffs
