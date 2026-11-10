"""Accept an extent only when our next same-object body matches retail right after it."""
import ast
from pathlib import Path

tree = ast.parse((Path(__file__).resolve().parents[3] / 'tools/bindcheck.py').read_text())
helper = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == 'adjacent_match')


def run(foreign=False, changed=False, missing=False, empty=False):
    source = bytearray(b'\x90' * 7 + b'\xc3' + b'\x8b\xc1\xc3')
    target = bytearray(source)
    if changed:
        target[9] = 0xc2
    allc = {'?body': dict(obj='cassembler.obj', size=8),
            '?next': dict(obj='other.obj' if foreign else 'cassembler.obj', size=0 if empty else 3)}
    ns = dict(atva={} if missing else {0x1008: '?next'}, allc=allc,
              masked_eq=lambda a, t, n: bytes(source[a-0x1000:a-0x1000+n]) == bytes(target[t-0x5000:t-0x5000+n]))
    exec(compile(ast.Module(body=[helper], type_ignores=[]), '<actual-adjacent-extent>', 'exec'), ns)
    return ns['adjacent_match']('?body', 0x1000, 0x5000, 8)


assert run()
for option in ('foreign', 'changed', 'missing', 'empty'):
    assert not run(**{option: True}), option
print('PASS: adjacent extent needs a same-object successor that matches retail at t+n')
