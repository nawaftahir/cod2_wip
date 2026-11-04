#!/usr/bin/env python3
"""Full-output SDK/source comparison for the eleven exact read helpers."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'test_reads.cpp', TARGET / 'src/codex_shader_constants/read_typed.cpp', HERE / 'compile_reads_test.sh',
          TARGET / 'src/codex_shader_constants/shader_version.cpp',
          ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
outputs = []
for mode in ('original', 'source'):
    exe = HERE / ('test_' + mode + '.exe')
    obj = HERE / 'obj' / ('test_' + mode + '.obj')
    assert max(p.stat().st_mtime for p in inputs) <= obj.stat().st_mtime <= exe.stat().st_mtime
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(TARGET) + ':/work', '-w', '/work', IMAGE,
        'wine', 'scratch/codex30_constants/' + exe.name], check=True, capture_output=True)
    assert result.stdout.rstrip().endswith(b'CASES 2000'), result.stdout[-100:]
    assert len(result.stdout.splitlines()) == 2001
    outputs.append(result.stdout)
assert outputs[0] == outputs[1], 'read behavior differs from SDK'
assert outputs[0] != b'CASES 2000\n', 'empty fixture'
paths = [*inputs, Path(__file__),
         *(HERE / ('test_' + mode + '.exe') for mode in ('original', 'source')),
         *(HERE / 'obj' / ('test_' + mode + '.obj') for mode in ('original', 'source'))]
(HERE / 'reads_fixture_packet.json').write_text(json.dumps({
    'status': 'PASS', 'image': IMAGE, 'cases': 2000,
    'scope': 'CPU read helpers; matrices, pointer arrays, vector reads and inclusive bounds; not GPU/game boot',
    'output_sha256': hashlib.sha256(outputs[0]).hexdigest(),
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
}, indent=2) + '\n')
print('PASS: 2000 full-output CPU comparisons with original SDK')
