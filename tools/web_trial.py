#!/usr/bin/env python3
"""Compile an isolated browser draft and report explicitly requested retail entries."""
import csv
import io
import json
import difflib
import os
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
import verify as v

SOURCE = 'src/radiant/FindTextureDlg.cpp'
DRAFT = 'research/web/drafts/FindTextureDlg.cpp'
REQUEST = 'research/web/trial.tsv'
OBSERVE = 'research/web/observe.tsv'


def requests(text):
    rows = list(csv.DictReader(io.StringIO(text), delimiter='\t'))
    allowed = {r['addr'] for r in v.read_tsv('data/tu_map.tsv') if r['tu'] == SOURCE.removeprefix('src/')}
    assert rows and len(rows) <= len(allowed), 'Request one to sixteen original entries'
    assert len({r['addr'] for r in rows}) == len(rows), 'Duplicate retail address'
    for row in rows:
        assert set(row) == {'addr', 'symbol'} and row['addr'] in allowed, row
        assert row['symbol'] and not any(c.isspace() for c in row['symbol']), row
    return rows


def main():
    os.chdir(v.BASE)
    draft, request, source = Path(DRAFT), Path(REQUEST), Path(SOURCE)
    observe = Path(OBSERVE)
    Path('build').mkdir(exist_ok=True)
    summary = Path('build/web-trial.md')
    if not draft.exists() and not request.exists():
        summary.write_text('# Web trial: no draft requested\n\nNo new function is credited. Read TASK_WEB.md.\n')
        print(summary.read_text())
        return 0
    assert draft.is_file() and not draft.is_symlink() and request.is_file(), 'Supply both draft and trial.tsv'
    rows = requests(request.read_text())
    observed = requests(observe.read_text()) if observe.exists() else []
    assert not ({r['addr'] for r in rows} & {r['addr'] for r in observed}), 'Do not request and observe the same retail address'
    saved = source.read_bytes() if source.exists() else None
    symbols = Path('data/symbols.tsv')
    saved_symbols = symbols.read_bytes()
    results = []
    try:
        source.parent.mkdir(parents=True, exist_ok=True)
        source.write_bytes(draft.read_bytes())
        # Use the existing retail address-taken mechanism, only in this checkout.
        with symbols.open('a') as f:
            for row in rows:
                f.write(row['addr'] + '\t' + row['symbol'] + '\tisolated web trial\n')
        # Keep the unchanged full referee; trial extras receive no canonical credit.
        assert v.verify_all(), 'Existing ledger regressed or compilation failed'
        image = v.Linked()
        names = v.known_names()
        names.update({int(r['addr'], 16): r['symbol'] for r in rows + observed})
        md = v.matcher.Cs(v.matcher.CS_ARCH_X86, v.matcher.CS_MODE_32)
        with Path('build/web-trial-assembly.txt').open('w') as out:
            for row in rows + observed:
                status, detail = v.check(image, row['addr'], row['symbol'], names)
                result = dict(row, status=status, detail=detail, mode=('request' if row in rows else 'observe'))
                results.append(result)
                print(row['addr'], row['symbol'], status, detail, flush=True)
                print('\n', result, file=out)
                target, _ = v.matcher.carve(row['addr'])
                bodies = [('retail', int(row['addr'], 16), target)]
                if row['symbol'] in image.syms:
                    bodies.append(('candidate', *image.code(row['symbol'])))

                disassembled = {}
                for label, start, code in bodies:
                    insns = list(md.disasm(code, start))
                    disassembled[label] = insns
                    print(label, hex(start), len(code), file=out)
                    for ins in insns:
                        print(hex(ins.address-start), ins.bytes.hex(), ins.mnemonic, ins.op_str, file=out)

                # Diagnostic-only instruction diff. Never affects MATCH/MISMATCH.
                if 'candidate' in disassembled:
                    def norm(insns, start):
                        return ['+0x%x  %-7s %s' % (ins.address-start, ins.mnemonic, ins.op_str)
                                for ins in insns]
                    rstart = int(row['addr'], 16)
                    cstart = image.syms[row['symbol']]
                    rd = norm(disassembled['retail'], rstart)
                    cd = norm(disassembled['candidate'], cstart)
                    diff = list(difflib.unified_diff(rd, cd, fromfile='retail', tofile='candidate', lineterm=''))
                    result['instruction_diff'] = diff
                    if diff:
                        print('instruction diff:', flush=True)
                        for line in diff[:80]:
                            print(line, flush=True)
                        print('instruction diff', file=out)
                        print('\n'.join(diff), file=out)
        return 0 if all(r['status'] == 'MATCH' for r in results if r['mode'] == 'request') else 1
    finally:
        symbols.write_bytes(saved_symbols)
        if saved is None: source.unlink(missing_ok=True)
        else: source.write_bytes(saved)
        Path('build/web-trial.json').write_text(json.dumps(results, indent=2) + '\n')
        lines = ['# Web trial: relocation-normalized function results', '',
                 'This isolated draft is not accepted source or whole-file completion.', '',
                 '| Mode | Retail | Symbol | Result | Detail |', '|---|---|---|---|---|']
        for r in results:
            lines.append('| ' + ' | '.join(r[k] for k in ('mode', 'addr', 'symbol', 'status', 'detail')) + ' |')
            diff = r.get('instruction_diff') or []
            if diff:
                lines += ['', '### ' + r['addr'] + ' instruction diff', '', '```diff']
                lines += diff[:80]
                lines += ['```']
        if not results: lines.append('\nBuild/request failed; read the job log.')
        summary.write_text('\n'.join(lines) + '\n')

if __name__ == '__main__':
    sys.exit(main())
