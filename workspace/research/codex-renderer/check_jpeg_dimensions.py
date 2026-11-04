#!/usr/bin/env python3
"""Complete dimensions code/table audit; generated data receives no code credit."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from contextlib import redirect_stdout
import io
from capstone import Cs, CS_ARCH_X86, CS_MODE_32, CS_GRP_JUMP, CS_OP_IMM
from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    run = HERE / 'baseline_jpeg_0rckeoeb'
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher()
    assert sha(m['DLL']) == EXPECTED
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    symbol, = [s for s in symbols.values() if s['name'] == '_jpeg_calc_output_dimensions' and s['sec'] > 0]
    section = coff['sections'][symbol['sec'] - 1]
    assert section['rawsize'] == 548
    address = 0x1004f9e0
    target = raw_target(m, address, 548)
    candidate = raw[section['rawptr']:section['rawptr'] + 548]
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    decoder.detail = True
    instructions = list(decoder.disasm(target[:527], address))
    assert sum(i.size for i in instructions) == 527 and instructions[-1].mnemonic == 'ret'
    starts = {i.address for i in instructions}
    for instruction in instructions:
        if instruction.group(CS_GRP_JUMP) and instruction.operands[0].type == CS_OP_IMM:
            assert instruction.operands[0].imm in starts
    assert target[527:528] == candidate[527:528] == b'\x90'
    for offset in range(528, 548, 4):
        assert struct.unpack_from('<I', target, offset)[0] in starts
    assert raw_target(m, address + 548, 12) == b'\xcc' * 12
    prior_path = HERE / 'jpeg_dependency_packet.json'
    prior = json.loads(prior_path.read_text())
    proof, = [r for r in prior['functions'] if r['symbol'] == '_use_merged_upsample']
    assert proof['unresolved'] == 0 and proof['bytes'] == 128 and not proof['sites']
    check(0x1004f960, obj, '_use_merged_upsample', matcher=m, bindings={})
    assert m['cmd_diff']('0x1004f960', str(obj), '_use_merged_upsample') == 100
    bindings = {}
    for relocation in section['relocs']:
        item = symbols[relocation['sym']]
        if item['sec'] == symbol['sec']:
            base = address + item['value']
            assert base in starts or base == address + 528
        else:
            assert item['name'] == '_use_merged_upsample'
            base = 0x1004f960
        bindings[item['name']] = base
    m['INV'][f'{address:x}'] = dict(name=symbol['name'], addr=f'{address:x}', size=548, thunk=False)
    check(address, obj, symbol['name'], matcher=m, bindings=bindings)
    assert m['cmd_diff'](hex(address), str(obj), symbol['name']) == 100
    for name, base in bindings.items():
        wrong = dict(bindings)
        wrong[name] = base + 4
        try:
            with redirect_stdout(io.StringIO()):
                check(address, obj, symbol['name'], matcher=m, bindings=wrong)
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError('wrong dimensions binding accepted')
    fixture = HERE / 'test_jpeg_dimensions.c'
    executable = run / 'dimensions_fixture32'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
               '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
               '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
               str(fixture), '-Wl,--gc-sections', '-o', str(executable)]
    subprocess.run(command, check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  object_sha256=sha(obj), inputs_sha256=sha(run / 'inputs.json'),
                  code_bytes=527, noncode_bytes_excluded=21, bindings=bindings,
                  negative_tests=len(bindings), checker_sha256=sha(__file__),
                  fixture_sha256=sha(fixture), base_packet_sha256=sha(prior_path),
                  fixture_cases=540, fixture_command=command,
                  functions=[dict(symbol=symbol['name'], address=hex(address), bytes=527)],
                  whole_file_identity=False)
    (HERE / 'jpeg_dimensions_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: dimensions527 code bytes, complete548 block; 540 native cases; not V4')


if __name__ == '__main__':
    main()
