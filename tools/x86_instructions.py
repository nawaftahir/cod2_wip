"""Decode instructions without losing alignment inside inline pointer tables."""


def instructions(decoder, code, address, relocation_bytes):
    offset = 0
    while offset < len(code):
        if address + offset in relocation_bytes:
            while offset < len(code) and address + offset in relocation_bytes:
                offset += 1
            continue
        for instruction in decoder.disasm(code[offset:], address + offset):
            if instruction.address in relocation_bytes:
                offset = instruction.address - address
                break
            offset = instruction.address - address + instruction.size
            yield instruction
        else:
            # Invalid pointer bytes may stop decoding before an instruction exists.
            if address + offset not in relocation_bytes:
                return
