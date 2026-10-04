"""Compare every byte of both CPU shader-compiler outputs. No source credit."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
SOURCE = TARGET / 'src/codex_shader_parse_casts/casts.cpp'
OBJECT = TARGET / 'build/codex35_parse_casts/libraries/casts.obj'
inputs = [HERE / name for name in (
    'compile_fixture.sh', 'select_dependencies.py', 'dependency_selection.json',
    'test_evaluator.obj', 'casts_dependencies.lib')]
inputs += [SOURCE, OBJECT]
inputs += [HERE / 'test_evaluator.cpp',
    HERE.parent / 'codex30_parser/select_dependencies.py']
inputs += [ROOT / 'sdk/sum2004/Lib/d3dx9.lib', TARGET / 'src/codex_shader_nodes/nodes.cpp',
    *(HERE.parent / 'codex19_dxerr/compiler' / name for name in ('cl.exe', 'c1xx.dll', 'c2.dll'))]
selection = json.loads((HERE / 'dependency_selection.json').read_text())
assert len(selection['removed_definitions']) == 2
assert {name.split('@')[0] for name in selection['source_objects']} == {
    '?CastToFloat', '?CastToValue'}
assert set(selection['source_objects'].values()) == {
    hashlib.sha256(OBJECT.read_bytes()).hexdigest()}

original_identities = {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in [*inputs, Path(__file__)]}
assert max(SOURCE.stat().st_mtime_ns, (TARGET / 'src/codex_shader_nodes/nodes.cpp').stat().st_mtime_ns) <= OBJECT.stat().st_mtime_ns

def run(mode):
    exe = HERE / (mode + '.exe')
    relevant = inputs if mode == 'source' else [HERE / 'test_evaluator.cpp', HERE / 'test_evaluator.obj',
        HERE / 'compile_fixture.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime for p in relevant) <= exe.stat().st_mtime
    mapping = (HERE / (mode + '.map')).read_text()
    for name in ('?CastToFloat', '?CastToValue',):
        lines = [line for line in mapping.splitlines() if name + '@CParse@' in line]
        expected = 'd3dx9:cparse.obj' if mode == 'original' else 'casts.obj'
        assert len(lines) == 1 and lines[0].split()[-1] == expected, lines
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex35_parse_casts/' + exe.name], capture_output=True)
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    (HERE / (mode + '_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stderr[-3000:], result.stdout[-1000:])
    lines = result.stdout.splitlines()
    assert len(lines) == 1401 and lines[-1] == b'CASES 1400', lines[-2:]
    successes = sum(line.split()[4] == b'00000000' for line in lines[:-1])
    assert successes > 0, 'No successful shader compiled'
    return lines, successes

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
differences = [(i + 1, a.decode(), b.decode()) for i, (a, b) in
    enumerate(zip(original[0], source[0])) if a != b]
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest() == value for p, value in original_identities.items()), 'Inputs changed during CPU execution'
packet = {'status': 'MISMATCH' if differences else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 1400, 'differing_cases': len(differences),
    'successful_compiles': {'original': original[1], 'source': source[1]},
    'first_differences': differences[:12],
    'scope': 'CPU-only D3DXCompileShader: complete HRESULT, shader, diagnostic and constant-table buffers; constant intrinsic evaluations including matrix operations, six types, two profiles and optimization modes; full compile errors compared. Other SDK methods are opaque dependencies; no GPU, allocation-failure, whole-file or byte-match certification.',
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
        for p in [*inputs, Path(__file__), *(HERE / (m + suffix) for m in ('original', 'source')
            for suffix in ('.exe', '.map', '_output.log', '_stderr.log'))]}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(differences), 'differences / 1400 cases;', packet['successful_compiles'], '; zero source credit')
for line in differences[:4]: print(str(line)[:1600])
assert not differences
