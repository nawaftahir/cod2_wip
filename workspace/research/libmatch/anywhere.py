#!/usr/bin/env python3
"""Search every retail function for the linked bytes of some symbols: anywhere.py <symbol>..."""
import sys; sys.path.insert(0, 'tools'); import verify, link, match_radiant as m
L = verify.Linked(); names = verify.known_names()
rows = link.read_tsv('data/tu_map.tsv')
for s in sys.argv[1:]:
    _, code = L.code(s)
    hits = [r['addr'] for r in rows if int(r['size']) == len(code) and verify.check(L, r['addr'], s, names)[0] in ('MATCH', 'CALLEE')]
    print(s, len(code), hits[:8])
