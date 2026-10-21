#!/usr/bin/env python3
"""Verify the actual Windows API table initializer, not callback implementations."""
import hashlib
import argparse
import io
import json
import subprocess
import sys
from contextlib import redirect_stdout
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher, EXPECTED
from check_shape import check
from batch_existing import IMAGE
from check_jpeg_dependencies import raw_target
from capstone import Cs, CS_ARCH_X86, CS_MODE_32


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    run = ROOT / 'gfx/scratch/library_runs/baseline_jpeg_7_9fo60y'
    reference = ROOT / 'gfx/scratch/refapi_context'
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, default=reference / 'j_get_ref_api.c')
    source = parser.parse_args().source.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(reference / name) == digest
    assert sha(source) == inputs['dependencies']['j_get_ref_api.c']
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    slots_path = ROOT / 'codex/renderer/refapi_pinned.json'
    pinned = json.loads(slots_path.read_text())
    assert pinned['anchor_sha256'] == EXPECTED
    bindings = {'_renderer_imports': 0x101d49c8, '_renderer_exports': 0x1076a880}
    for slot in pinned['slots']:
        if slot['write_instruction']:
            bindings['_renderer_entry_' + slot['target'][2:]] = int(slot['target'], 16)
    m = load_matcher(instruction_aware=True)
    body = raw_target(m, 0x10013270, 1051)
    decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(body, 0x10013270))
    assert sum(ins.size for ins in decoded) == 1051 and decoded[-1].mnemonic == 'ret'
    assert raw_target(m, 0x1001368b, 5) == b'\xcc' * 5
    coff = m['parse_coff'](obj.read_bytes())
    symbols = {s['idx']: s for s in coff['symbols']}
    section = next(s for s in coff['sections'] if s['flags'] & 0x20)
    for relocation in section['relocs']:
        name = symbols[relocation['sym']]['name']
        if name in bindings:
            continue
        assert name.startswith('??_C@'), name
        position = relocation['vaddr']
        code = raw_target(m, 0x10013270, 1051)
        import struct
        destination = struct.unpack_from('<I', code, position)[0]
        literal_symbol = symbols[relocation['sym']]
        literal_section = coff['sections'][literal_symbol['sec'] - 1]
        raw = obj.read_bytes()
        literal = raw[literal_section['rawptr']:literal_section['rawptr'] + literal_section['rawsize']]
        assert literal == raw_target(m, destination, len(literal))
        bindings[name] = destination
    check(0x10013270, obj, '_GetRefAPI', matcher=m, bindings=bindings)
    legacy = load_matcher()
    assert legacy['cmd_diff']('0x10013270', str(obj), '_GetRefAPI') == 100
    for name in bindings:
        wrong = dict(bindings)
        wrong[name] += 4
        try:
            with redirect_stdout(io.StringIO()):
                check(0x10013270, obj, '_GetRefAPI', matcher=m, bindings=wrong)
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError(name)
    fixture = reference / 'test_refapi.c'
    executable = run / 'fixture'
    subprocess.run(['cc', '-std=c99', '-Wall', '-Wextra', '-Werror', '-D__cdecl=',
                    str(fixture), '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    packet = dict(anchor_sha256=EXPECTED, source_path=str(source), source_sha256=sha(source),
                  object_sha256=sha(obj), checker_sha256=sha(Path(__file__)),
                  fixture_sha256=sha(fixture), slots_sha256=sha(slots_path),
                  bindings=bindings, negative_tests=len(bindings), body_bytes=1051,
                  callback_signatures_certified=False, callback_implementations_complete=False,
                  whole_file_identity=False, verified_initializer_code_bytes=1051,
                  total_verified_source_bytes=77362, denominator=1089680,
                  excluded_callback_code_bytes=True)
    (run / 'refapi_context_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: full GetRefAPI1051, all bindings/negative tests, host table/version fixture; callbacks incomplete')


if __name__ == '__main__':
    main()
