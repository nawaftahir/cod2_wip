"""Pin older credited switch tails without changing either byte-match referee."""
from pathlib import Path
import hashlib
import json
import struct
import capstone
import pefile

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
anchor = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
pe = pefile.PE(str(anchor))
base = pe.OPTIONAL_HEADER.ImageBase
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
rows = []
for va, extent, code, table, entries, selectors in [
    (0x1000d090, 92, 66, 0x1000d0d4, 6, 0),
    (0x1000e840, 187, 135, 0x1000e8c8, 5, 31),
    (0x1000e900, 274, 226, 0x1000e9e4, 4, 30),
    (0x1000ef40, 219, 149, 0x1000efd8, 4, 51),
    (0x10023800, 200, 183, 0x100238b8, 4, 0),
]:
    instructions = list(md.disasm(pe.get_data(va - base, code), va))
    assert instructions[-1].mnemonic == 'ret'
    assert instructions[-1].address + instructions[-1].size == va + code
    starts = {i.address for i in instructions}
    assert any(i.mnemonic == 'jmp' and hex(table) in i.op_str for i in instructions)
    targets = struct.unpack('<' + 'I' * entries, pe.get_data(table - base, entries * 4))
    assert all(t in starts for t in targets), (hex(va), targets)
    selector_data = pe.get_data(table - base + entries * 4, selectors)
    assert all(s < entries for s in selector_data)
    padding = table - va - code
    assert padding + entries * 4 + selectors == extent - code
    rows.append(dict(target=hex(va), full_extent=extent, executable_bytes=code,
                     excluded_bytes=extent-code, padding=padding,
                     table=hex(table), entries=entries, selectors=selectors))
assert sum(r['excluded_bytes'] for r in rows) == 213
print(json.dumps(dict(confirmed_extra_exclusions=213, rows=rows), indent=2))
