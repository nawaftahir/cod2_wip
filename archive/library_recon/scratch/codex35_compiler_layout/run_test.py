"""Compare both predicates against the original SDK; behavior never grants bytes."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / n for n in ('layout.cpp', 'compile.sh', 'test.cpp', 'test.obj',
    'compile_test.sh', 'obj/layout.obj', 'select_dependencies.py',
    'dependency_selection.json', 'dependencies/d3dx9.lib')]
inputs += [ROOT / 'sdk/sum2004/Lib/d3dx9.lib', TARGET / 'src/codex_shader_nodes/nodes.cpp']
inputs += [HERE.parent / 'codex19_dxerr/compiler' / n for n in ('cl.exe', 'c1xx.dll', 'c2.dll')]


def run(mode):
    exe, mapping = HERE / (mode + '.exe'), HERE / (mode + '.map')
    selected = inputs if mode == 'source' else [p for p in inputs
        if p not in (HERE / 'dependencies/d3dx9.lib', HERE / 'dependency_selection.json',
                      HERE / 'select_dependencies.py', HERE / 'obj/layout.obj', HERE / 'compile.sh')]
    assert max(p.stat().st_mtime for p in selected) <= exe.stat().st_mtime
    for name in ('?IsRowMajor@CCompiler@', '?IsColumnMajor@CCompiler@'):
        row, = [line for line in mapping.read_text().splitlines() if name in line]
        assert row.split()[-1] == ('layout.obj' if mode == 'source' else 'd3dx9:ccompiler.obj')
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex35_compiler_layout/' + exe.name], capture_output=True)
    assert result.returncode == 0, (mode, result.stderr[-3000:])
    assert len(result.stdout.splitlines()) == 32769 and result.stdout.rstrip().endswith(b'CASES 32768')
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    return result.stdout


with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
differences = [(i + 1, a.decode(), b.decode()) for i, (a, b) in
    enumerate(zip(original.splitlines(), source.splitlines())) if a != b]
paths = [*inputs, Path(__file__), *(HERE / (mode + suffix)
    for mode in ('original', 'source') for suffix in ('.exe', '.map', '_output.log'))]
packet = {'status': 'MISMATCH' if differences else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 32768, 'differing_cases': len(differences),
    'first_differences': differences[:12],
    'scope': 'Both matrix-layout predicates; numeric template codes 0..3, dimensions 0..7, label flags, differing registers, direct/indexed layouts, differing instruction owners and reversed argument lists. Original compiler constructor remains an SDK dependency. No allocation-failure/GPU/whole-file claim.',
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(differences), 'differing output rows of 32768; zero source credit')
for row in differences[:4]: print(row)
