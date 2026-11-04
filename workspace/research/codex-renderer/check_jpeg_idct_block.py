#!/usr/bin/env python3
"""Audit the complete IDCT selector code, alignment and generated switch table."""
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
    run = HERE / 'baseline_jpeg_d6d0wpgj'
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
    function = next(s for s in symbols.values() if s['name'] == '_start_pass' and s['sec'] > 0)
    section = coff['sections'][function['sec'] - 1]
    assert function['value'] == 0 and is_function(raw, function)
    assert sum(s['sec'] == function['sec'] and is_function(raw, s)
               for s in symbols.values()) == 1
    assert section['rawsize'] == 816
    address, code_size = 0x1004c0e0, 781
    assert int(m['INV']['1004c410']['addr'], 16) == address + 816
    candidate = raw[section['rawptr']:section['rawptr'] + 816]
    target = raw_target(m, address, 816)
    assert target[781:784] == candidate[781:784] == bytes.fromhex('8d4900')
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    decoder.detail = True
    decoded = list(decoder.disasm(target[:code_size], address))
    assert sum(i.size for i in decoded) == code_size and decoded[-1].mnemonic == 'ret'
    assert sum(i.size for i in decoder.disasm(candidate[:code_size], address)) == code_size
    starts = {i.address for i in decoded}
    for instruction in decoded:
        if instruction.group(CS_GRP_JUMP) and instruction.operands[0].type == CS_OP_IMM:
            assert instruction.operands[0].imm in starts
    for offset in range(784, 816, 4):
        assert struct.unpack_from('<I', target, offset)[0] in starts
    # One indexed indirect jump selects the eight-entry same-section table.
    jumps = [i for i in decoded if i.mnemonic == 'jmp' and i.operands[0].type != CS_OP_IMM]
    assert len(jumps) == 1 and jumps[0].address == address + 76
    assert bytes(jumps[0].bytes) == b'\xff\x24\x85' + struct.pack('<I', address + 784)
    offset = m['rva2off'](address - 0x10000000)
    branches = branch_fields(target[:code_size], address)
    sites = {p - offset: 6 for p in m['PE_RELOCS'] if offset <= p < offset + 816}
    sites.update({p: 20 for p in branches})
    assert len(sites) == len(section['relocs'])
    assert sites == {r['vaddr']: r['type'] for r in section['relocs']}
    prior = json.loads((HERE / 'jpeg_dependency_packet.json').read_text())
    assert prior['anchor_sha256'] == EXPECTED and prior['image'] == IMAGE
    referenced = {struct.unpack_from('<I', m['_d'], p)[0] for p in m['PE_RELOCS']}
    for key in m['INV']:
        try:
            referenced.update(branch_fields(m['carve'](int(key, 16))[0], int(key, 16)).values())
        except (ValueError, KeyError):
            continue
    for proof in prior['functions']:
        if not (proof['symbol'].startswith('_jpeg_idct_') or proof['symbol'] == '_jinit_inverse_dct'):
            continue
        entry, size = int(proof['address'], 16), proof['bytes']
        code = raw_target(m, entry, size)
        instructions = list(decoder.disasm(code, entry))
        assert sum(i.size for i in instructions) == size and instructions[-1].mnemonic == 'ret'
        boundaries = {i.address for i in instructions}
        for instruction in instructions:
            if instruction.group(CS_GRP_JUMP) and instruction.operands[0].type == CS_OP_IMM:
                assert instruction.operands[0].imm in boundaries
        assert entry in referenced
        padding = (-entry - size) % 16
        assert raw_target(m, entry + size, padding) == b'\xcc' * padding
        m['INV'][f'{entry:x}'] = dict(name=proof['symbol'], addr=f'{entry:x}', size=size, thunk=False)
    bindings, evidence = {}, []
    left, right = bytearray(target), bytearray(candidate)
    for relocation in section['relocs']:
        p = relocation['vaddr']
        symbol = symbols[relocation['sym']]
        addend = struct.unpack_from('<I', candidate, p)[0]
        destination = branches.get(p, struct.unpack_from('<I', target, p)[0])
        if symbol['sec'] == function['sec']:
            base = address + symbol['value']
            status = 'LOCAL-INSTRUCTION-OR-TABLE'
            assert base in starts or base == address + 784
        elif symbol['name'].startswith('_jpeg_idct_'):
            proof, = [r for r in prior['functions'] if r['symbol'] == symbol['name']]
            assert proof['unresolved'] == 0
            base = int(proof['address'], 16)
            # Revalidate the dependency object/source, not just a saved status.
            source = Path(proof['reference_root']) / proof['source']
            assert hashlib.sha256(source.read_bytes()).hexdigest() == proof['source_sha256']
            job = next(arg for arg in proof['command'] if arg.startswith('/Fo')).split('\\')[-1]
            dependency_obj = Path(proof['object_root']) / job
            assert hashlib.sha256(dependency_obj.read_bytes()).hexdigest() == proof['object_sha256']
            dependency_inputs = json.loads((Path(proof['object_root']) / 'inputs.json').read_text())
            dependency_reference = Path(dependency_inputs['reference'])
            for name, digest in dependency_inputs['dependencies'].items():
                assert hashlib.sha256((dependency_reference / name).read_bytes()).hexdigest() == digest
            dep_bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                            for s in proof['sites']}
            check(base, dependency_obj, proof['symbol'], matcher=m, bindings=dep_bindings)
            assert m['cmd_diff'](hex(base), str(dependency_obj), proof['symbol']) == 100
            status = 'RECHECKED-SOURCE-CALLEE'
        else:
            assert symbol['sec'] > 0 and relocation['type'] == 6
            data = coff['sections'][symbol['sec'] - 1]
            assert data['flags'] & 0x40 and not data['flags'] & 0x20
            assert data['rawsize'] and not data['relocs']
            if symbol['name'].startswith('?aanscales@'):
                size = 64 * 2
            elif symbol['name'].startswith('?aanscalefactor@'):
                size = 8 * 8
            else:
                assert symbol['value'] == 0
                size = data['rawsize']
            start = symbol['value']
            assert start + size <= data['rawsize']
            assert not any(s['sec'] == symbol['sec'] and start < s['value'] < start + size
                           for s in symbols.values())
            content = raw[data['rawptr'] + start:data['rawptr'] + start + size]
            base = (destination - addend) & 0xffffffff
            assert raw_target(m, base, len(content)) == content
            status = 'COMPLETE-SOURCE-DATA'
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
        evidence.append(dict(offset=p, symbol=symbol['name'], destination=hex(destination),
                             base=hex(base), addend=addend, status=status))
        left[p:p + 4] = right[p:p + 4] = bytes(4)
    assert left == right
    m['INV']['1004c0e0'] = dict(m['INV']['1004c0e0'], size=816)
    assert m['cmd_diff'](hex(address), str(obj), '_start_pass') == 100
    # Close the initializer only after the actual callback proof above passes.
    init, = [r for r in prior['functions'] if r['symbol'] == '_jinit_inverse_dct']
    assert init['object_sha256'] == row['object_sha256']
    init_bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                     for s in init['sites'] if s['status'] != 'UNRESOLVED'}
    unresolved = [s for s in init['sites'] if s['status'] == 'UNRESOLVED']
    assert len(unresolved) == 1 and unresolved[0]['symbol'] == '_start_pass'
    init_bindings['_start_pass'] = address
    check(0x1004c410, obj, '_jinit_inverse_dct', matcher=m, bindings=init_bindings)
    assert m['cmd_diff']('0x1004c410', str(obj), '_jinit_inverse_dct') == 100
    for name, base in init_bindings.items():
        try:
            check(0x1004c410, obj, '_jinit_inverse_dct', matcher=m,
                  bindings=dict(init_bindings, **{name: base + 4}))
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError('wrong initializer binding accepted')
    fixture = HERE / 'test_jpeg_allocators.c'
    fixture_command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
                       '-Werror', '-Wno-unused-parameter', '-Wno-unused-function',
                       '-DJPEG_MEMORY_VIRTUAL', '-D__forceinline=__inline__', '-D__declspec(x)=']
    memory = HERE / 'scratch/codex_jpeg_api_group/jmemmgr.c'
    fixture_command.append('-DJPEG_MEMORY_SOURCE="' + str(memory) + '"')
    for macro, source in [('MAIN', 'jdmainct.c'), ('POST', 'jdpostct.c'),
                          ('SAMPLE', 'jdsample.c'), ('COEF', 'jdcoefct.c'), ('IDCT', 'jddctmgr.c')]:
        fixture_command.append('-DJPEG_' + macro + '_SOURCE="' + str(reference / source) + '"')
    fixture_command += [str(fixture)] + [str(reference / name) for name in
                       ('jidctint.c', 'jidctfst.c', 'jidctflt.c', 'jidctred.c')]
    executable = run / 'idct_manager_fixture32'
    fixture_command += ['-o', str(executable)]
    subprocess.run(fixture_command, check=True)
    subprocess.run([str(executable)], check=True)
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    memory_run = HERE / 'baseline_jpeg_9nwllwps'
    memory_inputs = json.loads((memory_run / 'inputs.json').read_text())
    assert Path(memory_inputs['reference']) / 'jmemmgr.c' == memory
    for name, digest in memory_inputs['dependencies'].items():
        assert hashlib.sha256((Path(memory_inputs['reference']) / name).read_bytes()).hexdigest() == digest
    packet = dict(status='FULL-BLOCK-DEPENDENCY-PASS', anchor_sha256=EXPECTED,
                  image=IMAGE, run=str(run), object_sha256=row['object_sha256'],
                  code_bytes=781, switch_data_bytes=32, alignment_bytes=3,
                  initializer_bytes=117, sites=evidence, negative_bindings=len(bindings),
                  fixture_command=fixture_command, fixture_passed=True,
                  fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  decoder_input_sha256=hashlib.sha256((run / 'inputs.json').read_bytes()).hexdigest(),
                  dependency_packet_sha256=hashlib.sha256((HERE / 'jpeg_dependency_packet.json').read_bytes()).hexdigest(),
                  checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                  whole_file_identity=False, original_runtime_equivalence=False)
    (HERE / 'jpeg_idct_block_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: IDCT selector781 + initializer117; complete switch table and bindings; not V4')


if __name__ == '__main__':
    main()
