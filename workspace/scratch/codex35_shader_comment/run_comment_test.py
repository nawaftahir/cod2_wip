"""Compare all public comment results and verify source ownership for324 cases."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
RUN = TARGET / 'build/codex35_shader_comment'
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'comment_test.cpp', HERE / 'comment_test.obj', HERE / 'compile_clean_test.sh',
    HERE / 'run_comment_test.py', HERE / 'clean_packet.json', HERE / 'link_dependency_selection.json',
    TARGET / 'src/codex_shader_comment/comment.cpp', RUN / 'dependencies/runtime_new.lib',
    RUN / 'dependencies/d3dx9.lib', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
    *list((RUN / 'libraries').glob('*.obj')), *list((ROOT / 'sdk/sum2004/Include').glob('*.h')),
    *(HERE.parent / 'codex19_dxerr/compiler' / name for name in ('cl.exe', 'c1xx.dll', 'c2.dll'))]

def run(mode):
    exe = HERE / (mode + '_comment.exe')
    assert max(p.stat().st_mtime for p in inputs) <= exe.stat().st_mtime
    mapping = (HERE / (mode + '_comment.map')).read_text()
    rows = [line for line in mapping.splitlines() if '_D3DXFindShaderComment@16' in line.split()]
    assert len(rows) == 1
    owner = rows[0].split()[-1]
    assert owner == 'comment.obj' if mode == 'source' else owner.startswith('d3dx9:'), owner
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', str(TARGET) + ':/work',
        '-w', '/work', IMAGE, 'wine', 'scratch/codex35_shader_comment/' + exe.name], capture_output=True)
    (HERE / (mode + '_comment_output.log')).write_bytes(result.stdout)
    (HERE / (mode + '_comment_stderr.log')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.stderr[-2000:])
    lines = result.stdout.splitlines()
    assert len(lines) == 325 and lines[-1] == b'CASES 324'
    return lines

with ThreadPoolExecutor(max_workers=2) as pool:
    original, source = list(pool.map(run, ('original', 'source')))
differences = [(i + 1, a.decode(), b.decode()) for i, (a, b) in enumerate(zip(original, source)) if a != b]
packet = {'status': 'MISMATCH' if differences else 'PASS', 'source_credit': 0,
    'image': IMAGE, 'cases': 324, 'differing_cases': len(differences), 'first_differences': differences[:12],
    'scope': 'CPU public D3DXFindShaderComment; all324 HRESULT/pointer-offset/byte-count results. Six accepted header kinds, PS1, invalid kind, null input, four optional-output combinations, ten bounded token/comment patterns; no GPU or malformed unbounded-buffer claim.',
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in [*inputs,
        *(HERE / (mode + '_comment' + suffix) for mode in ('original', 'source')
          for suffix in ('.exe', '.map', '_output.log', '_stderr.log'))]}}
(HERE / 'comment_fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(packet['status'], len(differences), 'differences /324 public comment cases; ZERO added coverage')
assert not differences
