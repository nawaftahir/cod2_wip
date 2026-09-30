#!/usr/bin/env python3
"""Certify complete original CRT source sections; reject unresolved dependencies."""
import hashlib
import json
from pathlib import Path
import struct
import sys
import subprocess

import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher
from check_shape import branch_fields, is_function

ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
ANCHOR_SHA = '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
ALIASES = {'__alloca_probe': '__chkstk', '@__security_check_cookie@4': '__security_check_cookie'}


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def internal_entry(name, address, labels, branch_labels):
    return address in labels or (name.startswith('FUN_') and address in branch_labels)


def main():
    assert internal_entry('FUN_1002', 0x1002, set(), {0x1002})
    assert not internal_entry('FUN_1003', 0x1003, set(), {0x1002})
    assert not internal_entry('another_function', 0x1002, set(), {0x1002})
    assert internal_entry('filter', 0x1002, {0x1002}, set())
    assert sha(ANCHOR) == ANCHOR_SHA
    m = load_matcher()
    pe = pefile.PE(str(ANCHOR))
    dis = Cs(CS_ARCH_X86, CS_MODE_32)
    inv = {int(r['addr'], 16): r['name'] for r in
           json.loads((ROOT / 'glm/data/functions_gfx10.json').read_text())['functions']}
    imports = {i.name.decode(): i.address for d in pe.DIRECTORY_ENTRY_IMPORT
               for i in d.imports if i.name}
    inventory_path = ROOT / 'glm/data/functions_gfx10.json'
    asm_checker = HERE.parent / 'codex_crt14asm/check.py'
    subprocess.run([sys.executable, str(asm_checker)], check=True, capture_output=True)
    asm_packet = json.loads((asm_checker.parent / 'packet.json').read_text())
    assert asm_packet['anchor_sha256'] == ANCHOR_SHA and asm_packet['image'] == IMAGE
    assert asm_packet['checker_sha256'] == sha(asm_checker)
    proven_asm = {r['symbol']: int(r['address'], 16) for r in asm_packet['rows']}
    objects, definitions = {}, {}
    for directory in (HERE / 'obj', HERE.parent / 'codex17_crt/obj', HERE.parent / 'codex16_crt/obj', HERE.parent / 'codex_crt13/obj',
                      HERE.parent / 'codex_crt14extra/obj'):
        for obj in directory.rglob('*.obj'):
            raw = obj.read_bytes()
            coff = m['parse_coff'](raw)
            names = {s['idx']: s for s in coff['symbols']}
            objects[obj] = (raw, coff, names)
            for s in names.values():
                if s['sec'] > 0 or s['sec'] == 0 and s['value'] > 0:
                    definitions.setdefault(s['name'], []).append((obj, s))

    def at(address, length, zero_fill=False):
        rva = address - 0x10000000
        sec = next(s for s in pe.sections if s.VirtualAddress <= rva
                   and rva + length <= s.VirtualAddress + s.Misc_VirtualSize)
        off = rva - sec.VirtualAddress
        if zero_fill:
            assert sec.Name.rstrip(b'\0') == b'.data' and off >= sec.SizeOfRawData
            return b'\0' * length
        data = pe.get_data(rva, length)
        assert len(data) == length
        return data

    # Plan rows are hints only. Every byte/site/type is rechecked below.
    plan = json.loads((HERE / 'plan.json').read_text())
    rows, rejected, used = [], [], set()
    candidates = {}
    for row in plan:
        key = (row['symbol'], int(row['address'], 16))
        candidates.setdefault(key, []).append(row)
    data_proven = {}
    visiting = set()
    shapes = {}

    def shape(row):
        key = (row['object'], row['symbol'], row['address'])
        if key in shapes:
            return shapes[key]
        obj = ROOT / row['object']
        raw, coff, names = objects[obj]
        fn = next(s for s in names.values() if s['name'] == row['symbol'] and s['sec'] > 0)
        sec = coff['sections'][fn['sec'] - 1]
        assert is_function(raw, fn) and fn['value'] == 0 and sec['flags'] & 0x20
        assert sum(is_function(raw, s) for s in names.values() if s['sec'] == fn['sec']) == 1
        size, address = sec['rawsize'], int(row['address'], 16)
        assert size == row['bytes']
        source = raw[sec['rawptr']:sec['rawptr'] + size]
        retail = at(address, size)
        decoded = list(dis.disasm(retail, address))
        assert decoded and decoded[-1].mnemonic in ('ret', 'jmp')
        branches = branch_fields(retail, address)
        branch_fields(source, address)
        start = m['rva2off'](address - 0x10000000)
        fields = {p - start: 6 for p in m['PE_RELOCS'] if start <= p < start + size}
        fields.update({p: 20 for p in branches})
        assert fields == {r['vaddr']: r['type'] for r in sec['relocs']}
        a, b = bytearray(retail), bytearray(source)
        bindings = {}
        for r in sec['relocs']:
            p, name = r['vaddr'], names[r['sym']]['name']
            target = branches[p] if p in branches else struct.unpack_from('<I', retail, p)[0]
            value = (target - struct.unpack_from('<I', source, p)[0]) & 0xffffffff
            assert bindings.setdefault(name, value) == value
            assert (value + struct.unpack_from('<I', source, p)[0]) & 0xffffffff == target
            assert (value + 1 + struct.unpack_from('<I', source, p)[0]) & 0xffffffff != target
            a[p:p + 4] = b[p:p + 4] = b'\0' * 4
        assert a == b
        def check_bindings(values):
            for r in sec['relocs']:
                p = r['vaddr']
                name = names[r['sym']]['name']
                target = branches[p] if p in branches else struct.unpack_from('<I', retail, p)[0]
                assert (values[name] + struct.unpack_from('<I', source, p)[0]) & 0xffffffff == target
        check_bindings(bindings)
        for name in bindings:
            try:
                check_bindings(bindings | {name: bindings[name] + 1})
            except AssertionError:
                pass
            else:
                raise AssertionError('wrong binding accepted: ' + name)
        wrong = bytearray(a)
        wrong[0] ^= 1
        assert wrong != b
        # Inventory may contain SEH funclets, but no other source function may
        # start inside a complete single-function section.
        labels = {address + s['value'] for s in names.values() if s['sec'] == fn['sec']}
        branch_labels = {int(i.op_str, 16) for i in decoded
                         if i.mnemonic.startswith('j') and i.op_str.startswith('0x')}
        for addr in inv:
            if address < addr < address + size:
                assert internal_entry(inv[addr], addr, labels, branch_labels), (
                    'interior entry not a source label or confirmed internal branch', hex(addr))
        result = (obj, fn, source, bindings)
        shapes[key] = result
        return result

    def data(name, address, origin, depth=0):
        assert depth < 24
        key = (name, address)
        if key in data_proven:
            return
        assert key not in visiting, ('data cycle', name)
        visiting.add(key)
        options = sorted(definitions.get(name, []), key=lambda x: x[0] != origin)
        errors = []
        for obj, symbol in options:
            raw, coff, names = objects[obj]
            try:
                if symbol['sec'] == 0:
                    length = symbol['value']
                    assert 0 < length <= 8192
                    assert at(address, length, True) == b'\0' * length
                else:
                    sec = coff['sections'][symbol['sec'] - 1]
                    assert not sec['flags'] & 0x20
                    offset = symbol['value']
                    following = [s['value'] for s in names.values()
                                 if s['sec'] == symbol['sec'] and s['value'] > offset]
                    length = min(following, default=sec['rawsize']) - offset
                    assert 0 < length <= 16384
                    if sec['name'].startswith('.bss'):
                        assert not sec['relocs']
                        assert at(address, length, True) == b'\0' * length
                    else:
                        source = bytearray(raw[sec['rawptr'] + offset:sec['rawptr'] + offset + length])
                        retail = bytearray(at(address, length))
                        assert len(source) == length
                        start = m['rva2off'](address - 0x10000000)
                        fields = {p - start for p in m['PE_RELOCS'] if start <= p < start + length}
                        assert fields == {r['vaddr'] - offset for r in sec['relocs']
                                          if offset <= r['vaddr'] < offset + length}
                        for r in sec['relocs']:
                            if not offset <= r['vaddr'] < offset + length:
                                continue
                            p = r['vaddr'] - offset
                            assert r['type'] == 6 and p + 4 <= length
                            child = names[r['sym']]
                            addend = struct.unpack_from('<I', source, p)[0]
                            target = struct.unpack_from('<I', retail, p)[0]
                            value = (target - addend) & 0xffffffff
                            if is_function(raw, child) or (child['sec'] > 0 and coff['sections'][child['sec'] - 1]['flags'] & 0x20):
                                assert is_function(raw, child) or child['name'].startswith('$L')
                                if child['name'].startswith('$L'):
                                    parent_fn = next(s for s in names.values() if s['sec'] == child['sec'] and is_function(raw, s))
                                    matching = [r for r in plan if r['object'] == str(obj.relative_to(ROOT))
                                                and r['symbol'] == parent_fn['name']]
                                    assert len(matching) == 1
                                    parent_address = int(matching[0]['address'], 16)
                                    shape(matching[0])
                                    assert value == parent_address + child['value']
                                else:
                                    code(child['name'], value, obj, depth + 1)
                            elif child['name'].startswith('__imp__'):
                                api = child['name'][len('__imp__'):].lstrip('_').split('@')[0]
                                assert imports[api] == value
                            else:
                                data(child['name'], value, obj, depth + 1)
                            assert (value + 1 + addend) & 0xffffffff != target
                            source[p:p + 4] = retail[p:p + 4] = b'\0' * 4
                        assert source == retail
                data_proven[key] = {'object': str(obj.relative_to(ROOT)), 'bytes': length,
                                    'section': symbol['sec'], 'symbol_offset': symbol['value']}
                used.add(obj)
                visiting.remove(key)
                return
            except (AssertionError, StopIteration, KeyError) as error:
                errors.append(str(error))
        visiting.remove(key)
        raise AssertionError(('unproven data', name, hex(address), errors[:2]))

    code_done, code_visiting = set(), set()
    code_proven = {}

    def code(name, address, origin, depth=0):
        assert depth < 40
        expected = ALIASES.get(name, name)
        # Named target entries are an independent identity source.
        if inv.get(address) in (expected, expected.lstrip('_')):
            return
        if proven_asm.get(name) == address:
            return
        key = (name, address)
        if key in code_done:
            return
        assert key not in code_visiting, ('uncertified call cycle', name)
        options = list(candidates.get(key, []))
        # A typed callback in an original initializer can identify an entry
        # missing from GLM. It still needs the entire source body and bindings.
        if not options:
            for obj, fn in definitions.get(name, []):
                raw, coff, _ = objects[obj]
                if fn['sec'] > 0 and fn['value'] == 0 and is_function(raw, fn):
                    sec = coff['sections'][fn['sec'] - 1]
                    if sec['flags'] & 0x20:
                        options.append({'symbol': name, 'address': hex(address),
                                        'bytes': sec['rawsize'],
                                        'object': str(obj.relative_to(ROOT))})
        assert options, ('unproven code identity', name, hex(address), inv.get(address))
        code_visiting.add(key)
        errors = []
        for row in sorted(options, key=lambda r: ROOT / r['object'] != origin):
            try:
                bindings = certify(row, depth + 1)
                code_proven[key] = {k: row[k] for k in ('object', 'bytes')} | {
                    'bindings': {n: hex(v) for n, v in bindings.items()}}
                code_done.add(key)
                code_visiting.remove(key)
                return
            except (AssertionError, StopIteration, KeyError) as error:
                errors.append(str(error))
        code_visiting.remove(key)
        raise AssertionError(('unproven code body', name, hex(address), errors[:2]))

    def certify(row, depth=0):
        obj, fn, source, bindings = shape(row)
        for name, address in bindings.items():
            if name.startswith('__imp__'):
                api = name[len('__imp__'):].lstrip('_').split('@')[0]
                assert imports[api] == address
            elif name.startswith('$T'):
                data(name, address, obj, depth + 1)
            elif any(r['vaddr'] >= 0 and objects[obj][2][r['sym']]['name'] == name and r['type'] == 20
                     for r in objects[obj][1]['sections'][fn['sec'] - 1]['relocs']):
                code(name, address, obj, depth + 1)
            elif any(s['name'] == name and is_function(objects[obj][0], s)
                     for s in objects[obj][2].values()):
                code(name, address, obj, depth + 1)
            else:
                data(name, address, obj, depth + 1)
        used.add(obj)
        return bindings

    seen = set()
    for row in plan:
        if row['address'] in seen:
            continue
        try:
            bindings = certify(row)
        except (AssertionError, StopIteration, KeyError) as error:
            rejected.append(row | {'reason': str(error)})
            continue
        seen.add(row['address'])
        rows.append({k: row[k] for k in ('address', 'bytes', 'symbol', 'object')} |
                    {'bindings': {n: hex(v) for n, v in bindings.items()}})
    ordered = sorted((int(r['address'], 16), r['bytes']) for r in rows)
    assert all(a + n <= b for (a, n), (b, _) in zip(ordered, ordered[1:])), 'candidate overlap'
    section_bases = {}
    for (_, address), proof in data_proven.items():
        if proof['section'] > 0:
            key = (proof['object'], proof['section'])
            base = address - proof['symbol_offset']
            assert section_bases.setdefault(key, base) == base, ('incoherent data layout', key)
    dependencies = {str(p.relative_to(ROOT / 'glm/crt71')): sha(p)
                    for p in (ROOT / 'glm/crt71').rglob('*.h')}
    for obj in used:
        source = ROOT / 'glm/crt71' / (obj.stem + '.c')
        assert source.exists() and source.stat().st_mtime <= obj.stat().st_mtime
        dependencies[source.name] = sha(source)
    packet = {'status': 'REVIEWABLE', 'whole_file_identity': False,
              'source_class': 'authentic VC7.1 CRT C; not newly authored renderer source',
              'anchor_sha256': ANCHOR_SHA, 'image': IMAGE,
              'checker_sha256': sha(Path(__file__)), 'plan_sha256': sha(HERE / 'plan.json'),
              'build_script_sha256': sha(HERE / 'build.sh'),
              'compile_script_sha256': sha(HERE / 'compile.sh'),
              'inventory_sha256': sha(inventory_path), 'dependencies': dependencies,
              'asm_packet_sha256': sha(asm_checker.parent / 'packet.json'),
              'objects': {str(p.relative_to(ROOT)): sha(p) for p in sorted(used)},
              'rows': rows, 'data_proofs': [{'symbol': n, 'address': hex(a), **d}
                                           for (n, a), d in sorted(data_proven.items())],
              'code_dependency_proofs': [{'symbol': n, 'address': hex(a), **d}
                                         for (n, a), d in sorted(code_proven.items())],
              'negative_tests_passed': True,
              'verified_instruction_bytes': sum(r['bytes'] for r in rows)}
    (HERE / 'packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    (HERE / 'rejected.json').write_text(json.dumps(rejected, indent=2) + '\n')
    print('PASS:', len(rows), 'complete CRT source bodies,', packet['verified_instruction_bytes'],
          'bytes before aggregate deduplication;', len(rejected), 'rejected object variants')


if __name__ == '__main__':
    main()
