#!/usr/bin/env python3
"""Replay standard closed-link checks for the clean four-lookup source module."""
import importlib.util
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

import pefile

import check as proof

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
RUN = TARGET / 'build/codex25_dxerr'
spec = importlib.util.spec_from_file_location('codex19_link_check', HERE.parent / 'codex19_dxerr/check_link.py')
prior = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prior)
sha, sources, accepted = prior.sha, prior.sources, prior.accepted


def check_linked_lookup(row):
    entries = [int(m.group(1), 16) for line in (RUN / 'gfx.map').read_text().splitlines()
               if (m := re.search(r'\s' + re.escape(row['symbol']) + r'\s+([0-9a-f]{8}) f', line))]
    ours, = entries
    linked = pefile.PE(str(RUN / 'gfx.dll'))
    target = pefile.PE(str(proof.prior.ANCHOR))
    address, size = int(row['address'], 16), row['section_bytes']
    raw = (ROOT / row['object']).read_bytes()
    coff = proof.load_matcher()['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    fn, = [s for s in symbols.values() if s['name'] == row['symbol'] and s['sec'] > 0]
    sec = coff['sections'][fn['sec'] - 1]
    source = raw[sec['rawptr']:sec['rawptr'] + size]
    a = bytearray(linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, size))
    b = bytearray(target.get_data(address - target.OPTIONAL_HEADER.ImageBase, size))
    assert len(a) == len(b) == size
    relocations = {entry.rva + linked.OPTIONAL_HEADER.ImageBase - ours
                   for block in linked.DIRECTORY_ENTRY_BASERELOC for entry in block.entries
                   if entry.type == 3 and ours <= entry.rva + linked.OPTIONAL_HEADER.ImageBase < ours + size}
    assert relocations == {r['vaddr'] for r in sec['relocs']}
    for relocation in sec['relocs']:
        p, symbol = relocation['vaddr'], symbols[relocation['sym']]
        addend = struct.unpack_from('<I', source, p)[0]
        destination = struct.unpack_from('<I', a, p)[0]
        if symbol['sec'] == fn['sec']:
            proof.prior.require_binding(destination, ours + symbol['value'], addend)
        else:
            data = coff['sections'][symbol['sec'] - 1]
            assert data['name'] == '.rdata' and symbol['value'] == 0 and not data['relocs']
            value = raw[data['rawptr']:data['rawptr'] + data['rawsize']]
            proof.prior.require_bytes(value, linked.get_data(
                destination - addend - linked.OPTIONAL_HEADER.ImageBase, len(value)))
        a[p:p + 4] = b[p:p + 4] = bytes(4)
    proof.prior.require_bytes(a, b)
    return {'symbol': row['symbol'], 'source_va': hex(ours), 'target_va': row['address'],
            'section_bytes': size, 'code_bytes': row['code_bytes'],
            'binding_count': len(sec['relocs']), 'source_object_sha256': sha(ROOT / row['object'])}


def main():
    assert sha(Path(prior.__file__)) == '216442557e67b688d87294e57aea22a92ca081a659302c9950e80230d7102db3'
    canonical = sources(TARGET / 'verified/src')
    snapshot = sources(HERE / 'link_src')
    assert canonical.keys() == snapshot.keys()
    assert all(sha(canonical[name]) == sha(path) for name, path in snapshot.items())
    tus = [line.split('#')[0].split()[0] for line in
           (HERE / 'link_src/tus.txt').read_text().splitlines() if line.split('#')[0].strip()]
    engine_objects = [RUN / 'obj' / Path(name).with_suffix('.obj') for name in tus]
    assert all(snapshot[Path(name)].stat().st_mtime <= obj.stat().st_mtime
               for name, obj in zip(tus, engine_objects))
    library_objects = [RUN / 'libraries' / ('dxerr9_' + stem + '.obj')
                       for stem in ('name', 'name_w', 'description_a', 'description_w')]
    objects = engine_objects + library_objects
    dll = RUN / 'gfx.dll'
    assert max(path.stat().st_mtime for path in objects) <= dll.stat().st_mtime
    dependencies = {**{str(p.relative_to(ROOT)): sha(p) for p in snapshot.values()},
                    **{str(p.relative_to(ROOT)): sha(p)
                       for directory in ('src/shims', 'src/opencod2', 'src/cl', 'src/codex_libraries')
                       for p in sources(TARGET / directory).values()}}
    assert all((ROOT / path).stat().st_mtime <= min(o.stat().st_mtime for o in engine_objects)
               for path in dependencies if Path(path).suffix in ('.h', '.inc'))
    cmp, binder = TARGET.parent / 'tools/cmp.py', TARGET.parent / 'tools/bindcheck.py'
    assert '/FORCE' not in '\n'.join(line.split('#')[0] for line in (TARGET / 'closed.mk').read_text().splitlines()).upper()
    subprocess.run([sys.executable, str(cmp), str(dll), str(RUN / 'gfx.map'),
                    str(proof.prior.ANCHOR), str(RUN / 'cmp.json')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    subprocess.run([sys.executable, str(binder), str(dll), str(RUN / 'gfx.map'),
                    str(proof.prior.ANCHOR), str(RUN / 'cmp.json'), '--json', str(RUN / 'bind_raw.json'),
                    '--pdb', str(RUN / 'gfx.pdb')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    packet = json.loads((HERE / 'packet.json').read_text())
    linked_proofs = [check_linked_lookup(row) for row in packet['clean_rows']]
    comparisons = json.loads((RUN / 'cmp.json').read_text())
    descriptions = {symbol: spec for spec in proof.SPECS
                    if (symbol := spec[1]).startswith('_DXGetErrorDescription')}
    placements = []
    for comparison in comparisons:
        if comparison['name'] not in descriptions:
            continue
        spec = descriptions[comparison['name']]
        assert set(comparison['hits']) == {'0x100efe3c', '0x100f2b25'}
        matches, rejected = [], []
        for candidate in comparison['hits']:
            try:
                proof.certify(spec[0], spec[1], int(candidate, 16), *spec[3:], clean=True)
            except (AssertionError, ValueError) as error:
                rejected.append({'address': candidate, 'reason': str(error)})
            else:
                matches.append(candidate)
        assert matches == [hex(spec[2])] and len(rejected) == 1
        comparison['hits'] = matches
        # The complete source proof verifies the tables too. Only decoded code
        # belongs in a function scan: table bytes can decode as spurious CALLs.
        comparison['size'] = spec[4]
        placements.append({'symbol': comparison['name'], 'selected': matches[0],
                           'code_bytes': spec[4], 'verified_table_bytes_excluded': spec[3] - spec[4],
                           'wrong_width_rejected': rejected})
    assert len(placements) == 2
    (RUN / 'cmp_placed.json').write_text(json.dumps(comparisons, indent=0))
    # Refine only two ambiguous placements using complete source string proofs;
    # the standard binder's code, binding, extent and closure gates stay unchanged.
    subprocess.run([sys.executable, str(binder), str(dll), str(RUN / 'gfx.map'),
                    str(proof.prior.ANCHOR), str(RUN / 'cmp_placed.json'), '--json', str(RUN / 'bind.json'),
                    '--pdb', str(RUN / 'gfx.pdb')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    baseline = TARGET / 'build/v/bind.json'
    old, new = accepted(baseline), accepted(RUN / 'bind.json')
    previous = accepted(TARGET / 'build/codex19_dxerr/bind.json')
    assert len(old) == 359 and len(previous) == 360
    assert all(new.get(name) == interval for name, interval in old.items())
    assert all(new.get(name) == interval for name, interval in previous.items())
    expected = {proof.prior.SYMBOL: (hex(proof.prior.ADDRESS), proof.prior.SECTION_BYTES)}
    expected.update({symbol: (hex(address), size) for _, symbol, address, size, *_ in proof.SPECS})
    expected.update({symbol: (hex(address), code) for _, symbol, address, _, code, _ in proof.SPECS
                     if symbol.startswith('_DXGetErrorDescription')})
    assert new.keys() - old.keys() == expected.keys()
    assert all(new[name] == interval for name, interval in expected.items())
    packet = {'status': 'PASS', 'whole_file_identity': False, 'image': prior.IMAGE,
              'baseline_source_matches': len(old), 'previous_source_matches': len(previous),
              'linked_source_matches': len(new), 'source_match_losses': [],
              'raw_standard_source_matches': len(accepted(RUN / 'bind_raw.json')),
              'data_disambiguated_placements': placements, 'linked_lookup_proofs': linked_proofs,
              'source_dependencies': dependencies,
              'objects': {str(path.relative_to(ROOT)): sha(path) for path in objects},
              'files': {str(path.relative_to(ROOT)): sha(path) for path in (
                  baseline, TARGET / 'build/codex19_dxerr/bind.json', proof.prior.ANCHOR,
                  cmp, binder, TARGET / 'closed.mk', TARGET / 'src/codex_libraries/build.mk',
                  HERE / 'link.mk', Path(__file__), dll, RUN / 'gfx.map', RUN / 'gfx.pdb',
                  RUN / 'cmp.json', RUN / 'cmp_placed.json', RUN / 'bind_raw.json', RUN / 'bind.json')},
              'coverage_note': 'linked table bytes excluded by the dedicated source code proofs'}
    (HERE / 'link_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: clean module linked without FORCE;', len(old), 'baseline and', len(previous),
          'previous source matches preserved;', len(new), 'source matches now; no table credit')


if __name__ == '__main__':
    main()
