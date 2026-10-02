"""Decoded PE relocation mask; internal jumps and table bytes stay literal."""
import struct
from capstone import Cs, CS_ARCH_X86, CS_MODE_32


def relocation_mask(matcher, file_offset, size, body, rva, code_bytes):
    assert len(body) == size and 0 < code_bytes <= size
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(body[:code_bytes], rva))
    assert sum(i.size for i in instructions) == code_bytes
    fields = {p - file_offset for p in matcher['PE_RELOCS']
              if file_offset <= p < file_offset + size}
    assert all(0 <= p <= size - 4 for p in fields)
    for instruction in instructions:
        if instruction.size == 5 and instruction.bytes[0] in (0xe8, 0xe9):
            target = instruction.address + 5 + struct.unpack('<i', instruction.bytes[1:])[0]
            if not rva <= target < rva + code_bytes or (
                instruction.bytes[0] == 0xe8 and target == rva):
                fields.add(instruction.address - rva + 1)
    return {p + byte for p in fields for byte in range(4)}


def self_check():
    empty = {'PE_RELOCS': set()}
    mask = lambda b: relocation_mask(empty, 0, len(b), b, 0x1000, len(b))
    assert mask(bytes.fromhex('e8 fb ff ff ff c3')) == {1, 2, 3, 4}
    assert mask(bytes.fromhex('e9 00 00 00 00 c3')) == set()
    assert mask(bytes.fromhex('b8 e8 00 01 00 00 c3')) == set()
    assert mask(bytes.fromhex('e9 00 01 00 00')) == {1, 2, 3, 4}
    assert relocation_mask(empty, 0, 5, b'\xc3\xe8\xe9\xff\xff', 0x1000, 1) == set()
    try:
        relocation_mask({'PE_RELOCS': {3}}, 0, 5, b'\x90' * 5, 0x1000, 5)
    except AssertionError:
        pass
    else:
        raise AssertionError('truncated relocation accepted')
    print('PASS: recursive calls, literal internal jumps, immediates, tables, bounds')


if __name__ == '__main__':
    self_check()
