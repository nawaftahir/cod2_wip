#!/usr/bin/env python3
"""Complete marker dispatch/table parser proofs; no table bytes as code credit."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

from capstone import Cs, CS_ARCH_X86, CS_MODE_32, CS_GRP_JUMP, CS_OP_IMM
from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import branch_fields, check, is_function
from check_jpeg_dependencies import raw_target, require_binding


def main():
    run = HERE / 'baseline_jpeg_56yqdjvj'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    raw = obj.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == row['object_sha256']
    m = load_matcher()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    definitions = {r['symbol']: int(r['address'], 16) for r in row['matches']}
    prior = json.loads((HERE / 'jpeg_dependency_packet.json').read_text())
    assert prior['anchor_sha256'] == EXPECTED and prior['image'] == IMAGE
    old = {r['symbol']: r for r in prior['functions'] if r['unresolved'] == 0}
    expected = {'_get_dht': (0x1004e310, 795), '_get_dqt': (0x1004e630, 618)}
    for name, (address, size) in expected.items():
        assert definitions[name] == address
        assert next(r['bytes'] for r in row['matches'] if r['symbol'] == name) == size
    dispatch, code_size, block_size = 0x1004f280, 563, 882
    definitions['_read_markers'] = dispatch
    m['INV'][f'{dispatch:x}'] = dict(name='_read_markers', addr=f'{dispatch:x}', size=block_size, thunk=False)
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    decoder.detail = True
    records = []
    names = ['_get_dht', '_get_dqt', '_read_markers']
    # Every referenced parser must have an existing closed proof or be one of
    # the two newly checked real parser bodies, not an inferred inventory name.
    dependencies = ['_first_marker', '_next_marker', '_get_soi', '_get_sof',
                    '_get_dri', '_skip_variable', '_get_sos']
    for name in dependencies:
        assert name in old and definitions[name] == int(old[name]['address'], 16)
        address, size = definitions[name], old[name]['bytes']
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        check(address, obj, name, matcher=m,
              bindings={s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                        for s in old[name]['sites']})
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
    for name in names:
        address, code_bytes = (dispatch, code_size) if name == '_read_markers' else expected[name]
        function = next(s for s in symbols.values() if s['name'] == name and s['sec'] > 0)
        section = coff['sections'][function['sec'] - 1]
        assert function['value'] == 0 and is_function(raw, function)
        assert sum(s['sec'] == function['sec'] and is_function(raw, s)
                   for s in symbols.values()) == 1
        size = block_size if name == '_read_markers' else code_bytes
        assert section['rawsize'] == size
        candidate = raw[section['rawptr']:section['rawptr'] + size]
        target = raw_target(m, address, size)
        instructions = list(decoder.disasm(target[:code_bytes], address))
        assert sum(i.size for i in instructions) == code_bytes and instructions[-1].mnemonic == 'ret'
        assert sum(i.size for i in decoder.disasm(candidate[:code_bytes], address)) == code_bytes
        starts = {i.address for i in instructions}
        for instruction in instructions:
            if instruction.group(CS_GRP_JUMP) and instruction.operands[0].type == CS_OP_IMM:
                assert instruction.operands[0].imm in starts
        if name == '_read_markers':
            assert target[563:564] == candidate[563:564] == b'\x90'
            assert target[628:] == candidate[628:] and len(target[628:]) == 254
            assert max(target[628:]) < 16
            assert raw_target(m, address + size, 14) == b'\xcc' * 14
            for p in range(564, 628, 4):
                assert struct.unpack_from('<I', target, p)[0] in starts
            assert target[64:70] == bytes.fromhex('81f9fd000000')
            assert target[76:83] == b'\x0f\xb6\x89' + struct.pack('<I', address + 628)
            assert target[83:90] == b'\xff\x24\x8d' + struct.pack('<I', address + 564)
            references = {struct.unpack_from('<I', m['_d'], p)[0] for p in m['PE_RELOCS']}
            assert address in references
        else:
            padding = (-address - size) % 16
            assert raw_target(m, address + size, padding) == b'\xcc' * padding
        branches = branch_fields(target[:code_bytes], address)
        offset = m['rva2off'](address - 0x10000000)
        fields = {p - offset: 6 for p in m['PE_RELOCS'] if offset <= p < offset + size}
        fields.update({p: 20 for p in branches})
        assert len(fields) == len(section['relocs'])
        assert fields == {r['vaddr']: r['type'] for r in section['relocs']}
        left, right = bytearray(target), bytearray(candidate)
        bindings, sites = {}, []
        for relocation in section['relocs']:
            p = relocation['vaddr']
            symbol = symbols[relocation['sym']]
            destination = branches.get(p, struct.unpack_from('<I', target, p)[0])
            addend = struct.unpack_from('<I', candidate, p)[0]
            if symbol['sec'] == function['sec']:
                base = address + symbol['value']
                assert base in starts or name == '_read_markers' and base in (address + 564, address + 628)
                status = 'LOCAL-BOUND'
            elif symbol['name'] == '_jpeg_natural_order':
                data = coff['sections'][symbol['sec'] - 1]
                value = symbol['value']
                assert value + 320 <= data['rawsize'] and not data['relocs']
                assert raw[data['rawptr'] + value:data['rawptr'] + value + 320] == raw_target(m, 0x10191200, 320)
                base, status = 0x10191200, 'COMPLETE-SOURCE-DATA'
            else:
                assert symbol['name'] in dependencies + names
                base, status = definitions[symbol['name']], 'SOURCE-CALLEE-BOUND'
            require_binding(destination, base, addend)
            try:
                require_binding(destination, base + 4, addend)
            except ValueError:
                pass
            else:
                raise AssertionError('wrong binding accepted')
            if symbol['name'] in bindings:
                assert bindings[symbol['name']] == base
            bindings[symbol['name']] = base
            sites.append(dict(offset=p, symbol=symbol['name'], base=hex(base), status=status))
            left[p:p + 4] = right[p:p + 4] = bytes(4)
        assert left == right
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
        if name != '_read_markers':
            check(address, obj, name, matcher=m, bindings=bindings)
            for binding_name, base in bindings.items():
                try:
                    check(address, obj, name, matcher=m,
                          bindings=dict(bindings, **{binding_name: base + 4}))
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                else:
                    raise AssertionError('wrong parser binding accepted')
        records.append(dict(address=hex(address), symbol=name, code_bytes=code_bytes,
                            block_bytes=size, sites=sites, negative_bindings=len(bindings)))
    fixture = HERE / 'test_jpeg_markers.c'
    executable = run / 'marker_fixture32'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
               '-Werror', '-Wno-unused-parameter', '-Wno-unused-function',
               '-D__declspec(x)=', str(fixture), '-o', str(executable)]
    subprocess.run(command, check=True)
    subprocess.run([str(executable)], check=True)
    for input_name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / input_name).read_bytes()).hexdigest() == digest
    packet = dict(status='MARKER-BLOCK-PASS', anchor_sha256=EXPECTED, image=IMAGE,
                  object_sha256=row['object_sha256'], run=str(run), functions=records,
                  code_bytes=1976, table_alignment_bytes=319, whole_file_identity=False,
                  fixture_command=command, fixture_passed=True,
                  fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  dependency_packet_sha256=hashlib.sha256((HERE / 'jpeg_dependency_packet.json').read_bytes()).hexdigest())
    (HERE / 'jpeg_marker_block_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: DHT795 + DQT618 + marker dispatch563; not V4')


if __name__ == '__main__':
    main()
