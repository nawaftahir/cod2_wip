#!/usr/bin/env python3
"""Verify private linked source, pinned alias placements and unchanged regression gates."""
import contextlib
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys

import pefile

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
RUN = TARGET / 'build/codex35_sdk'


def load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    old_check = HERE.parent / 'codex25_dxerr/check.py'
    old_link = HERE.parent / 'codex25_dxerr/check_link.py'
    assert sha(old_check) == 'bd7d15d998485deaf357712eddc0ef4ab5bdfe673e651637e4ca8d9a8f23784e'
    assert sha(old_link) == 'bbe00a4c3187a55b85f2be4a1e100c2509a4bb7cb1727112a39103f0f1ecf1b8'
    lookup = load(old_check, 'existing_lookup_proof')
    sys.modules['check'] = lookup
    previous = load(old_link, 'existing_lookup_link')
    previous.RUN = RUN
    baseline = previous.accepted(TARGET / 'build/codex25_dxerr/bind.json')
    assert len(baseline) == 363
    canonical = previous.sources(TARGET / 'verified/src')
    snapshot = previous.sources(TARGET / 'scratch/codex25_dxerr/link_src')
    assert canonical.keys() == snapshot.keys()
    assert all(sha(path) == sha(canonical[name]) for name, path in snapshot.items())
    objects = list((RUN / 'obj').rglob('*.obj')) + list((RUN / 'libraries').glob('*.obj'))
    dll = RUN / 'gfx.dll'
    assert max(p.stat().st_mtime for p in objects) <= dll.stat().st_mtime
    anchor = lookup.prior.ANCHOR
    compare, binder = TARGET.parent / 'tools/cmp.py', TARGET.parent / 'tools/bindcheck.py'
    subprocess.run([sys.executable, str(compare), str(dll), str(RUN / 'gfx.map'),
                    str(anchor), str(RUN / 'cmp.json')], check=True, capture_output=True)
    comparisons = json.loads((RUN / 'cmp.json').read_text())
    source_packet = json.loads((HERE / 'packet.json').read_text())
    methods = {r['symbol']: r for r in source_packet['rows']}
    placements = []
    for row in comparisons:
        if row['name'] in methods:
            proof = methods[row['name']]
            assert row['size'] == proof['bytes'] and proof['address'] in row['hits']
            row['hits'] = [proof['address']]
            placements.append({'symbol': row['name'], 'address': proof['address'],
                               'identity': proof['identity']})
        if row['name'].startswith('_DXGetErrorDescription9'):
            spec, = [s for s in lookup.SPECS if s[1] == row['name']]
            accepted, rejected = [], []
            for candidate in row['hits']:
                try:
                    lookup.certify(spec[0], spec[1], int(candidate, 16), *spec[3:], clean=True)
                except (AssertionError, ValueError):
                    rejected.append(candidate)
                else:
                    accepted.append(candidate)
            assert accepted == [hex(spec[2])] and len(rejected) == 1
            row['hits'], row['size'] = accepted, spec[4]
    assert len(placements) == 37
    map_text = (RUN / 'gfx.map').read_text()
    linked = pefile.PE(str(dll))
    retail = pefile.PE(str(anchor))
    for proof in source_packet['rows']:
        entries = [int(m.group(1), 16) for line in map_text.splitlines()
                   if (m := re.search(r'\s' + re.escape(proof['symbol']) + r'\s+([0-9a-f]{8}) f', line))]
        ours, = entries
        a = linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, proof['bytes'])
        b = retail.get_data(int(proof['address'], 16) - retail.OPTIONAL_HEADER.ImageBase, proof['bytes'])
        assert a == b and len(a) == proof['bytes']
        assert not any(ours <= entry.rva + linked.OPTIONAL_HEADER.ImageBase < ours + len(a)
                       for block in linked.DIRECTORY_ENTRY_BASERELOC for entry in block.entries if entry.type == 3)
    old_packet = json.loads((old_check.parent / 'packet.json').read_text())
    linked_lookups = []
    for row in old_packet['clean_rows']:
        row = row | {'object': str((RUN / 'libraries' / Path(row['object']).name).relative_to(ROOT))}
        linked_lookups.append(previous.check_linked_lookup(row))
    (RUN / 'cmp_placed.json').write_text(json.dumps(comparisons, indent=0))
    for source, output in [('cmp.json', 'bind_raw.json'), ('cmp_placed.json', 'bind.json')]:
        subprocess.run([sys.executable, str(binder), str(dll), str(RUN / 'gfx.map'), str(anchor),
                        str(RUN / source), '--json', str(RUN / output), '--pdb', str(RUN / 'gfx.pdb')],
                       check=True, capture_output=True)
    accepted = previous.accepted(RUN / 'bind.json')
    assert all(accepted.get(name) == interval for name, interval in baseline.items())
    expected = {r['symbol']: (r['address'], r['bytes']) for r in source_packet['rows']}
    assert accepted.keys() - baseline.keys() == expected.keys()
    assert all(accepted[name] == interval for name, interval in expected.items())
    paths = [*objects, *snapshot.values(), compare, binder, TARGET / 'closed.mk',
             HERE / 'packet.json', HERE / 'link.mk', HERE / 'build.sh', Path(__file__),
             TARGET / 'src/codex_libraries/shader_build.mk',
             *(RUN / n for n in ['gfx.dll', 'gfx.map', 'gfx.pdb', 'cmp.json', 'cmp_placed.json',
                                 'bind.json', 'bind_raw.json'])]
    packet = {'status': 'PASS', 'whole_file_identity': False,
              'baseline_source_matches': 363, 'linked_source_matches': len(accepted),
              'raw_standard_source_matches': len(previous.accepted(RUN / 'bind_raw.json')),
              'source_match_losses': [], 'placements': placements, 'linked_lookups': linked_lookups,
              'files': {str(p.relative_to(ROOT)): sha(p) for p in paths}}
    (HERE / 'link_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(accepted), 'private linked source matches; all 363 previous matches preserved')


if __name__ == '__main__':
    main()
