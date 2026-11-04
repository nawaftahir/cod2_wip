#!/usr/bin/env python3
"""Run all four source lookups against their authentic SDK counterparts."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
keys = set(json.loads((HERE.parent / 'codex_dxerr_rebuild/mapping.json').read_text()))
for stem in ('name_w', 'description_a', 'description_w'):
    keys.update(json.loads((HERE / (stem + '_mapping.json')).read_text()))
values = sorted({(int(key, 16) + delta) & 0xffffffff
                 for key in keys for delta in (-1, 0, 1)} | {0xffffffff, 0x12345678})
stdin = ''.join(f'{value:08x}\n' for value in values)
run = subprocess.run([
    'docker', 'run', '--rm', '-i', '--network', 'none',
    '-v', f'{ROOT / "gfx/target"}:/w', '-w', '/w',
    'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694',
    'wine', 'scratch/codex25_dxerr/test_lookup.exe',
], input=stdin, capture_output=True, text=True, check=True)
count = len(values) + 100000
expected = f'PASS {count} inputs; {count * 4} source/reference lookup comparisons'
assert expected in run.stdout, (run.stdout, run.stderr)
files = [HERE / 'run_test.py', HERE / 'test_lookup.cpp', HERE / 'compile_test.sh',
         HERE / 'test_lookup.exe', HERE / 'test_lookup.obj',
         ROOT / 'sdk/sum2004/Lib/DxErr9.lib']
for stem in ('name', 'name_w', 'description_a', 'description_w'):
    files.extend([HERE / ('fixture_' + stem + '.obj'),
                  ROOT / 'gfx/target/src/codex_libraries' / ('dxerr9_' + stem + '.cpp')])
packet = {'status': 'PASS', 'boundary_inputs': len(values), 'random_inputs': 100000,
          'lookup_comparisons': count * 4, 'result': expected,
          'stdin_sha256': hashlib.sha256(stdin.encode()).hexdigest(),
          'files': {str(path.relative_to(ROOT)): sha(path) for path in files}}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(expected)
