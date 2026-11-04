#!/usr/bin/env python3
"""Fresh SDK-origin CRT assembly/helper builds, accounted separately from engine C."""
from contextlib import redirect_stdout
import argparse
import hashlib
import io
import json
from pathlib import Path
import shlex
import subprocess
import tempfile

from audit_legacy import ROOT, load_matcher
from batch_existing import HERE, IMAGE, CRT_FLAGS
from check_shape import check


def key(name):
    return name.lstrip('_@').split('@')[0].lower()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', action='append', help='bounded source subset')
    parser.add_argument('--retry-run', type=Path, help='retry only missing-input compilation failures')
    parser.add_argument('--multithread', action='store_true', help='bounded authentic CRT _MT build probe')
    args = parser.parse_args()
    m = load_matcher()
    run = HERE / tempfile.mkdtemp(prefix='authcrt_', dir=HERE)
    sources = sorted((ROOT / 'glm/crt71').glob('*.asm')) + [ROOT / 'glm/crt71/secchk.c',
                ROOT / 'glm/crt71/free.c', ROOT / 'glm/crt71/wctomb.c']
    if args.retry_run:
        failures = {r['source'] for r in json.loads((args.retry_run / 'results.json').read_text())
                    if r['status'] == 'COMPILE_DEFER'}
        sources = [p for p in sources if p.name in failures]
    if args.source:
        # Explicit additional SDK C inputs (including data-only TUs), never a sweep.
        for name in args.source:
            path = ROOT / 'glm/crt71' / name
            if Path(name).name != name or path.suffix not in ('.c', '.asm') or not path.is_file():
                parser.error('not a local CRT source: ' + name)
            if path not in sources:
                sources.append(path)
        sources = [p for p in sources if p.name in args.source]
    if not sources:
        parser.error('no selected sources')
    jobs, commands = [], []
    for index, source in enumerate(sources):
        job = f'job{index:03d}'
        windows = 'Z:\\inputs\\crt71\\' + source.name
        if source.suffix == '.asm':
            flags = ['/c', '/coff', '/nologo', '/Cx', '/Zm', '/D?QUIET', '/DQUIET',
                     '/Di386', '/D_WIN32', '/DWIN32', '/IZ:\\inputs\\crt71',
                     '/IZ:\\opt\\msvc710\\Vc7\\crt\\src']
            command = ['wine', '/opt/msvc710/Vc7/bin/ml.exe', *flags, windows]
            object_name = source.stem + '.obj'
        else:
            flags = ['/nologo', '/c', '/W3', *CRT_FLAGS]
            if args.multithread:
                flags.append('/D_MT')
            object_name = job + '.obj'
            command = ['cl', *flags, windows, '/FoZ:\\out\\' + object_name]
        commands.append(shlex.join(command) + f' > /out/{job}.log 2>&1\necho $? > /out/{job}.status')
        jobs.append(dict(source=source.name, source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                         job=job, object=object_name, flags=flags))
    dependencies = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                    for p in (ROOT / 'glm/crt71').iterdir() if p.is_file()}
    (run / 'compile.sh').write_text('\n'.join(commands) + '\n')
    (run / 'inputs.json').write_text(json.dumps(dict(image=IMAGE, jobs=jobs,
                                                    dependency_hashes=dependencies), indent=2))
    print(f'Authentic CRT: {len(jobs)} fresh source jobs; {run}', flush=True)
    subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v',
                    f'{ROOT / "glm"}:/inputs:ro', '-v', f'{run}:/out', '-w', '/out',
                    '--entrypoint', '/bin/sh', IMAGE, '/out/compile.sh'], check=True)
    anchors = {'strlen': [0x100fa200], 'strcat': [0x100fe8a0], 'strcmp': [0x101003a0],
               'aulldvrm': [0x10106bc0], 'security_check_cookie': [0x10100d4d],
               'free': [0x100f84d0], 'wctomb': [0x10106b8d]}
    results = []
    for job in jobs:
        obj = run / job['object']
        if (run / (job['job'] + '.status')).read_text().strip() != '0' or not obj.is_file():
            results.append(dict(job, status='COMPILE_DEFER', detail=(run / (job['job'] + '.log')).read_text(errors='replace')))
            continue
        raw = obj.read_bytes()
        coff = m['parse_coff'](raw)
        matches, attempts = [], []
        for symbol in coff['symbols']:
            if symbol['sec'] <= 0 or symbol['sclass'] != 2 or symbol['name'].startswith('.'):
                continue
            section = coff['sections'][symbol['sec'] - 1]
            if not section['flags'] & 0x20:
                continue
            addresses = set(anchors.get(key(symbol['name']), []))
            addresses.update(int(f['addr'], 16) for f in m['INV'].values()
                             if key(f['name']) == key(symbol['name']))
            for address in sorted(addresses):
                output = io.StringIO()
                try:
                    with redirect_stdout(output):
                        check(address, obj, symbol['name'], matcher=m)
                    matches.append(dict(address=hex(address), symbol=symbol['name'], output=output.getvalue()))
                except (ValueError, KeyError, StopIteration) as error:
                    attempts.append(dict(address=hex(address), symbol=symbol['name'], reason=str(error)))
        results.append(dict(job, status='SHAPE_ONLY' if matches else 'DEFER', matches=matches,
                            attempts=attempts, object_sha256=hashlib.sha256(raw).hexdigest()))
    for name, digest in dependencies.items():
        if hashlib.sha256((ROOT / 'glm/crt71' / name).read_bytes()).hexdigest() != digest:
            raise ValueError('CRT input changed during build: ' + name)
    (run / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
    print('RESULT:', sum(r['status'] == 'SHAPE_ONLY' for r in results), 'matched source jobs;',
          sum(len(r.get('matches', [])) for r in results), 'function shape matches')
    print('SDK-origin assembly/helper source only, not engine C or retail transplants:', run)


if __name__ == '__main__':
    main()
