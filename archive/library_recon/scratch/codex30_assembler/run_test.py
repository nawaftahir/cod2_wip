"""Compare complete SDK/source assembler outputs in the pinned CPU image."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'test.cpp', HERE / 'compile_test.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
          TARGET / 'src/codex_shader_nodes/nodes.cpp', TARGET / 'src/codex_shader_assembler/asm_nodes.cpp', TARGET / 'src/codex_shader_assembler/assembler.cpp',
          TARGET / 'src/codex_shader_support/support.h',
          *list((TARGET / 'build/codex30_assembler/libraries').glob('*.obj')),
          TARGET / 'build/codex30_assembler/dependencies/d3dx9.lib']
outputs = []
for mode in ('original', 'source'):
    exe = HERE / ('test_' + mode + '.exe')
    assert max(p.stat().st_mtime for p in inputs) <= (HERE / 'test.obj').stat().st_mtime <= exe.stat().st_mtime
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', str(TARGET) + ':/work',
        '-w', '/work', IMAGE, 'wine', 'scratch/codex30_assembler/' + exe.name], check=True, capture_output=True)
    assert len(result.stdout.splitlines()) == 1441
    assert result.stdout.rstrip().endswith(b'CASES 1440')
    outputs.append(result.stdout)
assert outputs[0] == outputs[1], 'complete SDK/source fixture output differs'
paths = [*inputs, Path(__file__), HERE / 'test.obj', *(HERE / ('test_' + m + '.exe') for m in ('original', 'source'))]
(HERE / 'fixture_packet.json').write_text(json.dumps({'status': 'PASS', 'image': IMAGE, 'cases': 1440,
    'scope': 'assembler constructors, untouched bytes, recursive copies, non-null handling, valid masks/swizzles, buffer growth and full returned bytes; valid/invalid assembly and diagnostics in both debug modes; not allocation failure or game/GPU boot',
    'output_sha256': hashlib.sha256(outputs[0]).hexdigest(),
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}, indent=2) + '\n')
print('PASS: 1440 complete-output CPU comparisons against original SDK')
