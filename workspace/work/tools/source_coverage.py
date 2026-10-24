"""Subtract authored assembly bodies from the unchanged referee's game meter."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

import capstone
import pefile

work = Path(__file__).resolve().parents[1]
gfx = work.parents[1]
build = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else (work / 'build').resolve()
report = json.loads(subprocess.check_output(
    [sys.executable, str(work / 'tools/regression.py'), str(build / 'bind.json')], text=True))
bindings = json.loads((build / 'bind.json').read_text())
anchor = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'

# These are the only authored assembly definitions in this source snapshot.
allowed = {
    'universal/com_math.h': 'dae8001e68bd0cb4d03066b214d2d49a0b7cadecafdbd955178b7835145c9091',
    'universal/com_shared.cpp': 'd19acbee13742932acea6b76556326489b6fce44ed742acccfa59072770818a3',
    'universal/box_on_plane_side_x86.inc': '01447f1d547da40d7d228d91157964b259f8ad8180074b6a95f0df332771328d',
    'gfx_d3d/rb_backend.cpp': '9a933e7f0393c89446d41205a3b36f85b68c597e43b35239babf2d6646b82e8a',
    'compat/msvc71.h': '8b793ebbd41492a4289a9d26c7f39543022351c2e847273bfd68ec96f3598dab',
}
sources = {}
for path in (work / 'src').rglob('*'):
    if not path.is_file():
        continue
    relative = path.relative_to(work / 'src').as_posix()
    sources[relative] = hashlib.sha256(path.read_bytes()).hexdigest()
    if relative in allowed:
        assert sources[relative] == allowed[relative], ('assembly source changed; re-review required', relative)
    if path.suffix not in ('.cpp', '.c', '.h', '.inc', '.inl'):
        continue
    source = path.read_text()
    source = re.sub(r'/\*.*?\*/|//[^\n]*', '', source, flags=re.S)
    if re.search(r'\b(?:__asm|__asm__|_asm|_emit)\b', source):
        assert relative in allowed, ('unreviewed assembly source', relative)
    assert path.stat().st_mtime <= (build / 'gfx.dll').stat().st_mtime, ('source newer than build', relative)

memory = (work / 'src/universal/com_shared.cpp').read_text()
assert not (work / 'src/cltus.txt').exists(), 'Review any newly added external engine TUs before accounting'
for entry in (work / 'src/tus.txt').read_text().splitlines():
    entry = entry.split('#', 1)[0].split()
    if entry:
        assert (work / 'src' / entry[0]).resolve().is_relative_to((work / 'src').resolve()), entry
for function in ('_copyDWord', 'Com_Memcpy', 'Com_Memset'):
    assert re.search(r'__declspec\(noinline\) void ' + function + r'\s*\(', memory), function
box = (work / 'src/universal/box_on_plane_side_x86.inc').read_text()
assert '__declspec( naked ) int BoxOnPlaneSide' in box
math = (work / 'src/universal/com_math.h').read_text()
assert '__asm fistp result' in math and '\n\t\tfsincos\n' in math
backend = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
assert '__asm rdtsc' in backend

rows = {}
for name, row in bindings.items():
    address = int(row['t'], 16)
    if row['why'] or '@std@@' in name or Path(row['obj'].replace('\\', '/')).name in report['dependency_objects'] or not (
            0x10001000 <= address < 0x10041db0 or 0x10057990 <= address < 0x10062200):
        continue
    assert address not in rows or rows[address]['n'] == row['n']
    rows[address] = dict(row, name=name)
assert sum(row['n'] for row in rows.values()) - report['excluded_new_embedded_table_bytes'] == report['bytes']
assert len(rows) == report['functions']

direct = {0x1005da30: 567, 0x1005ea60: 138, 0x1005eaf0: 295, 0x1005ec20: 170}
pe = pefile.PE(str(anchor), fast_load=True)
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
excluded = []
for address, row in sorted(rows.items()):
    instructions = list(decoder.disasm(pe.get_data(address - pe.OPTIONAL_HEADER.ImageBase, row['n']), address))
    reasons = sorted({ins.mnemonic for ins in instructions
                      if ins.mnemonic in ('rdtsc', 'fsincos') or ins.mnemonic.startswith('fist')})
    if address in direct:
        assert row['n'] == direct[address]
        reasons.append('explicit out-of-line assembly')
    if reasons:
        excluded.append(dict(target=hex(address), bytes=row['n'], name=row['name'], reasons=reasons))
assert set(direct) <= set(rows)
assert len(excluded) == 31 and sum(row['bytes'] for row in excluded) == 7787
cpp = report['bytes'] - sum(row['bytes'] for row in excluded)
print(json.dumps(dict(
    status='authored-assembly attribution; not whole-file identity',
    policy='Entire containing bodies excluded; C/C++ intrinsics and calls to out-of-line helpers remain C/C++.',
    game_denominator=report['total'], mixed_executable_bytes=report['bytes'],
    cpp_executable_bytes=cpp, cpp_percent=100*cpp/report['total'],
    cpp_game_bodies=len(rows)-len(excluded),
    bytes_needed_for_40_percent=max(0, (report['total']*40+99)//100-cpp),
    excluded_assembly_bodies=excluded,
    memory_helpers_cannot_inline=True, naked_box_separate=True,
    scope='current authored source tree; original compiler/SDK/library internals are dependencies',
    counter_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    regression_sha256=hashlib.sha256((work / 'tools/regression.py').read_bytes()).hexdigest(),
    bind_sha256=hashlib.sha256((build / 'bind.json').read_bytes()).hexdigest(),
    source_sha256=sources), indent=2))
