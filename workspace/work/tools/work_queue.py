"""Map inventoried retail functions and rank the existing TUs for worker assignment."""
from collections import defaultdict
import csv
import hashlib
import json
from pathlib import Path

work = Path(__file__).resolve().parents[1]
gfx = work.parents[1]
out = work / 'layout'
inventory_path = gfx.parent / 'glm/data/functions_gfx10.json'
inputs = [inventory_path, work / 'src/tus.txt', work / 'build/bind.json',
          out / 'file_layout.tsv', work / 'proof/source_coverage_current.json',
          out / 'current.json']
inventory = json.loads(inventory_path.read_text())['functions']
bindings = json.loads((work / 'build/bind.json').read_text())
coverage = json.loads((work / 'proof/source_coverage_current.json').read_text())
assert coverage['bind_sha256'] == hashlib.sha256(inputs[2].read_bytes()).hexdigest()
tus = [line.split()[0] for line in inputs[1].read_text().splitlines()
       if line.strip() and not line.lstrip().startswith('#')]
assert len(tus) == len(set(tus))
owners, by_tu, accepted = defaultdict(list), defaultdict(list), defaultdict(list)
for line in inputs[3].read_text().splitlines():
    if line.startswith('#'):
        continue
    tu, symbol, address, evidence, *_ = line.split('\t')
    assert tu in tus, tu
    by_tu[tu].append((symbol, address, evidence))
    if address != '-':
        owners[int(address, 16)].append((tu, symbol, evidence))
for symbol, row in bindings.items():
    if not row['why']:
        accepted[int(row['t'], 16)].append((symbol, row))
retail = {int(row['addr'], 16): row for row in inventory}
assert len(retail) == len(inventory)
function_rows = []
for address in sorted(set(retail) | set(accepted)):
    original = retail.get(address)
    matches = accepted.get(address, [])
    candidates = owners.get(address, [])
    evidence = {r[2] for r in candidates}
    state = ('VERIFIED_EXTENT' if matches else 'BYTE_HIT_ONLY' if 'hit' in evidence
             else 'PINNED_SOURCE_CANDIDATE' if candidates else 'NO_SOURCE_OWNER')
    function_rows.append(dict(
        target=hex(address), inventory_name=original['name'] if original else '-',
        inventory_bytes=original['size'] if original else '',
        verified_extent_bytes=';'.join(map(str, sorted({r['n'] for _, r in matches}))),
        status=state, candidate_tus=';'.join(sorted({r[0] for r in candidates})),
        ownership_evidence=';'.join(sorted(evidence)) or '-',
        verified_objects=';'.join(sorted({r['obj'] for _, r in matches})),
        symbols=';'.join(sorted({r[1] for r in candidates} | {n for n, _ in matches}))))
reserved = {'gfx_d3d/r_jpeg.cpp', 'jpeg-6b/jdatasrc.c',
            'gfx_d3d/r_rendercmds.cpp', 'gfx_d3d/r_image_load_obj.cpp',
            'gfx_d3d/r_utils.cpp', 'gfx_d3d/r_dpvs.cpp', 'gfx_d3d/r_material_load_obj.cpp'}
numeric = {'r_dpvs', 'r_staticmodelcache', 'r_water', 'r_water_load_obj',
           'r_specularityimage', 'r_shadowcookie', 'r_skin_transform',
           'r_xsurface_optimize', 'rb_tess', 'fft', 'com_math', 'com_plane'}
tu_rows = []
for slot, tu in enumerate(tus, 1):
    rows = by_tu[tu]
    pending = [r for r in rows if r[2] != 'bind']
    byte_count = sum(retail.get(int(a, 16), {}).get('size', 0)
                     for _, a, _ in pending if a != '-')
    if tu in reserved:
        role, difficulty, why = 'CODEX_ACTIVE', 'reserved', 'current coordinator work'
    elif tu == 'gfx_d3d/r_scene.cpp':
        role, difficulty, why = 'GEMINI_SCENE_01', 'medium cohort / hard TU', 'five assigned bodies; remaining source frozen'
    elif tu.startswith('jpeg-6b/'):
        role, difficulty, why = 'DEPENDENCY', 'specialist', 'library code; not engine coverage'
    elif not pending:
        role, difficulty, why = 'NO_PENDING_EMITTED_BODY', '-', 'not proof of a complete historical TU'
    elif tu.startswith(('universal/', 'qcommon/', 'win32/')):
        role, difficulty, why = 'COORDINATOR', 'hard', 'shared helpers and cross-TU ABI'
    elif Path(tu).stem in numeric or len(pending) > 15 or byte_count > 4000:
        role, difficulty, why = 'UNASSIGNED', 'hard', 'numeric kernels or large unresolved cohort'
    elif len(pending) <= 3 and byte_count <= 500 and all(a != '-' for _, a, _ in pending):
        role, difficulty, why = 'UNASSIGNED', 'small cohort', 'estimate only; inspect compiler and binding blockers'
    else:
        role, difficulty, why = 'UNASSIGNED', 'medium', 'bounded engine glue; inspect bindings first'
    tu_rows.append(dict(link_slot=slot, tu=tu, assignment=role, complexity=difficulty,
        complexity_reason=why, emitted_symbols=len(rows), accepted_symbols=len(rows)-len(pending),
        pending_symbols=len(pending), pending_known_inventory_bytes=byte_count,
        pending_without_target=sum(a == '-' for _, a, _ in pending),
        source_sha256=hashlib.sha256((work / 'src' / tu).read_bytes()).hexdigest()))

def write(name, rows):
    with (out / name).open('w') as stream:
        writer = csv.DictWriter(stream, fieldnames=list(rows[0]), delimiter='\t', lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)

write('retail_functions.tsv', function_rows)
write('tu_work_queue.tsv', tu_rows)
sections = json.loads(inputs[5].read_text())['retail_sections']
write('section_work_queue.tsv', [dict(
    section=s['name'], file_offset=s['file_offset'], rva=s['rva'], raw_bytes=s['raw_bytes'],
    assignment='COORDINATOR', status='WHOLE_FILE_GATE_OPEN',
    scope='TU queue plus toolchain libraries' if s['name'] == '.text'
          else 'data/resource/linker ownership; do not invent contributors') for s in sections])
summary = dict(
    scope='Inventory and candidate TU ownership; not historical boundary or coverage proof',
    inventory_functions=len(inventory), additional_verified_starts=len(set(accepted)-set(retail)),
    inventory_without_candidate_tu_owner=sum(not owners.get(a) for a in retail),
    candidate_tus=len(tus), cpp_percent=coverage['cpp_percent'],
    warning='Counts include dependencies and aliases. Queue bytes and complexity are diagnostics, not progress.',
    input_sha256={str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs})
(out / 'work_queue.json').write_text(json.dumps(summary, indent=2)+'\n')
assert len(tu_rows) == len(tus) and len(function_rows) >= len(inventory)
assert [r['tu'] for r in tu_rows] == tus
print(json.dumps(summary, indent=2))
