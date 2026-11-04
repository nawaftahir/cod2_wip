#!/usr/bin/env python3
"""Replay source-cluster link bytes/bindings; never claim retail layout or decoder match."""
import hashlib
import json
from pathlib import Path
import re
import struct

from audit_legacy import load_matcher
from batch_existing import HERE, IMAGE
from check_jpeg_dependencies import raw_target, require_binding
from check_shape import branch_fields
from verify_wavelet_initializers import recheck_packet


def main():
    packet = json.loads((HERE / 'wavelet_link_packet.json').read_text())
    assert packet['image'] == IMAGE
    dll = Path(packet['dll'])
    raw = dll.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == packet['dll_sha256']
    run = dll.parent
    mapping = (run / 'wavelet.map').read_text(errors='replace')
    names = list(packet['symbols']) + ['_Wavelet_ApplyDelta', '_Wavelet_DecodeValue']
    owned = {}
    for name in names:
        values = re.findall(r'^\s*[0-9a-fA-F]+:[0-9a-fA-F]+\s+' + re.escape(name) +
                            r'\s+([0-9a-fA-F]+)\b', mapping, flags=re.M)
        assert len(values) == 1
        owned[name] = int(values[0], 16)
    probe = load_matcher()
    probe['_d'] = raw
    probe['SECS'] = probe['pe_sections']()
    reference = HERE / 'scratch/wavelet_delta_order'
    tables = recheck_packet(load_matcher(), reference / 'common_types.h')
    assert tables == packet['table_proof']
    for table in tables['tables']:
        content = raw_target(probe, owned[table['symbol']], table['bytes'])
        assert hashlib.sha256(content).hexdigest() == table['sha256']
    objpath = HERE / 'baseline_jpeg_1v2df6oy/job000.obj'
    obj = objpath.read_bytes()
    assert hashlib.sha256(obj).hexdigest() == packet['functions_object_sha256']
    inputs = json.loads((objpath.parent / 'inputs.json').read_text())
    for name, digest in inputs['dependencies'].items():
        assert hashlib.sha256((reference / name).read_bytes()).hexdigest() == digest
    coff = probe['parse_coff'](obj)
    symbol = next(s for s in coff['symbols'] if s['name'] == '_Wavelet_ApplyDelta')
    section = coff['sections'][symbol['sec'] - 1]
    assert section['rawsize'] == 134 and symbol['value'] == 0
    candidate = bytearray(obj[section['rawptr']:section['rawptr'] + 134])
    address = owned['_Wavelet_ApplyDelta']
    linked = bytearray(raw_target(probe, address, 134))
    branches = branch_fields(linked, address)
    symbols = {s['idx']: s['name'] for s in coff['symbols']}
    bindings = []
    for relocation in section['relocs']:
        offset = relocation['vaddr']
        name = symbols[relocation['sym']]
        addend = struct.unpack_from('<I', candidate, offset)[0]
        actual = branches[offset] if relocation['type'] == 20 else struct.unpack_from('<I', linked, offset)[0]
        require_binding(actual, owned[name], addend)
        bindings.append(dict(offset=offset, symbol=name, actual=hex(actual)))
        candidate[offset:offset + 4] = linked[offset:offset + 4] = b'\0' * 4
    assert len(bindings) == 4 and candidate == linked
    output = dict(status='SOURCE-LINK-BYTES-AND-BINDINGS-PASS', link_proof=packet,
        code_bytes=134, data_bytes=49152, bindings=bindings,
        actual_symbols={k: hex(v) for k, v in owned.items()},
        retail_layout=False, decoder_matched=False, whole_file_identity=False)
    (HERE / 'wavelet_link_checked.json').write_text(json.dumps(output, indent=2) + '\n')
    print('PASS: linked134-byte helper retains code and all4 real bindings; all49,152 table bytes retained')
    print('Partial source-link proof only; generic/outer decoder and retail DLL remain unfinished')


if __name__ == '__main__':
    main()
