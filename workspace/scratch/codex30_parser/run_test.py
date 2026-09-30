#!/usr/bin/env python3
"""Compare complete shader/error outputs against the original SDK on CPU."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
source_inputs = [HERE / 'test_parsers.cpp', HERE / 'test_parsers.obj',
                 ROOT / 'gfx/target/build/codex30_parser/dependencies/d3dx9.lib',
                 *(ROOT / 'gfx/target/build/codex30_parser/libraries' / (n + '.obj')
                   for n in ('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants'))]
assert max(p.stat().st_mtime for p in source_inputs) <= (HERE / 'test_source.exe').stat().st_mtime
outputs = []
for name in ('test_original.exe', 'test_source.exe'):
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', str(ROOT / 'gfx/target') + ':/w', '-w', '/w', IMAGE,
        'wine', 'scratch/codex30_parser/' + name], check=True, capture_output=True)
    assert result.stdout.rstrip().endswith(b'CASES 96'), result.stdout[-200:]
    outputs.append(result.stdout)
assert outputs[0] == outputs[1], 'Reconstructed parser behavior differs from original SDK'
statuses = [int(line.split()[-1], 16) for line in outputs[0].splitlines()
            if line.startswith((b'ASM ', b'HLSL '))]
assert len(statuses) == 96 and any(r == 0 for r in statuses) and any(r & 0x80000000 for r in statuses)
paths = [Path(__file__), HERE / 'compile_test.sh', HERE / 'test_parsers.cpp',
         HERE / 'test_parsers.obj', HERE / 'test_original.exe', HERE / 'test_source.exe',
         ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
         ROOT / 'gfx/target/build/codex30_parser/dependencies/d3dx9.lib',
         *(ROOT / 'gfx/target/build/codex30_parser/libraries' / (n + '.obj')
           for n in ('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants'))]
(HERE / 'fixture_packet.json').write_text(json.dumps({
    'status': 'PASS', 'image': IMAGE, 'cases': 96,
    'scope': 'CPU assembly/compilation, full bytecode and diagnostic output equality; not a GPU/game boot',
    'output_sha256': hashlib.sha256(outputs[0]).hexdigest(),
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
}, indent=2) + '\n')
print('PASS: 96 shader assembly/compilation cases; full bytecode/errors equal to original SDK')
