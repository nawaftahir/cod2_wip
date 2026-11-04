"""Audit game coverage against unique retail addresses and exact anchor spans."""
import sys
sys.path.insert(0, 'tools')
import verify

rows = verify.read_tsv('ledger/matches.tsv')
addresses = [int(row['addr'], 16) for row in rows]
assert len(addresses) == len(set(addresses)), 'game addresses must be unique'
roles = {int(row['addr'], 16): row['evidence'] for row in verify.read_tsv('data/tu_map.tsv')}
libraries = {int(row['addr'], 16) for row in verify.read_tsv('data/lib_funcs.tsv')}
for row in rows:
    address = int(row['addr'], 16)
    assert address not in libraries and roles[address] not in ('AUTO', 'EXTLIB'), row
    assert int(row['size']) == len(verify.matcher.carve(row['addr'])[0]), row
assert not set(addresses) & {int(row['addr'], 16) for row in verify.read_tsv('ledger/compiler.tsv')}
print('PASS: %d unique game addresses, exact retail byte spans, separate library/compiler accounting' % len(rows))
