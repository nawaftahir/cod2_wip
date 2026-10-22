"""A known MSVC string cannot own unnamed data after its encoded extent."""
from pathlib import Path
import bisect
import sys

gfx = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(gfx / 'tools'))
from string_literal import string_size

text = (gfx / 'tools/bindcheck.py').read_text()
start = text.index('def resolve(va):')
source = text[start:text.index('\n\nglm =', start)]


def resolver(name):
    symbols = [(0x2000, name, 'LIB:data.obj', False),
               (0x2048, 'ordinary_data', 'LIB:data.obj', False),
               (0x2050, 'next_data', 'LIB:data.obj', False)]
    context = dict(bisect=bisect, syms=symbols, svas=[row[0] for row in symbols],
                   string_size=string_size, contribution_sizes={})
    exec(source, context)
    return context['resolve']


lookup = resolver('??_C@_04ODHECPBC@fabs?$AA@')
assert lookup(0x1fff) is None
for offset in range(5):
    row = lookup(0x2000+offset)
    assert row[1] == offset and row[2] == 0x2000 and row[3] == 5
for offset in (5, 8, 12, 71):
    assert lookup(0x2000+offset) is None, ('string overrun became owned data', offset)
assert lookup(0x2048)[:3] == ('ordinary_data', 0, 0x2048)
assert lookup(0x204a)[:3] == ('ordinary_data', 2, 0x2048)
wide = resolver('??_C@_13wide')
assert wide(0x2003)[3] == 4 and wide(0x2004) is None
assert resolver('??_C@_0Q@invalid')(0x2000) is None
name = '$pdb_contribution$fixture@2000'
lookup = resolver(name)
lookup.__globals__['contribution_sizes'][name] = 12
assert lookup(0x200b)[3] == 12
assert lookup(0x200c) is None
print('PASS: encoded string extents, unnamed-data overruns, wide counts and unchanged ordinary data')
