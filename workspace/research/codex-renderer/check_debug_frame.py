#!/usr/bin/env python3
"""Replay the isolated source-built debug-frame packet, not whole-DLL proof."""
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import sys

from audit_legacy import EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target
from check_shape import check


def main():
    run = Path(sys.argv[1]) if len(sys.argv) == 2 else HERE / 'baseline_jpeg_8cwyzk_y'
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    source = Path(inputs['reference'])
    assert source.resolve() in [(HERE / 'scratch' / name).resolve()
                               for name in ('codex_debug_frame', 'codex_debug_pair')]
    paired = source.name == 'codex_debug_pair'
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((source / name).read_bytes()).hexdigest() == digest
    row, = json.loads((run / 'results.json').read_text())
    obj = run / 'job000.obj'
    assert (run / 'job000.status').read_text().strip() == '0'
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    bindings = {
        '_renderer_registered': 0x101d4d00,
        '_renderer_front_end_data': 0x101da9c8,
        '_renderer_command_list': 0x1042e778,
        '_debug_saved_command_list': 0x101e4a00,
        '_debug_saved_front_end_data': 0x101e4a04,
        '_debug_restore_skin_cache': 0x101e4a08,
        '_R_AddCmdEndOfList': 0x10020ec0,
        '_RB_ExecuteRenderCommands': 0x10033d20,
        '_RB_EndFrame': 0x10033b20,
        '_R_LockSkinnedCache': 0x1001e4b0,
    }
    if paired:
        bindings.update(_renderer_skin_cache_lock=0x101d49b0,
                        _debug_frame_commands=0x103fe718,
                        _debug_frame_data=0x101e4a0c,
                        _R_UnlockSkinnedCache=0x1001e540)
    m = load_matcher()
    log = io.StringIO()
    functions = [
        (0x10020ec0, '_R_AddCmdEndOfList', 71, 9),
        (0x10022040, '_R_EndDebugFrame', 114, 14),
    ]
    if paired:
        functions.append((0x10021ff0, '_R_BeginDebugFrame', 73, 7))
    for address, symbol, size, padding in functions:
        target = raw_target(m, address, size + padding)
        assert target[size - 1] == 0xc3
        assert target[size:] == b'\xcc' * padding
        with redirect_stdout(log):
            check(address, obj, symbol, matcher=m, bindings=bindings)
            assert m['cmd_diff'](hex(address), str(obj), symbol) == 100
        try:
            with redirect_stdout(io.StringIO()):
                check(address, obj, symbol, matcher=m,
                      bindings=dict(bindings, _renderer_command_list=0x1042e77c))
        except ValueError as error:
            assert 'wrong binding' in str(error)
        else:
            raise AssertionError('incorrect command-list binding accepted')
    assert 'UNRESOLVED binding' not in log.getvalue()
    total = sum(size for _, _, size, _ in functions)
    fixture = HERE / 'test_debug_pair.c' if paired else source / 'test_debug_frame.c'
    packet = dict(status='REVIEWABLE', code_bytes=total, functions=len(functions),
                  independent_review=False, whole_file_identity=False,
                  anchor_sha256=EXPECTED, inputs=inputs,
                  object_sha256=row['object_sha256'],
                  bindings={k: hex(v) for k, v in bindings.items()},
                  diagnostics=log.getvalue(), wrong_binding_rejected=True,
                  fixture_command='cc -m32 -std=c89 -Wall -Wextra -Werror '
                  + str(fixture) + ' '
                  '-o /tmp/codex_debug_frame_test && /tmp/codex_debug_frame_test',
                  fixture_note='Run separately; this replay checks bytes, not test execution.',
                  fixture_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(),
                  external_dependencies='External callees have pinned destinations and '
                  'target-compatible observed calls; their full bodies remain unmatched.')
    (run / 'debug_frame_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print(f'PASS: {len(functions)} bodies /{total} bytes, complete extents, both referees, '
          'all bindings and negative binding checks; not V4')


if __name__ == '__main__':
    main()
