#!/usr/bin/env python3
"""Verify _output's complete code + compiler-generated switch table, not a prefix."""
import hashlib
import json
from pathlib import Path
import struct
from contextlib import redirect_stdout
import io

from audit_legacy import load_matcher
from check_shape import branch_fields, is_function, check

HERE = Path(__file__).resolve().parent


def verify_callees(m):
    """Recheck source-defined callees from hashed fresh objects, not name guesses."""
    proofs = {}
    requests = [
        ('baseline_p9txpec2', 0x100fa439, '_write_char'),
        ('baseline_p9txpec2', 0x100fa46c, '_write_multi_char'),
        ('baseline_p9txpec2', 0x100fa490, '_write_string'),
        ('baseline_p9txpec2', 0x100fc464, '_malloc'),
        ('authcrt_f0z031l7', 0x100fa200, '_strlen'),
        ('authcrt_f0z031l7', 0x10100d4d, '@__security_check_cookie@4'),
        ('authcrt_wi5hy4yr', 0x10106bc0, '__aulldvrm'),
        ('authcrt_k7o2adah', 0x10106b8d, '_wctomb'),
        ('authcrt_k7o2adah', 0x100f84d0, '_free')]
    for folder, address, symbol in requests:
        run = HERE / folder
        rows = json.loads((run / 'results.json').read_text())
        if folder.startswith('baseline'):
            row = next(r for r in rows if r['address'] == address)
            obj = run / (row['job'] + '.obj')
            source = HERE.parents[1] / 'glm' / row['source']
        else:
            row = next(r for r in rows if any(x['symbol'] == symbol for x in r.get('matches', []))
                       or (symbol == '_free' and r['source'] == 'free.c'))
            obj = run / row['object']
            source = HERE.parents[1] / 'glm/crt71' / row['source']
        for path, digest in [(obj, row['object_sha256']), (source, row['source_sha256'])]:
            if hashlib.sha256(path.read_bytes()).hexdigest() != digest:
                raise ValueError('callee evidence changed: ' + str(path))
        original = m['INV'][f'{address:x}']
        if symbol == '_free':
            if m['INV'][f'{address:x}']['size'] != 104 or '100f8541' not in m['INV']:
                raise ValueError('audited free boundary changed')
            m['INV'][f'{address:x}'] = dict(original, size=113)
        log = io.StringIO()
        try:
            with redirect_stdout(log):
                check(address, obj, symbol, matcher=m)
        finally:
            m['INV'][f'{address:x}'] = original
        proofs[symbol] = dict(address=hex(address), source=str(source.relative_to(HERE.parents[1])),
                              source_sha256=row['source_sha256'], object_sha256=row['object_sha256'],
                              flags=row['flags'], run=folder, diagnostics=log.getvalue(),
                              callee_external_bindings_reviewed=False)
    return proofs


def verify_globals(m):
    run = HERE / 'authcrt_7df5umf_'
    rows = json.loads((run / 'results.json').read_text())
    proofs = {}
    def load(source, name):
        row = next(r for r in rows if r['source'] == source)
        path = HERE.parents[1] / 'glm/crt71' / source
        raw = (run / row['object']).read_bytes()
        if (hashlib.sha256(raw).hexdigest() != row['object_sha256'] or
                hashlib.sha256(path.read_bytes()).hexdigest() != row['source_sha256']):
            raise ValueError('CRT data proof input changed')
        coff = m['parse_coff'](raw)
        symbols = {s['idx']: s for s in coff['symbols']}
        symbol = next(s for s in symbols.values() if s['name'] == name)
        section = coff['sections'][symbol['sec'] - 1]
        proofs[name] = dict(source=source, source_sha256=row['source_sha256'],
                            object_sha256=row['object_sha256'], flags=row['flags'])
        return raw[section['rawptr']:section['rawptr'] + section['rawsize']], section, symbols
    def retail(address, size):
        offset = m['rva2off'](address - 0x10000000)
        return m['_d'][offset:offset + size]
    cookie, section, _ = load('seccook.c', '___security_cookie')
    if len(cookie) != 4 or section['relocs'] or cookie != retail(0x101a50d0, 4):
        raise ValueError('security cookie initializer differs')
    data, section, symbols = load('ctype.c', '__pctype')
    relocation = next(r for r in section['relocs'] if r['vaddr'] == 0)
    if relocation['type'] != 6 or symbols[relocation['sym']]['name'] != '___newctype':
        raise ValueError('ctype initializer relocation differs')
    addend = struct.unpack_from('<I', data)[0]
    pointer = struct.unpack('<I', retail(0x101a5090, 4))[0]
    table, section, _ = load('ctype.c', '___newctype')
    if addend != 256 or len(table) != 1284 or section['relocs'] or table != retail(pointer - addend, len(table)):
        raise ValueError('complete classification tables differ')
    table, section, symbols = load('cmiscdat.c', '__cfltcvt_tab')
    if (len(table) != 24 or table != bytes(24) or
            [r['vaddr'] for r in section['relocs']] != list(range(0, 24, 4)) or
            any(r['type'] != 6 or symbols[r['sym']]['name'] != '__fptrap' for r in section['relocs']) or
            retail(0x101a4fb0, 24) != struct.pack('<6I', *([0x1010851b] * 6))):
        raise ValueError('floating conversion table initializer differs')
    # The default trap is source-matched; runtime conversion-table mutation is separate.
    trap_run = HERE / 'baseline_pn934zlj'
    row = next(r for r in json.loads((trap_run / 'results.json').read_text()) if r['address'] == 0x1010851b)
    obj = trap_run / (row['job'] + '.obj')
    if (hashlib.sha256(obj.read_bytes()).hexdigest() != row['object_sha256'] or
            hashlib.sha256((HERE.parents[1] / 'glm' / row['source']).read_bytes()).hexdigest() != row['source_sha256']):
        raise ValueError('trap proof changed')
    with redirect_stdout(io.StringIO()):
        check(row['address'], obj, '__fptrap', matcher=m)
    proofs['__cfltcvt_tab']['trap_source_match'] = row
    return {'___security_cookie': 0x101a50d0, '__pctype': 0x101a5090,
            '__cfltcvt_tab': 0x101a4fb0}, proofs


def verify_tail(target, candidate, relocs, symbols, section_number, address, code_size):
    if len(target) != len(candidate) or len(candidate) <= code_size:
        raise ValueError('complete code/table block lengths must agree')
    fields = {r['vaddr']: r for r in relocs if r['vaddr'] >= code_size}
    if set(fields) != set(range(code_size, len(candidate), 4)):
        raise ValueError('tail must consist entirely of explicit DWORD relocation entries')
    for offset, reloc in fields.items():
        symbol = symbols[reloc['sym']]
        if reloc['type'] != 6 or symbol['sec'] != section_number or not 0 <= symbol['value'] < code_size:
            raise ValueError('table entry is not a same-function code-label pointer')
        addend = struct.unpack_from('<I', candidate, offset)[0]
        expected = (address + symbol['value'] + addend) & 0xffffffff
        if struct.unpack_from('<I', target, offset)[0] != expected:
            raise ValueError('wrong switch-table destination at ' + str(offset))
    return len(fields)


def self_check():
    reloc = [{'vaddr': 4, 'sym': 0, 'type': 6}]
    symbols = {0: {'sec': 1, 'value': 2}}
    candidate = b'\x90\x90\x90\xc3' + b'\0' * 4
    good = b'\x90\x90\x90\xc3' + struct.pack('<I', 0x1002)
    assert verify_tail(good, candidate, reloc, symbols, 1, 0x1000, 4) == 1
    wrong = good[:4] + struct.pack('<I', 0x1003)
    try:
        verify_tail(wrong, candidate, reloc, symbols, 1, 0x1000, 4)
    except ValueError:
        pass
    else:
        raise AssertionError('wrong table destination accepted')
    print('PASS: table-entry positive and negative fixtures')


def main():
    self_check()
    m = load_matcher()
    callees = verify_callees(m)
    globals_bound, global_proofs = verify_globals(m)
    run = HERE / 'baseline_p9txpec2'
    row = next(r for r in json.loads((run / 'results.json').read_text()) if r['address'] == 0x100fa4e6)
    raw = (run / (row['job'] + '.obj')).read_bytes()
    if hashlib.sha256(raw).hexdigest() != row['object_sha256']:
        raise ValueError('recorded object hash changed')
    if hashlib.sha256((HERE.parents[1] / 'glm' / row['source']).read_bytes()).hexdigest() != row['source_sha256']:
        raise ValueError('recorded source hash changed')
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    function = next(s for s in symbols.values() if s['name'] == '__output')
    section = coff['sections'][function['sec'] - 1]
    if function['value'] != 0 or sum(s['sec'] == function['sec'] and is_function(raw, s)
                                    for s in symbols.values()) != 1:
        raise ValueError('ambiguous function extent')
    candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
    address = row['address']
    code_size = m['carve'](address)[1]['size']
    if code_size != 2010 or len(candidate) != 2042:
        raise ValueError('audited block extents changed')
    offset = m['rva2off'](address - 0x10000000)
    target = m['_d'][offset:offset + len(candidate)]
    # Next inventoried function starts exactly after the complete block.
    if f'{address + len(candidate):x}' not in m['INV']:
        raise ValueError('adjacent function boundary no longer agrees')
    entries = verify_tail(target, candidate, section['relocs'], symbols,
                          function['sec'], address, code_size)
    branches = branch_fields(target[:code_size], address)
    fields = {p - offset: 6 for p in m['PE_RELOCS'] if offset <= p < offset + len(target)}
    fields.update({p: 20 for p in branches})
    if len(fields) != len(section['relocs']) or fields != {r['vaddr']: r['type'] for r in section['relocs']}:
        raise ValueError('full-block relocation sites/types differ')
    a, b = bytearray(target), bytearray(candidate)
    bindings = []
    # Full immutable table and both null-string initializers, not masked operands.
    lookup = next(s for s in symbols.values() if s['name'] == '___lookuptable')
    lookup_section = coff['sections'][lookup['sec'] - 1]
    lookup_bytes = raw[lookup_section['rawptr']:lookup_section['rawptr'] + lookup_section['rawsize']]
    lookup_offset = m['rva2off'](0x1017c708 - 0x10000000)
    if len(lookup_bytes) != 89 or lookup_bytes != m['_d'][lookup_offset:lookup_offset + 89]:
        raise ValueError('complete CRT lookup table differs')
    null_symbols = {}
    for name, slot, destination, literal in [
            ('___nullstring', 0x101a4890, 0x10196d94, b'(null)\0'),
            ('___wnullstring', 0x101a4894, 0x1017c764, '(null)\0'.encode('utf-16le'))]:
        symbol = next(s for s in symbols.values() if s['name'] == name)
        data_section = coff['sections'][symbol['sec'] - 1]
        relocation = next(r for r in data_section['relocs'] if r['vaddr'] == symbol['value'])
        pooled = symbols[relocation['sym']]
        pooled_section = coff['sections'][pooled['sec'] - 1]
        pos = pooled_section['rawptr'] + pooled['value']
        addend = struct.unpack_from('<I', raw, data_section['rawptr'] + symbol['value'])[0]
        slot_offset = m['rva2off'](slot - 0x10000000)
        literal_offset = m['rva2off'](destination - 0x10000000)
        if (relocation['type'] != 6 or addend != 0 or
                raw[pos:pos + len(literal)] != literal or
                struct.unpack_from('<I', m['_d'], slot_offset)[0] != destination or
                m['_d'][literal_offset:literal_offset + len(literal)] != literal):
            raise ValueError('CRT null-string initializer differs: ' + name)
        null_symbols[name] = slot
    for reloc in section['relocs']:
        p = reloc['vaddr']
        symbol = symbols[reloc['sym']]
        retail = branches[p] if p in branches else struct.unpack_from('<I', target, p)[0]
        addend = struct.unpack_from('<I', candidate, p)[0]
        local = symbol['sec'] == function['sec']
        if local and retail != (address + symbol['value'] + addend) & 0xffffffff:
            raise ValueError('same-section binding differs: ' + symbol['name'])
        data_base = (0x1017c708 if symbol['name'] == '___lookuptable'
                     else null_symbols.get(symbol['name'], globals_bound.get(symbol['name'])))
        if data_base is not None and retail != (data_base + addend) & 0xffffffff:
            raise ValueError('CRT data binding differs: ' + symbol['name'])
        status = 'LOCAL-BOUND' if local else ('DATA-BOUND' if data_base is not None else 'EXTERNAL-UNRESOLVED')
        if not local and symbol['name'] in callees:
            callee = callees[symbol['name']]
            if retail != (int(callee['address'], 16) + addend) & 0xffffffff:
                raise ValueError('callee source-shape binding differs: ' + symbol['name'])
            status = 'CALLEE-SHAPE-SUPPORTED'
        bindings.append(dict(offset=p, symbol=symbol['name'], target=hex(retail),
                             addend=hex(addend), status=status))
        a[p:p+4] = b'\0' * 4
        b[p:p+4] = b'\0' * 4
    if a != b:
        raise ValueError('full-block instruction/data bytes differ')
    packet = dict(status='FULL-BLOCK-SHAPE-MATCH', code_bytes=code_size,
                  switch_table_bytes=len(target) - code_size, switch_entries=entries,
                  source=row['source'], source_sha256=row['source_sha256'],
                  object_sha256=row['object_sha256'], flags=row['flags'], bindings=bindings,
                  callee_proofs=callees,
                  global_proofs=global_proofs,
                  normalized_only=True, independent_review=False)
    output = HERE / 'crt_output_block.json'
    output.write_text(json.dumps(packet, indent=2) + '\n')
    print(f'MATCH: complete {len(target)}-byte block = {code_size} code + '
          f'{entries * 4} switch data; all table destinations bound; '
          f'{sum(r["status"] == "EXTERNAL-UNRESOLVED" for r in bindings)} external sites unresolved; '
          f'{sum(r["status"] == "CALLEE-SHAPE-SUPPORTED" for r in bindings)} callee sites source-shape supported')
    print('Not V4; source/reference and binding review remain:', output)


if __name__ == '__main__':
    main()
