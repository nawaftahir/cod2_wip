#!/usr/bin/env python3
"""Isolated source-built Direct3D DLL probe, explicitly not reconstructed retail DLL."""
import hashlib
import json
from pathlib import Path
import shlex
import subprocess
import tempfile

from audit_legacy import ROOT
from batch_existing import HERE, IMAGE


def main():
    sdk = ROOT / 'refrences/iw3xo-radiant/deps/dxsdk'
    run = Path(tempfile.mkdtemp(prefix='link_probe_', dir=HERE))
    source = HERE / 'dxsdk_probe.cpp'
    inputs = {'dxsdk_probe.cpp': hashlib.sha256(source.read_bytes()).hexdigest()}
    for relative in ('Include/d3d9.h', 'Include/d3d9types.h', 'Include/d3d9caps.h', 'Lib/x86/d3d9.lib'):
        inputs[relative] = hashlib.sha256((sdk / relative).read_bytes()).hexdigest()
    commands = [
        ['cl', '/nologo', '/W3', '/O2', '/c', 'Z:\\inputs\\dxsdk_probe.cpp',
         '/IZ:\\dxsdk\\Include', '/FoZ:\\out\\probe.obj'],
        ['wine', '/opt/msvc710/Vc7/bin/link.exe', '/DLL', '/NOENTRY', '/NODEFAULTLIB',
         '/MACHINE:X86', '/OUT:Z:\\out\\probe.dll', '/IMPLIB:Z:\\out\\probe.lib',
         '/FILEALIGN:4096', '/BASE:0x10000000', 'Z:\\out\\probe.obj',
         'Z:\\dxsdk\\Lib\\x86\\d3d9.lib'],
        ['wine', '/opt/msvc710/Vc7/bin/dumpbin.exe', '/headers', '/imports', 'Z:\\out\\probe.dll']]
    script = 'set -e\n' + '\n'.join(shlex.join(command) for command in commands) + '\n'
    (run / 'build.sh').write_text(script)
    completed = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v',
        f'{HERE}:/inputs:ro', '-v', f'{sdk}:/dxsdk:ro', '-v', f'{run}:/out', '-w', '/out',
        '--entrypoint', '/bin/sh', IMAGE, '/out/build.sh'], capture_output=True, text=True)
    log = completed.stdout + completed.stderr
    (run / 'build.log').write_text(log)
    print(log)
    if completed.returncode:
        raise SystemExit('PROBE DEFER: ' + str(run))
    if 'Direct3DCreate9' not in log or 'D3D9.DLL' not in log.upper():
        raise ValueError('expected Direct3D import absent from dump output')
    (run / 'packet.json').write_text(json.dumps(dict(status='SDK-LINK-PROBE-PASS',
        canonical=False, reconstructed_binary=False, image=IMAGE, inputs=inputs,
        commands=commands, dll_sha256=hashlib.sha256((run / 'probe.dll').read_bytes()).hexdigest()), indent=2))
    print('PASS: source-built x86 DLL links against the local SDK. Not retail parity:', run)


if __name__ == '__main__':
    main()
