"""The clear-call expression must stringify to the actual retail log message."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import re
import struct
import pefile

w=Path(__file__).resolve().parents[1]
pe=pefile.PE(str(retail_anchor()))
assert pe.get_data(0x2fefb,5)==b'\x68'+struct.pack('<I',0x10197f40)
expected=pe.get_string_at_rva(0x197f40).decode('ascii')
s=(w/'src/gfx_d3d/rb_backend.cpp').read_text()
start=s.index('void RB_ClearScreen(');body=s[start:s.index('\n}',start)+2]
expression=re.search(r'R_DX_CALL\(([^\n]+)\);',body).group(1)
assert ' '.join(expression.split())+'\n'==expected
assert 'union { DWORD packed; byte array[4]; } nativeColor;' in body
assert 'R_QuantizeCachedColor(color, nativeColor.array);' in body
assert ' '.join(expression.replace('nativeColor.packed','packedColor').split())+'\n'!=expected
print('PASS: target-proven clear log, actual union member expression, byte conversion and old-spelling negative')
