#!/usr/bin/env python3
"""Fresh bounded delayed-command family build; no canonical promotion."""
from contextlib import redirect_stdout
import argparse
import hashlib
import io
import json
from pathlib import Path
import subprocess
import shlex
import tempfile

from batch_existing import IMAGE, HERE
from check_shape import check
from audit_legacy import load_matcher


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--optimization-probes', action='store_true')
    args = parser.parse_args()
    source = HERE / 'src/delayed_drawing.c'
    digest = hashlib.sha256(source.read_bytes()).hexdigest()
    run = Path(tempfile.mkdtemp(prefix='material_verify_delayed_', dir=HERE))
    command = ['cl', '/nologo', '/W3', '/O2', '/Gy', '/c',
               'Z:\\inputs\\src\\delayed_drawing.c', '/FoZ:\\out\\delayed.obj']
    variants = [[], ['/Og-'], ['/Oy-'], ['/Os'], ['/Ot'], ['/Ob0'], ['/G6'], ['/G7']]
    commands = [command]
    if args.optimization_probes:
        commands += [command[:-1] + flags + [f'/FoZ:\\out\\probe{i}.obj']
                     for i, flags in enumerate(variants[1:], 1)]
    subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', f'{HERE}:/inputs:ro',
                    '-v', f'{run}:/out', '-w', '/out', '--entrypoint', '/bin/sh', IMAGE,
                    '-c', ' && '.join(shlex.join(cmd) for cmd in commands)], check=True)
    obj = run / 'delayed.obj'
    results = []
    m = load_matcher()
    probes = []
    for i, cmd in enumerate(commands[1:], 1):
        path = run / f'probe{i}.obj'
        log = io.StringIO()
        try:
            with redirect_stdout(log):
                check(0x10020f70, path, '_R_EndDelayedDrawing', matcher=m,
                      bindings={'_renderer_command_list': 0x1042e778})
                if m['cmd_diff']('0x10020f70', str(path), '_R_EndDelayedDrawing') != 100:
                    raise ValueError('legacy referee differs')
            status = 'SHAPE_ONLY'
        except ValueError as error:
            status = 'DEFER'
            log.write(str(error) + '\n')
        probes.append(dict(command=cmd, status=status, diagnostics=log.getvalue(),
                           object_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
        print('PROBE', variants[i], status, log.getvalue())
    for address, symbol in [(0x10020f10, '_R_BeginDelayedDrawing'),
                            (0x10020f70, '_R_EndDelayedDrawing'),
                            (0x10020fe0, '_R_IssueDelayedDrawing')]:
        log = io.StringIO()
        try:
            with redirect_stdout(log):
                check(address, obj, symbol, matcher=m,
                      bindings={'_renderer_command_list': 0x1042e778})
                if m['cmd_diff'](hex(address), str(obj), symbol) != 100:
                    raise ValueError('legacy referee differs')
            status = 'SHAPE_ONLY'
        except ValueError as error:
            status = 'DEFER'
            log.write(str(error) + '\n')
        results.append(dict(address=hex(address), symbol=symbol, status=status, diagnostics=log.getvalue()))
        print(symbol, status, log.getvalue())
    if hashlib.sha256(source.read_bytes()).hexdigest() != digest:
        raise ValueError('source changed during build')
    try:
        check(0x10020fe0, obj, '_R_IssueDelayedDrawing', matcher=m,
              bindings={'_renderer_command_list': 0x1042e77c})
    except ValueError as error:
        if 'wrong binding' not in str(error):
            raise
    else:
        raise AssertionError('wrong command-list binding accepted')
    test_source = HERE / 'test_delayed_drawing.c'
    executable = run / 'host_test32'
    subprocess.run(['cc', '-m32', '-std=c89', '-Wall', '-Wextra', '-Werror',
                    '-fno-strict-aliasing', str(test_source), '-o', str(executable)], check=True)
    subprocess.run([str(executable)], check=True)
    (run / 'packet.json').write_text(json.dumps(dict(image=IMAGE, command=command,
        source_sha256=digest, object_sha256=hashlib.sha256(obj.read_bytes()).hexdigest(),
        functions=results, optimization_probes=probes, independent_review=False, host_32bit_fixtures_passed=True,
        test_sha256=hashlib.sha256(test_source.read_bytes()).hexdigest(),
        wrong_binding_rejected=True), indent=2) + '\n')
    print(run)


if __name__ == '__main__':
    main()
