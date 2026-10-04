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
inputs = [HERE / name for name in ('math.cpp', 'math.h',
    'compile_math_fixture.sh', 'select_math_dependencies.py', 'math_dependency_selection.json',
    'obj/math.obj', 'math_test.obj', 'math_dependencies.lib')]
inputs += [HERE / 'math_test.cpp',
    HERE.parent / 'codex30_parser/select_dependencies.py']
inputs += [ROOT / 'sdk/sum2004/Lib/d3dx9.lib', TARGET / 'src/codex_shader_nodes/nodes.cpp',
    *(HERE.parent / 'codex19_dxerr/compiler' / name for name in ('cl.exe', 'c1xx.dll', 'c2.dll'))]
selection = json.loads((HERE / 'math_dependency_selection.json').read_text())
assert len(selection['removed_definitions']) == 3
assert {name.split('@')[0] for name in selection['source_objects']} == {
    '?EmitSinCos', '?EmitPow', '?EmitATan2'}
assert set(selection['source_objects'].values()) == {
    hashlib.sha256((HERE / 'obj' / name).read_bytes()).hexdigest() for name in ('math.obj',)}

original_identities = {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in [*inputs, Path(__file__)]}
assert max((HERE / 'math.cpp').stat().st_mtime_ns, (HERE / 'math.h').stat().st_mtime_ns) <= (HERE / 'obj/math.obj').stat().st_mtime_ns

def run(mode):
    exe = HERE / ('math_' + mode + '.exe')
    relevant = inputs if mode == 'source' else [HERE / 'math_test.cpp', HERE / 'math_test.obj',
        HERE / 'compile_math_fixture.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime for p in relevant) <= exe.stat().st_mtime
    mapping = (HERE / ('math_' + mode + '.map')).read_text()
    for name in ('?EmitSinCos', '?EmitPow', '?EmitATan2',):
        lines = [line for line in mapping.splitlines() if name + '@CCompiler@' in line]
        expected = 'd3dx9:ccompiler.obj' if mode == 'original' else 'math.obj'
        assert len(lines) == 1 and lines[0].split()[-1] == expected, lines
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex35_unary/' + exe.name], capture_output=True)
    (HERE / ('math_' + mode + '_output.log')).write_bytes(result.stdout)
    (HERE / ('math_' + mode + '_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stderr[-3000:], result.stdout[-1000:])
    lines = result.stdout.splitlines()
    assert len(lines) == 1817 and lines[-1] == b'CASES 1816', lines[-2:]
    successes = sum(line.split()[4] == b'00000000' for line in lines[:-1])
    assert successes > 0, 'No successful shader compiled'
    return lines, successes

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
differences = [(i + 1, a.decode(), b.decode()) for i, (a, b) in
    enumerate(zip(original[0], source[0])) if a != b]
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest() == value for p, value in original_identities.items()), 'Inputs changed during CPU execution'
packet = {'status': 'MISMATCH' if differences else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 1816, 'differing_cases': len(differences),
    'successful_compiles': {'original': original[1], 'source': source[1]},
    'first_differences': differences[:12],
    'scope': 'CPU-only D3DXCompileShader: complete HRESULT, shader, diagnostic and constant-table buffers; two profiles, optimized/unoptimized, arithmetic, comparisons, casts, intrinsics, assignments, swizzles, array access, function calls and compile errors. Other SDK methods are opaque dependencies; no GPU, allocation-failure, whole-file or byte-match certification.',
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
        for p in [*inputs, Path(__file__), *(HERE / ('math_' + m + suffix) for m in ('original', 'source')
            for suffix in ('.exe', '.map', '_output.log', '_stderr.log'))]}}
(HERE / 'math_fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(differences), 'differences / 1816 cases;', packet['successful_compiles'], '; zero source credit')
for line in differences[:4]: print(str(line)[:1600])
