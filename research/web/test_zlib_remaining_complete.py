"""Complete translation-unit code and data audit for six zlib 1.1.4 sources.

The matching game routines predate this proof. This test grants no new game
credit: it requires the unchanged retail referee, full inventoried functions,
linker source ownership, nonfunction padding and additional data bindings.
"""
from pathlib import Path
import re
import struct
import sys

sys.path.insert(0, 'tools')
import verify as v

FILES = {
    'src/zlib/infblock.c': (0x004ae960, 0x004af64b),
    'src/zlib/infcodes.c': (0x004af650, 0x004afd9c),
    'src/zlib/inftrees.c': (0x004b0850, 0x004b0f8a),
    'src/zlib/trees.c': (0x004b10d0, 0x004b2b72),
    'src/zlib/unzip.c': (0x004b2c10, 0x004b3c6f),
    'src/zlib/zutil.c': (0x004b3c70, 0x004b3cf1),
}

image = v.Linked()
retail = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
names = v.known_names()
matches = v.read_tsv('ledger/matches.tsv')
mapping = v.read_tsv('data/tu_map.tsv')
compiler = v.read_tsv('ledger/compiler.tsv')


def read(pe, address, size):
    result = pe.get_data(address - pe.OPTIONAL_HEADER.ImageBase, size)
    assert len(result) == size, (hex(address), size)
    return result


def data_symbol(name):
    rows = re.findall(r'^\s*000[23]:[0-9a-f]+\s+' + re.escape(name) +
                      r'\s+([0-9a-f]+)\s', v.link.MAP.read_text(), re.M)
    assert len(rows) == 1, (name, rows)
    return int(rows[0], 16)


def string(pe, address, limit=256):
    data = read(pe, address, limit)
    assert b'\0' in data
    return data.split(b'\0', 1)[0]


total_rows = total_bytes = total_padding = 0
for source, (start, end) in FILES.items():
    rows = sorted((r for r in matches if r['source'] == source),
                  key=lambda r: int(r['addr'], 16))
    inventory = [r for r in mapping
                 if r['tu'] in (source, source.removeprefix('src/'))]
    assert rows, source
    assert {(int(r['addr'], 16), int(r['size'])) for r in rows} == {
        (int(r['addr'], 16), int(r['size'])) for r in inventory
    }, (source, 'unaccounted retail entry')
    assert not any(r['source'] == source for r in compiler), (
        source, 'unexpected compiler routine')
    wanted = {r['symbol'] for r in rows}
    actual = set(image.of_source(source))
    assert wanted == actual, (source, {'missing': wanted - actual,
                                       'extra': actual - wanted})
    assert [image.syms[r['symbol']] for r in rows] == sorted(
        image.syms[r['symbol']] for r in rows), (source, 'emit-order mismatch')
    cursor = start
    local_padding = 0
    for r in rows:
        address, size = int(r['addr'], 16), int(r['size'])
        assert start <= address and address + size <= end
        gap = read(retail, cursor, address - cursor)
        assert set(gap) <= {0x90, 0xcc}, (source, hex(cursor), gap.hex())
        local_padding += len(gap)
        status, detail = v.check(image, r['addr'], r['symbol'], names)
        assert status == 'MATCH', (source, r['symbol'], detail)
        cursor = address + size
    tail = read(retail, cursor, end - cursor)
    assert set(tail) <= {0x90, 0xcc}, (source, hex(cursor), tail.hex())
    local_padding += len(tail)
    assert (end - start) == sum(int(r['size']) for r in rows) + local_padding
    count, size = len(rows), sum(int(r['size']) for r in rows)
    total_rows += count
    total_bytes += size
    total_padding += local_padding
    print('PASS:', source, '%d/%d game routines' % (count, len(inventory)),
          '%d B' % size, '%d B padding' % local_padding, flush=True)

# Static/global zlib data must be the actual source-defined strings and tables,
# not just relocation-masked instruction operands. Deflate's independent proof
# checks the 120 B configuration dispatch, 512+256 B code tables, allocator
# callbacks and the ten z_errmsg strings (research/codex_deflate/test_complete.py).
copyrights = (
    ('_inflate_copyright',
     b' inflate 1.1.4 Copyright 1995-2002 Mark Adler '),
)
for name, expected in copyrights:
    ours = data_symbol(name)
    assert string(image.pe, ours) == expected, (name, 'candidate copyright')
    print('DATA diagnostic', name, 'retail exact index', retail.__data__.find(expected + b'\0'),
          'retail partial index', retail.__data__.find(b'inflate 1.1.4'),
          'candidate', string(image.pe, ours), flush=True)
    assert retail.__data__.find(expected + b'\0') >= 0, (name, 'retail copyright')
    print('PASS:', name, 'retail/candidate constant match')

# The actual linked zlib version string should be backed by the source object,
# not an arbitrary mask-compatible absolute address.
assert '_zlibVersion' in image.syms, 'missing zlibVersion function'

assert total_rows == 63 and total_bytes == 17744, (
    total_rows, total_bytes)
print('PASS: six complete zlib source inventories, %d exact game routines / %d B; %d B retail padding; no extra emitted functions; image placement PENDING' % (total_rows, total_bytes, total_padding))
