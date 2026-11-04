"""Check compiler accounting and the actual global dialog lifetime bindings."""
import json
from pathlib import Path
import re
import runpy
import struct
import sys

sys.path.insert(0, 'tools')
import link

model = runpy.run_path('research/codex_order/test_model.py')
space = {'__file__': str(Path('tools/verify.py').resolve()), '__name__': 'lifetime_verifier'}
verifier = Path(sys.argv[1]) if len(sys.argv) > 1 else Path('tools/verify.py')
report = Path(sys.argv[2]) if len(sys.argv) > 2 else Path('build/verify.json')
exec(compile(verifier.read_text(), str(verifier), 'exec'), space)
summary = json.loads(report.read_text())
assert summary['compiler_rows'] == summary['compiler_matched'] == 2
assert summary['compiler_matched_bytes'] == 35 and summary['failed'] == 0
assert summary['unverified_in_src'] == 50
assert summary['matched_bytes'] == sum(int(row['size']) for row in link.read_tsv('ledger/matches.tsv'))
image = space['Linked']()
names = space['known_names']()
for address, symbol in [('0x00526a10', '_$E1'), ('0x00526f50', '_$E2')]:
    assert space['check'](image, address, symbol, names)[0] == 'MATCH'
initializer, init_code = image.code('_$E1')
cleanup, cleanup_code = image.code('_$E2')
object_address = model['data_symbol']('?g_curveDialog@@')
assert b'\x68' + struct.pack('<I', object_address) in init_code
assert b'\x68' + struct.pack('<I', object_address) in cleanup_code
assert b'\x68' + struct.pack('<I', cleanup) in init_code
# The compiler must register the initializer in the actual CRT constructor table.
mapping = link.MAP.read_text(errors='replace')
match = re.search(r'^\s+(\d{4}):([0-9a-f]{8})\s+([0-9a-fA-F]+)H\s+\.CRT\$XCU\s+DATA', mapping, re.M)
assert match
section = image.pe.sections[int(match[1]) - 1]
table = image.pe.get_data(section.VirtualAddress + int(match[2], 16), int(match[3], 16))
assert initializer in struct.unpack('<%dI' % (len(table) // 4), table)
print('PASS: two compiler helpers / 35 bytes, correct object and cleanup, CRT registration, game coverage unchanged')
