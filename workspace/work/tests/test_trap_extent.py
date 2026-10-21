"""Preserve a branch-targeted INT3; ordinary alignment remains excluded."""
import ast
from pathlib import Path
import capstone

tool = Path(__file__).parents[3] / 'tools/cmp.py'
node = next(n for n in ast.parse(tool.read_text()).body
            if isinstance(n, ast.FunctionDef) and n.name == 'trim_padding')
scope = {'md': capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)}
exec(compile(ast.Module(body=[node], type_ignores=[]), str(tool), 'exec'), scope)
trim = scope['trim_padding']
assert trim(b'\x90\xc3\xcc\xcc', 0x1000) == b'\x90\xc3'
assert trim(b'\x75\x01\xc3\xcc\xcc', 0x1000) == b'\x75\x01\xc3\xcc'
assert trim(b'\x75\x02\xc3\xcc\xcc', 0x1000) == b'\x75\x02\xc3\xcc\xcc'
assert trim(b'\xeb\x7f\xc3\xcc', 0x1000) == b'\xeb\x7f\xc3'
assert trim(b'\xe8\x01\x00\x00\x00\xc3\xcc', 0x1000) == b'\xe8\x01\x00\x00\x00\xc3'
assert trim(b'\x0f\x83\x01\x00\x00\x00\xc3\xcc\xcc', 0x1000).endswith(b'\xc3\xcc')
assert trim(b'\xcc\xcc', 0x1000) == b''
assert trim(b'\xc3\x75\x01\xc3\xcc\xcc', 0x1000) == b'\xc3\x75\x01\xc3'
assert trim(b'\xff\xe0\x75\x01\xc3\xcc\xcc', 0x1000) == b'\xff\xe0\x75\x01\xc3'
print('PASS: targeted traps, short/long branches, external jumps, calls and padding')
