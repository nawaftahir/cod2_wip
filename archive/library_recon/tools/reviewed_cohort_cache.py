"""Reuse a completed cohort proof only with unchanged inputs and verifier closure.

This is historical proof reuse, never a fresh build or fresh CPU execution.
The aggregate still executes all acceptance, accounting and disjointness gates.
"""
import ast
import hashlib
import json
import re
from pathlib import Path
import subprocess
import sys
import capstone
import pefile

ROOT = Path(__file__).resolve().parents[2]
GFX = ROOT / 'gfx'
IMAGES = (
    'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131',
    'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694',
)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def fingerprint(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True).encode()).hexdigest()


def environment():
    paths = set()
    for folder in (GFX / 'tools', GFX / 'target/scratch',
                   ROOT / 'codex/renderer', ROOT / 'glm/tools'):
        paths.update(p for p in folder.rglob('*') if p.suffix in ('.py', '.sh', '.mk'))
    paths.discard(GFX / 'tools/check_ten_percent.py')
    paths.add(ROOT / 'glm/data/functions_gfx10.json')
    paths.add(ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll')
    for folder in (ROOT / 'sdk/sum2004/Include', ROOT / 'sdk/sum2004/Lib',
                   GFX / 'target/scratch/codex19_dxerr/compiler'):
        paths.update(p for p in folder.rglob('*') if p.is_file())
    for module in (capstone, pefile):
        path = Path(module.__file__).resolve()
        paths.add(path)
        if path.name == '__init__.py':
            paths.update(p for p in path.parent.rglob('*') if p.suffix in ('.py', '.so', '.dll'))
    paths.add(Path(sys.executable).resolve())
    images = [subprocess.check_output(
        ['docker', 'image', 'inspect', '--format', '{{.Id}}', image], text=True).strip()
        for image in IMAGES]
    assert images == list(IMAGES)
    return fingerprint({'python': sys.version, 'images': images,
                        'files': {str(p): digest(p) for p in sorted(paths)}})


def state(directory):
    files = {}
    for name in ('clean_packet.json', 'link_packet.json',
                 'clean_fixture_packet.json' if (directory / 'clean_fixture_packet.json').is_file()
                 else 'fixture_packet.json'):
        path = directory / name
        packet = json.loads(path.read_text())
        assert packet['status'] in ('PASS', 'REVIEWABLE')
        files[str(path)] = digest(path)
        for name, expected in packet['files'].items():
            path = ROOT / name
            actual = digest(path)
            assert actual == expected, str(path)
            assert str(path) not in files or files[str(path)] == actual
            files[str(path)] = actual
    # Include directory membership: a newly added source/tool cannot be hidden.
    for path in directory.iterdir():
        if path.suffix in ('.cpp', '.h', '.inc', '.py', '.sh', '.mk'):
            files[str(path)] = digest(path)
    return fingerprint(files)


def load(path, expected):
    assert digest(path) == expected
    packet = json.loads(path.read_text())
    assert packet['status'] == 'REVIEWED-INPUT-SNAPSHOT'
    assert packet['environment'] == environment()
    assert digest(ROOT / packet['completed_audit']) == packet['audit_sha256']
    return packet


def reusable(packet, family, directory):
    return family in packet['cohorts'] and packet['cohorts'][family] == state(directory)


def main():
    assert len(sys.argv) == 4 and sys.argv[1] == '--seal'
    log = Path(sys.argv[2]).resolve()
    text = log.read_text()
    assert text.splitlines()[-1] == 'Draft functions, opaque SDK/CRT library bytes, and whole-file identity excluded.'
    summary = re.search(r'^PASS: disjoint source lower bound (\d+)/1089680 = ([\d.]+)%', text, re.M)
    assert summary and abs(int(summary[1]) / 1089680 * 100 - float(summary[2])) < 0.000001
    tree = ast.parse((GFX / 'tools/check_ten_percent.py').read_text())
    cohorts = {}
    for node in ast.walk(tree):
        if not isinstance(node, ast.Tuple) or len(node.elts) != 7:
            continue
        try:
            row = ast.literal_eval(node)
        except (ValueError, TypeError):
            continue
        if not isinstance(row[0], str) or not row[0].startswith('codex') or not isinstance(row[6], dict):
            continue
        directory = GFX / 'target/scratch' / row[0]
        assert f'Checking {row[0]}: complete byte proof and linked regression' in text
        assert all(digest(directory / name) == value for name, value in row[6].items())
        cohorts[row[0]] = state(directory)
    assert cohorts
    packet = {'status': 'REVIEWED-INPUT-SNAPSHOT', 'source_credit': 0,
              'completed_audit': str(log.relative_to(ROOT)), 'audit_sha256': digest(log),
              'environment': environment(), 'cohorts': cohorts,
              'scope': 'Historical proof reuse only; unchanged full inputs, tools, host packages and pinned images'}
    Path(sys.argv[3]).write_text(json.dumps(packet, indent=2) + '\n')
    assert fingerprint({'x': 'a'}) != fingerprint({'x': 'b'})
    assert fingerprint({'x': 'a'}) != fingerprint({'x': 'a', 'y': 'b'})
    print(f'PASS: sealed{len(cohorts)} reviewed cohort states; changed bytes/membership reject; ZERO new source credit')


if __name__ == '__main__':
    main()
