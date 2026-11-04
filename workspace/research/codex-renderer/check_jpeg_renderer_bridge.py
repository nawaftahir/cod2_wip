#!/usr/bin/env python3
"""Audit JPEG error callbacks and scan/finish APIs, without constructor credit."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
from contextlib import redirect_stdout
import io

from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', required=True, type=Path)
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    reference = Path(inputs['reference'])
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    assert reference == HERE / 'scratch/codex_jpeg_image_loader'
    for name, sha in inputs['dependencies'].items():
        assert digest(reference / name) == sha
    row, = json.loads((run / 'results.json').read_text())
    obj = run / (row['job'] + '.obj')
    assert digest(obj) == row['object_sha256']
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    m = load_matcher()
    assert digest(m['DLL']) == EXPECTED
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    parent = HERE / 'baseline_jpeg_0u7hoy4j/results.json'
    regression_rows, = json.loads(parent.read_text())
    regression = io.StringIO()
    with redirect_stdout(regression):
        for previous in regression_rows['matches']:
            address = int(previous['address'], 16)
            m['INV'][f'{address:x}'] = dict(name=previous['symbol'], addr=f'{address:x}',
                                           size=previous['bytes'], thunk=False)
            check(address, obj, previous['symbol'], matcher=m)
            assert m['cmd_diff'](hex(address), str(obj), previous['symbol']) == 100
    (run / 'bridge_regression.log').write_text(regression.getvalue())
    decoder = Cs(CS_ARCH_X86, CS_MODE_32)
    records = []
    for name, address, size in [('_error_exit', 0x10051f90, 51),
                                ('_output_message', 0x10051fd0, 49),
                                ('_jpeg_finish_decompress', 0x1004a310, 227),
                                ('_jpeg_read_scanlines', 0x1004a5d0, 154)]:
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        symbol, = [s for s in coff['symbols'] if s['name'] == name and s['sec'] > 0]
        section = coff['sections'][symbol['sec'] - 1]
        assert not section['relocs']
        check(address, obj, name, matcher=m, bindings={})
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
        target = raw_target(m, address, size)
        instructions = list(decoder.disasm(target, address))
        assert sum(i.size for i in instructions) == size
        assert instructions[-1].mnemonic == ('jmp' if name == '_error_exit' else 'ret')
        assert raw_target(m, address + size, (-address - size) % 16) == b'\xcc' * ((-address - size) % 16)
        records.append(dict(symbol=name, address=hex(address), bytes=size,
                            unresolved=0, relocation_sites=0))
    fixture = HERE / 'test_jpeg_renderer_bridge.c'
    executable = run / 'test_jpeg_renderer_bridge32'
    command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra', '-Werror',
               '-Wno-unused-parameter', '-Wno-unused-function', '-ffunction-sections',
               '-fdata-sections', '-D__forceinline=__inline__', '-D__declspec(x)=',
               str(fixture), '-Wl,--gc-sections', '-o', str(executable)]
    subprocess.run(command, check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  object_sha256=digest(obj), inputs_sha256=digest(run / 'inputs.json'),
                  checker_sha256=digest(Path(__file__)), fixture_sha256=digest(fixture),
                  regression_parent_sha256=digest(parent),
                  regression_functions=len(regression_rows['matches']),
                  regression_log_sha256=digest(run / 'bridge_regression.log'),
                  functions=records, closed_code_bytes=481,
                  fixture='32-bit real allocator/constructor/error/scan/finish APIs; mocked downstream callbacks; no game boot',
                  held='Constructor310 remains uncredited: marker-reader dependency held.')
    (HERE / 'jpeg_renderer_bridge_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: JPEG error/scan/finish APIs, 481 code bytes; constructor held.')


if __name__ == '__main__':
    main()
