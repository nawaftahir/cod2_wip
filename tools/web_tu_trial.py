#!/usr/bin/env python3
"""Generic isolated TU reconstruction trial for web/reconstruction.

research/web/target.tsv:
source\tdraft
src/zlib/inflate.c\tresearch/web/drafts/inflate.c

research/web/tu_trial.tsv:
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

TARGET = 'research/web/target.tsv'
REQUEST = 'research/web/tu_trial.tsv'
OBSERVE = 'research/web/tu_observe.tsv'


def read_rows(path):
    return list(csv.DictReader(io.StringIO(Path(path).read_text()), delimiter='\t'))


def target():
    rows = read_rows(TARGET)
    assert len(rows) == 1 and set(rows[0]) in ({'source', 'draft'}, {'source', 'draft', 'flags'}), \
        'target.tsv needs one source/draft row, with optional flags'
    row = rows[0]
    assert row['source'].startswith('src/') and '..' not in row['source'], row
    assert row['draft'].startswith('research/web/drafts/') and '..' not in row['draft'], row
    return row


def requests(text, source):
    rows = list(csv.DictReader(io.StringIO(text), delimiter='\t'))
    aliases = {source, source.removeprefix('src/')}
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
    cfg = target()
    source = Path(cfg['source'])
    draft = Path(cfg['draft'])
    request = Path(REQUEST)
    observe = Path(OBSERVE)
    assert draft.is_file() and not draft.is_symlink() and request.is_file(), 'Supply target draft and tu_trial.tsv'
    rows = requests(request.read_text(), cfg['source'])
    observed = requests(observe.read_text(), cfg['source']) if observe.exists() else []
    assert not ({r['addr'] for r in rows} & {r['addr'] for r in observed}), 'Do not request and observe the same address'

    Path('build').mkdir(exist_ok=True)
    summary = Path('build/web-tu-trial.md')
    saved = source.read_bytes() if source.exists() else None
    symbols = Path('data/symbols.tsv')
    saved_symbols = symbols.read_bytes()
    flags_path = Path('data/flags.tsv')
    saved_flags = flags_path.read_bytes()
    results = []
    try:
        source.parent.mkdir(parents=True, exist_ok=True)
        source.write_bytes(draft.read_bytes())
        if cfg.get('flags'):
            lines = saved_flags.decode().splitlines()
            flags_path.write_text(lines[0] + '\n' + cfg['source'] + '\t' + cfg['flags'] + '\n' +
                                  '\n'.join(lines[1:]) + '\n')
            print('trial flags', cfg['source'], cfg['flags'], flush=True)
        with symbols.open('a') as f:
            for row in rows:
                f.write(row['addr'] + '\t' + row['symbol'] + '\tisolated generic web TU trial\n')

        existing_ok = v.verify_all()
        if not v.link.EXE.is_file():
            assert existing_ok, 'Existing ledger regressed or compilation failed'
        image = v.Linked()
        names = v.known_names()
        names.update({int(r['addr'], 16): r['symbol'] for r in rows + observed})
        md = v.matcher.Cs(v.matcher.CS_ARCH_X86, v.matcher.CS_MODE_32)

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
                        print('\n'.join(diff[:80]), flush=True)
        assert existing_ok, 'Existing ledger regressed or compilation failed'
        return 0 if all(r['status'] == 'MATCH' for r in results if r['mode'] == 'request') else 1
    finally:
        symbols.write_bytes(saved_symbols)
        flags_path.write_bytes(saved_flags)
        if saved is None:
            source.unlink(missing_ok=True)
        else:
            source.write_bytes(saved)
        Path('build/web-tu-trial.json').write_text(json.dumps(results, indent=2) + '\n')
        lines = ['# Generic web TU trial', '', 'Source: `' + cfg['source'] + '`', '',
                 '| Mode | Retail | Symbol | Result | Detail |', '|---|---|---|---|---|']
        for r in results:
            lines.append('| ' + ' | '.join(r[k] for k in ('mode','addr','symbol','status','detail')) + ' |')
        summary.write_text('\n'.join(lines) + '\n')


if __name__ == '__main__':
    sys.exit(main())
