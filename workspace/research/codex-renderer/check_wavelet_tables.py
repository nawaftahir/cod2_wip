#!/usr/bin/env python3
"""Compare complete reference Huffman initializers with pinned renderer data."""
import hashlib
import json
import re
import struct

from audit_legacy import ROOT, EXPECTED, load_matcher
from batch_existing import HERE
from check_jpeg_dependencies import raw_target


def main():
    source = ROOT / 'refrences/cod2-mp-macho/rodata.c'
    raw = source.read_bytes()
    text = raw.decode()
    m = load_matcher()
    tables = []
    for name, address in (('waveletDecodeBlue', 0x10182988),
                          ('waveletDecodeRedGreen', 0x10186988),
                          ('waveletDecodeAlpha', 0x1018a988)):
        match = re.search(r'const unsigned char ' + name + r'\[16384\]\s*=\s*\{(.*?)\};', text, re.S)
        if not match:
            raise ValueError('reference initializer missing: ' + name)
        body = re.sub(r'/\*.*?\*/|//[^\n]*', '', match[1], flags=re.S)
        data = bytes(int(value.strip(), 0) for value in body.split(',') if value.strip())
        if len(data) != 16384 or data != raw_target(m, address, 16384):
            raise ValueError('full table differs: ' + name)
        entries = list(struct.iter_unpack('<hh', data))
        tables.append(dict(name=name, address=hex(address), bytes=len(data), entries=len(entries),
            sha256=hashlib.sha256(data).hexdigest(), escape_entries=sum(v == -32768 for v, _ in entries),
            bit_lengths=sorted({bits for _, bits in entries})))
    packet = dict(status='COMPLETE-REFERENCE-DATA-MATCH', anchor_sha256=EXPECTED,
                  source=str(source), source_sha256=hashlib.sha256(raw).hexdigest(), tables=tables,
                  bytes=sum(t['bytes'] for t in tables), compiler_initializer_verified=False,
                  redistributable_provenance_reviewed=False, whole_file_identity=False)
    (HERE / 'wavelet_table_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: three complete reference Huffman tables /49,152 bytes; not compiled source proof or V4')


if __name__ == '__main__':
    main()
