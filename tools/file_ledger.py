#!/usr/bin/env python3
"""Run complete-file audits and write the review table to ledger/files.tsv."""
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
CHECKS = (
    ('test_dialog_completion.py', 'all', ('ScaleDialog', 'NameDlg')),
    ('test_dialog_batch.py', None, ('NewProjDlg', 'DlgEvent', 'TextureLayout')),
    ('test_keyvalue_complete.py', None, ('KeyValueSelectDlg',)),
    ('test_finished_small.py', None, ('CapDialog', 'DialogThick', 'LstToolBar')),
    ('test_editor_completion.py', None, ('EditWnd', 'RADEditWnd')),
    ('test_mru_complete.py', None, ('mru',)),
    ('test_camera_complete.py', None, ('cameratargetdlg',)),
    ('research/web/test_findtexture_complete.py', None, ('src/radiant/FindTextureDlg.cpp',)),
    ('research/web/test_zlib_leaf_complete.py', None, (
        'src/zlib/adler32.c', 'src/zlib/compress.c', 'src/zlib/inffast.c',
        'src/zlib/infutil.c', 'src/zlib/uncompr.c',
    )),
    ('research/codex_deflate/test_complete.py', None, ('src/zlib/deflate.c',)),
)

def read(path):
    lines = [line for line in (ROOT / path).read_text().splitlines()
             if line and not line.startswith('#')]
    return list(csv.DictReader(lines, delimiter='\t'))

def main():
    result = ROOT / 'build/verify.json'
    checked = json.loads(result.read_text())
    rows = read('ledger/matches.tsv')
    assert checked['failed'] == 0 and checked['matched'] == len(rows)
    inputs = list((ROOT / 'src').rglob('*.cpp')) + list((ROOT / 'src').rglob('*.c'))
    inputs += list((ROOT / 'src').rglob('*.h'))
    inputs += [ROOT / name for name in ('data/flags.tsv', 'data/lib_funcs.tsv',
               'ledger/matches.tsv', 'ledger/compiler.tsv')]
    assert result.stat().st_mtime >= max(p.stat().st_mtime for p in inputs), 'Run the full referee after source changes'
    image = ROOT / 'build/CoD2Radiant.exe'
    image_hash = hashlib.sha256(image.read_bytes()).hexdigest()
    proofs = {}
    log = []
    for script, mode, files in CHECKS:
        command = [sys.executable, script if script.startswith('research/') else 'research/gemini_review/' + script]
        if mode: command.append(mode)
        run = subprocess.run(command, cwd=ROOT, capture_output=True, text=True)
        log += ['$ ' + ' '.join(command), run.stdout, run.stderr]
        (ROOT / 'build/file-ledger-audit.log').write_text('\n'.join(log))
        assert run.returncode == 0, 'File audit failed: ' + script
        for name in files: proofs[name if name.startswith('src/') else 'src/radiant/' + name + '.cpp'] = ' '.join(command[1:])
    assert hashlib.sha256(image.read_bytes()).hexdigest() == image_hash, 'Linked image changed during audits'
    sources = []
    for line in (ROOT / 'link/order.txt').read_text().splitlines():
        if not line or line.startswith('#'): continue
        source = line.split('\t')[0]
        if source.startswith('extlib/'): continue
        sources.append(source if source.startswith('src/') else 'src/' + source)
    sources = list(dict.fromkeys(sources + sorted({r['source'] for r in rows})))
    board = {r['file']: r for r in read('lanes/BOARD.tsv')}
    output = io.StringIO()
    writer = csv.writer(output, delimiter='\t', lineterminator='\n')
    writer.writerow(('source', 'status', 'matched_game_functions', 'matched_game_bytes',
                     'metadata', 'image_placement', 'proof', 'remaining'))
    for source in sources:
        matches = [r for r in rows if r['source'] == source]
        note = board.get(source, {}).get('reference', '')
        verified = source in proofs
        partial = bool(matches) or board.get(source, {}).get('status') == 'partial'
        writer.writerow((source, 'VERIFIED' if verified else 'PARTIAL' if partial else 'UNSTARTED',
                         len(matches), sum(int(r['size']) for r in matches),
                         'PASS' if verified else 'PENDING', 'PENDING', proofs.get(source, ''),
                         '' if verified else note))
    (ROOT / 'ledger/files.tsv').write_text(output.getvalue())
    (ROOT / 'build/file-ledger-proof.json').write_text(json.dumps({
        'linked_sha256': image_hash, 'verified_files': sorted(proofs),
        'game_rows': checked['matched'], 'game_bytes': checked['matched_bytes'],
    }, indent=2) + '\n')
    print('FILE LEDGER:', len(proofs), 'VERIFIED /', len(sources), 'files; image placement remains PENDING')

if __name__ == '__main__':
    if not os.environ.get('RADIANT_IN_IMAGE'):
        os.execvp('docker', ['docker', 'run', '--rm', '-v', str(ROOT)+':/w', '-w', '/w',
                  '-e', 'RADIANT_IN_IMAGE=1', os.environ.get('RADIANT_IMAGE','cod2-radiant-msvc71'),
                  'python3', 'tools/file_ledger.py'] + sys.argv[1:])
    main()
