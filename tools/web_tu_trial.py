#!/usr/bin/env python3
"""Generic isolated TU reconstruction trial for web/reconstruction.

workspace/research/web/target.tsv:
source\tdraft
src/zlib/inflate.c\tresearch/web/drafts/inflate.c

workspace/research/web/tu_trial.tsv:
addr\tsymbol
0x004b0140\t_inflateReset
"""
import csv
import difflib
import io
import json
import os
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import verify as v

TARGET = 'workspace/research/web/target.tsv'
REQUEST = 'workspace/research/web/tu_trial.tsv'
OBSERVE = 'workspace/research/web/tu_observe.tsv'


def read_rows(path):
    return list(csv.DictReader(io.StringIO(Path(path).read_text()), delimiter='\t'))


def targets():
    rows = read_rows(TARGET)
    assert rows, 'target.tsv needs one or more source/draft rows'
    assert all(set(row) in ({'source', 'draft'}, {'source', 'draft', 'flags'}) for row in rows), \
        'target.tsv rows need source/draft, with optional flags'
    assert len({row['source'] for row in rows}) == len(rows), 'Duplicate target source'
    for row in rows:
        assert row['source'].startswith('src/') and '..' not in row['source'], row
        assert row['draft'].startswith('workspace/research/web/drafts/') and '..' not in row['draft'], row
    return rows


def requests(text, sources):
    rows = list(csv.DictReader(io.StringIO(text), delimiter='\t'))
    aliases = set()
    for source in sources:
        aliases.add(source)
        aliases.add(source.removeprefix('src/'))
    allowed = {r['addr'] for r in v.read_tsv('data/tu_map.tsv') if r['tu'] in aliases}
    assert rows and len(rows) <= len(allowed), 'Request one or more original entries from the selected TU'
    assert len({r['addr'] for r in rows}) == len(rows), 'Duplicate retail address'
    for row in rows:
        assert set(row) == {'addr', 'symbol'} and row['addr'] in allowed, row
        assert row['symbol'] and not any(c.isspace() for c in row['symbol']), row
    return rows


def norm(insns, start):
    return ['+0x%x  %-7s %s' % (ins.address-start, ins.mnemonic, ins.op_str) for ins in insns]


def main():
    os.chdir(v.BASE)
    cfgs = targets()
    sources = [cfg['source'] for cfg in cfgs]
    request = Path(REQUEST)
    observe = Path(OBSERVE)
    for cfg in cfgs:
        draft = Path(cfg['draft'])
        assert draft.is_file() and not draft.is_symlink(), 'Supply every target draft'
    assert request.is_file(), 'Supply tu_trial.tsv'
    rows = requests(request.read_text(), sources)
    observe_text = observe.read_text() if observe.exists() else ''
    observed = requests(observe_text, sources) if len(observe_text.strip().splitlines()) > 1 else []
    assert not ({r['addr'] for r in rows} & {r['addr'] for r in observed}), 'Do not request and observe the same address'

    Path('build').mkdir(exist_ok=True)
    summary = Path('build/web-tu-trial.md')
    saved = {}
    for cfg in cfgs:
        source = Path(cfg['source'])
        saved[cfg['source']] = source.read_bytes() if source.exists() else None
    symbols = Path('data/symbols.tsv')
    saved_symbols = symbols.read_bytes()
    flags_path = Path('data/flags.tsv')
    saved_flags = flags_path.read_bytes()
    results = []
    try:
        for cfg in cfgs:
            source = Path(cfg['source'])
            draft = Path(cfg['draft'])
            source.parent.mkdir(parents=True, exist_ok=True)
            source.write_bytes(draft.read_bytes())
        flagged = [cfg for cfg in cfgs if cfg.get('flags')]
        if flagged:
            lines = saved_flags.decode().splitlines()
            injected = [cfg['source'] + '\t' + cfg['flags'] for cfg in flagged]
            flags_path.write_text('\n'.join(lines[:2] + injected + lines[2:]) + '\n')
            for cfg in flagged:
                print('trial flags', cfg['source'], cfg['flags'], flush=True)
        with symbols.open('a') as f:
            for row in rows:
                f.write(row['addr'] + '\t' + row['symbol'] + '\tisolated generic web TU trial\n')

        existing_ok = v.verify_all()
        if not v.link.EXE.is_file():
            assert existing_ok, 'Existing ledger regressed or compilation failed'
        image = v.Linked()
        # Optional diagnostics only: enumerate source-emitted, equal-length,
        # unique retail matches from the temporary draft before restoring it.
        # The unchanged canonical gate/verifier remains the sole credit authority.
        if Path('workspace/research/web/draft_scan.flag').is_file():
            import runpy
            print('DRAFT-SCAN: discovering unledgered source bodies in isolated trial', flush=True)
            # The read-only scanner's __main__ calls sys.exit(main()).
            # Catch only its successful exit so requested function comparisons
            # still run and can never be silently skipped by the diagnostic.
            try:
                runpy.run_path('workspace/research/web/scan_emitted_matches.py', run_name='__main__')
            except SystemExit as exc:
                if exc.code not in (0, None):
                    raise
        names = v.known_names()
        names.update({int(r['addr'], 16): r['symbol'] for r in rows + observed})
        md = v.matcher.Cs(v.matcher.CS_ARCH_X86, v.matcher.CS_MODE_32)
        # Independent diagnosis of canonical regressions in an external TU.
        # These reads NEVER grant MATCH credit and do not change the referee.
        cross = Path('workspace/research/web/cross_observe.tsv')
        if cross.is_file():
            for extra in read_rows(str(cross)):
                address, symbol = extra['addr'], extra['symbol']
                status, detail = v.check(image, address, symbol, names)
                print('cross-observe', address, symbol, status, detail, flush=True)
                ours_va, ours = image.code(symbol)
                retail, _ = v.matcher.carve(address)
                for label, va, body in [('retail', int(address, 16), retail),
                                        ('candidate', ours_va, ours)]:
                    print('cross-disasm', label, address, flush=True)
                    for inst in v.matcher.Cs(v.matcher.CS_ARCH_X86,
                                              v.matcher.CS_MODE_32).disasm(body, va):
                        print('+0x%x %s %s %s' % (inst.address-va, inst.bytes.hex(),
                              inst.mnemonic, inst.op_str), flush=True)

        with Path('build/web-tu-trial-assembly.txt').open('w') as out:
            for row in rows + observed:
                status, detail = v.check(image, row['addr'], row['symbol'], names)
                mode = 'request' if row in rows else 'observe'
                result = dict(row, status=status, detail=detail, mode=mode)
                results.append(result)
                print(mode, row['addr'], row['symbol'], status, detail, flush=True)

                target_code, _ = v.matcher.carve(row['addr'])
                bodies = [('retail', int(row['addr'], 16), target_code)]
                if row['symbol'] in image.syms:
                    bodies.append(('candidate', *image.code(row['symbol'])))
                dis = {}
                for label, start, body in bodies:
                    insns = list(md.disasm(body, start))
                    dis[label] = (start, insns)
                    print('\n', result, label, hex(start), len(body), file=out)
                    for ins in insns:
                        print(hex(ins.address-start), ins.bytes.hex(), ins.mnemonic, ins.op_str, file=out)
                if 'candidate' in dis:
                    rs, ri = dis['retail']; cs, ci = dis['candidate']
                    diff = list(difflib.unified_diff(norm(ri, rs), norm(ci, cs),
                                                     fromfile='retail', tofile='candidate', lineterm=''))
                    result['instruction_diff'] = diff
                    if diff:
                        print('instruction diff for', row['addr'], flush=True)
                        print('\n'.join(diff[:240]), flush=True)
        assert existing_ok, 'Existing ledger regressed or compilation failed'
        return 0 if all(r['status'] == 'MATCH' for r in results if r['mode'] == 'request') else 1
    finally:
        symbols.write_bytes(saved_symbols)
        flags_path.write_bytes(saved_flags)
        for cfg in cfgs:
            source = Path(cfg['source'])
            original = saved[cfg['source']]
            if original is None:
                source.unlink(missing_ok=True)
            else:
                source.write_bytes(original)
        Path('build/web-tu-trial.json').write_text(json.dumps(results, indent=2) + '\n')
        lines = ['# Generic web TU trial', '',
                 'Sources: ' + ', '.join(cfg['source'] for cfg in cfgs), '',
                 '| Mode | Retail | Symbol | Result | Detail |', '|---|---|---|---|---|']
        for r in results:
            lines.append('| ' + ' | '.join(r[k] for k in ('mode','addr','symbol','status','detail')) + ' |')
        summary.write_text('\n'.join(lines) + '\n')


if __name__ == '__main__':
    sys.exit(main())
