#!/usr/bin/env python3
"""Fresh-build readable GLM ledger candidates once per source/flag combination."""
import argparse
from collections import Counter
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import re
import shlex
import subprocess
import tempfile

from audit_legacy import ROOT, load_matcher
from check_shape import check, is_function, self_check

IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
HERE = Path(__file__).resolve().parent
CRT_FLAGS = ('/Zelp8 /GFy /DWIN32 /GB /Gi- /GS /Zc:wchar_t /Zc:forScope '
             '/DWIN32_LEAN_AND_MEAN /DNOSERVICE /D_MBCS /D_MB_MAP_DIRECT '
             '/D_CRTBLD /DWINHEAP /O1 /IZ:\\inputs\\crt71').split()


def parse_flags(note):
    return list(dict.fromkeys(re.findall(r'/(?:O[12]|Oy-|Gr|Gy|Gd|Gz)(?![A-Za-z0-9])', note)))


def contains_assembly(text):
    code = re.sub(r'/\*.*?\*/|//[^\r\n]*|"(?:\\.|[^"\\])*"', '', text, flags=re.S)
    return bool(re.search(r'\b(_emit|__asm|_asm|asm)\b|__declspec\s*\(\s*naked', code))


def candidates(crt=False, wrappers=False):
    rows = {}
    for line in (ROOT / 'glm/MATCHES.md').read_text().splitlines():
        match = re.search(r'0x(1[0-9a-fA-F]{7})\b', line)
        if '✅' not in line or not match:
            continue
        cols = [c.strip() for c in line.split('|')]
        rows[int(match.group(1), 16)] = (cols[2].strip('`'), cols[5].strip('` '), cols[6])
    result = []
    for address, (name, source, note) in sorted(rows.items()):
        path = ROOT / 'glm' / source
        if not path.is_file() or path.suffix not in ('.c', '.cpp'):
            continue
        if wrappers and not source.startswith('src/tu_crt/'):
            continue
        if not wrappers and source.startswith('crt71/') != crt:
            continue
        text = path.read_text(errors='replace')
        if contains_assembly(text):
            continue
        # Only explicit known switches; missing optimization flags get a labelled probe.
        flags = CRT_FLAGS.copy() if crt or wrappers else parse_flags(note)
        explicit = False if crt or wrappers else any(f in ('/O1', '/O2') for f in flags)
        if not explicit and not (crt or wrappers):
            flags.insert(0, '/O2')
        result.append(dict(address=address, name=name, source=source, flags=flags,
                           flags_explicit=explicit, source_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', action='append', help='exact source path to rebuild')
    parser.add_argument('--crt', action='store_true', help='use existing crt_gfx.py reproduction flags')
    parser.add_argument('--crt-wrappers', action='store_true', help='rebuild src/tu_crt with CRT includes/flags')
    parser.add_argument('--optimization', choices=('O1', 'O2'), help='bounded codegen probe, not historical flag proof')
    parser.add_argument('--manifest', type=Path, help='fresh-build engine candidates from a recovered snapshot')
    parser.add_argument('--extra-tus', action='store_true', help='probe readable GLM TUs outside the recovered snapshot')
    args = parser.parse_args()
    self_check()
    assert parse_flags('**/O1 /Oy-**; /Gr; /O1') == ['/O1', '/Oy-', '/Gr']
    assert not contains_assembly('/* crt0.asm */ const char *s = "asm";')
    assert contains_assembly('void f(void) { __asm { ret } }')
    matcher = load_matcher()
    if args.crt and args.crt_wrappers:
        parser.error('choose --crt or --crt-wrappers')
    rows = candidates(args.crt, args.crt_wrappers)
    input_root = ROOT / 'glm'
    if args.extra_tus:
        if args.crt or args.crt_wrappers or args.manifest:
            parser.error('extra TU mode cannot combine with CRT/snapshot modes')
        recovered = json.loads((HERE / 'recovered_dbu46avj/manifest.json').read_text())['source_files']
        rows = []
        for path in sorted((input_root / 'src/tu').glob('*')):
            relative = str(path.relative_to(input_root))
            if path.suffix not in ('.c', '.cpp') or relative in recovered:
                continue
            text = path.read_text()
            if contains_assembly(text):
                continue
            # Address mentions select comparison candidates only, never trusted labels.
            addresses = sorted({int(value, 16) for value in re.findall(r'(?<![0-9a-fA-F])(1[0-9a-fA-F]{7})(?![0-9a-fA-F])', text)
                                if value.lower() in matcher['INV']})
            for address in addresses:
                rows.append(dict(address=address, name=matcher['INV'][f'{address:x}']['name'],
                                 source=relative, source_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                                 flags=['/O2', '/Gy'], flags_explicit=False,
                                 unregistered_probe=True))
    if args.manifest:
        if args.crt or args.crt_wrappers:
            parser.error('snapshot mode is for engine candidates only')
        input_root = args.manifest.resolve().parent
        packet = json.loads(args.manifest.read_text())
        rows = [dict(address=int(r['address'], 0), name=r['name_supported'], source=r['source'],
                     source_sha256=r['source_sha256'], flags=r['flags'],
                     flags_explicit=r['flags_explicit']) for r in packet['candidates']
                if r['category'] == 'ENGINE-CANDIDATE']
        for row in rows:
            path = (input_root / row['source']).resolve()
            path.relative_to(input_root)
            if hashlib.sha256(path.read_bytes()).hexdigest() != row['source_sha256']:
                raise ValueError('snapshot hash mismatch: ' + row['source'])
    if args.source:
        rows = [row for row in rows if row['source'] in args.source]
        if not rows:
            parser.error('no candidates selected')
    if args.optimization:
        for row in rows:
            row['flags'] = ['/' + args.optimization] + [f for f in row['flags'] if f not in ('/O1', '/O2')]
            row['flags_explicit'] = False
            row['optimization_probe'] = True
    run = Path(tempfile.mkdtemp(prefix='baseline_', dir=HERE))
    jobs = {}
    for row in rows:
        key = (row['source'], tuple(row['flags']))
        if key not in jobs:
            jobs[key] = f'job{len(jobs):03d}'
        row['job'] = jobs[key]
    commands = []
    for (source, flags), job in jobs.items():
        src = 'Z:\\inputs\\' + source.replace('/', '\\')
        command = ['cl', '/nologo', '/c', '/W3', *flags, '/IZ:\\inputs\\include', src,
                   '/FoZ:\\out\\' + job + '.obj']
        commands.append(shlex.join(command) + f' > /out/{job}.log 2>&1\n'
                        f'echo $? > /out/{job}.status')
    (run / 'compile.sh').write_text('\n'.join(commands) + '\n')
    dependencies = {str(path.relative_to(input_root)): hashlib.sha256(path.read_bytes()).hexdigest()
                    for directory in ('src', 'include', 'crt71')
                    for path in (input_root / directory).rglob('*')
                    if path.is_file() and path.suffix.lower() in ('.h', '.c', '.cpp', '.inc')}
    (run / 'inputs.json').write_text(json.dumps(dict(image=IMAGE, input_root=str(input_root), candidates=rows,
                                                   dependency_hashes=dependencies), indent=2))
    print(f'Fresh batch: {len(rows)} candidates, {len(jobs)} source/flag jobs; {run}', flush=True)
    subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v',
                    f'{input_root}:/inputs:ro', '-v', f'{run}:/out', '-w', '/out',
                    '--entrypoint', '/bin/sh', IMAGE, '/out/compile.sh'], check=True)
    for row in rows:
        job = row['job']
        obj = run / (job + '.obj')
        if hashlib.sha256(
                (input_root / row['source']).read_bytes()).hexdigest() != row['source_sha256']:
            raise RuntimeError('source changed during build: ' + row['source'])
        if (run / (job + '.status')).read_text().strip() != '0' or not obj.is_file():
            row.update(status='COMPILE_DEFER', detail=(run / (job + '.log')).read_text(errors='replace'))
            continue
        raw = obj.read_bytes()
        row['object_sha256'] = hashlib.sha256(raw).hexdigest()
        coff = matcher['parse_coff'](raw)
        symbols = [s['name'] for s in coff['symbols'] if s['sec'] > 0 and
                   s['sclass'] in (2, 3) and is_function(raw, s) and
                   coff['sections'][s['sec'] - 1]['flags'] & 0x20]
        successes, failures = [], []
        for symbol in symbols:
            output = io.StringIO()
            try:
                with redirect_stdout(output):
                    check(row['address'], obj, symbol, matcher)
                successes.append(dict(symbol=symbol, output=output.getvalue()))
            except (ValueError, KeyError, StopIteration) as error:
                failures.append(dict(symbol=symbol, reason=str(error)))
        row.update(status='SHAPE_ONLY' if len(successes) == 1 else 'DEFER',
                   shape_matches=successes, failures=failures)
    for relative, digest in dependencies.items():
        if hashlib.sha256((input_root / relative).read_bytes()).hexdigest() != digest:
            raise RuntimeError('dependency changed during build: ' + relative)
    (run / 'results.json').write_text(json.dumps(rows, indent=2))
    print('RESULTS:', dict(Counter(r['status'] for r in rows)))
    print('No V2 claims. Results:', run / 'results.json')


if __name__ == '__main__':
    main()
