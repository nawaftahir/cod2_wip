"""Positive/negative controls for complete MSVC literal objects, not neighbor data."""
from pathlib import Path
import re
import sys
import pefile

gfx = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(gfx / 'tools'))
from string_literal import string_size, string_equal

symbol = '??_C@_01IDAFKMJL@_?$AA@'
assert string_size(symbol) == 2
assert string_equal(symbol, b'_\0', b'_\0')
for wrong in (b'x\0', b'__', b'_', b'_\0\0', None):
    assert not string_equal(symbol, b'_\0', wrong)
assert not string_equal(symbol, b'__', b'__')
assert string_size('??_C@_0L@DLHIECNL@LC_NUMERIC?$AA@') == 11
assert string_size('??_C@_1O@wide') == 14
assert string_equal('??_C@_13wide', b'A\0\0\0', b'A\0\0\0')
assert not string_equal('??_C@_13wide', b'A\0\0\0', b'A\0B\0')
assert string_equal('??_C@_03embedded', b'a\0b\0', b'a\0b\0')
assert not string_equal('??_C@_03embedded', b'a\0b\0', b'a\0c\0')
for invalid in ('ordinary', '??_C@_2bad', '??_C@_0Q@bad', '??_C@_1B@odd'):
    assert string_size(invalid) is None
assert string_size('??_C@_04KGLCPMCP@log2?$AA@+8') is None

build = gfx / 'target/work/build'
pe = pefile.PE(str(build / 'gfx.dll'))
checked = 0
for line in (build / 'gfx.map').read_text().splitlines():
    match = re.match(r'\s*\w{4}:\w{8}\s+(\?\?_C@\S+)\s+([0-9a-f]{8})', line)
    if not match:
        continue
    name, address = match[1], int(match[2], 16)
    size = string_size(name)
    assert size is not None, name
    data = pe.get_data(address - pe.OPTIONAL_HEADER.ImageBase, size)
    assert string_equal(name, data, data), name
    corrupt = bytes([data[0] ^ 1]) + data[1:]
    assert not string_equal(name, data, corrupt), name
    assert not string_equal(name, data, data[:-1]), name
    checked += 1
assert checked > 100
print(f'PASS: {checked} compiler-named string extents, byte/truncation negatives, embedded NUL and wide controls')
