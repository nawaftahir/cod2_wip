#!/usr/bin/env python3
"""Relocation-normalized matcher for CoD2Radiant.exe and MSVC COFF objects."""
import json
import os
import struct
import sys

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXE = os.path.join(BASE_DIR, "binaries", "CoD2Radiant.exe")
INVENTORY = os.path.join(BASE_DIR, "data", "functions_cod2radiant.json")
_image = open(EXE, "rb").read()


def _sections(data):
    pe = struct.unpack_from("<I", data, 0x3C)[0]
    count = struct.unpack_from("<H", data, pe + 6)[0]
    option_size = struct.unpack_from("<H", data, pe + 20)[0]
    offset = pe + 24 + option_size
    result = {}
    for index in range(count):
        record = data[offset + index * 40:offset + (index + 1) * 40]
        name = record[:8].rstrip(b"\0").decode()
        virtual_size, virtual_address, raw_size, raw_ptr = struct.unpack_from("<IIII", record, 8)
        result[name] = {"va": virtual_address, "vs": virtual_size,
                        "ptr": raw_ptr, "raw": raw_size}
    return result


SECTIONS = _sections(_image)
_pe = struct.unpack_from("<I", _image, 0x3C)[0]
IMAGE_BASE = struct.unpack_from("<I", _image, _pe + 24 + 28)[0]
IMAGE_SIZE = struct.unpack_from("<I", _image, _pe + 24 + 56)[0]
IMAGE_END = IMAGE_BASE + IMAGE_SIZE


def rva_to_offset(rva):
    for section in SECTIONS.values():
        if section["va"] <= rva < section["va"] + max(section["vs"], section["raw"]):
            return section["ptr"] + rva - section["va"]
    raise ValueError("RVA is not mapped: %#x" % rva)


def load_functions():
    with open(INVENTORY) as stream:
        payload = json.load(stream)
    return {item["addr"].lower(): item for item in payload["functions"]}


FUNCTIONS = load_functions()


def carve(address):
    key = "0x%08x" % int(address, 16)
    function = FUNCTIONS.get(key)
    if not function:
        raise KeyError("function is absent from inventory: %s" % address)
    va = int(key, 16)
    offset = rva_to_offset(va - IMAGE_BASE)
    size = int(function["size"])
    return _image[offset:offset + size], function


def parse_coff(data):
    machine, section_count, _, symbol_pointer, symbol_count, optional_size, _ = \
        struct.unpack_from("<HHIIIHH", data, 0)
    if machine != 0x14C:
        raise ValueError("object is not i386 COFF")
    sections = []
    base = 20 + optional_size
    for index in range(section_count):
        record = data[base + index * 40:base + (index + 1) * 40]
        virtual_size, virtual_address, raw_size, raw_ptr = struct.unpack_from("<IIII", record, 8)
        relocation_ptr, _, relocation_count = struct.unpack_from("<IIH", record, 24)
        flags = struct.unpack_from("<I", record, 36)[0]
        sections.append({"raw": raw_size, "ptr": raw_ptr,
                         "reloc_ptr": relocation_ptr,
                         "reloc_count": relocation_count, "flags": flags})
    string_base = symbol_pointer + symbol_count * 18
    string_size = struct.unpack_from("<I", data, string_base)[0]
    strings = data[string_base:string_base + string_size]
    symbols = []
    raw_index = 0
    while raw_index < symbol_count:
        record_at = symbol_pointer + raw_index * 18
        record = data[record_at:record_at + 18]
        first, second = struct.unpack_from("<II", record)
        if first == 0 and second:
            start = string_base + second
            end = data.index(b"\0", start)
            name = data[start:end].decode(errors="replace")
        else:
            name = record[:8].rstrip(b"\0").decode(errors="replace")
        value, section_number, _, storage_class, auxiliary = struct.unpack_from("<IhHBB", record, 8)
        symbols.append({"name": name, "value": value, "section": section_number,
                        "class": storage_class, "aux": auxiliary, "raw": raw_index})
        raw_index += 1 + auxiliary
    by_raw = {symbol["raw"]: symbol["name"] for symbol in symbols}
    for section in sections:
        section["relocations"] = []
        for index in range(section["reloc_count"]):
            at = section["reloc_ptr"] + index * 10
            position, symbol_index, relocation_type = struct.unpack_from("<IIH", data, at)
            section["relocations"].append({"position": position, "type": relocation_type,
                                           "target": by_raw.get(symbol_index, "")})
    return sections, symbols


def object_function(data, wanted=None, target_hint=None, with_calls=False):
    _, _, _, symbol_pointer, _, _, _ = struct.unpack_from("<HHIIIHH", data, 0)
    sections, symbols = parse_coff(data)
    executable = [section for section in sections if section["flags"] & 0x20]
    chosen_index = None
    for index, symbol in enumerate(symbols):
        if symbol["section"] > 0 and symbol["class"] in (2, 3):
            if not wanted or symbol["name"] == wanted:
                section = sections[symbol["section"] - 1]
                if section in executable and not symbol["name"].startswith("."):
                    chosen_index = index
                    break
    if chosen_index is None:
        raise ValueError("matching text symbol was not found")
    symbol = symbols[chosen_index]
    section = sections[symbol["section"] - 1]
    own_record_at = 0
    own_size = 0
    if symbol.get("aux"):
        preceding_aux = sum(item.get("aux", 0) for item in symbols[:chosen_index])
        own_record_at = symbol_pointer + (preceding_aux + chosen_index) * 18
        own_size = struct.unpack_from("<II", data, own_record_at + 8)[1]
    sec_length = None
    end_record = None
    if chosen_index > 0 and symbols[chosen_index - 1].get("section") == symbol["section"] \
            and symbols[chosen_index - 1].get("class") == 3 and symbols[chosen_index - 1].get("aux") == 1:
        preceding_aux = sum(item.get("aux", 0) for item in symbols[:chosen_index - 1])
        length_at = symbol_pointer + (preceding_aux + chosen_index) * 18
        sec_length = struct.unpack_from("<I", data, length_at)[0]
    start = symbol["value"]
    end = section["raw"]
    begin_symbols = [index for index, item in enumerate(symbols[:chosen_index])
                     if item["section"] == symbol["section"] and item["name"] == ".bf"]
    begin_index = begin_symbols[-1] if begin_symbols else chosen_index
    later_symbols = [item for item in symbols[begin_index:]
                     if item["section"] == symbol["section"] and item["name"] == ".ef"]
    if later_symbols:
        end_offset = symbols[begin_index:].index(later_symbols[0])
        end_index = begin_index + end_offset
        preceding_aux = sum(item.get("aux", 0) for item in symbols[:end_index])
        end_record_at = symbol_pointer + (preceding_aux + end_index) * 18
        end_record = struct.unpack_from("<II", data, end_record_at + 8)

    expected_end = None
    if target_hint:
        expected_end = start + len(target_hint)
    if end_record and 0 < end_record[0] <= section["raw"] and end_record[0] > start and \
            (expected_end is None or end_record[0] <= expected_end):
        end = start + end_record[0]
    elif expected_end and expected_end <= section["raw"]:
        end = expected_end
    elif sec_length and sec_length < 0x1000000:
        end = min(end, start + sec_length)
    else:
        later = sorted(item["value"] for item in symbols
                       if item["section"] == symbol["section"] and item["class"] in (2, 3)
                       and item["value"] > start)
        if later:
            end = min(end, later[0])
        elif target_hint and start + len(target_hint) <= section["raw"]:
            end = min(end, start + len(target_hint))
    size = max(1, end - start)
    begin = section["ptr"] + start
    payload = bytearray(data[begin:begin + size])
    mask = set()
    calls = []
    for relocation in section["relocations"]:
        position = relocation["position"] - start
        if 0 <= position < size and relocation["type"] in (6, 20, 22, 4):
            mask.update(range(position, min(position + 4, size)))
            if relocation["type"] == 20:
                calls.append((position, relocation["target"]))
    if with_calls:
        return bytes(payload), mask, symbol["name"], calls
    return bytes(payload), mask, symbol["name"]


def normalize(payload, positions):
    output = bytearray(payload)
    for position in positions:
        output[position] = 0xAA
    return bytes(output)


def pe_relocations(va, size, payload):
    disassembler = Cs(CS_ARCH_X86, CS_MODE_32)
    disassembler.detail = True
    mask = set()
    text_va = IMAGE_BASE + SECTIONS[".text"]["va"]
    text_end = text_va + SECTIONS[".text"]["vs"]
    for instruction in disassembler.disasm(payload, 0):
        for operand in instruction.operands:
            if operand.type != X86_OP_IMM:
                continue
            immediate = operand.imm & 0xFFFFFFFF
            if instruction.mnemonic in ("call", "jmp") or instruction.mnemonic.startswith("j"):
                displacement = immediate - 0x100000000 if immediate >= 0x80000000 else immediate
                target = va + displacement
                if not (0 <= displacement < size) and text_va <= target < text_end:
                    mask.update(range(instruction.address + instruction.size - 4,
                                      instruction.address + instruction.size))
            elif operand.type == X86_OP_MEM:
                pass
    return mask


def absolute_masks(payload, existing):
    disassembler = Cs(CS_ARCH_X86, CS_MODE_32)
    disassembler.detail = True
    mask = set(existing)
    for instruction in disassembler.disasm(payload, 0):
        for operand in instruction.operands:
            if operand.type == X86_OP_MEM:
                displacement = operand.mem.disp & 0xFFFFFFFF
                if IMAGE_BASE <= displacement < IMAGE_END:
                    pos = bytes(instruction.bytes).find(struct.pack('<I', displacement))
                    if pos != -1:
                        mask.update(range(instruction.address + pos, instruction.address + pos + 4))
                    else:
                        mask.update(range(instruction.address + instruction.size - 4,
                                          instruction.address + instruction.size))
            elif operand.type == X86_OP_IMM and instruction.mnemonic not in ("call", "jmp"):
                immediate = operand.imm & 0xFFFFFFFF
                if IMAGE_BASE <= immediate < IMAGE_END:
                    pos = bytes(instruction.bytes).rfind(struct.pack('<I', immediate))
                    if pos != -1:
                        mask.update(range(instruction.address + pos, instruction.address + pos + 4))
                    else:
                        mask.update(range(instruction.address + instruction.size - 4,
                                          instruction.address + instruction.size))
    return mask


def diff(address, object_path, wanted=None):
    target, metadata = carve(address)
    va = int(address.lower(), 16)
    with open(object_path, "rb") as stream:
        data = stream.read()
    candidate, candidate_mask, candidate_name = object_function(data, wanted)
    pe_mask = absolute_masks(target, pe_relocations(va, len(target), target))
    left = normalize(target, pe_mask)
    right = normalize(candidate, candidate_mask)
    compared = max(len(left), len(right))
    equal = sum(a == b for a, b in zip(left, right)) + abs(len(left) - len(right)) * 0
    score = equal * 100 // compared if compared else 100
    print("%s @ %s size=%d vs %s size=%d" %
          (metadata["name"], address, len(target), candidate_name, len(candidate)))
    print("normalized match: %d/%d bytes (%d%%)" % (equal, compared, score))
    if score < 100:
        for index, (a, b) in enumerate(zip(left, right)):
            if a != b:
                print("first difference at +%d" % index)
                break
    else:
        print("MATCH (normalized)")
    return score == 100


def main():
    if len(sys.argv) < 4 or sys.argv[1] != "diff":
        print(__doc__)
        return 2
    wanted = None
    if "--symbol" in sys.argv:
        wanted = sys.argv[sys.argv.index("--symbol") + 1]
    return 0 if diff(sys.argv[2], sys.argv[3], wanted) else 1


if __name__ == "__main__":
    raise SystemExit(main())
