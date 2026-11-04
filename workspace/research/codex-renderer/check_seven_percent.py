#!/usr/bin/env python3
"""Full-body proof for two independent functions, not whole-DLL identity."""
import hashlib
import argparse
import io
import json
import struct
import subprocess
from pathlib import Path
from contextlib import redirect_stdout

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import check
from check_jpeg_dependencies import raw_target
from capstone import Cs, CS_ARCH_X86, CS_MODE_32


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path,
                        default=HERE / 'scratch/codex_seven_percent/j_checkpoint.c')
    args = parser.parse_args()
    run = HERE / 'baseline_jpeg_7h016wwk'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    source = args.source.resolve()
    assert sha(source) == inputs['dependencies']['j_checkpoint.c']
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher(instruction_aware=True)
    legacy = load_matcher()
    bindings = dict(_far_plane_dvar=0x101ce61c, _far_plane_zero=0x1019bc84,
                    _far_plane_override_active=0x101d620c,
                    _far_plane_override_enabled=0x101d61c8,
                    _far_plane_override_mode=0x101d61ac,
                    _far_plane_override_value=0x101d61c0,
                    _far_plane_minimum=0x101ce5f4)
    assert struct.unpack('<f', raw_target(m, 0x1019bc84, 4))[0] == 0.0
    functions = []
    for address, size, name in ((0x1000aa60, 82, '_Image_GetFarPlane'),
                                (0x10023e90, 57, '_Image_InitRecords')):
        body = raw_target(m, address, size)
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(body, address))
        assert sum(i.size for i in decoded) == size and decoded[-1].mnemonic == 'ret'
        padding = (-address - size) % 16
        assert raw_target(m, address + size, padding) == bytes([0xcc]) * padding
        for matcher in (m, legacy):
            matcher['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}',
                                                size=size, thunk=False)
        active = bindings if address == 0x1000aa60 else {}
        check(address, obj, name, matcher=m, bindings=active)
        assert legacy['cmd_diff'](hex(address), str(obj), name) == 100
        for symbol in active:
            bad = dict(active)
            bad[symbol] += 4
            try:
                with redirect_stdout(io.StringIO()):
                    check(address, obj, name, matcher=m, bindings=bad)
            except ValueError as error:
                assert 'wrong binding' in str(error)
            else:
                raise AssertionError(symbol)
        functions.append(dict(address=hex(address), bytes=size, symbol=name,
                              bindings=active, negative_tests=len(active)))
    fixture = HERE / 'test_seven_percent.c'
    executable = run / 'fixture'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror',
                    str(fixture), '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, source_path=str(source), source_sha256=sha(source),
                  object_sha256=sha(obj), inputs_sha256=sha(run / 'inputs.json'),
                  checker_sha256=sha(HERE / 'check_seven_percent.py'),
                  fixture_sha256=sha(fixture), functions=functions,
                  new_code_bytes=139, whole_file_identity=False,
                  total_code_bytes=76311, denominator=1089680)
    (run / 'seven_percent_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:139 new code bytes; total76311/1089680 = %.6f%%' %
          (76311 / 1089680 * 100))


if __name__ == '__main__':
    main()
