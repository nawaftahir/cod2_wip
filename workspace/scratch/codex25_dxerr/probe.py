#!/usr/bin/env python3
"""Query SDK lookup siblings; emitted mappings are candidates, not proof."""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
keys = json.loads((HERE.parent / 'codex_dxerr_rebuild/mapping.json').read_text())
values = sorted({(int(key, 16) + delta) & 0xffffffff
                 for key in keys for delta in (-1, 0, 1)} | {0xffffffff, 0x12345678})
stdin = ''.join(f'{value:08x}\n' for value in values)
image = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
run = subprocess.run([
    'docker', 'run', '--rm', '-i', '--network', 'none',
    '-v', f'{ROOT / "gfx/target"}:/w', '-w', '/w', image,
    'wine', 'scratch/codex25_dxerr/oracle.exe',
], input=stdin, capture_output=True, text=True, check=True)
mapping = [{}, {}, {}]
for line in run.stdout.splitlines():
    key, *outputs = line.split('\t')
    assert len(outputs) == 3 and len(key) == 8
    for i, output in enumerate(outputs):
        if i == 1:
            text = bytes.fromhex(output).decode('latin1')
        else:
            assert len(output) % 4 == 0
            text = ''.join(chr(int(output[p:p + 4], 16)) for p in range(0, len(output), 4))
        if text != ('Unknown' if i == 0 else 'n/a'):
            mapping[i][key] = text
assert len(run.stdout.splitlines()) == len(values)
for name, data in zip(('name_w', 'description_a', 'description_w'), mapping):
    (HERE / (name + '_mapping.json')).write_text(json.dumps(data, indent=2) + '\n')
packet = {'image': image, 'sdk_lib_sha256': sha(ROOT / 'sdk/sum2004/Lib/DxErr9.lib'),
          'oracle_source_sha256': sha(HERE / 'oracle.cpp'),
          'oracle_exe_sha256': sha(HERE / 'oracle.exe'),
          'oracle_object_sha256': sha(HERE / 'oracle.obj'),
          'runner_sha256': sha(Path(__file__)),
          'stdin_sha256': hashlib.sha256(stdin.encode()).hexdigest(),
          'queries': len(values),
          'mappings': {name: sha(HERE / (name + '_mapping.json'))
                       for name in ('name_w', 'description_a', 'description_w')}}
(HERE / 'oracle_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
print('SDK oracle:', len(values), 'inputs;', [len(data) for data in mapping], 'named cases; no coverage credit')
