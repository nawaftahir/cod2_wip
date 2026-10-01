"""Fresh full-output CPU comparison of profile selection and operand copies."""
import hashlib
import json
from pathlib import Path
import subprocess
HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'test.cpp', HERE / 'compile_test.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
          *(TARGET / 'src/codex_shader_instructions').glob('*.cpp'),
          *(TARGET / 'build/codex30_instructions/libraries' / (n + '.obj') for n in ('instruction_copy', 'shader_profiles', 'cparse_cast')),
          TARGET / 'build/codex30_instructions/dependencies/d3dx9.lib']
outputs = []
for mode in ('original', 'source'):
    exe = HERE / ('test_' + mode + '.exe')
    assert max(p.stat().st_mtime for p in inputs) <= (HERE / 'test.obj').stat().st_mtime <= exe.stat().st_mtime
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', str(TARGET) + ':/work', '-w', '/work',
                             IMAGE, 'wine', 'scratch/codex30_instructions/' + exe.name], check=True, capture_output=True)
    assert len(result.stdout.splitlines()) == 10286
    assert result.stdout.rstrip().endswith(b'CASES 10285')
    outputs.append(result.stdout)
assert outputs[0] == outputs[1], 'full SDK/source fixture output differs'
paths = [*inputs, Path(__file__), HERE / 'test.obj', *(HERE / ('test_' + m + '.exe') for m in ('original', 'source'))]
(HERE / 'fixture_packet.json').write_text(json.dumps({'status': 'PASS', 'image': IMAGE, 'cases': 10285,
    'scope': 'CPU capability profiles, inline operand copies and cast compatibility codes; not GPU/game/large allocations',
    'output_sha256': hashlib.sha256(outputs[0]).hexdigest(),
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}, indent=2) + '\n')
print('PASS: 10285 full-output CPU comparisons with original SDK')
