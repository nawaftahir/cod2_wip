"""Find currently compiled, unledgered exact game functions without altering source.

This is discovery only. It reads the linked image produced by the *full retail
gate* and tests unique, equal-length candidates within their original TU using
the same retail verifier. Results are not ledger credit; a human must review
symbol identity, external calls, data, ownership, order and whole-file proof.
"""
import collections
import json
import re
from pathlib import Path
import sys

sys.path.insert(0, 'tools')
import verify as v

ROOT = Path('.')
OUTPUT = ROOT / 'build/web-auto-match.json'
# Every attributed source is eligible; verification still requires an
# unclaimed, unique exact match in the unmodified retail image.
SCOPED = tuple(r['source'] for r in v.read_tsv('ledger/files.tsv')
               if r['source'].startswith('src/'))

def main():
    image = v.Linked()
    names = v.known_names()
    ledger = v.read_tsv('ledger/matches.tsv')
    mapping = v.read_tsv('data/tu_map.tsv')
    known = {r['addr'] for r in ledger}
    used = {r['symbol'] for r in ledger + v.read_tsv('ledger/compiler.tsv')}
    inventory = collections.defaultdict(list)
    for row in mapping:
        source = row['tu'] if row['tu'].startswith('src/') else 'src/' + row['tu']
        if source in SCOPED and row['addr'] not in known:
            inventory[source].append(row)

    suggestions = []
    near_misses = []
    stats = []
    for source in SCOPED:
        if not (ROOT / source).is_file():
            continue
        syms = [s for s in image.of_source(source)
                if s not in used and s not in image.inline]
        by_size = collections.defaultdict(list)
        for symbol in syms:
            try:
                _va, body = image.code(symbol)
                by_size[len(body)].append(symbol)
            except (ValueError, KeyError):
                pass
        cases = 0
        exact = 0
        for row in inventory[source]:
            size = int(row['size'])
            if size < 8:
                continue
            candidates = by_size[size]
            if not candidates:
                continue
            cases += 1
            hits = []
            for symbol in candidates:
                status, detail = v.check(image, row['addr'], symbol, names)
                if status == 'MATCH':
                    hits.append((symbol, detail))
                elif status == 'MISMATCH':
                    rate = re.match(r'(\d+)%', detail)
                    pct = int(rate.group(1)) if rate else 0
                    if pct >= 85:
                        near_misses.append({
                            'source': source, 'addr': row['addr'], 'bytes': size,
                            'symbol': symbol, 'percent': pct,
                            'detail': detail,
                            'candidate_count_by_length': len(candidates)
                        })
            if len(hits) == 1:
                symbol, detail = hits[0]
                suggestions.append({
                    'source': source, 'addr': row['addr'], 'bytes': size,
                    'symbol': symbol, 'verification': detail,
                    'candidate_count_by_length': len(candidates)
                })
                exact += 1
            elif len(hits) > 1:
                print('AMBIGUOUS', source, row['addr'], size, [s for s,_ in hits], flush=True)
        stats.append({'source': source, 'unledgered': len(inventory[source]),
                      'emitted_nonledgered': len(syms), 'length_cases': cases,
                      'unique_exact': exact})
    # Require one retail address per candidate function. Cross-address
    # duplicates are inconclusive, not a match.
    by_symbol = collections.Counter(row['symbol'] for row in suggestions)
    suggestions = [r for r in suggestions if by_symbol[r['symbol']] == 1]
    suggestions.sort(key=lambda x: (-x['bytes'], x['addr']))
    near_misses.sort(key=lambda x: (-x['bytes']*x['percent']/100, -x['percent']))
    OUTPUT.write_text(json.dumps({'stats': stats, 'suggestions': suggestions, 'near_misses': near_misses}, indent=2) + '\n')
    print('Read-only sweep of linked /GL code: unique unledgered matches',
          len(suggestions), 'bytes', sum(s['bytes'] for s in suggestions), flush=True)
    for row in suggestions[:90]:
        print('EXACT-CANDIDATE', row['addr'], row['bytes'],
              row['source'], row['symbol'], row['verification'], flush=True)
    print('Read-only near-match candidates at >=85%', len(near_misses), flush=True)
    for row in near_misses[:90]:
        print('NEAR-CANDIDATE', row['addr'], row['bytes'], row['percent'],
              row['source'], row['symbol'], row['detail'], flush=True)
    for s in stats:
        print('SOURCE', s['source'], s['unledgered'], 'unledgered,',
              s['emitted_nonledgered'], 'emitted,',
              s['length_cases'], 'length cases,',
              s['unique_exact'], 'possible exact', flush=True)
    return 0

if __name__ == '__main__':
    sys.exit(main())
