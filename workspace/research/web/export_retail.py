"""Regenerate the assigned TU evidence inside the pinned compiler image."""
import csv
import hashlib
import json
from pathlib import Path
import subprocess
import sys
sys.path.insert(0, 'tools')
import link

rows = [r for r in link.read_tsv('data/tu_map.tsv') if r['tu'] == 'radiant/FindTextureDlg.cpp']
assert len(rows) == 16
folder = Path('workspace/research/web/retail')
folder.mkdir(exist_ok=True)
with (folder / 'inventory.tsv').open('w') as f:
    writer = csv.DictWriter(f, fieldnames=rows[0].keys(), delimiter='\t', lineterminator='\n')
    writer.writeheader()
    writer.writerows(rows)
for row in rows:
    run = subprocess.run([sys.executable, 'tools/show.py', row['addr']], capture_output=True, text=True, check=True)
    (folder / (row['addr'] + '.txt')).write_text('\n'.join(line.rstrip() for line in run.stdout.splitlines()).rstrip() + '\n')
manifest = {'anchor_sha256': hashlib.sha256(Path('binaries/CoD2Radiant.exe').read_bytes()).hexdigest(),
            'command': 'python3 workspace/research/web/export_retail.py',
            'files': {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(folder.iterdir()) if p.name != 'manifest.json'}}
(folder / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
print(len(rows), 'retail entries exported; inventory labels and decompiled types remain provisional')
