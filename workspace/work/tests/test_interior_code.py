"""An exception label binds only inside its uniquely matched enclosing body."""
from pathlib import Path
import capstone

text = (Path(__file__).resolve().parents[3] / 'tools/bindcheck.py').read_text()
start = text.index('def interior_code(')
source = text[start:text.index('\n\ndef nested_data(', start)]
code = b'\x31\xc0\x40\xc3'
owner = dict(va=0x2000, t=0x5000, n=len(code))
row = dict(calls=[])
context = dict(results={'owner': owner}, osecs=[], r=row,
               read=lambda sections, va, n: code,
               md=capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32))
exec(source, context)
check = context['interior_code']
assert check(0x2002, 0x5002)
assert row['calls'] == [(0x2000, 0x5000)]
for op, tp in ((0x2001, 0x5001), (0x2002, 0x5003), (0x2004, 0x5004), (0x1fff, 0x4fff)):
    assert not check(op, tp), (op, tp)
context['results']['alias'] = owner
assert not check(0x2002, 0x5002)
context['results'].clear()
assert not check(0x2002, 0x5002)
print('PASS: exact interior instruction offset, enclosing-call dependency and six ambiguity/bounds negatives')
