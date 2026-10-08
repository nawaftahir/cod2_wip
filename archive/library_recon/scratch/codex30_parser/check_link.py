#!/usr/bin/env python3
"""Private parser link proof; standard binding gates and prior source regression."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

import pefile

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
RUN = TARGET / 'build/codex30_parser'
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(TARGET.parent / 'tools')]
from audit_legacy import load_matcher
from check_shape import branch_fields


def load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    lookup = load(HERE.parent / 'codex25_dxerr/check.py', 'lookup_proof')
    sys.modules['check'] = lookup
    old = load(HERE.parent / 'codex25_dxerr/check_link.py', 'lookup_link')
    old.RUN = RUN
    baseline = old.accepted(TARGET / 'build/codex35_sdk/bind.json')
    assert len(baseline) == 400
    snapshot = old.sources(TARGET / 'scratch/codex25_dxerr/link_src')
    canonical = old.sources(TARGET / 'verified/src')
    assert snapshot.keys() == canonical.keys()
    assert all(sha(p) == sha(canonical[n]) for n, p in snapshot.items())
    parsers = json.loads((HERE / 'clean_packet.json').read_text())
    helpers = json.loads((HERE.parent / 'codex35_sdk/packet.json').read_text())
    assert parsers['verified_instruction_bytes'] == 6082
    assert all(sha(ROOT / p) == h for p, h in parsers['files'].items())
    dll, mapfile = RUN / 'gfx.dll', RUN / 'gfx.map'
    text = mapfile.read_text()
    linked = pefile.PE(str(dll))
    retail = pefile.PE(str(lookup.prior.ANCHOR))
    m = load_matcher()
    map_symbols = {}
    for line in text.splitlines():
        match = re.match(r'\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$', line)
        if match:
            map_symbols[match[1]] = (int(match[2], 16), match[3])
    linked_parsers, literal_ends = [], {}
    for row in parsers['rows']:
        ours, owner = map_symbols[row['symbol']]
        assert owner == Path(row['object']).name and ':' not in owner
        raw = (ROOT / row['object']).read_bytes()
        c = m['parse_coff'](raw)
        names = {s['idx']: s for s in c['symbols']}
        fn, = [s for s in names.values() if s['name'] == row['symbol'] and s['sec'] > 0]
        sec = c['sections'][fn['sec'] - 1]
        source = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
        a = bytearray(linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, row['section_bytes']))
        b = bytearray(retail.get_data(int(row['address'], 16) - 0x10000000, row['section_bytes']))
        expected_abs = {r['vaddr'] for r in sec['relocs'] if r['type'] == 6}
        actual_abs = {e.rva + linked.OPTIONAL_HEADER.ImageBase - ours
                      for block in linked.DIRECTORY_ENTRY_BASERELOC for e in block.entries
                      if e.type == 3 and ours <= e.rva + linked.OPTIONAL_HEADER.ImageBase < ours + len(a)}
        assert actual_abs == expected_abs
        branches = branch_fields(a[:row['bytes']], ours)
        for r in sec['relocs']:
            p, s = r['vaddr'], names[r['sym']]
            addend = struct.unpack_from('<I', source, p)[0]
            actual = branches[p] if r['type'] == 20 else struct.unpack_from('<I', a, p)[0]
            destination = ours + s['value'] if s['sec'] == fn['sec'] else map_symbols[s['name']][0]
            lookup.prior.require_binding(actual, destination, addend)
            # Source strings are not merely masked pointers: compare their linked contents.
            if s['name'].startswith('??_C@'):
                data = c['sections'][s['sec'] - 1]
                assert source is not None and not data['relocs']
                assert raw[data['rawptr']:data['rawptr'] + data['rawsize']] == linked.get_data(
                    destination - linked.OPTIONAL_HEADER.ImageBase, data['rawsize'])
                literal_ends[s['name']] = {'address': destination, 'bytes': data['rawsize'],
                                          'object': row['object']}
            a[p:p + 4] = b[p:p + 4] = bytes(4)
        assert a == b and len(a) == row['section_bytes']
        linked_parsers.append({'symbol': row['symbol'], 'source_va': hex(ours),
                               'retail_va': row['address'], 'source_object': owner,
                               'instruction_bytes': row['bytes'], 'full_section_bytes': len(a)})
    compare, binder = TARGET.parent / 'tools/cmp.py', TARGET.parent / 'tools/bindcheck.py'
    subprocess.run([sys.executable, str(compare), str(dll), str(mapfile),
                    str(lookup.prior.ANCHOR), str(RUN / 'cmp.json')], check=True, capture_output=True)
    comparisons = json.loads((RUN / 'cmp.json').read_text())
    placements = {r['symbol']: r for r in helpers['rows'] + parsers['rows']}
    for row in comparisons:
        if row['name'] in placements:
            proof = placements[row['name']]
            assert proof['address'] in row['hits']
            row['hits'], row['size'] = [proof['address']], proof['bytes']
        if row['name'].startswith('_DXGetErrorDescription9'):
            spec, = [s for s in lookup.SPECS if s[1] == row['name']]
            found = []
            for hit in row['hits']:
                try:
                    lookup.certify(spec[0], spec[1], int(hit, 16), *spec[3:], clean=True)
                except (AssertionError, ValueError):
                    pass
                else:
                    found.append(hit)
            assert found == [hex(spec[2])]
            row['hits'], row['size'] = found, spec[4]
    (RUN / 'cmp_placed.json').write_text(json.dumps(comparisons, indent=0))
    # The map omits ends of COFF literal sections. Supply only proven data extents;
    # otherwise the generic binder compares unrelated SDK bytes following a string.
    rdata, = [s for s in linked.sections if s.Name.rstrip(b'\0') == b'.rdata']
    refined = text
    for name, extent in literal_ends.items():
        end = extent['address'] + extent['bytes']
        relative = end - linked.OPTIONAL_HEADER.ImageBase - rdata.VirtualAddress
        assert relative >= 0
        refined += '\n 0002:%08x %s$coff_end %08x literal_extent:COFF\n' % (relative, name, end)
    (RUN / 'gfx_placed.map').write_text(refined)
    for cmpname, mapname, result in [('cmp.json', 'gfx.map', 'bind_raw.json'),
                                     ('cmp_placed.json', 'gfx_placed.map', 'bind.json')]:
        subprocess.run([sys.executable, str(binder), str(dll), str(RUN / mapname), str(lookup.prior.ANCHOR),
                        str(RUN / cmpname), '--json', str(RUN / result), '--pdb', str(RUN / 'gfx.pdb')],
                       check=True, capture_output=True)
    accepted = old.accepted(RUN / 'bind.json')
    losses = {n: v for n, v in baseline.items() if accepted.get(n) != v}
    assert not losses, losses
    parser_results = {r['symbol']: accepted.get(r['symbol']) for r in parsers['rows']}
    assert all(parser_results[r['symbol']] == (r['address'], r['bytes']) for r in parsers['rows']), parser_results
    paths = [Path(__file__), HERE / 'build.sh', HERE / 'link.mk', HERE / 'select_dependencies.py',
             HERE / 'clean_packet.json', HERE / 'dependency_selection.json', TARGET / 'closed.mk',
             compare, binder, *snapshot.values(), *list((RUN / 'obj').rglob('*.obj')),
             *list((RUN / 'libraries').glob('*.obj')), RUN / 'dependencies/d3dx9.lib',
             *(RUN / n for n in ['gfx.dll', 'gfx.map', 'gfx_placed.map', 'gfx.pdb', 'cmp.json', 'cmp_placed.json', 'bind.json', 'bind_raw.json'])]
    assert max(p.stat().st_mtime for p in (RUN / 'libraries').glob('*.obj')) <= dll.stat().st_mtime
    packet = {'status': 'PASS', 'whole_file_identity': False, 'baseline_source_matches': 400,
              'linked_source_matches': len(accepted), 'source_match_losses': [],
              'linked_parsers': linked_parsers, 'dependency_source_credit': 0,
              'coff_literal_extents': literal_ends,
              'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
    (HERE / 'link_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(accepted), 'private linked source matches; all 400 previous matches preserved')


if __name__ == '__main__':
    main()
