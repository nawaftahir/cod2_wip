#!/usr/bin/env python3
"""Snapshot readable candidates with provenance; never imports byte transplants."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import shutil
import tempfile

from audit_legacy import ROOT, load_matcher
from check_shape import check

HERE = Path(__file__).resolve().parent
RUNS = ('baseline_w7psnpgf', 'baseline_brlg4r7u', 'baseline_p9txpec2',
        'baseline_9tqw8c6g', 'baseline_s6wi07wo')


def main():
    m = load_matcher()
    rows = {}
    for name in RUNS:
        for row in json.loads((HERE / name / 'results.json').read_text()):
            rows[row['address']] = dict(row, evidence_run=name)
    destination = Path(tempfile.mkdtemp(prefix='recovered_', dir=HERE))
    copied, accepted = {}, []
    for address, row in sorted(rows.items()):
        if row['status'] != 'SHAPE_ONLY':
            continue
        source = (ROOT / 'glm' / row['source']).resolve()
        source.relative_to((ROOT / 'glm').resolve())
        if hashlib.sha256(source.read_bytes()).hexdigest() != row['source_sha256']:
            raise ValueError('source changed since fresh build: ' + row['source'])
        obj = HERE / row['evidence_run'] / (row['job'] + '.obj')
        if hashlib.sha256(obj.read_bytes()).hexdigest() != row['object_sha256']:
            raise ValueError('object changed since fresh build: ' + str(obj))
        symbol = row['shape_matches'][0]['symbol']
        output = io.StringIO()
        with redirect_stdout(output):
            check(address, obj, symbol, matcher=m)
        kind = 'CRT-SOURCE' if row['source'].startswith(('crt71/', 'src/tu_crt/')) else 'ENGINE-CANDIDATE'
        # CRT is kept as a local reference, not copied into a distributable source tree.
        if kind == 'ENGINE-CANDIDATE':
            target = destination / row['source']
            if row['source'] not in copied:
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source, target)
                copied[row['source']] = row['source_sha256']
        accepted.append(dict(address=hex(address), bytes=m['carve'](address)[1]['size'],
            name_supported=row['name'], symbol=symbol, category=kind,
            source=row['source'], source_sha256=row['source_sha256'],
            source_location='snapshot' if kind == 'ENGINE-CANDIDATE' else 'glm-reference-only',
            flags=row['flags'], flags_explicit=row['flags_explicit'],
            evidence_run=row['evidence_run'], object_sha256=row['object_sha256'],
            diagnostics=output.getvalue(), status='UNREVIEWED-SHAPE-MATCH'))
    # Copy local source dependencies without importing unrelated drafts or artifacts.
    for path in (ROOT / 'glm/src').rglob('*'):
        if path.is_file() and path.suffix.lower() in ('.h', '.inc'):
            relative = path.relative_to(ROOT / 'glm')
            target = destination / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(path, target)
    packet = dict(source_provenance='glm; preserved byte-for-byte',
        canonical=False, independently_reviewed=False, source_files=copied, candidates=accepted,
        crt_notice='Authentic Microsoft source is referenced locally only; redistribution rights not established.')
    (destination / 'manifest.json').write_text(json.dumps(packet, indent=2) + '\n')
    print(f'Recovered {len(copied)} engine candidate files; '
          f'{sum(r["category"] == "ENGINE-CANDIDATE" for r in accepted)} engine rows; '
          f'{sum(r["category"] == "CRT-SOURCE" for r in accepted)} CRT reference rows. {destination}')
    print('Working snapshot only: no canonical import or verification-level promotion.')


if __name__ == '__main__':
    main()
