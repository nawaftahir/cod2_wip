"""Validate the relocated API address oracle against actual retail instructions."""
import hashlib
import json
from pathlib import Path
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
oracle = work / 'proof/retail/refapi_pinned.json'
assert hashlib.sha256(oracle.read_bytes()).hexdigest() == 'f8ba91eda8b82778d5197fb72d80bd3098f162dc1d8af421ee1a67cacac31639'
pinned = json.loads(oracle.read_text())
anchor = work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == pinned['anchor_sha256']
pe = pefile.PE(str(anchor)); base = pe.OPTIONAL_HEADER.ImageBase
image = pe.get_memory_mapped_image()
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
decoder.detail = True
assert len(pinned['slots']) == pinned['export_slots'] == 108
assert pinned['api_version'] == 59 and pinned['import_slots'] == 169
for slot in pinned['slots']:
    address = int(slot['table_address'], 16)
    assert address == int(pinned['export_base'], 16) + 4*slot['slot']
    if not slot['write_instruction']:
        assert slot['target'] == '0x0' and image[address-base:address-base+4] == bytes(4)
        continue
    location = int(slot['write_instruction'], 16)
    instruction = next(decoder.disasm(pe.get_data(location-base, 10), location))
    assert instruction.mnemonic == 'mov'
    destination, value = instruction.operands
    assert destination.type == capstone.x86.X86_OP_MEM and destination.mem.disp == address
    assert value.type == capstone.x86.X86_OP_IMM and value.imm == int(slot['target'], 16)
for address in (0x1000bad0, 0x1000ce60, 0x1000ce70, 0x10020cf0):
    assert pe.get_data(address-base, 2) == b'\xc3\xcc', hex(address)
reset = next(decoder.disasm(pe.get_data(0x10001280-base, 5), 0x10001280))
assert reset.mnemonic == 'jmp' and reset.operands[0].imm == 0x100013d0
print('PASS: 108 API slots, 98 writes, ten zeros, four genuine empty callbacks and sun-reset tail')
