#!/usr/bin/env python3
"""Fresh historical JPEG reference build; strict shape discovery, not promotion."""
import argparse
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import shlex
import subprocess
import tempfile

from audit_legacy import ROOT, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import branch_fields, check, is_function
import struct
from check_jpeg_dependencies import raw_target


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', action='append', help='explicit JPEG filename subset')
    parser.add_argument('--cpp', action='store_true', help='bounded C++ /TP source-context experiment')
    parser.add_argument('--optimization', choices=('O1', 'O2'), default='O2',
                        help='bounded optimization probe; default historical engine O2')
    parser.add_argument('--frame-pointer', action='store_true', help='bounded /Oy- probe')
    parser.add_argument('--hotpatch', action='store_true', help='bounded /hotpatch probe; inspect compiler warnings')
    parser.add_argument('--reference', type=Path, help='explicit local source overlay (recorded and hashed)')
    parser.add_argument('--recheck-run', type=Path, help='reuse hashed objects from a recorded fresh build')
    parser.add_argument('--boundary-discovery', action='store_true',
                        help='diagnose omitted return tails up to16 bytes; not acceptance')
    parser.add_argument('--missing-entry-discovery', action='store_true',
                        help='diagnose referenced aligned entries absent from inventory; not acceptance')
    parser.add_argument('--start', type=lambda x: int(x, 0), default=0x10050000)
    parser.add_argument('--end', type=lambda x: int(x, 0), default=0x10058400)
    args = parser.parse_args()
    reference = ROOT / 'refrences/cod2-mp-macho/PC/jpeg-6'
    if args.reference:
        reference = args.reference.resolve()
    recorded = None
    if args.recheck_run:
        recorded = json.loads((args.recheck_run / 'inputs.json').read_text())
        if recorded['image'] != IMAGE:
            parser.error('recorded toolchain identity differs')
        if args.reference and reference != Path(recorded['reference']):
            parser.error('cannot change reference inputs when reusing objects')
        reference = Path(recorded['reference'])
        for name, digest in recorded['dependencies'].items():
            if hashlib.sha256((reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('recorded reference changed: ' + name)
    if not 0x10000000 <= args.start < args.end <= 0x1010b000:
        parser.error('invalid renderer code discovery interval')
    sources = sorted(reference.glob('j*.c'))
    if args.source:
        sources = [p for p in sources if p.name in args.source]
        if {p.name for p in sources} != set(args.source):
            parser.error('unknown reference source')
    m = load_matcher()
    by_size = {}
    referenced_entries = set()
    if args.missing_entry_discovery:
        for p in m['PE_RELOCS']:
            destination = struct.unpack_from('<I', m['_d'], p)[0]
            if args.start <= destination < args.end:
                referenced_entries.add(destination)
        for key, row in m['INV'].items():
            try:
                code = m['carve'](int(key, 16))[0]
                referenced_entries.update(branch_fields(code, int(key, 16)).values())
            except (ValueError, KeyError):
                continue
        discovery_code = raw_target(m, args.start, args.end - args.start)
    for key, row in m['INV'].items():
        if args.start <= int(key, 16) < args.end:
            by_size.setdefault(row['size'], []).append(int(key, 16))
            if args.boundary_discovery:
                for extra in range(1, 17):
                    by_size.setdefault(row['size'] + extra, []).append(int(key, 16))
    run = Path(tempfile.mkdtemp(prefix='baseline_jpeg_', dir=HERE))
    jobs, commands = [], []
    for i, source in enumerate(sources):
        job = f'job{i:03d}'
        command = ['cl', '/nologo', '/c', '/W3', '/' + args.optimization, '/Gy',
                   'Z:\\inputs\\' + source.name, '/FoZ:\\out\\' + job + '.obj']
        if args.cpp:
            command.insert(6, '/TP')
        if args.frame_pointer:
            command.insert(6, '/Oy-')
        if args.hotpatch:
            command.insert(6, '/hotpatch')
        jobs.append(dict(source=source.name, source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                         job=job, command=command))
        commands.append(shlex.join(command) + f' > /out/{job}.log 2>&1\necho $? > /out/{job}.status')
    if recorded:
        selected = {p.name for p in sources}
        jobs = [j for j in recorded['jobs'] if j['source'] in selected]
    dependencies = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                    for p in reference.iterdir() if p.is_file() and p.suffix in ('.h', '.c')}
    (run / 'inputs.json').write_text(json.dumps(dict(image=IMAGE, reference=str(reference),
        jobs=jobs, dependencies=dependencies, discovery_range=[hex(args.start), hex(args.end)],
        boundary_discovery=args.boundary_discovery,
        missing_entry_discovery=args.missing_entry_discovery,
        reused_objects_from=str(args.recheck_run.resolve()) if recorded else None), indent=2))
    (run / 'compile.sh').write_text('\n'.join(commands) + '\n')
    print(f'JPEG: {len(jobs)} ' + ('hashed reused TUs' if recorded else 'fresh TUs') + f'; {run}', flush=True)
    if not recorded:
        subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', f'{reference}:/inputs:ro',
                    '-v', f'{run}:/out', '-w', '/out', '--entrypoint', '/bin/sh', IMAGE,
                    '/out/compile.sh'], check=True)
    objects = args.recheck_run if recorded else run
    old_results = {r['job']: r for r in json.loads((objects / 'results.json').read_text())} if recorded else {}
    results = []
    for job in jobs:
        obj = objects / (job['job'] + '.obj')
        if (objects / (job['job'] + '.status')).read_text().strip() != '0' or not obj.is_file():
            results.append(dict(job, status='COMPILE_DEFER', detail=(objects / (job['job'] + '.log')).read_text(errors='replace')))
            continue
        raw = obj.read_bytes()
        if recorded and hashlib.sha256(raw).hexdigest() != old_results[job['job']]['object_sha256']:
            raise ValueError('recorded object changed: ' + str(obj))
        coff = m['parse_coff'](raw)
        matches, failures = [], []
        for symbol in coff['symbols']:
            if symbol['sec'] <= 0 or not is_function(raw, symbol):
                continue
            section = coff['sections'][symbol['sec'] - 1]
            candidates = list(by_size.get(section['rawsize'], []))
            missing = set()
            if args.missing_entry_discovery and section['rawsize'] >= 32:
                candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
                excluded = {p for r in section['relocs'] for p in range(r['vaddr'], r['vaddr'] + 4)}
                spans = []
                begin = 0
                for p in range(min(32, len(candidate)) + 1):
                    if p == min(32, len(candidate)) or p in excluded:
                        spans.append((begin, p))
                        begin = p + 1
                begin, end = max(spans, key=lambda pair: pair[1] - pair[0])
                if end - begin >= 8:
                    position = discovery_code.find(candidate[begin:end])
                    while position >= 0:
                        address = args.start + position - begin
                        if (address % 16 == 0 and args.start <= address
                                and address + len(candidate) <= args.end
                                and f'{address:x}' not in m['INV']
                                and address in referenced_entries):
                            missing.add(address)
                        position = discovery_code.find(candidate[begin:end], position + 1)
                candidates += sorted(missing)
            for address in candidates:
                log = io.StringIO()
                old_entry = m['INV'].get(f'{address:x}')
                old_size = old_entry['size'] if old_entry else None
                try:
                    if old_size != section['rawsize']:
                        code = raw_target(m, address, section['rawsize'])
                        padding = (-address - len(code)) % 16
                        if code[-1] != 0xc3 or raw_target(m, address + len(code), padding) != b'\xcc' * padding:
                            continue
                        m['INV'][f'{address:x}'] = dict(old_entry or {}, size=len(code),
                                                       name=symbol['name'], addr=f'{address:x}')
                    with redirect_stdout(log):
                        check(address, obj, symbol['name'], matcher=m)
                        if m['cmd_diff'](hex(address), str(obj), symbol['name']) != 100:
                            raise ValueError('original referee differs')
                    matches.append(dict(address=hex(address), symbol=symbol['name'],
                                        bytes=section['rawsize'], diagnostics=log.getvalue(),
                                        old_inventory_size=old_size,
                                        original_referee_passed=True))
                except (ValueError, KeyError, StopIteration) as error:
                    failures.append(dict(address=hex(address), symbol=symbol['name'], reason=str(error)))
                finally:
                    if old_entry is None:
                        m['INV'].pop(f'{address:x}', None)
                    else:
                        m['INV'][f'{address:x}'] = old_entry
        results.append(dict(job, object_sha256=hashlib.sha256(raw).hexdigest(),
                            status='SHAPE_ONLY' if matches else 'DEFER', matches=matches, failures=failures))
    for name, digest in dependencies.items():
        if hashlib.sha256((reference / name).read_bytes()).hexdigest() != digest:
            raise ValueError('reference input changed during build: ' + name)
    (run / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
    matches = [match for row in results for match in row.get('matches', [])]
    print('SHAPE matches:', len(matches), 'unique bytes:', sum({r['address']: r['bytes'] for r in matches}.values()))
    print('Compilation failures:', sum(r['status'] == 'COMPILE_DEFER' for r in results))
    print('Reference/source/bindings and independent review remain; not V4:', run)


if __name__ == '__main__':
    main()
