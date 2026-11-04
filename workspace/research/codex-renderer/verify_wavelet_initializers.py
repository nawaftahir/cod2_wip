#!/usr/bin/env python3
"""Mechanically emit typed reference tables, compile and compare complete source data."""
import hashlib
import json
from pathlib import Path
import re
import shlex
import struct
import subprocess
import tempfile

from audit_legacy import ROOT, EXPECTED, load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target

NAMES = [('waveletDecodeBlue', 0x10182988), ('waveletDecodeRedGreen', 0x10186988),
         ('waveletDecodeAlpha', 0x1018a988)]


def verify_object(obj, m):
    coff = m['parse_coff'](obj)
    records = []
    for name, address in NAMES:
        symbol = next(s for s in coff['symbols'] if s['name'] == '_' + name and s['sec'] > 0)
        section = coff['sections'][symbol['sec'] - 1]
        begin = symbol['value']
        if not section['flags'] & 0x40 or begin + 16384 > section['rawsize']:
            raise ValueError('initialized table extent differs')
        if any(begin <= r['vaddr'] < begin + 16384 for r in section['relocs']):
            raise ValueError('unexpected table relocation')
        content = obj[section['rawptr'] + begin:section['rawptr'] + begin + 16384]
        if content != raw_target(m, address, 16384):
            raise ValueError('compiled complete table differs: ' + name)
        records.append(dict(symbol=symbol['name'], address=hex(address), bytes=16384,
                            object_offset=begin, sha256=hashlib.sha256(content).hexdigest()))
    return records


def recheck_packet(m, header):
    packet = json.loads((HERE / 'wavelet_initializer_packet.json').read_text())
    if packet['image'] != IMAGE or packet['anchor_sha256'] != EXPECTED:
        raise ValueError('table proof toolchain/anchor differs')
    run = Path(packet['run'])
    for path, key in ((run / 'tables.c', 'generated_source_sha256'),
                      (run / 'common_types.h', 'header_sha256'),
                      (header, 'header_sha256'), (run / 'tables.obj', 'object_sha256'),
                      (Path(packet['reference']), 'reference_sha256')):
        if hashlib.sha256(path.read_bytes()).hexdigest() != packet[key]:
            raise ValueError('table proof input changed: ' + str(path))
    if verify_object((run / 'tables.obj').read_bytes(), m) != packet['tables']:
        raise ValueError('compiled table proof changed')
    return packet


def main():
    source = ROOT / 'refrences/cod2-mp-macho/rodata.c'
    header = HERE / 'scratch/wavelet_delta_order/common_types.h'
    original = source.read_bytes()
    header_bytes = header.read_bytes()
    text = original.decode()
    run = Path(tempfile.mkdtemp(prefix='baseline_wavelet_data_', dir=HERE))
    generated = ['#include "common_types.h"',
                 'typedef char entry_size_check[sizeof(WaveletHuffmanDecode) == 4 ? 1 : -1];']
    for name, _ in NAMES:
        match = re.search(r'const unsigned char ' + name + r'\[16384\]\s*=\s*\{(.*?)\};', text, re.S)
        if not match:
            raise ValueError('missing source initializer: ' + name)
        body = re.sub(r'/\*.*?\*/|//[^\n]*', '', match[1], flags=re.S)
        data = bytes(int(value.strip(), 0) for value in body.split(',') if value.strip())
        if len(data) != 16384:
            raise ValueError('wrong reference extent')
        entries = list(struct.iter_unpack('<hh', data))
        generated.append('const WaveletHuffmanDecode ' + name + '[4096] = {')
        for index in range(0, 4096, 8):
            generated.append('    ' + ', '.join('{%d, %d}' % entry for entry in entries[index:index + 8]) + ',')
        generated.append('};')
    # Generated build inputs are a mechanical typed rewrite of reference constants,
    # never extracted from retail bytes and never promoted to canonical source here.
    candidate = '\n'.join(generated) + '\n'
    (run / 'tables.c').write_text(candidate)
    (run / 'common_types.h').write_bytes(header_bytes)
    command = ['cl', '/nologo', '/c', '/W3', '/O2', '/Gy',
               'Z:\\out\\tables.c', '/FoZ:\\out\\tables.obj']
    (run / 'build.sh').write_text('set -e\n' + shlex.join(command) + '\n')
    print('Fresh typed initializers:', run, flush=True)
    completed = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v',
        f'{run}:/out', '-w', '/out', '--entrypoint', '/bin/sh', IMAGE, '/out/build.sh'],
        capture_output=True, text=True)
    (run / 'build.log').write_text(completed.stdout + completed.stderr)
    completed.check_returncode()
    if source.read_bytes() != original or header.read_bytes() != header_bytes:
        raise ValueError('reference inputs changed during compile')
    if (run / 'tables.c').read_text() != candidate or (run / 'common_types.h').read_bytes() != header_bytes:
        raise ValueError('generated compile inputs changed')
    obj = (run / 'tables.obj').read_bytes()
    m = load_matcher()
    records = verify_object(obj, m)
    packet = dict(status='COMPILED-TYPED-INITIALIZERS-MATCH', image=IMAGE, anchor_sha256=EXPECTED,
        run=str(run), command=command, tables=records, bytes=49152,
        reference=str(source), reference_sha256=hashlib.sha256(original).hexdigest(),
        header_sha256=hashlib.sha256(header_bytes).hexdigest(),
        generated_source_sha256=hashlib.sha256(candidate.encode()).hexdigest(),
        object_sha256=hashlib.sha256(obj).hexdigest(),
        redistributable_provenance_reviewed=False, independent_review=False, whole_file_identity=False)
    encoded = json.dumps(packet, indent=2) + '\n'
    (run / 'packet.json').write_text(encoded)
    (HERE / 'wavelet_initializer_packet.json').write_text(encoded)
    print('PASS: three typed C initializers recompile to all49,152 target data bytes; not V4')


if __name__ == '__main__':
    main()
