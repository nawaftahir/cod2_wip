"""Short library leaves need caller placement, not a global RET-byte search."""
from pathlib import Path
import contextlib
import io
import json
import runpy
import sys
import tempfile
from types import SimpleNamespace
from unittest.mock import patch
import capstone

gfx = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(gfx / 'tools'))
from x86_instructions import instructions
relocation_sites = []
code = b'\xc3\x8b\xc1\xc3\x33\xc0\xc2\x04\x00\xe9\x00\x00\x00\x00'


def image(path):
    section = SimpleNamespace(Name=b'.text', VirtualAddress=0x1000,
                              Misc_VirtualSize=len(code), get_data=lambda: code)
    return SimpleNamespace(OPTIONAL_HEADER=SimpleNamespace(ImageBase=0x10000000),
                           sections=[section], DIRECTORY_ENTRY_BASERELOC=[SimpleNamespace(entries=[
                               SimpleNamespace(type=3,rva=0x1000+offset) for offset in relocation_sites])])


with tempfile.TemporaryDirectory(prefix='gfx_short_candidates_') as directory:
    directory = Path(directory)
    symbols = directory / 'image.map'
    symbols.write_text(''' 0001:00000000 alias 10001000 f original.obj
 0001:00000000 empty 10001000 f original.obj
 0001:00000001 constructor 10001001 f original.obj
 0001:00000004 return_value 10001004 f original.obj
 0001:00000009 jump_thunk 10001009 f original.obj
''')
    output = directory / 'cmp.json'
    argv = ['cmp.py', 'ours', str(symbols), 'target', str(output)]
    with patch('pefile.PE', side_effect=image), patch.object(sys, 'argv', argv), \
            contextlib.redirect_stdout(io.StringIO()):
        runpy.run_path(str(gfx / 'tools/cmp.py'), run_name='__main__')
    rows = {row['name']: row for row in json.loads(output.read_text())}
    assert set(rows) == {'empty', 'constructor', 'return_value'}
    assert [rows[name]['size'] for name in rows] == [1, 3, 5]
    assert all(not row['hits'] for row in rows.values())

# Only unique, unrelocated six/seven-byte straight-line returns get global discovery.
parts = [('constant', bytes.fromhex('b878563412c3')),
         ('accessor', bytes.fromhex('8b4424048b00c3')),
         ('duplicate_a', bytes.fromhex('8b4424048b40c3')),
         ('duplicate_b', bytes.fromhex('8b4424048b40c3')),
         ('relocated', bytes.fromhex('a130201010c3')),
         ('internal_call', bytes.fromhex('e800000000c3')),
         ('conditional', bytes.fromhex('7401909090c3')),
         ('immediate_c3', bytes.fromhex('90b8000000c3')),
         ('trap', bytes.fromhex('cc90909090c3'))]
code = b''.join(body for _,body in parts)
relocation_sites = [sum(len(body) for _,body in parts[:4])+1]
with tempfile.TemporaryDirectory(prefix='gfx_unique_short_') as directory:
    directory=Path(directory);symbols=directory/'image.map';output=directory/'cmp.json'
    offset=0;lines=[]
    for name,body in parts:
        lines.append(f' 0001:{offset:08x} {name} {0x10001000+offset:08x} f original.obj\n')
        offset+=len(body)
    symbols.write_text(''.join(lines))
    argv=['cmp.py','ours',str(symbols),'target',str(output)]
    with patch('pefile.PE',side_effect=image),patch.object(sys,'argv',argv),contextlib.redirect_stdout(io.StringIO()):
        runpy.run_path(str(gfx/'tools/cmp.py'),run_name='__main__')
    rows={r['name']:r for r in json.loads(output.read_text())}
    assert rows['constant']['hits']==['0x10001000']
    assert rows['accessor']['hits']==['0x10001006']
    assert all(not rows[name]['hits'] for name,_ in parts[2:])

text = (gfx / 'tools/bindcheck.py').read_text()
source = text[text.index('def masked_eq('):text.index('\nchanged = True\nwhile changed and multi:')]
ours = b'\x8b\xc1\xc3'
target = b'\x8b\xc1\xc3\x33\xc0\xc3'


def read(sections, address, count):
    data, base = (ours, 0x2000) if sections == 'ours' else (target, 0x5000)
    offset = address - base
    return data[offset:offset + count] if 0 <= offset <= len(data) - count else None


context = dict(read=read, osecs='ours', asecs='target', orel=set(),
               orelocbytes=set(), instructions=instructions,
               md=capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32))
exec(source, context)
check = context['masked_eq']
assert check(0x2000, 0x5000, 3)
assert not check(0x2000, 0x5003, 3)
assert not check(0x2000, 0x5001, 3)
assert not check(0x2000, 0x5000, 4)
source = text[text.index('def closed_end('):text.index('\n\nacalls =')]
context = dict(capstone=capstone)
exec(source, context)
assert context['closed_end'](b'\xc3', 0x5000, 1)
assert context['closed_end'](ours, 0x5000, 3)
assert not context['closed_end'](b'\x8b\xc1', 0x5000, 2)
print('PASS: 1/3/5-byte candidates, zero aliases and separate jump thunks, caller-only 1/3/5-byte and ambiguous leaves, unique 6/7-byte discovery, relocation/control-flow negatives, exact bodies and closed extents')
