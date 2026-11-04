#!/usr/bin/env python3
"""Compare named cases, boundary neighbours and deterministic random inputs."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
mapping = json.loads((HERE.parent / 'codex_dxerr_rebuild/mapping.json').read_text())
values = sorted({(int(key, 16) + delta) & 0xffffffff
                 for key in mapping for delta in (-1, 0, 1)})
data = ''.join(f'{value:08x}\n' for value in values)
run = subprocess.run([
    'docker', 'run', '--rm', '-i', '--network', 'none',
    '-v', f'{ROOT / "gfx/target"}:/w', '-w', '/w',
    'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694',
    'wine', 'scratch/codex19_dxerr/test_lookup.exe',
], input=data, text=True, capture_output=True, check=True)
expected = f'PASS {len(values) + 100000} source/reference lookup comparisons'
assert expected in run.stdout, (run.stdout, run.stderr)
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
packet = {'status': 'PASS', 'named_cases': len(mapping), 'boundary_inputs': len(values),
          'random_inputs': 100000, 'stdin_sha256': hashlib.sha256(data.encode()).hexdigest(),
          'result': expected, 'runner_sha256': sha(Path(__file__)),
          'source_sha256': sha(HERE / 'group_sdk_leaf.cpp'),
          'test_source_sha256': sha(HERE / 'test_lookup.cpp'),
          'build_script_sha256': sha(HERE / 'compile_test.sh'),
          'test_exe_sha256': sha(HERE / 'test_lookup.exe'),
          'test_object_sha256': sha(HERE / 'test_lookup.obj'),
          'lookup_object_sha256': sha(HERE / 'fixture_lookup.obj'),
          'sdk_lib_sha256': sha(ROOT / 'sdk/sum2004/Lib/DxErr9.lib')}
(HERE / 'fixture_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print(expected)
