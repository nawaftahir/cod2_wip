#!/usr/bin/env python3
"""Strict single-function-section shape check; unresolved bindings never certify V2."""
import argparse
import json
import struct
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import load_matcher


def branch_fields(code, address):
    fields = {}
    decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(code, address))
    if sum(ins.size for ins in decoded) != len(code):
        raise ValueError('incomplete instruction decode')
    for ins in decoded:
        offset = ins.address - address
        if ins.size == 5 and ins.bytes[0] in (0xe8, 0xe9):
            target = ins.address + 5 + struct.unpack('<i', ins.bytes[1:])[0]
            if not address <= target < address + len(code):
                fields[offset + 1] = target
    return fields


def self_check():
    assert branch_fields(b'\xb8\xe8\x00\x01\x00\x00\xc3', 0x1000) == {}
    assert branch_fields(bytes.fromhex('81 e9 e0 00 00 00 89 74 24 14 c3'), 0x1000) == {}
    assert branch_fields(b'\xe9\x00\x01\x00\x00', 0x1000) == {1: 0x1105}
    assert binding_target(0x1000, 4, 6) == 0x1004
    assert binding_target(0x1000, 0xffffffff, 20) == 0xfff
    raw = bytearray(60)
    struct.pack_into('<I', raw, 8, 20)
    struct.pack_into('<H', raw, 34, 0x20)
    assert is_function(raw, {'idx': 0})
    assert not is_function(raw, {'idx': 1})
    print('PASS: instruction-aware masking fixtures')


def binding_target(symbol_address, addend, kind):
    if kind not in (6, 20):
        raise ValueError('unsupported binding relocation type')
    return (symbol_address + addend) & 0xffffffff


def is_function(raw, symbol):
    # COFF Type=0x20 marks MSVC function definitions; labels have Type=0.
    table = struct.unpack_from('<I', raw, 8)[0]
    kind = struct.unpack_from('<H', raw, table + symbol['idx'] * 18 + 14)[0]
    return kind & 0x30 == 0x20


def check(address, objpath, symbol, matcher=None, bindings=None):
    m = matcher if matcher is not None else load_matcher()
    target, meta = m['carve'](address)
    if len(target) != meta['size']:
        raise ValueError('target range is not fully backed by file bytes')
    raw = objpath.read_bytes()
    coff = m['parse_coff'](raw)
    sym = next(s for s in coff['symbols'] if s['name'] == symbol and s['sec'] > 0)
    section = coff['sections'][sym['sec'] - 1]
    others = [s for s in coff['symbols'] if s['sec'] == sym['sec'] and
              s['sclass'] in (2, 3) and is_function(raw, s)]
    if not is_function(raw, sym):
        raise ValueError('selected symbol is not a COFF function definition')
    if sym['value'] != 0 or len(others) != 1 or not section['flags'] & 0x20:
        raise ValueError('requires a single-function code section; boundary review needed')
    candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
    if len(candidate) != len(target):
        raise ValueError(f'length mismatch: target={len(target)}, object={len(candidate)}')
    branches = branch_fields(target, address)
    branch_fields(candidate, address)  # Refuse incomplete object decode too.
    start = m['rva2off'](address - 0x10000000)
    absolute = {p - start for p in m['PE_RELOCS'] if start <= p < start + len(target)}
    pe_fields = {p: 6 for p in absolute} | {p: 20 for p in branches}
    obj_fields = {r['vaddr']: r['type'] for r in section['relocs']}
    if len(obj_fields) != len(section['relocs']) or pe_fields != obj_fields:
        raise ValueError(f'relocation-site/type mismatch: PE={pe_fields}, COFF={obj_fields}')
    a, b = bytearray(target), bytearray(candidate)
    names = {s['idx']: s['name'] for s in coff['symbols']}
    for reloc in section['relocs']:
        p = reloc['vaddr']
        if not 0 <= p <= len(target) - 4:
            raise ValueError('out-of-range relocation')
        retail = branches[p] if p in branches else struct.unpack('<I', target[p:p+4])[0]
        addend = struct.unpack('<I', candidate[p:p+4])[0]
        name = names.get(reloc['sym'], 'UNKNOWN')
        if bindings is not None and name in bindings:
            expected = binding_target(bindings[name], addend, reloc['type'])
            if expected != retail:
                raise ValueError(f'wrong binding for {name}: expected=0x{expected:08x}, '
                                 f'target=0x{retail:08x}')
            print(f'BOUND +{p}: {name} -> 0x{retail:08x}')
        else:
            print(f'UNRESOLVED binding +{p}: target=0x{retail:08x}, '
                  f'COFF={name} addend=0x{addend:08x}')
        a[p:p+4] = b'\0' * 4
        b[p:p+4] = b'\0' * 4
    if a != b:
        first = next(i for i in range(len(a)) if a[i] != b[i])
        raise ValueError(f'byte mismatch +{first}: PE={a[first]:02x}, COFF={b[first]:02x}')
    print(f'SHAPE MATCH: {meta["name"]}, {len(target)} bytes; '
          'NOT V2: source semantics, inventory boundaries and bindings require review')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('address', nargs='?', type=lambda value: int(value, 0))
    parser.add_argument('object', nargs='?', type=Path)
    parser.add_argument('symbol', nargs='?')
    parser.add_argument('--bindings', type=Path, help='reviewed symbol-to-target-VA JSON map')
    args = parser.parse_args()
    self_check()
    if args.address is not None:
        if args.object is None or args.symbol is None:
            parser.error('address, object and symbol must be provided together')
        try:
            bindings = None
            if args.bindings:
                bindings = {name: int(value, 0) if isinstance(value, str) else value
                            for name, value in json.loads(args.bindings.read_text()).items()}
            check(args.address, args.object, args.symbol, bindings=bindings)
        except (ValueError, KeyError, StopIteration) as error:
            raise SystemExit('DEFER: ' + str(error))
