#!/usr/bin/env python3
"""Source-only wavelet/table DLL link probe, never retail identity certification."""
import hashlib
import json
from pathlib import Path
import re
import shlex
import subprocess
import tempfile

from audit_legacy import load_matcher
from batch_existing import HERE, IMAGE
from verify_wavelet_initializers import recheck_packet


def main():
    functions = HERE / 'baseline_jpeg_1v2df6oy'
    inputs = json.loads((functions / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    row, = json.loads((functions / 'results.json').read_text())
    obj = functions / (row['job'] + '.obj')
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    tables = recheck_packet(load_matcher(), reference / 'common_types.h')
    data_run = Path(tables['run'])
    run = Path(tempfile.mkdtemp(prefix='link_probe_wavelet_', dir=HERE))
    command = ['wine', '/opt/msvc710/Vc7/bin/link.exe', '/DLL', '/NOENTRY', '/NODEFAULTLIB',
        '/MACHINE:X86', '/OPT:NOREF', '/OPT:NOICF', '/BASE:0x10000000', '/FILEALIGN:4096',
        '/EXPORT:Wavelet_DecompressLevel', '/OUT:Z:\\out\\wavelet.dll',
        '/IMPLIB:Z:\\out\\wavelet.lib', '/MAP:Z:\\out\\wavelet.map',
        'Z:\\functions\\' + obj.name, 'Z:\\tables\\tables.obj']
    (run / 'build.sh').write_text('set -e\n' + shlex.join(command) + '\n')
    print('Fresh source cluster link:', run, flush=True)
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none',
        '-v', f'{functions}:/functions:ro', '-v', f'{data_run}:/tables:ro',
        '-v', f'{run}:/out', '-w', '/out', '--entrypoint', '/bin/sh', IMAGE, '/out/build.sh'],
        capture_output=True, text=True)
    (run / 'build.log').write_text(result.stdout + result.stderr)
    result.check_returncode()
    assert hashlib.sha256(obj.read_bytes()).hexdigest() == row['object_sha256']
    recheck_packet(load_matcher(), reference / 'common_types.h')
    mapping = (run / 'wavelet.map').read_text(errors='replace')
    owned = {}
    for symbol in ['_Wavelet_DecompressLevel'] + [t['symbol'] for t in tables['tables']]:
        matches = re.findall(r'^\s*[0-9a-fA-F]+:[0-9a-fA-F]+\s+' + re.escape(symbol) +
                             r'\s+([0-9a-fA-F]+)\b', mapping, flags=re.M)
        if len(matches) != 1:
            raise ValueError('source-link symbol ownership ambiguous: ' + symbol)
        owned[symbol] = '0x' + matches[0]
    packet = dict(status='SOURCE-CLUSTER-LINK-PROBE-PASS', image=IMAGE, command=command,
        functions_object_sha256=row['object_sha256'], table_proof=tables,
        symbols=owned, dll_sha256=hashlib.sha256((run / 'wavelet.dll').read_bytes()).hexdigest(),
        dll=str(run / 'wavelet.dll'), retail_layout=False, retail_symbol_ownership=False,
        unmatched_decoder_included=True, whole_file_identity=False, runtime_smoke=False)
    encoded = json.dumps(packet, indent=2) + '\n'
    (run / 'packet.json').write_text(encoded)
    (HERE / 'wavelet_link_packet.json').write_text(encoded)
    print('PASS: real source decoder/table objects link with unique symbols; NOT retail parity or V4')


if __name__ == '__main__':
    main()
