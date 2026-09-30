#!/usr/bin/env python3
"""Replay the standard closed-link referees and preserve every baseline match."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
RUN = TARGET / 'build/codex19_dxerr'
ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
IMAGE = 'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def sources(directory):
    return {p.relative_to(directory): p for p in directory.rglob('*')
            if p.is_file() and p.suffix in ('.c', '.cpp', '.h', '.inc', '.txt')}


def accepted(path):
    return {name: (row['t'], row['n']) for name, row in json.loads(path.read_text()).items()
            if not row['why'] and ':' not in row['obj']}


def main():
    baseline = TARGET / 'build/v/bind.json'
    canonical = sources(TARGET / 'verified/src')
    snapshot = sources(HERE / 'link_src')
    assert canonical.keys() == snapshot.keys()
    assert all(sha(canonical[name]) == sha(path) for name, path in snapshot.items())
    tus = [line.split('#')[0].split()[0] for line in
           (HERE / 'link_src/tus.txt').read_text().splitlines() if line.split('#')[0].strip()]
    objects = [RUN / 'obj' / Path(name).with_suffix('.obj') for name in tus]
    assert all(snapshot[Path(name)].stat().st_mtime <= obj.stat().st_mtime
               for name, obj in zip(tus, objects))
    extra = HERE / 'group_4035_sdk_leaf.obj'
    objects.append(extra)
    dll = RUN / 'gfx.dll'
    assert max(p.stat().st_mtime for p in objects) <= dll.stat().st_mtime
    dependencies = {**{str(p.relative_to(ROOT)): sha(p) for p in snapshot.values()},
                    **{str(p.relative_to(ROOT)): sha(p)
                       for directory in ('src/shims', 'src/opencod2', 'src/cl')
                       for p in sources(TARGET / directory).values()}}
    assert all((ROOT / p).stat().st_mtime <= min(o.stat().st_mtime for o in objects[:-1])
               for p in dependencies if Path(p).suffix in ('.h', '.inc'))
    cmp = TARGET.parent / 'tools/cmp.py'
    binder = TARGET.parent / 'tools/bindcheck.py'
    subprocess.run([sys.executable, str(cmp), str(dll), str(RUN / 'gfx.map'),
                    str(ANCHOR), str(RUN / 'cmp.json')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    subprocess.run([sys.executable, str(binder), str(dll), str(RUN / 'gfx.map'),
                    str(ANCHOR), str(RUN / 'cmp.json'), '--json', str(RUN / 'bind.json'),
                    '--pdb', str(RUN / 'gfx.pdb')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    old, new = accepted(baseline), accepted(RUN / 'bind.json')
    assert len(old) == 359
    assert all(new.get(name) == interval for name, interval in old.items())
    assert new.keys() - old.keys() == {'_DXGetErrorString9A@4'}
    assert new['_DXGetErrorString9A@4'] == ('0x100cc81b', 72524)
    packet = {
        'status': 'PASS', 'whole_file_identity': False, 'image': IMAGE,
        'baseline_source_matches': len(old), 'linked_source_matches': len(new),
        'source_match_losses': [], 'baseline_bind_sha256': sha(baseline),
        'source_dependencies': dependencies,
        'objects': {str(p.relative_to(ROOT)): sha(p) for p in objects},
        'files': {str(p.relative_to(ROOT)): sha(p) for p in (
            ANCHOR, cmp, binder, TARGET / 'closed.mk', HERE / 'link.mk',
            Path(__file__), dll, RUN / 'gfx.map', RUN / 'gfx.pdb',
            RUN / 'cmp.json', RUN / 'bind.json')},
        'coverage_note': '72524 linked bytes include tables; only the dedicated code proof earns credit',
    }
    (HERE / 'link_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS: no-FORCE closed link preserves', len(old), 'baseline source matches;',
          len(new), 'accepted source functions; table bytes receive no credit')


if __name__ == '__main__':
    main()
