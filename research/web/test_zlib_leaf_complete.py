"""Complete-file audit for simple zlib 1.1.4 leaf translation units."""
import sys
from pathlib import Path
sys.path.insert(0, 'tools')
import verify as v

FILES = {
    'src/zlib/adler32.c': (0x4acfc0, 0x4ad0f0),
    'src/zlib/compress.c': (0x4ad0f0, 0x4ad1a0),
    'src/zlib/inffast.c': (0x4afda0, 0x4b0135),
    'src/zlib/infutil.c': (0x4b0f90, 0x4b10c6),
    'src/zlib/uncompr.c': (0x4b2b80, 0x4b2c0b),
}

image = v.Linked()
names = v.known_names()
retail = v.link.RETAIL.read_bytes()
pe = v.pefile.PE(str(v.link.RETAIL), fast_load=True)

def read_retail(address, size):
    rva = address - pe.OPTIONAL_HEADER.ImageBase
    data = pe.get_data(rva, size)
    assert len(data) == size, (hex(address), size)
    return data

matches = v.read_tsv('ledger/matches.tsv')
mapping = v.read_tsv('data/tu_map.tsv')
compiler = v.read_tsv('ledger/compiler.tsv')

for source, (start, end) in FILES.items():
    rows = [r for r in matches if r['source'] == source]
    mapped = [r for r in mapping if r['tu'] in (source, source.removeprefix('src/'))]
    assert rows, source
    assert {(int(r['addr'],16), int(r['size'])) for r in rows} == {
        (int(r['addr'],16), int(r['size'])) for r in mapped
    }, (source, 'inventory mismatch')
    assert not any(r['source'] == source for r in compiler), (source, 'unexpected compiler row')

    expected_symbols = {r['symbol'] for r in rows}
    owned = set(image.of_source(source))
    assert owned == expected_symbols, (source, {'missing': expected_symbols-owned, 'extra': owned-expected_symbols})

    ordered = sorted(rows, key=lambda r: int(r['addr'], 16))
    cursor = start
    for row in ordered:
        address, size, symbol = int(row['addr'],16), int(row['size']), row['symbol']
        assert start <= address < end and address + size <= end, (source, row)
        gap = read_retail(cursor, address-cursor)
        assert all(b in (0x90, 0xcc) for b in gap), (source, hex(cursor), gap.hex())
        status, detail = v.check(image, row['addr'], symbol, names)
        assert status == 'MATCH', (source, symbol, detail)
        cursor = address + size
    tail = read_retail(cursor, end-cursor)
    assert all(b in (0x90, 0xcc) for b in tail), (source, hex(cursor), tail.hex())
    assert [image.syms[r['symbol']] for r in ordered] == sorted(image.syms[r['symbol']] for r in ordered)
    print('PASS:', source, len(rows), 'routines /',
          sum(int(r['size']) for r in rows), 'B; padding', (end-start)-sum(int(r['size']) for r in rows), 'B')

print('PASS: five zlib leaf TUs have complete code inventories, no extra emitted helpers, and no compiler-owned rows')
