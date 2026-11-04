#!/usr/bin/env python3
"""Run the CPU-only original-SDK behavior fixture and persist exact input hashes."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
run = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
                      '-v', f'{ROOT / "gfx/target"}:/w', '-w', '/w', IMAGE,
                      'wine', 'scratch/codex35_sdk/test_predicates.exe'],
                     check=True, capture_output=True, text=True)
expected = 'PASS 361654 predicate/getter comparisons'
assert expected in run.stdout, (run.stdout, run.stderr)
paths = [Path(__file__), HERE / 'compile_test.sh', HERE / 'test_predicates.cpp',
         HERE / 'test_predicates.obj', HERE / 'test_predicates.exe',
         ROOT / 'gfx/target/src/codex_libraries/instruction_predicates.cpp',
         ROOT / 'sdk/sum2004/Lib/d3dx9.lib']
packet = {'status': 'PASS', 'image': IMAGE, 'comparisons': 361654, 'result': expected,
          'scope': '22 predicates plus three getters; CPU only, not a game/GPU smoke test',
          'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(expected)
