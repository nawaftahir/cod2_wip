#!/usr/bin/env python3
"""Run the complete source gate inside the pinned compiler image."""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
STEPS = [
    ('web-infrastructure', ['tools/test_web_ci.py']),
    ('game-ledger', ['research/gemini_review/test_game_ledger.py']),
    ('verify', ['tools/verify.py', '--all']),
    ('sections', ['tools/sections.py']),
    ('meter', ['tools/meter.py', '--gate']),
    ('complete-files', ['tools/file_ledger.py']),
    ('patch-dialog', ['research/codex_patchdialog/test_partial.py']),
    ('texture-vectors', ['research/codex_texturevecs/test_vectors.py']),
    ('patch-distance', ['research/codex_density/test_patch_distance.py']),
    ('density', ['research/gemini_review/test_density_partial.py']),
]

def anchor():
    text = (ROOT / 'checksums.yml').read_text()
    size = int(re.search(r'^  size: (\d+)$', text, re.M)[1])
    digest = re.search(r'^  sha256: ([a-f0-9]{64})$', text, re.M)[1]
    data = (ROOT / 'binaries/CoD2Radiant.exe').read_bytes()
    assert len(data) == size and hashlib.sha256(data).hexdigest() == digest, 'Retail anchor differs'
    print('Retail anchor:', digest, flush=True)

def main():
    os.chdir(ROOT)
    (ROOT / 'build').mkdir(exist_ok=True)
    (ROOT / 'scratch').mkdir(exist_ok=True)
    summary = ROOT / 'build/ci-summary.md'
    results = []
    try:
        anchor()
        for name, args in STEPS:
            print('CHECK:', name, flush=True)
            with (ROOT / ('build/ci-' + name + '.log')).open('w') as log:
                run = subprocess.run([sys.executable, '-u'] + args, stdout=log, stderr=subprocess.STDOUT)
            results.append({'check': name, 'exit_code': run.returncode})
            output = (ROOT / ('build/ci-' + name + '.log')).read_text(errors='replace')
            print(output[-14000:], end='', flush=True)
            if run.returncode:
                raise RuntimeError(name + ' failed; see build/ci-' + name + '.log')
        return 0
    except Exception as error:
        print('GATE FAILED:', error, flush=True)
        results.append({'check': 'gate', 'error': str(error), 'exit_code': 1})
        return 1
    finally:
        passed = bool(results) and all(r['exit_code'] == 0 for r in results)
        lines = ['# Radiant source gate: ' + ('PASS' if passed else 'FAIL'), '']
        for item in results:
            lines.append('- ' + item['check'] + ': ' + ('PASS' if item['exit_code'] == 0 else 'FAIL'))
        if (ROOT / 'build/summary.md').exists():
            lines += ['', (ROOT / 'build/summary.md').read_text()]
        lines += ['', 'Normalized source verification only; whole-image SHA and boot are separate milestones.']
        summary.write_text('\n'.join(lines) + '\n')
        (ROOT / 'build/ci-results.json').write_text(json.dumps(results, indent=2) + '\n')

if __name__ == '__main__':
    sys.exit(main())
