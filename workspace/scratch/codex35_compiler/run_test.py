"""Compare full original/source outputs; unmatched drafts stay uncredited."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'compiler.cpp', HERE / 'compile.sh', HERE / 'test.cpp',
    HERE / 'compile_test.sh', HERE / 'obj/compiler.obj', HERE / 'test.obj',
    HERE / 'select_dependencies.py', HERE / 'dependency_selection.json',
    HERE / 'dependencies/d3dx9.lib', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
    TARGET / 'src/codex_shader_nodes/nodes.cpp',
    *(HERE.parent / 'codex19_dxerr/compiler' / name for name in ('cl.exe', 'c1xx.dll', 'c2.dll'))]

def run(mode):
    exe = HERE / (mode + '.exe')
    selected = inputs if mode == 'source' else [p for p in inputs if p.name in
        ('compiler.cpp', 'test.cpp', 'compile_test.sh', 'test.obj', 'nodes.cpp', 'cl.exe', 'c1xx.dll', 'c2.dll') or p == ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
    assert max(p.stat().st_mtime for p in selected) <= exe.stat().st_mtime
    mapping = (HERE / (mode + '.map')).read_text()
    for name in ('??0CCompiler@', '?Scratch@', '?StackAlloc@', '?StackFree@',
        '?EmitTemp@', '?IsFullySemantic@', '?CompareSemantic@', '?EvalValue@', '?EvalRange@', '?EvalRange_Mul@'):
        rows = [line for line in mapping.splitlines() if name in line]
        assert len(rows) == 1
        assert rows[0].endswith('compiler.obj' if mode == 'source' else 'd3dx9:ccompiler.obj')
        if mode == 'source': assert ':' not in rows[0].split()[-1]
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE, 'wine',
        'scratch/codex35_compiler/' + exe.name], capture_output=True)
    assert result.returncode == 0, (mode, result.returncode, result.stderr[-3000:], result.stdout[-1000:])
    assert result.stdout.rstrip().endswith(b'CASES 20355'), result.stdout[-1000:]
    assert len(result.stdout.splitlines()) == 20356
    (HERE / (mode + '_output.log')).write_bytes(result.stdout)
    return result.stdout

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
differences = [(i + 1, a.decode(), b.decode()) for i, (a, b) in
    enumerate(zip(original.splitlines(), source.splitlines())) if a != b]
paths = [*inputs, Path(__file__), *(HERE / (m + suffix) for m in ('original', 'source')
    for suffix in ('.exe', '.map', '_output.log'))]
packet = {'status': 'MISMATCH' if differences else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 20355, 'differing_cases': len(differences),
    'first_differences': differences[:12],
    'scope': '1969 allocator/stack/temp/semantic/constant-value cases plus 18386 range cases. Range multiplication includes NaNs, signed zero and infinities; cached/constant ranges, interval flag updates, unary/binary/select/dot/lit/sincos operations, aliases and nullable outputs. GetToken, IsNumeric, ApplyType, allocation failures, general indexed EvalValue, and game/GPU behavior are not certified.',
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(differences), 'differing cases of 20355; source credit remains zero')
for line in differences[:4]: print(line)
