"""Write a measured renderer meter after the clean byte/binding gates pass."""
from pathlib import Path
import hashlib
import json
import subprocess
import sys
import pefile
from renderer_paths import ROOT, retail_anchor
from tu_metrics import measure, selftest


def covered(spans):
    end = total = 0
    for left, right in sorted(spans):
        if right > end:
            total += right - max(left, end)
            end = right
    return total


assert covered([(1, 4), (3, 6), (1, 2)]) == 5
selftest()
subprocess.run([sys.executable, str(ROOT / 'tools/check_verified_source.py')], check=True)
work = ROOT / 'workspace/work'
build = ROOT / 'workspace/build/codex_boundsoutside_1016_02'
started = int(sys.argv[1])
tus = [line.split()[0] for line in (work / 'src/tus.txt').read_text().splitlines()
       if line.strip() and not line.startswith('#')]
for tu in tus:
    obj = build / 'obj' / Path(tu).with_suffix('.obj')
    assert obj.is_file() and obj.stat().st_mtime >= started, ('object was not rebuilt', str(obj))
subprocess.run([sys.executable, str(work / 'tools/check_checkpoint.py'), str(build / 'bind.json')], check=True)
coverage = json.loads((work / 'proof/source_coverage_current.json').read_text())
bind = json.loads((build / 'bind.json').read_text())
assert coverage['bind_sha256'] == hashlib.sha256((build / 'bind.json').read_bytes()).hexdigest()
layout = json.loads((work / 'layout/current.json').read_text())
reference = json.loads((ROOT / 'data/migration_baseline.json').read_text())
assert coverage['cpp_executable_bytes'] >= reference['cpp_bytes'], 'C/C++ regression'
old_bind = ROOT / 'build/baseline-bind.json'
old_meter = ROOT / 'build/baseline-meter.json'
if not old_bind.is_file():
    old_bind = ROOT / 'ledger/bind.json'
    old_meter = ROOT / 'ledger/meter.json'
if old_bind.is_file():
    baseline = json.loads(old_bind.read_text())
    required = {(int(row['t'], 16), row['n']) for row in baseline.values() if not row['why']}
    actual = {(int(row['t'], 16), row['n']) for row in bind.values() if not row['why']}
    assert required <= actual, ('accepted extents lost', sorted(required - actual))
if old_meter.is_file():
    assert coverage['cpp_executable_bytes'] >= json.loads(old_meter.read_text())['game_cpp_bytes'], 'meter regression'

anchor = retail_anchor().read_bytes()
candidate = (build / 'gfx.dll').read_bytes()
pe = pefile.PE(data=anchor, fast_load=True)
accepted = {(int(row['t'], 16), row['n']) for row in bind.values() if not row['why']}
sections = {}
for section in pe.sections:
    name = section.Name.rstrip(b'\0').decode()
    offset, size = section.PointerToRawData, section.SizeOfRawData
    address = pe.OPTIONAL_HEADER.ImageBase + section.VirtualAddress
    spans = [(max(address, va), min(address + size, va + n)) for va, n in accepted
             if va < address + size and va + n > address]
    sections[name] = dict(size=size, same_offset=sum(a == b for a, b in zip(
        anchor[offset:offset + size], candidate[offset:offset + size])))
    if name == '.text':
        sections[name]['matched'] = covered(spans)
same_offset = sum(a == b for a, b in zip(anchor, candidate))
assert same_offset == layout['same_file_offset_equal_bytes'], 'layout counter disagrees'
assert len({va for va, n in accepted}) == len(accepted), 'conflicting function extents'
assert coverage['cpp_percent'] == 100 * coverage['cpp_executable_bytes'] / coverage['game_denominator']
manifest = json.loads((ROOT / 'proof/verified_source_20261102/manifest.json').read_text())
meter = dict(name='renderer 1.0', binary='gfx_d3d_mp_x86_s.dll', version='1.0',
             anchor='windows/1.0/gfx_d3d_mp_x86_s.dll', sha_identical=candidate == anchor,
             text_bytes=sections['.text']['size'], matched_bytes=sections['.text']['matched'],
             file_bytes=len(anchor), same_offset_bytes=same_offset,
             matched_functions=len(accepted), tus_total=len(tus),
             verified_source_files=len(manifest['files']),
             game_cpp_denominator_status='provisional inventory; not whole-DLL completion',
             anchor_sha256=hashlib.sha256(anchor).hexdigest(),
             candidate_sha256=hashlib.sha256(candidate).hexdigest(),
             unverified_in_src=0, game_cpp_bytes=coverage['cpp_executable_bytes'],
             game_cpp_total=coverage['game_denominator'], game_cpp_percent=coverage['cpp_percent'],
             game_cpp_functions=coverage['cpp_game_bodies'],
             assembly_bytes=sum(row['bytes'] for row in coverage['excluded_assembly_bodies']),
             assembly_functions=len(coverage['excluded_assembly_bodies']),
             sections=sections, source_commit=subprocess.check_output(
                 ['git', '-C', str(ROOT), 'rev-parse', 'HEAD'], text=True).strip(),
             note='Matched extents include libraries and relocation normalization, not identical linked files. Verified source snapshots are not current identical TUs. game_cpp uses a provisional inventory and excludes entire assembly-bearing bodies. Whole-file SHA is the finish line.')
meter.update(measure(tus, json.loads((build / 'cmp.json').read_text()), bind))
(ROOT / 'build').mkdir(exist_ok=True)
(ROOT / 'build/meter.json').write_text(json.dumps(meter, indent=2) + '\n')
(ROOT / 'build/summary.md').write_text(
    f"Renderer C/C++: {meter['game_cpp_bytes']}/{meter['game_cpp_total']} "
    f"({meter['game_cpp_percent']:.6f}%).\n\n"
    f"Whole-file same offset: {meter['same_offset_bytes']}/{len(anchor)} bytes. "
    f"SHA identical: {meter['sha_identical']}.\n\n"
    f"Fresh source objects: {len(tus)}. Verified-only src violations: 0.\n")
print((ROOT / 'build/summary.md').read_text())
