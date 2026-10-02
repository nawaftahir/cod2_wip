#!/usr/bin/env python3
"""Conservative, address-deduplicated renderer source-coverage checkpoint."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
GFX = ROOT / 'gfx'
OLD = ROOT / 'codex/renderer'
ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
TARGET = GFX / 'target'
# Frozen 09-28 snapshot of verified/src: the root of the private-gain proof chain below.
RUN = TARGET / 'build/v_base_0928'
LIVE_RUN = TARGET / 'build/v'
PACKETS = (
    'jpeg_dependency_packet.json',
    'jpeg_entropy_packet.json',
    'jpeg_quantizer_packet.json',
    'jpeg_constructor_packet.json',
    'jpeg_dimensions_packet.json',
    'jpeg_startup_packet.json',
    'jpeg_marker_block_packet.json',
    'jpeg_color_callbacks_packet.json',
    'jpeg_loader_packet.json',
    'jpeg_input_block_packet.json',
    'jpeg_renderer_bridge_packet.json',
)
ANCHOR_SHA = '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
DENOMINATOR = 1089680


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def disjoint(intervals):
    ordered = sorted(intervals)
    overlap = [((a, n), (b, m)) for (a, n), (b, m) in zip(ordered, ordered[1:])
               if b < a + n]
    assert not overlap, overlap


def checked_object(packet, run):
    inputs = packet['inputs']
    recorded = json.loads((run / 'inputs.json').read_text())
    assert inputs == recorded and inputs['image'] == IMAGE
    assert not inputs.get('reused_objects_from')
    assert all(sha(Path(inputs['reference']) / name) == digest
               for name, digest in inputs['dependencies'].items())
    assert sha(run / 'job000.obj') == packet['object_sha256']
    assert packet['object_sha256'] in {row['object_sha256']
                                       for row in json.loads((run / 'results.json').read_text())}


def main():
    assert sha(ANCHOR) == ANCHOR_SHA
    assert sha(TARGET / 'src/codex_drawgroups/gfx_d3d/r_splitscreen.cpp') == (
        '10601fdeb692bc831120dfc53121894bf1c7185205c5de6c4d5052b0b4e1ea9a')
    jpeg = {}
    for name in PACKETS:
        packet = json.loads((OLD / name).read_text())
        assert packet['anchor_sha256'] == ANCHOR_SHA
        run = Path(packet.get('run') or packet['objects_from'])
        inputs = json.loads((run / 'inputs.json').read_text())
        assert packet['image'] == inputs['image'] == IMAGE
        reference = Path(inputs['reference'])
        assert all(sha(reference / path) == digest
                   for path, digest in inputs['dependencies'].items())
        results = json.loads((run / 'results.json').read_text())
        assert all(sha(run / (row['job'] + '.obj')) == row['object_sha256']
                   for row in results)
        if packet.get('object_sha256'):
            assert packet['object_sha256'] in {row['object_sha256'] for row in results}
        for row in packet.get('functions', []):
            if row.get('unresolved'):
                continue
            address = row.get('address')
            size = row.get('coverage_credit') or row.get('code_bytes') or row.get('bytes')
            if not isinstance(address, str) or not isinstance(size, int):
                continue
            address = int(address, 16)
            if not 0x10001000 <= address < 0x1010b000:
                continue
            if name == 'jpeg_dependency_packet.json':
                assert sha(Path(row['reference_root']) / row['source']) == row['source_sha256']
                assert row['object_sha256'] in {sha(p) for p in Path(row['object_root']).glob('*.obj')}
            jpeg[address] = max(jpeg.get(address, 0), size)

    source_dir = TARGET / 'scratch/claude_verified_src_backup_0929'
    dll = RUN / 'gfx.dll'
    assert dll.exists() and (RUN / 'cmp.json').stat().st_mtime >= dll.stat().st_mtime
    assert (RUN / 'bind.json').stat().st_mtime >= dll.stat().st_mtime
    for dependency in (source_dir, TARGET / 'src/opencod2/headers',
                       TARGET / 'src/shims', TARGET / 'src/cl'):
        assert all(p.stat().st_mtime <= dll.stat().st_mtime for p in dependency.rglob('*')
                   if p.is_file() and p.suffix in ('.cpp', '.c', '.h', '.txt'))
    bound = json.loads((RUN / 'bind.json').read_text())
    closed = {(int(row['t'], 16), row['n'])
              for row in bound.values() if not row['why'] and ':' not in row['obj']}
    switch_sections = {(0x1000e840, 187), (0x1000e900, 274),
                       (0x1000ef40, 219)}
    assert switch_sections <= closed
    closed -= switch_sections  # These include jump tables; engine packets count code only.
    candidate_dir = TARGET / 'scratch/codex_rendercmd_rotate_15'
    candidate_run = TARGET / 'build/codex_rendercmd_rotate_15'
    changed_sources = {Path('gfx_d3d/r_rendercmds.cpp'), Path('gfx_d3d/r_utils.cpp')}
    assert all(sha(candidate_dir / path.relative_to(source_dir)) == sha(path)
               for path in source_dir.rglob('*') if path.is_file()
               and path.relative_to(source_dir) not in changed_sources)
    for path in changed_sources:
        candidate_source = candidate_dir / path
        candidate_obj = candidate_run / 'obj' / path.with_suffix('.obj')
        assert candidate_source.stat().st_mtime <= candidate_obj.stat().st_mtime
        assert candidate_obj.stat().st_mtime <= (candidate_run / 'gfx.dll').stat().st_mtime
    assert (candidate_run / 'gfx.dll').stat().st_mtime <= (candidate_run / 'cmp_short.json').stat().st_mtime
    assert (candidate_run / 'cmp_short.json').stat().st_mtime <= (candidate_run / 'bind_short.json').stat().st_mtime
    assert (TARGET / 'scratch/codex_short_cmp.py').stat().st_mtime <= (candidate_run / 'cmp_short.json').stat().st_mtime
    assert (GFX / 'tools/bindcheck.py').stat().st_mtime <= (candidate_run / 'bind_short.json').stat().st_mtime
    candidate_bound = json.loads((candidate_run / 'bind_short.json').read_text())
    assert candidate_bound['_atoi']['t'] == '0x100f742f'
    assert candidate_bound['_atoi']['n'] == 5
    assert candidate_bound['_atol']['t'] == '0x100f73a7'
    candidate_matches = {(int(row['t'], 16), row['n'])
                         for row in candidate_bound.values()
                         if not row['why'] and ':' not in row['obj']}
    baseline_matches = closed | switch_sections
    private_gain = {(0x10021100, 158), (0x100211a0, 207), (0x100213f0, 229),
                    (0x10021660, 130)}
    # The 384-byte parser body is shape-correct here, but its _atoi binding
    # requires the exact C-string-boundary check in the merged proof below.
    assert candidate_matches - baseline_matches == private_gain | {(0x10061440, 384)}
    assert baseline_matches <= candidate_matches
    parse_dir = TARGET / 'scratch/codex_qparse_12'
    parse_run = TARGET / 'build/codex_qparse_12c'
    assert all(sha(parse_dir / path.relative_to(source_dir)) == sha(path)
               for path in source_dir.rglob('*') if path.is_file()
               and path.relative_to(source_dir) != Path('universal/q_parse.cpp'))
    assert (parse_dir / 'universal/q_parse.cpp').stat().st_mtime <= (
        parse_run / 'obj/universal/q_parse.obj').stat().st_mtime
    assert (parse_run / 'gfx.dll').stat().st_mtime <= (
        parse_run / 'cmp.json').stat().st_mtime <= (
        parse_run / 'bind.json').stat().st_mtime
    parse_bound = json.loads((parse_run / 'bind.json').read_text())
    parse_matches = {(int(row['t'], 16), row['n'])
                     for row in parse_bound.values()
                     if not row['why'] and ':' not in row['obj']}
    parse_gain = {(0x1005f690, 945), (0x1005fa50, 68), (0x1005faa0, 75),
                  (0x1005faf0, 181), (0x1005fbb0, 131), (0x1005fc80, 222),
                  (0x1005fd60, 275), (0x1005fed0, 82), (0x1005ffe0, 221),
                  (0x100600c0, 167), (0x10060170, 181)}
    assert parse_matches - baseline_matches == parse_gain
    assert baseline_matches <= parse_matches
    merged_dir = TARGET / 'scratch/codex_merged_12'
    merged_run = TARGET / 'build/codex_merged_12'
    merged_changes = {Path(name) for name in (
        'roots.txt', 'universal/q_parse.cpp', 'gfx_d3d/r_utils.cpp',
        'gfx_d3d/r_rendercmds.cpp', 'gfx_d3d/rb_state.cpp',
        'gfx_d3d/rb_logfile.cpp')}
    assert all(sha(merged_dir / path.relative_to(source_dir)) == sha(path)
               for path in source_dir.rglob('*') if path.is_file()
               and path.relative_to(source_dir) not in merged_changes)
    for path in merged_changes - {Path('roots.txt')}:
        assert (merged_dir / path).stat().st_mtime <= (
            merged_run / 'obj' / path.with_suffix('.obj')).stat().st_mtime
    assert (merged_dir / 'roots.txt').stat().st_mtime <= (merged_run / 'gfx.dll').stat().st_mtime
    assert (merged_run / 'gfx.dll').stat().st_mtime <= (
        merged_run / 'cmp_short.json').stat().st_mtime <= (
        merged_run / 'bind_literal.json').stat().st_mtime
    assert sha(TARGET / 'scratch/codex_bindcheck.py') == (
        '091a1e69a58a4a5ff894d51abc155ce908cff9bb32449852cc481ba24c9e9f1b')
    assert sha(TARGET / 'scratch/codex_short_cmp.py') == (
        '4c59b2bfed614bd0c7052043bdfbc509472f23c6b9c77c989ae12b13f4aebc3f')
    merged_bound = json.loads((merged_run / 'bind_literal.json').read_text())
    merged_matches = {(int(row['t'], 16), row['n'])
                      for row in merged_bound.values()
                      if not row['why'] and ':' not in row['obj']}
    standard_bound = json.loads((merged_run / 'bind.json').read_text())
    standard_matches = {(int(row['t'], 16), row['n'])
                        for row in standard_bound.values()
                        if not row['why'] and ':' not in row['obj']}
    conditional = {(0x1005ff80, 84), (0x10061440, 384)}
    assert merged_matches - standard_matches == conditional
    assert baseline_matches <= standard_matches <= merged_matches
    state_gain = {(0x10037ce0, 1060), (0x10038110, 211),
                  (0x1003c430, 2086), (0x1003cc60, 1452),
                  (0x1003e8a0, 262), (0x1003ecb0, 109),
                  (0x1003ed20, 144)}
    merged_gain = private_gain | parse_gain | state_gain | conditional
    assert merged_matches - baseline_matches == merged_gain
    more_dir = TARGET / 'scratch/codex_moretu15'
    more_run = TARGET / 'build/codex_moretu15'
    more_changes = {Path(name) for name in (
        'tus.txt', 'universal/com_math.cpp', 'gfx_d3d/r_xsurface.cpp',
        'gfx_d3d/r_surfbounds.cpp', 'gfx_d3d/r_fatal_init.cpp',
        'gfx_d3d/r_matrix_scale.cpp', 'gfx_d3d/r_staticmodel_load_obj.cpp',
        'gfx_d3d/r_staticmodelcache.cpp', 'gfx_d3d/r_water_load_obj.cpp')}
    assert all(sha(more_dir / path.relative_to(merged_dir)) == sha(path)
               for path in merged_dir.rglob('*') if path.is_file()
               and path.relative_to(merged_dir) not in more_changes)
    for path in more_changes - {Path('tus.txt')}:
        assert (more_dir / path).stat().st_mtime <= (
            more_run / 'obj' / path.with_suffix('.obj')).stat().st_mtime
    assert (more_dir / 'tus.txt').stat().st_mtime <= (more_run / 'gfx.dll').stat().st_mtime
    assert (more_run / 'gfx.dll').stat().st_mtime <= (
        more_run / 'cmp.json').stat().st_mtime <= (more_run / 'bind.json').stat().st_mtime
    assert (more_run / 'gfx.dll').stat().st_mtime <= (
        more_run / 'cmp_short.json').stat().st_mtime <= (
        more_run / 'bind_literal.json').stat().st_mtime
    more_bound = json.loads((more_run / 'bind_literal.json').read_text())
    more_matches = {(int(row['t'], 16), row['n'])
                    for row in more_bound.values()
                    if not row['why'] and ':' not in row['obj']}
    more_standard = json.loads((more_run / 'bind.json').read_text())
    more_standard_matches = {(int(row['t'], 16), row['n'])
                             for row in more_standard.values()
                             if not row['why'] and ':' not in row['obj']}
    surface_gain = {(0x1002bca0, 13), (0x1002bcb0, 36),
                    (0x1002cd80, 80), (0x1002cdd0, 71)}
    support_gain = {(0x10011390, 66), (0x10038c60, 131)}
    cache_tree_gain = {(0x1002a010, 489), (0x1002ab90, 87),
                       (0x1002abf0, 221), (0x1002cb40, 445)}
    assert more_matches - merged_matches == surface_gain | support_gain | cache_tree_gain
    assert more_standard_matches - standard_matches == surface_gain | support_gain | cache_tree_gain
    assert merged_matches <= more_matches
    assert standard_matches <= more_standard_matches
    caps_dir = TARGET / 'scratch/codex_cohort13'
    caps_run = TARGET / 'build/codex_cohort13'
    assert all(sha(caps_dir / path.relative_to(more_dir)) == sha(path)
               for path in more_dir.rglob('*') if path.is_file()
               and path.relative_to(more_dir) != Path('tus.txt'))
    assert (caps_dir / 'tus.txt').read_text().splitlines() == (
        (more_dir / 'tus.txt').read_text().splitlines()[:5]
        + ['gfx_d3d/r_caps.cpp']
        + (more_dir / 'tus.txt').read_text().splitlines()[5:])
    assert (caps_dir / 'gfx_d3d/r_caps.cpp').stat().st_mtime <= (
        caps_run / 'obj/gfx_d3d/r_caps.obj').stat().st_mtime
    assert (caps_dir / 'tus.txt').stat().st_mtime <= (caps_run / 'gfx.dll').stat().st_mtime
    assert (caps_run / 'gfx.dll').stat().st_mtime <= (
        caps_run / 'cmp_short.json').stat().st_mtime <= (
        caps_run / 'bind_literal.json').stat().st_mtime
    caps_bound = json.loads((caps_run / 'bind_literal.json').read_text())
    caps_matches = {(int(row['t'], 16), row['n'])
                    for row in caps_bound.values()
                    if not row['why'] and ':' not in row['obj']}
    caps_gain = {(0x10005150, 135), (0x100051e0, 165)}
    assert caps_matches - more_matches == caps_gain
    assert more_matches <= caps_matches
    total_gain = merged_gain | surface_gain | support_gain | cache_tree_gain | caps_gain
    stl_run = GFX / 'scratch/library_runs/stl_sort_gl_r6ekw52i'
    stl_inputs = json.loads((stl_run / 'inputs.json').read_text())
    stl_packet = json.loads((stl_run / 'sort_helpers_packet.json').read_text())
    assert stl_inputs['anchor_sha256'] == stl_packet['anchor_sha256'] == ANCHOR_SHA
    assert stl_inputs['image'] == stl_packet['image'] == IMAGE
    assert all(sha(Path(stl_inputs['source']) / name) == digest
               for name, digest in stl_inputs['inputs'].items())
    assert all(sha(stl_run / name) == digest
               for name, digest in stl_inputs['outputs'].items())
    assert sha(GFX / 'tools/check_stl_sort.py') == stl_packet['checker_sha256']
    assert sha(GFX / 'tools/cmp.py') == stl_packet['linked_referee_sha256']
    assert sha(stl_run / 'test_sort.exe') == stl_packet['fixture_exe_sha256']
    assert stl_packet['linked_referee_replayed'] and stl_packet['source_fixture_passed']
    assert not stl_packet['whole_file_identity']
    stl = {(int(row['target_address'], 16), row['instruction_bytes'])
           for row in stl_packet['functions']}
    assert len(stl) == len(stl_packet['functions']) == 24
    assert sum(size for _, size in stl) == stl_packet['verified_instruction_bytes'] == 3434
    views_run = OLD / 'baseline_jpeg_7h016wwk'
    views = json.loads((views_run / 'seven_percent_packet.json').read_text())
    assert views['anchor_sha256'] == ANCHOR_SHA and views['image'] == IMAGE
    assert sha(TARGET / 'src/codex/renderer_views.c') == views['source_sha256']
    assert sha(OLD / 'check_seven_percent.py') == views['checker_sha256']
    assert sha(views_run / 'inputs.json') == views['inputs_sha256']
    assert views['object_sha256'] in {sha(p) for p in views_run.glob('*.obj')}
    refapi_run = GFX / 'scratch/library_runs/baseline_jpeg_7_9fo60y'
    refapi = json.loads((refapi_run / 'refapi_context_packet.json').read_text())
    assert refapi['anchor_sha256'] == ANCHOR_SHA
    assert sha(TARGET / 'src/codex/refapi_table.c') == refapi['source_sha256']
    assert sha(GFX / 'tools/check_refapi_context.py') == refapi['checker_sha256']
    assert sha(OLD / 'refapi_pinned.json') == refapi['slots_sha256']
    assert refapi['object_sha256'] in {sha(p) for p in refapi_run.glob('*.obj')}
    standalone = {(int(row['address'], 16), row['bytes']) for row in views['functions']}
    standalone.add((0x10013270, refapi['verified_initializer_code_bytes']))
    assert len(standalone) == 3 and sum(size for _, size in standalone) == 1190
    startup = json.loads((OLD / 'jpeg_startup_packet.json').read_text())
    assert startup['anchor_sha256'] == ANCHOR_SHA and startup['image'] == IMAGE
    assert sha(OLD / 'check_jpeg_color_initializers.py') == startup['checker_sha256']
    jpeg_extra = {(address, size) for address, size in startup['callbacks'].values()}
    jpeg_extra.update((address, size) for address, size in startup['table_builders'].values())
    idct = json.loads((OLD / 'jpeg_idct_block_packet.json').read_text())
    idct_run = Path(idct['run'])
    assert idct['anchor_sha256'] == ANCHOR_SHA and idct['image'] == IMAGE
    assert idct['status'] == 'FULL-BLOCK-DEPENDENCY-PASS' and idct['fixture_passed']
    assert sha(OLD / 'check_jpeg_idct_block.py') == idct['checker_sha256']
    assert sha(idct_run / 'inputs.json') == idct['decoder_input_sha256']
    assert idct['object_sha256'] in {sha(p) for p in idct_run.glob('*.obj')}
    jpeg_extra.update(((0x1004c0e0, idct['code_bytes']),
                       (0x1004c410, idct['initializer_bytes'])))
    assert sum(size for _, size in jpeg_extra) == 1310
    material_run = OLD / 'material_verify_onw3l0z5'
    material = json.loads((material_run / 'packet.json').read_text())
    assert material['image'] == IMAGE and material['status'] == 'REVIEWABLE'
    assert material['functions'] == 14 and material['bytes'] == 425
    assert material['wrong_binding_rejected'] and material['host_fixtures_passed']
    assert all(sha(OLD / 'src' / name) == digest
               for name, digest in material['sources'].items())
    assert all(sha(material_run / name) == digest
               for name, digest in material['objects'].items())
    material_rows = ((0x10017300, 7), (0x10017310, 16), (0x10017320, 37),
                     (0x1000c8d0, 6), (0x1001d8f0, 15), (0x1001d900, 14),
                     (0x10001430, 42), (0x10001460, 39), (0x1000c000, 8),
                     (0x1000aac0, 38), (0x1001d910, 77), (0x1000bb10, 22),
                     (0x1000bc40, 35), (0x10001230, 69))
    log = (material_run / 'checks.log').read_text()
    assert all(f'@ {address:#x} size={size} ' in log
               for address, size in material_rows)
    assert sum(size for _, size in material_rows) == material['bytes']
    delayed_run = OLD / 'material_verify_delayed_v01ovwmn'
    delayed = json.loads((delayed_run / 'packet.json').read_text())
    assert delayed['image'] == IMAGE and delayed['wrong_binding_rejected']
    assert delayed['host_32bit_fixtures_passed']
    assert sha(OLD / 'src/delayed_drawing.c') == delayed['source_sha256']
    assert sha(delayed_run / 'delayed.obj') == delayed['object_sha256']
    delayed_rows = ((0x10020f10, 92), (0x10020fe0, 91))
    assert all(any(row['address'] == f'{address:#x}' and
                   f'{size} bytes' in row['diagnostics'] and
                   'normalized match:' in row['diagnostics']
                   for row in delayed['functions'])
               for address, size in delayed_rows)
    engine = [*material_rows, *delayed_rows]
    image_packets = (
        ('image_create', 'baseline_jpeg_4un7pbxe',
         ((0x1000ce80, 113), (0x1000cf00, 130), (0x1000cf90, 119))),
        ('image_slice', 'baseline_jpeg_t8vfcrgk',
         ((0x1000e840, 135), (0x1000e900, 226))),
        ('image_dispatch', 'baseline_jpeg_qqtw3j8j',
         ((0x1000f900, 261), (0x1000f2a0, 67))),
    )
    for name, run_name, rows in image_packets:
        packet = json.loads((OLD / f'{name}_packet.json').read_text())
        assert packet['status'] == 'REVIEWABLE' and packet['anchor_sha256'] == ANCHOR_SHA
        assert packet['host_fixture_passed'] if name == 'image_create' else packet['fixture_passed']
        checked_object(packet, OLD / run_name)
        assert all(f'@ {address:#x} size=' in json.dumps(packet)
                   for address, _ in rows)
        engine.extend(rows)
    memory = json.loads((OLD / 'image_memory_chain_packet.json').read_text())
    mip = memory['matched_dependency']
    assert memory['status'] == mip['status'] == 'REVIEWABLE'
    assert memory['wrong_binding_rejected'] and mip['wrong_binding_rejected']
    assert mip['fixture_passed'] and mip['anchor_sha256'] == ANCHOR_SHA
    checked_object(mip, OLD / 'baseline_jpeg_olyhxdy7')
    assert memory['address'] == '0x1000f020' and mip['address'] == '0x1000ef40'
    engine.extend(((0x1000ef40, mip['code_bytes']),
                   (0x1000f020, memory['new_code_bytes'])))
    image_file = json.loads((OLD / 'image_file_packet.json').read_text())
    image_path = image_file['retained']
    assert image_file['status'] == image_path['status'] == 'REVIEWABLE'
    assert image_file['wrong_binding_rejected'] and image_path['wrong_binding_rejected']
    assert image_file['new_code_bytes'] == 240 and image_path['new_code_bytes'] == 26
    assert '0x1000fa40' in image_file['diagnostics']
    assert '0x10060c10' in image_path['diagnostics']
    engine.append((0x1000fa40, 240))
    assert (0x10060c10, 26) in closed  # Formatter already linked and counted.
    debug_run = OLD / 'baseline_jpeg_arnc6688'
    debug = json.loads((debug_run / 'debug_frame_packet.json').read_text())
    assert debug['status'] == 'REVIEWABLE' and debug['anchor_sha256'] == ANCHOR_SHA
    assert debug['wrong_binding_rejected'] and debug['code_bytes'] == 258
    assert sha(OLD / 'test_debug_pair.c') == debug['fixture_sha256']
    checked_object(debug, debug_run)
    engine.extend(((0x10020ec0, 71), (0x10022040, 114), (0x10021ff0, 73)))
    frame_run = OLD / 'baseline_jpeg_n2weway4'
    frame = json.loads((frame_run / 'frame_end_packet.json').read_text())
    assert frame['status'] == 'REVIEWABLE' and frame['code_bytes'] == 86
    assert frame['negative_bindings_passed'] and frame['fixture_passed']
    assert sha(OLD / 'test_frame_end.c') == frame['fixture_sha256']
    checked_object(frame, frame_run)
    engine.append((0x10021f90, 86))
    wavelet = json.loads((OLD / 'wavelet_link_packet.json').read_text())
    wavelet_checked = json.loads((OLD / 'wavelet_link_checked.json').read_text())
    assert wavelet_checked['status'] == 'SOURCE-LINK-BYTES-AND-BINDINGS-PASS'
    assert wavelet_checked['link_proof'] == wavelet
    assert wavelet_checked['code_bytes'] == 134 and len(wavelet_checked['bindings']) == 4
    assert sha(Path(wavelet['dll'])) == wavelet['dll_sha256']
    wavelet_run = OLD / 'baseline_jpeg_1v2df6oy'
    wavelet_inputs = json.loads((wavelet_run / 'inputs.json').read_text())
    assert wavelet_inputs['image'] == IMAGE
    assert all(sha(Path(wavelet_inputs['reference']) / name) == digest
               for name, digest in wavelet_inputs['dependencies'].items())
    assert sha(wavelet_run / 'job000.obj') == wavelet['functions_object_sha256']
    engine.append((0x10010cb0, 134))
    assert sum(size for _, size in engine) == 608 + 362 + 361 + 328 + 284 + 240 + 258 + 86 + 134
    crt_run = TARGET / 'scratch/codex_crt13'
    crt_checker = crt_run / 'check.py'
    subprocess.run([sys.executable, str(crt_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    crt_packet = json.loads((crt_run / 'packet.json').read_text())
    assert crt_packet['status'] == 'REVIEWABLE' and not crt_packet['whole_file_identity']
    assert crt_packet['anchor_sha256'] == ANCHOR_SHA and crt_packet['image'] == IMAGE
    assert crt_packet['checker_sha256'] == sha(crt_checker)
    assert crt_packet['build_script_sha256'] == sha(crt_run / 'build.sh')
    assert crt_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert crt_packet['classification_sha256'] == sha(ROOT / 'glm/data/match_classification.json')
    assert crt_packet['negative_bindings_passed']
    for name, hashes in crt_packet['inputs'].items():
        assert sha(ROOT / 'glm/crt71' / name) == hashes['source_sha256']
        obj = crt_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(obj) == hashes['object_sha256']
        assert (ROOT / 'glm/crt71' / name).stat().st_mtime <= obj.stat().st_mtime
    crt = {(int(row['address'], 16), row['bytes']) for row in crt_packet['rows']}
    assert len(crt) == len(crt_packet['rows']) == 44
    crt_bytes = sum(size for _, size in crt)
    assert crt_bytes == crt_packet['verified_instruction_bytes'] == 10273
    asm_run = TARGET / 'scratch/codex_crt14asm'
    asm_checker = asm_run / 'check.py'
    subprocess.run([sys.executable, str(asm_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    asm_packet = json.loads((asm_run / 'packet.json').read_text())
    assert asm_packet['status'] == 'REVIEWABLE' and not asm_packet['whole_file_identity']
    assert asm_packet['anchor_sha256'] == ANCHOR_SHA and asm_packet['image'] == IMAGE
    assert asm_packet['checker_sha256'] == sha(asm_checker)
    assert asm_packet['build_script_sha256'] == sha(asm_run / 'build.sh')
    assert asm_packet['negative_test_passed']
    for name, hashes in asm_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj = asm_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    for name, digest in asm_packet['includes'].items():
        assert sha(asm_run / 'case' / name) == digest
    asm = {(int(row['address'], 16), row['bytes']) for row in asm_packet['rows']}
    assert len(asm) == len(asm_packet['rows']) == 15
    asm_bytes = sum(size for _, size in asm)
    assert asm_bytes == asm_packet['verified_instruction_bytes'] == 1682
    extra_run = TARGET / 'scratch/codex_crt14extra'
    extra_checker = extra_run / 'check.py'
    subprocess.run([sys.executable, str(extra_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    extra_packet = json.loads((extra_run / 'packet.json').read_text())
    assert extra_packet['status'] == 'REVIEWABLE' and not extra_packet['whole_file_identity']
    assert extra_packet['anchor_sha256'] == ANCHOR_SHA and extra_packet['image'] == IMAGE
    assert extra_packet['checker_sha256'] == sha(extra_checker)
    assert extra_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert extra_packet['asm_packet_sha256'] == sha(asm_run / 'packet.json')
    assert extra_packet['negative_bindings_passed']
    for name, hashes in extra_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj = extra_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    extra = {(int(row['address'], 16), row['bytes']) for row in extra_packet['rows']}
    assert len(extra) == len(extra_packet['rows']) == 4
    extra_bytes = sum(size for _, size in extra)
    assert extra_bytes == extra_packet['verified_instruction_bytes'] == 238
    output_checker = extra_run / 'check_output.py'
    subprocess.run([sys.executable, str(output_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    output_packet = json.loads((extra_run / 'output_packet.json').read_text())
    assert output_packet['status'] == 'REVIEWABLE' and not output_packet['whole_file_identity']
    assert output_packet['anchor_sha256'] == ANCHOR_SHA and output_packet['image'] == IMAGE
    assert output_packet['checker_sha256'] == sha(output_checker)
    assert output_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert output_packet['crt13_build_script_sha256'] == sha(crt_run / 'build.sh')
    assert output_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert output_packet['negative_bindings_passed']
    assert output_packet['excluded_jump_table_bytes'] == 32
    for name, hashes in output_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj_root = crt_run if name in ('output.c', 'seccook.c') else extra_run
        obj = obj_root / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    output = {(int(output_packet['address'], 16), output_packet['verified_instruction_bytes'])}
    assert output == {(0x100fa4e6, 2010)}
    woutput_checker = extra_run / 'check_woutput.py'
    subprocess.run([sys.executable, str(woutput_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    woutput_packet = json.loads((extra_run / 'woutput_packet.json').read_text())
    assert woutput_packet['status'] == 'REVIEWABLE' and not woutput_packet['whole_file_identity']
    assert woutput_packet['anchor_sha256'] == ANCHOR_SHA and woutput_packet['image'] == IMAGE
    assert woutput_packet['checker_sha256'] == sha(woutput_checker)
    assert woutput_packet['output_packet_sha256'] == sha(extra_run / 'output_packet.json')
    assert woutput_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert woutput_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert woutput_packet['negative_bindings_passed']
    assert woutput_packet['excluded_jump_table_bytes'] == 32
    for name, hashes in woutput_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj = extra_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    woutput = {(int(woutput_packet['address'], 16), woutput_packet['verified_instruction_bytes'])}
    assert woutput == {(0x1010552c, 2064)}
    large_checker = extra_run / 'check_large.py'
    subprocess.run([sys.executable, str(large_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    large_packet = json.loads((extra_run / 'large_packet.json').read_text())
    assert large_packet['status'] == 'REVIEWABLE' and not large_packet['whole_file_identity']
    assert large_packet['anchor_sha256'] == ANCHOR_SHA and large_packet['image'] == IMAGE
    assert large_packet['checker_sha256'] == sha(large_checker)
    assert large_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert large_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert large_packet['negative_test_passed'] and large_packet['binding_count'] == 57
    for name, hashes in large_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj = extra_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    large = {(int(row['address'], 16), row['bytes']) for row in large_packet['rows']}
    assert large == {(0x10107fca, 457), (0x10109f98, 900)}
    assert sum(size for _, size in large) == large_packet['verified_instruction_bytes'] == 1357
    leaves_checker = extra_run / 'check_leaves.py'
    subprocess.run([sys.executable, str(leaves_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    leaves_packet = json.loads((extra_run / 'leaves_packet.json').read_text())
    assert leaves_packet['status'] == 'REVIEWABLE' and not leaves_packet['whole_file_identity']
    assert leaves_packet['anchor_sha256'] == ANCHOR_SHA and leaves_packet['image'] == IMAGE
    assert leaves_packet['checker_sha256'] == sha(leaves_checker)
    assert leaves_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert leaves_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert leaves_packet['asm_packet_sha256'] == sha(asm_run / 'packet.json')
    assert leaves_packet['negative_bindings_passed']
    for name, hashes in leaves_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj = extra_run / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    leaves = {(int(row['address'], 16), row['bytes']) for row in leaves_packet['rows']}
    assert len(leaves) == len(leaves_packet['rows']) == 12
    assert sum(size for _, size in leaves) == leaves_packet['verified_instruction_bytes'] == 707
    globals_checker = extra_run / 'check_globals.py'
    subprocess.run([sys.executable, str(globals_checker)], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    globals_packet = json.loads((extra_run / 'globals_packet.json').read_text())
    assert globals_packet['status'] == 'REVIEWABLE' and not globals_packet['whole_file_identity']
    assert globals_packet['anchor_sha256'] == ANCHOR_SHA and globals_packet['image'] == IMAGE
    assert globals_packet['checker_sha256'] == sha(globals_checker)
    assert globals_packet['build_script_sha256'] == sha(extra_run / 'build.sh')
    assert globals_packet['crt13_build_script_sha256'] == sha(crt_run / 'build.sh')
    assert globals_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert globals_packet['asm_packet_sha256'] == sha(asm_run / 'packet.json')
    assert globals_packet['negative_bindings_passed']
    for name, hashes in globals_packet['inputs'].items():
        source = ROOT / 'glm/crt71' / name
        obj_root = Path(hashes['object_root'])
        assert obj_root in (crt_run, extra_run)
        obj = obj_root / 'obj' / (Path(name).stem + '.obj')
        assert sha(source) == hashes['source_sha256']
        assert sha(obj) == hashes['object_sha256']
        assert source.stat().st_mtime <= obj.stat().st_mtime
    globals_rows = {(int(row['address'], 16), row['bytes']) for row in globals_packet['rows']}
    assert len(globals_rows) == len(globals_packet['rows']) == 15
    assert sum(size for _, size in globals_rows) == globals_packet['verified_instruction_bytes'] == 2911
    # Live consolidated tree: only matches beyond every set above are credited.
    live_dir = TARGET / 'verified/src'
    live_dll = LIVE_RUN / 'gfx.dll'
    assert (LIVE_RUN / 'cmp.json').stat().st_mtime >= live_dll.stat().st_mtime
    assert (LIVE_RUN / 'bind.json').stat().st_mtime >= live_dll.stat().st_mtime
    for dependency in (live_dir, TARGET / 'src/opencod2/headers',
                       TARGET / 'src/shims', TARGET / 'src/cl'):
        assert all(p.stat().st_mtime <= live_dll.stat().st_mtime for p in dependency.rglob('*')
                   if p.is_file() and p.suffix in ('.cpp', '.c', '.h', '.txt'))
    live_bound = json.loads((LIVE_RUN / 'bind.json').read_text())
    live = {(int(row['t'], 16), row['n'])
            for row in live_bound.values() if not row['why'] and ':' not in row['obj']}
    live_gain = live - closed - switch_sections - total_gain
    counted = [*jpeg.items(), *jpeg_extra, *closed, *stl, *standalone, *engine, *total_gain,
               *crt, *asm, *extra, *output, *woutput, *large, *leaves, *globals_rows]
    # Live rows already claimed by another proof set count once, under that set.
    live_gain = {(a, n) for a, n in live_gain
                 if not any(a < b + m and b < a + n for b, m in counted)}
    draw_dir = TARGET / 'scratch/codex15_drawgroups'
    # The drawgroup packet was pinned to the 348-function tree; replay it against that snapshot.
    live_dir = TARGET / 'scratch/premerge_1001/src'
    snap_bound = json.loads((TARGET / 'build/pm/bind.json').read_text())
    live_now = live
    live = {(int(row['t'], 16), row['n'])
            for row in snap_bound.values() if not row['why'] and ':' not in row['obj']}
    draw_run = TARGET / 'build/codex15_drawgroups'
    draw_new = Path('gfx_d3d/r_splitscreen.cpp')
    draw_changes = {draw_new, Path('tus.txt'), Path('roots.txt'),
                    Path('gfx_d3d/r_rendercmds.cpp')}
    assert {p.relative_to(draw_dir) for p in draw_dir.rglob('*') if p.is_file()} - {
        p.relative_to(live_dir) for p in live_dir.rglob('*') if p.is_file()} == {
            draw_new, Path('REPORT.md')}  # Evidence prose is not a compiled input.
    assert all(sha(draw_dir / path.relative_to(live_dir)) == sha(path)
               for path in live_dir.rglob('*') if path.is_file()
               and path.relative_to(live_dir) not in draw_changes)
    assert (draw_dir / 'tus.txt').read_text().splitlines() == (
        (live_dir / 'tus.txt').read_text().splitlines()[:19]
        + ['gfx_d3d/r_splitscreen.cpp']
        + (live_dir / 'tus.txt').read_text().splitlines()[19:])
    assert (draw_dir / 'roots.txt').read_text() == (
        (live_dir / 'roots.txt').read_text().replace(
            'R_BeginDelayedDrawing\n', '?R_BeginDelayedDrawing@@YAXH@Z\n'))
    assert sha(draw_dir / draw_new) == '10601fdeb692bc831120dfc53121894bf1c7185205c5de6c4d5052b0b4e1ea9a'
    assert sha(draw_dir / 'gfx_d3d/r_rendercmds.cpp') == 'a02cc72bf5d5e9f8334bd7243ac17b3ed81626e9086557c255b5b73bb9bcf0d5'
    assert sha(draw_dir / 'tus.txt') == '91e0d3b5d75d06b59f4c1c20afe1cb8e8637016832dc05df018f6ff1fbfb06da'
    assert sha(draw_dir / 'roots.txt') == '6f84f1b5a5db355945d7d21f5338788a25240bf74387034527185557eaf4ec8d'
    assert sha(TARGET / 'closed.mk') == '7164205f6dcecd96dfd0db1e0543b601eab87c89d59b6c112043344c8b71faa8'
    assert sha(GFX / 'tools/codex15_bindcheck.py') == '2f9fc9f1cdbfff3fca3dcbc054e51d1f48657022545b4eb9bb38d3f16f39939a'
    assert sha(draw_run / 'obj/gfx_d3d/r_splitscreen.obj') == '59084e6c2cf4abe404e22446aab33d71f9a4361a302b5bf5f109ccc54fb5c7d3'
    assert sha(draw_run / 'obj/gfx_d3d/r_rendercmds.obj') == '576784f6b3e4ac79c1523ff13e464a596ce48d269ef0e5c3028ab97bc3c8067c'
    assert sha(draw_run / 'gfx.dll') == '94dfae1b71e37a585527717d3a64995001039357071fd9fe7d075883d82616d6'
    assert sha(draw_run / 'cmp.json') == '9df5dbe6659d1f206b14f13b1a93812db1c5cf49f3371d352070e5cffff99e3b'
    assert sha(draw_run / 'bind_private.json') == '51f9c2056b551d116923bf91df3d5dd1fd5c0c5072ec127b549a673ce869cde0'
    assert (draw_dir / draw_new).stat().st_mtime <= (draw_run / 'obj/gfx_d3d/r_splitscreen.obj').stat().st_mtime
    assert (draw_dir / 'gfx_d3d/r_rendercmds.cpp').stat().st_mtime <= (draw_run / 'obj/gfx_d3d/r_rendercmds.obj').stat().st_mtime
    assert (draw_run / 'obj/gfx_d3d/r_splitscreen.obj').stat().st_mtime <= (draw_run / 'gfx.dll').stat().st_mtime
    assert (draw_run / 'obj/gfx_d3d/r_rendercmds.obj').stat().st_mtime <= (draw_run / 'gfx.dll').stat().st_mtime
    assert (draw_dir / 'roots.txt').stat().st_mtime <= (draw_run / 'gfx.dll').stat().st_mtime
    assert (draw_run / 'gfx.dll').stat().st_mtime <= (draw_run / 'cmp.json').stat().st_mtime
    subprocess.run([sys.executable, str(GFX / 'tools/codex15_bindcheck.py'),
                    str(draw_run / 'gfx.dll'), str(draw_run / 'gfx.map'), str(ANCHOR),
                    str(draw_run / 'cmp.json'), '--json', str(draw_run / 'bind_replay.json'),
                    '--pdb', str(draw_run / 'gfx.pdb')],
                   cwd=TARGET, check=True, capture_output=True, text=True)
    assert sha(draw_run / 'bind_replay.json') == sha(draw_run / 'bind_private.json')
    draw_bound = json.loads((draw_run / 'bind_replay.json').read_text())
    draw = {(int(row['t'], 16), row['n'])
            for row in draw_bound.values() if not row['why'] and ':' not in row['obj']}
    draw_gain = {(0x10020f10, 92), (0x10029430, 53),
                 (0x10029470, 44), (0x100294a0, 63),
                 (0x100294e0, 70), (0x10029530, 40),
                 (0x10029560, 317)}
    assert live <= draw and draw - live == draw_gain
    assert (0x10020f10, 92) in engine
    draw_credit = draw_gain - {(0x10020f10, 92)}
    live = live_now
    input_dir = TARGET / 'scratch/codex15_crtinput'
    assert sha(input_dir / 'check.py') == '49b5452b656d1b5436921984cc2149b5e360dd4706cefec748e9b3ed64a8758f'
    assert sha(input_dir / 'build.sh') == 'e788fd886a95a4c9fe5340bfbdacfef2789d78eb6c90d337371f9aab1e9a4da0'
    # cl writes the build time to the COFF header; it is not instruction data.
    input_raw = (input_dir / 'obj/O1mt.obj').read_bytes()
    input_stable = hashlib.sha256(input_raw[:4] + b'\0' * 4 + input_raw[8:]).hexdigest()
    assert input_stable == 'c58c7b899ee4d2e74258f4a5d0f2f7f983410e1c0dd3bc530770c8ac1930a3f5'
    subprocess.run([sys.executable, str(input_dir / 'check.py')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    input_packet = json.loads((input_dir / 'packet.json').read_text())
    assert input_packet['status'] == 'REVIEWABLE' and not input_packet['whole_file_identity']
    assert input_packet['anchor_sha256'] == ANCHOR_SHA and input_packet['image'] == IMAGE
    assert input_packet['checker_sha256'] == sha(input_dir / 'check.py')
    assert input_packet['build_script_sha256'] == sha(input_dir / 'build.sh')
    assert input_packet['object_sha256'] == sha(input_dir / 'obj/O1mt.obj')
    assert input_packet['negative_bindings_passed'] and len(input_packet['bindings']) == 21
    assert input_packet['output_packet_sha256'] == sha(extra_run / 'output_packet.json')
    assert input_packet['nlsdata1_object_sha256'] == sha(extra_run / 'obj/nlsdata1.obj')
    assert input_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert all(sha(ROOT / 'glm/crt71' / n) == h for n, h in input_packet['dependencies'].items())
    crt_input = {(int(input_packet['address'], 16), input_packet['verified_instruction_bytes'])}
    assert crt_input == {(0x100f9482, 3452)}
    crt16_dir = TARGET / 'scratch/codex16_crt'
    for name, digest in {
        'check.py': '1ba4d0ae4c4d9e4e134eaeccde5ae5c18564fcdaabca5d9bd96fb5d54ef06fdd',
        'plan.json': '5bbe8c938a298bc75be22cc8a7574e0131dffe2f0268900baee2a96c3e1cc6d6',
        'compile.sh': '83a6e2781b7e6b03d8132a6bcc54867c77f5d0eb6a9fb5a170e7059488adf69e',
        'build.sh': '13ca7c9ac9ddd1aedbdc4c744c50f9ada4be1ff28c8f1e6969b910c4811dc908',
    }.items():
        assert sha(crt16_dir / name) == digest
    subprocess.run([sys.executable, str(crt16_dir / 'check.py')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    crt16_packet = json.loads((crt16_dir / 'packet.json').read_text())
    assert crt16_packet['status'] == 'REVIEWABLE' and not crt16_packet['whole_file_identity']
    assert crt16_packet['anchor_sha256'] == ANCHOR_SHA and crt16_packet['image'] == IMAGE
    assert crt16_packet['checker_sha256'] == sha(crt16_dir / 'check.py')
    assert crt16_packet['plan_sha256'] == sha(crt16_dir / 'plan.json')
    assert crt16_packet['compile_script_sha256'] == sha(crt16_dir / 'compile.sh')
    assert crt16_packet['build_script_sha256'] == sha(crt16_dir / 'build.sh')
    assert crt16_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert crt16_packet['negative_tests_passed']
    for path, digest in crt16_packet['objects'].items():
        obj = ROOT / path
        assert obj.parent in (crt16_dir / 'obj/st', crt16_dir / 'obj/mt',
                              TARGET / 'scratch/codex_crt13/obj', extra_run / 'obj')
        assert sha(obj) == digest
    assert all(sha(ROOT / 'glm/crt71' / n) == h for n, h in crt16_packet['dependencies'].items())
    crt16 = {(int(row['address'], 16), row['bytes']) for row in crt16_packet['rows']}
    assert len(crt16) == len(crt16_packet['rows']) == 141
    assert sum(n for _, n in crt16) == crt16_packet['verified_instruction_bytes'] == 25076
    prior = [*counted, *live_gain, *draw_credit, *crt_input]
    crt16_gain = {(a, n) for a, n in crt16
                  if not any(a < b + m and b < a + n for b, m in prior)}
    crt17_dir = TARGET / 'scratch/codex17_crt'
    for name, digest in {
        'check.py': '160ead4c9380b95207d80ad2672264ac9cfe514b2baaf72db8246a12e2b7a7d3',
        'plan.json': '4c3ebb26ec4a1de0ec5169168489b066a8f8a115b89fcb34ec86de2b8e70c1ff',
        'compile.sh': '5b8faefd040328fd52fbd3bcc5865b1c0c5ce11541ac93a5ff8ff7311402ac45',
        'build.sh': 'd110b90e1431749d48288a236200b57c7c29b486b16ef443bf74038f4e743009',
    }.items():
        assert sha(crt17_dir / name) == digest
    subprocess.run([sys.executable, str(crt17_dir / 'check.py')], cwd=TARGET,
                   check=True, capture_output=True, text=True)
    crt17_packet = json.loads((crt17_dir / 'packet.json').read_text())
    assert crt17_packet['status'] == 'REVIEWABLE' and not crt17_packet['whole_file_identity']
    assert crt17_packet['anchor_sha256'] == ANCHOR_SHA and crt17_packet['image'] == IMAGE
    for key, path in (
        ('checker_sha256', crt17_dir / 'check.py'), ('plan_sha256', crt17_dir / 'plan.json'),
        ('compile_script_sha256', crt17_dir / 'compile.sh'),
        ('build_script_sha256', crt17_dir / 'build.sh'),
        ('inventory_sha256', ROOT / 'glm/data/functions_gfx10.json'),
        ('asm_packet_sha256', asm_run / 'packet.json'),
    ):
        assert crt17_packet[key] == sha(path)
    assert crt17_packet['negative_tests_passed']
    for path, digest in crt17_packet['objects'].items():
        obj = ROOT / path
        assert obj.parent in (crt17_dir / 'obj/st', crt17_dir / 'obj/mt',
                              crt16_dir / 'obj/st', crt16_dir / 'obj/mt',
                              TARGET / 'scratch/codex_crt13/obj', extra_run / 'obj')
        assert sha(obj) == digest
    assert all(sha(ROOT / 'glm/crt71' / n) == h for n, h in crt17_packet['dependencies'].items())
    crt17 = {(int(row['address'], 16), row['bytes']) for row in crt17_packet['rows']}
    assert len(crt17) == len(crt17_packet['rows']) == 200
    assert sum(n for _, n in crt17) == crt17_packet['verified_instruction_bytes'] == 37866
    crt17_gain = {(a, n) for a, n in crt17
                  if not any(a < b + m and b < a + n for b, m in [*prior, *crt16_gain])}
    crt19_dir = TARGET / 'scratch/codex19_crt'
    for name, digest in {
        'check.py': '85b144646e69d5a9aecf72b88e6953e4a79ff9ad2ab8f73b20e1582387eda3d6',
        'check_asm.py': '5a109fccb0d24887d7c39553ec6e8670ef24e2bfbc65113c1b81738b28831aea',
        'plan.json': '010f945a13375e6a300b2d893d36da62b4b5d6b972f956abd06fcd17550def20',
        'compile.sh': 'c77cde720a33d651f22ac948f1f19eedc5865e7399dece08816183b141d94b72',
        'build.sh': '494ba2b3dad641567f3d30833c98d8373eef94f61e5ab29092831388f3f8813f',
        'compile_asm.sh': '39a850aedac0fd2aa4a2db931977204f9dd940a2d102035b9790060d2e61b538',
    }.items():
        assert sha(crt19_dir / name) == digest
    for checker in ('check.py', 'check_asm.py'):
        subprocess.run([sys.executable, str(crt19_dir / checker)], cwd=TARGET,
                       check=True, capture_output=True, text=True)
    crt19_packet = json.loads((crt19_dir / 'packet.json').read_text())
    asm19_packet = json.loads((crt19_dir / 'asm_packet.json').read_text())
    for packet in (crt19_packet, asm19_packet):
        assert packet['status'] == 'REVIEWABLE' and not packet['whole_file_identity']
        assert packet['anchor_sha256'] == ANCHOR_SHA and packet['image'] == IMAGE
        assert packet['negative_tests_passed']
    for key, name in (('checker_sha256', 'check.py'), ('plan_sha256', 'plan.json'),
                      ('build_script_sha256', 'build.sh'), ('compile_script_sha256', 'compile.sh')):
        assert crt19_packet[key] == sha(crt19_dir / name)
    assert crt19_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert crt19_packet['asm_packet_sha256'] == sha(asm_run / 'packet.json')
    assert all(sha(ROOT / 'glm/crt71' / n) == h for n, h in crt19_packet['dependencies'].items())
    assert all(sha(ROOT / n) == h for n, h in crt19_packet['objects'].items())
    assert asm19_packet['checker_sha256'] == sha(crt19_dir / 'check_asm.py')
    assert asm19_packet['build_script_sha256'] == sha(crt19_dir / 'compile_asm.sh')
    assert asm19_packet['includes']['Intel/MEMCPY.ASM'] == sha(asm_run / 'case/Intel/MEMCPY.ASM')
    assert asm19_packet['includes']['cruntime.inc'] == sha(ROOT / 'glm/crt71/cruntime.inc')
    for name, inputs in asm19_packet['inputs'].items():
        assert inputs['source_sha256'] == sha(ROOT / 'glm/crt71' / (name + '.asm'))
        assert inputs['object_sha256'] == sha(crt19_dir / 'asm' / (name + '.obj'))
    crt19 = {(int(row['address'], 16), row['bytes']) for row in crt19_packet['rows']}
    assert len(crt19) == len(crt19_packet['rows']) == 216
    assert sum(n for _, n in crt19) == crt19_packet['verified_instruction_bytes'] == 40617
    crt19_gain = {(a, n) for a, n in crt19 if not any(
        a < b + m and b < a + n for b, m in [*prior, *crt16_gain, *crt17_gain])}
    asm19 = {(int(span['address'], 16), span['bytes'])
             for row in asm19_packet['rows'] for span in row['instruction_ranges']}
    assert all(row['original_referee_match'] == 100 for row in asm19_packet['rows'])
    assert sum(n for _, n in asm19) == asm19_packet['verified_instruction_bytes'] == 1749
    asm19_gain = {(a, n) for a, n in asm19 if not any(
        a < b + m and b < a + n for b, m in [*prior, *crt16_gain, *crt17_gain, *crt19_gain])}
    dx_dir = TARGET / 'scratch/codex19_dxerr'
    for name, digest in {
        'check.py': '2d2436d55793b71298193896b144d66405aa3a1ec564e68d61c85c947b21afae',
        'check_link.py': '216442557e67b688d87294e57aea22a92ca081a659302c9950e80230d7102db3',
        'compile_4035.sh': 'c195bb7dc1da9d6dbd2ac3f6a75875f269cdfcf27cba04b1b61ada24d62af66e',
        'group_cases.py': '68a6721a7a9fdd6e097882e8f3ec5f74c06fbac9c3fc5bf995abf692fc7bc446',
        'group_sdk_leaf.cpp': '5d6e13837b2dc528a26aa06ac6c7723f0b778805f1a8353398e1bee895257dcf',
        'run_test.py': '6210060abd38ff9396a28e9a2d2fb28ae4474d8456cb85d1d0fb49caaceef6ae',
        'compile_test.sh': 'ac8abddfd15aa0685a3b0032a1faccb8618b02d51274e78b594a1b578201be4c',
        'test_lookup.cpp': '27c2171b3276df7fec2087df947eb6daa02b0558eddc1f15d4d425dfb433dad5',
        'link.mk': '9007bf520e56e38eed7ff8b40b7359835b72b7ac0037724382ec4a153911119d',
        'build.sh': '74fa1c00e30a3005c9a0ca9b275586a15cc413755fb76c4849b3fd841f470ef9',
        'extract_compiler.py': '75235721084828ecd125fc807147118ce8326d1e4e907839d72ddb71293554fb',
    }.items():
        assert sha(dx_dir / name) == digest
    assert sha(TARGET / 'src/codex_libraries/dxerr9_name.cpp') == sha(dx_dir / 'group_sdk_leaf.cpp')
    for checker in ('check.py', 'check_link.py'):
        subprocess.run([sys.executable, str(dx_dir / checker)], cwd=TARGET,
                       check=True, capture_output=True, text=True)
    dx = json.loads((dx_dir / 'packet.json').read_text())
    assert dx['status'] == 'REVIEWABLE' and not dx['whole_file_identity']
    assert dx['anchor_sha256'] == ANCHOR_SHA and dx['image'] == IMAGE
    assert dx['negative_tests_passed'] and dx['original_referee_match'] == 100
    assert len(dx['bindings']) == 8899 and dx['excluded_table_bytes'] == 24097
    assert dx['code_bytes'] == 48427 and dx['section_bytes'] == 72524
    for key, name in (('checker_sha256', 'check.py'), ('source_sha256', 'group_sdk_leaf.cpp'),
                      ('object_sha256', 'group_4035_sdk_leaf.obj'),
                      ('build_script_sha256', 'compile_4035.sh'), ('generator_sha256', 'group_cases.py')):
        assert dx[key] == sha(dx_dir / name)
    assert dx['mapping_sha256'] == sha(dx_dir.parent / 'codex_dxerr_rebuild/mapping.json')
    assert dx['sdk_lib_sha256'] == sha(ROOT / 'sdk/sum2004/Lib/DxErr9.lib')
    assert all(sha(dx_dir / 'compiler' / n) == h for n, h in dx['compiler_files'].items())
    link = json.loads((dx_dir / 'link_packet.json').read_text())
    assert link['status'] == 'PASS' and not link['whole_file_identity']
    assert link['image'] == 'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131'
    assert link['source_match_losses'] == []
    assert (link['baseline_source_matches'], link['linked_source_matches']) == (359, 360)
    assert link['baseline_bind_sha256'] == sha(LIVE_RUN / 'bind.json')
    assert all(sha(ROOT / p) == h for key in ('source_dependencies', 'objects', 'files')
               for p, h in link[key].items())
    fixture = json.loads((dx_dir / 'fixture_packet.json').read_text())
    assert fixture['status'] == 'PASS' and fixture['named_cases'] == 5467
    assert fixture['boundary_inputs'] + fixture['random_inputs'] == 106560
    assert fixture['sdk_lib_sha256'] == dx['sdk_lib_sha256']
    for key, name in (('runner_sha256', 'run_test.py'), ('source_sha256', 'group_sdk_leaf.cpp'),
                      ('test_source_sha256', 'test_lookup.cpp'), ('build_script_sha256', 'compile_test.sh'),
                      ('test_exe_sha256', 'test_lookup.exe'), ('test_object_sha256', 'test_lookup.obj'),
                      ('lookup_object_sha256', 'fixture_lookup.obj')):
        assert fixture[key] == sha(dx_dir / name)
    dx_credit = {(int(dx['address'], 16), dx['code_bytes'])}
    dx25_dir = TARGET / 'scratch/codex25_dxerr'
    for name, digest in {
        'check.py': 'bd7d15d998485deaf357712eddc0ef4ab5bdfe673e651637e4ca8d9a8f23784e',
        'check_link.py': 'bbe00a4c3187a55b85f2be4a1e100c2509a4bb7cb1727112a39103f0f1ecf1b8',
        'generate.py': 'd5c265c50d426258b4da14f053fbbeca9db929c6728f0891184b67994fc94367',
        'build.sh': '38370bfa0c42393a53b0636fbd7fbedec83251277f5eb2ddd562ce587d4f68bc',
        'compile.sh': '6891eee0c20f883cbc1ff3eae50f164f428af3c4372f84f774ab671f24aebcfd',
        'compile_test.sh': 'ce09e78aea92d7cae8c4e3774fa71cb3e08cc33e16f8aba1116157ba97f86931',
        'run_test.py': 'f4451bdbb24aa4d11e6824bc272656968a3ea113e1293d359da7f4dad728983b',
        'test_lookup.cpp': 'e6288de709647e1b8fdd1a38d25a33ec074cc1cddf2bb4987191ae9b20e6ee15',
        'link.mk': 'f7a3e37ea64ab618a402831345d8306edcf89bdd20712536f329af0c5b4024a0',
        'probe.py': '0c591195d9566598c3dd3446ec78ea1292dc5efb9d08450a53ae9b2c212430c2',
        'oracle.cpp': 'ee7f05677d718452d4c801f43586245ab8888bcccc07643bd3465cd6645f7679',
        'compile_oracle.sh': '6bff442951f2ab8b49f39006579d0505594d7893fac3edc28a59a73fdc074849',
    }.items():
        assert sha(dx25_dir / name) == digest
    assert sha(TARGET / 'src/codex_libraries/build.mk') == (
        'fae7f598a3a81d416f9861bf66eb0490b933f8a911c3dc21c62929e528c2e711')
    for name, digest in {
        'name_w': '81a0ab0bacbc9b69e706094fb1417ecfd34f69b590e4a1fc77168474f42edc3d',
        'description_a': '13234549d95852550c229c822ef2136e4576db9c9b5b17bcadc447eedcb09a83',
        'description_w': 'b656d13c6c84a1fd7b76f83cb188ec2c7ae486224f5461020fbad0f66379a9a2',
    }.items():
        assert sha(TARGET / 'src/codex_libraries' / ('dxerr9_' + name + '.cpp')) == digest
        assert sha(dx25_dir / (name + '.cpp')) == digest
    for checker in ('check.py', 'check_link.py'):
        subprocess.run([sys.executable, str(dx25_dir / checker)], cwd=TARGET,
                       check=True, capture_output=True, text=True)
    dx25 = json.loads((dx25_dir / 'packet.json').read_text())
    assert dx25['status'] == 'REVIEWABLE' and not dx25['whole_file_identity']
    assert dx25['anchor_sha256'] == ANCHOR_SHA and dx25['image'] == IMAGE
    assert dx25['compiler_files'] == dx['compiler_files'] and dx25['compiler_version'] == '13.10.4035'
    assert dx25['checker_sha256'] == sha(dx25_dir / 'check.py')
    assert dx25['prior_checker_sha256'] == sha(dx_dir / 'check.py')
    assert dx25['build_script_sha256'] == sha(dx25_dir / 'compile.sh')
    assert dx25['generator_sha256'] == sha(dx25_dir / 'generate.py')
    assert dx25['clean_build_module_sha256'] == sha(TARGET / 'src/codex_libraries/build.mk')
    assert dx25['clean_build_image'] == link['image'] and dx25['sdk_lib_sha256'] == dx['sdk_lib_sha256']
    assert dx25['oracle_packet_sha256'] == sha(dx25_dir / 'oracle_packet.json')
    oracle = json.loads((dx25_dir / 'oracle_packet.json').read_text())
    assert oracle['image'] == IMAGE and oracle['sdk_lib_sha256'] == dx['sdk_lib_sha256']
    for key, name in (('oracle_source_sha256', 'oracle.cpp'), ('oracle_exe_sha256', 'oracle.exe'),
                      ('oracle_object_sha256', 'oracle.obj'), ('runner_sha256', 'probe.py')):
        assert oracle[key] == sha(dx25_dir / name)
    assert oracle['mappings'] == dx25['mappings']
    for name, digest in dx25['mappings'].items():
        assert sha(dx25_dir / (name + '_mapping.json')) == digest
    for row in dx25['clean_rows']:
        assert row['negative_tests_passed'] and row['original_referee_match'] == 100
        assert sha(ROOT / row['source']) == row['source_sha256']
        assert sha(ROOT / row['object']) == row['object_sha256']
    assert len(dx25['rows']) == 3 and len(dx25['clean_rows']) == 4
    dx25_credit = {(int(row['address'], 16), row['code_bytes']) for row in dx25['rows']}
    assert dx25_credit == {(0x100de367, 48462), (0x100efe3c, 9617), (0x100f2b25, 9617)}
    assert sum(n for _, n in dx25_credit) == dx25['verified_instruction_bytes'] == 67696
    assert sum(len(row['bindings']) for row in dx25['rows']) == 10991
    assert sum(row['excluded_table_bytes'] for row in dx25['rows']) == 27703
    link25 = json.loads((dx25_dir / 'link_packet.json').read_text())
    assert link25['status'] == 'PASS' and not link25['whole_file_identity'] and link25['image'] == link['image']
    assert link25['source_match_losses'] == []
    assert (link25['baseline_source_matches'], link25['previous_source_matches'],
            link25['raw_standard_source_matches'], link25['linked_source_matches']) == (359, 360, 361, 363)
    assert len(link25['linked_lookup_proofs']) == 4
    assert len(link25['data_disambiguated_placements']) == 2
    assert all(len(row['wrong_width_rejected']) == 1 for row in link25['data_disambiguated_placements'])
    assert all(sha(ROOT / p) == h for key in ('source_dependencies', 'objects', 'files')
               for p, h in link25[key].items())
    fixture25 = json.loads((dx25_dir / 'fixture_packet.json').read_text())
    assert fixture25['status'] == 'PASS' and fixture25['lookup_comparisons'] == 426244
    assert fixture25['boundary_inputs'] + fixture25['random_inputs'] == 106561
    assert all(sha(ROOT / p) == h for p, h in fixture25['files'].items())
    crt35_dir = TARGET / 'scratch/codex35_crt'
    for name, digest in {
        'check.py': '7965d5d493a8ad044249cdfe15a4a6ff23d86d077575cb5516b9f8324e54e843',
        'build.sh': 'f0608ff971e1fb3bd26c2012e5c6c708d3691b9b96a87c08adcc1ff421517413',
        'compile.sh': '5003488fca198eb99f944f02c496dbb76c273e30ac04dc4a5c30a0bd7d566f81',
        'sources.txt': '085d2b624accd30d348e2c698a6d0dc2f64369a22e869a87c06ea5cbdc085a00',
        'discovery.json': '62a1373e8df04f33fbac92d148e0595cc168e2feb3cd7ed1c9aae62b9344c356',
    }.items():
        assert sha(crt35_dir / name) == digest
    subprocess.run([sys.executable, str(crt35_dir / 'check.py')], check=True, capture_output=True)
    crt35_packet = json.loads((crt35_dir / 'packet.json').read_text())
    assert crt35_packet['status'] == 'REVIEWABLE' and not crt35_packet['whole_file_identity']
    assert crt35_packet['anchor_sha256'] == ANCHOR_SHA and crt35_packet['image'] == IMAGE
    assert crt35_packet['negative_tests_passed']
    for key, name in (('checker_sha256', 'check.py'), ('plan_sha256', 'plan.json'),
                      ('build_script_sha256', 'build.sh'), ('compile_script_sha256', 'compile.sh')):
        assert crt35_packet[key] == sha(crt35_dir / name)
    assert crt35_packet['inventory_sha256'] == sha(ROOT / 'glm/data/functions_gfx10.json')
    assert all(sha(ROOT / 'glm/crt71' / n) == h for n, h in crt35_packet['dependencies'].items())
    assert all(sha(ROOT / n) == h for n, h in crt35_packet['objects'].items())
    assert len(crt35_packet['rows']) == 243 and crt35_packet['verified_instruction_bytes'] == 43206
    prior35 = [*jpeg.items(), *jpeg_extra, *closed, *stl, *standalone, *engine, *total_gain,
               *live_gain, *draw_credit, *crt, *asm, *extra, *output, *woutput, *large, *leaves,
               *globals_rows, *crt_input, *crt16_gain, *crt17_gain, *crt19_gain, *asm19_gain,
               *dx_credit, *dx25_credit]
    crt35_gain = {(int(r['address'], 16), r['bytes']) for r in crt35_packet['rows']
                  if not any(int(r['address'], 16) < a + n and a < int(r['address'], 16) + r['bytes']
                             for a, n in prior35)}
    sdk35_dir = TARGET / 'scratch/codex35_sdk'
    for name, digest in {
        'check.py': '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc',
        'check_link.py': 'be24421653cb667e64ea5365d6e7af4113b832b203cd079136006658a29f7a77',
        'build.sh': '772140daee879fd7652bc914fb5fd47b27581d472c9a84f1b5d19ebef1ff4e4d',
        'link.mk': '417b12952ef8aadbeb5412652d55a1e9acb1a542237730d099316beb9c1791bc',
        'run_test.py': '925841161374d79c812b85bec1b69f137178f23298f5198db0fc63cc2003d77e',
        'compile_test.sh': '5804f4d363f9e2ffde0b678cc158df76aa7d92e76259546e67a0994909cf32ff',
    }.items():
        assert sha(sdk35_dir / name) == digest
    for checker in ('check.py', 'check_link.py'):
        subprocess.run([sys.executable, str(sdk35_dir / checker)], check=True, capture_output=True)
    sdk35_packet = json.loads((sdk35_dir / 'packet.json').read_text())
    assert sdk35_packet['status'] == 'REVIEWABLE' and not sdk35_packet['whole_file_identity']
    assert sdk35_packet['anchor_sha256'] == ANCHOR_SHA and sdk35_packet['negative_tests_passed']
    assert all(sha(ROOT / n) == h for n, h in sdk35_packet['files'].items())
    sdk35 = {(int(r['address'], 16), r['bytes']) for r in sdk35_packet['rows']}
    assert len(sdk35) == len(sdk35_packet['rows']) == 37
    assert sum(n for _, n in sdk35) == sdk35_packet['verified_instruction_bytes'] == 1798
    assert sdk35_packet['callback_identity_carrier']['source_credit'] == 0
    sdk35_gain = {(a, n) for a, n in sdk35 if not any(
        a < b + m and b < a + n for b, m in [*prior35, *crt35_gain])}
    link35 = json.loads((sdk35_dir / 'link_packet.json').read_text())
    assert link35['status'] == 'PASS' and not link35['whole_file_identity']
    assert link35['baseline_source_matches'] == 363 and link35['linked_source_matches'] == 400
    assert not link35['source_match_losses'] and len(link35['placements']) == 37
    assert all(sha(ROOT / n) == h for n, h in link35['files'].items())
    fixture35 = json.loads((sdk35_dir / 'fixture_packet.json').read_text())
    assert fixture35['status'] == 'PASS' and fixture35['comparisons'] == 361654
    assert all(sha(ROOT / n) == h for n, h in fixture35['files'].items())
    parser_dir = TARGET / 'scratch/codex30_parser'
    for name, digest in {
        'check.py': 'a7de81ca77ba6de75cea6213795052867fdf88375929345644ce0272a2effb05',
        'check_link.py': 'b36393e4c8ebf219b70545dc81c6a29ea4e4d9c7ab702c3aefa6331361dec67c',
        'build.sh': '03b850cc4b93c354a45ac4b4cdba42ae82350971b4a070e91ccb9cb53a2c6741',
        'link.mk': '2e6f05ac81a277f17c4346614b6f1835382fe7c2de3be30e124e266fe2eed2d1',
        'select_dependencies.py': '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692',
        'run_test.py': '79c002a3f087b2e6d6474728f985b739cf96c67e15afc54f0725c693017c4de9',
        'compile_test.sh': 'f7d8477d79720c8987f7da820daaf18048572d3c4b2e0dd4446369e73637cf4f',
    }.items():
        assert sha(parser_dir / name) == digest
    subprocess.run([sys.executable, str(parser_dir / 'check.py'), '--clean'], check=True, capture_output=True)
    subprocess.run([sys.executable, str(parser_dir / 'check_link.py')], check=True, capture_output=True)
    parser_packet = json.loads((parser_dir / 'clean_packet.json').read_text())
    assert parser_packet['status'] == 'REVIEWABLE' and not parser_packet['whole_file_identity']
    assert parser_packet['anchor_sha256'] == ANCHOR_SHA and parser_packet['negative_tests_passed']
    assert all(sha(ROOT / n) == h for n, h in parser_packet['files'].items())
    parser_gain = {(int(r['address'], 16), r['bytes']) for r in parser_packet['rows']}
    assert len(parser_gain) == 3 and sum(n for _, n in parser_gain) == 6082
    assert sum(r['excluded_table_bytes'] for r in parser_packet['rows']) == 1608
    assert not any(a < b + m and b < a + n for a, n in parser_gain
                   for b, m in [*prior35, *crt35_gain, *sdk35_gain])
    parser_link = json.loads((parser_dir / 'link_packet.json').read_text())
    assert parser_link['status'] == 'PASS' and not parser_link['whole_file_identity']
    assert parser_link['baseline_source_matches'] == 400 and parser_link['linked_source_matches'] == 403
    assert not parser_link['source_match_losses'] and parser_link['dependency_source_credit'] == 0
    assert all(sha(ROOT / n) == h for n, h in parser_link['files'].items())
    parser_fixture = json.loads((parser_dir / 'fixture_packet.json').read_text())
    assert parser_fixture['status'] == 'PASS' and parser_fixture['cases'] == 96
    assert all(sha(ROOT / n) == h for n, h in parser_fixture['files'].items())
    reads_dir = TARGET / 'scratch/codex30_reads'
    for name, digest in {
        'check.py': 'f037f929cd4d7d9c51bb5c7154cbc30ca9b1c2e6093d07e2d2a49b651b9b692c',
        'check_link.py': 'b11276584cb351fa734091a15f45b17edd4aabadf5cea75fbffa54ed00602334',
        'select_dependencies.py': '87335ff6653bd7718db69feeeaa299219c858d56280f98d5215047ed3231bd6d',
        'build.sh': '80f1100463604cc630b2a14b3cb950171d25be045f15c00b1554508fe4a33b6f',
        'link.mk': 'b37e6509f22af1c54bb523b164575adefbc9367468595d8181e9b6241f5f321d',
    }.items():
        assert sha(reads_dir / name) == digest
    subprocess.run([sys.executable, str(reads_dir / 'check.py')], check=True, capture_output=True)
    subprocess.run([sys.executable, str(reads_dir / 'check_link.py')], check=True, capture_output=True)
    reads_packet = json.loads((reads_dir / 'clean_packet.json').read_text())
    assert reads_packet['status'] == 'REVIEWABLE' and not reads_packet['whole_file_identity']
    assert reads_packet['anchor_sha256'] == ANCHOR_SHA and reads_packet['negative_tests_passed']
    assert all(sha(ROOT / n) == h for n, h in reads_packet['files'].items())
    reads_gain = {(int(r['address'], 16), r['bytes']) for r in reads_packet['rows']}
    assert len(reads_gain) == 12 and sum(n for _, n in reads_gain) == 475
    reads_link = json.loads((reads_dir / 'link_packet.json').read_text())
    assert reads_link['status'] == 'PASS' and not reads_link['whole_file_identity']
    assert reads_link['baseline_source_matches'] == 403 and reads_link['linked_source_matches'] == 415
    assert not reads_link['source_match_losses'] and reads_link['dependency_source_credit'] == 0
    assert all(sha(ROOT / n) == h for n, h in reads_link['files'].items())
    reads_fixture = json.loads((TARGET / 'scratch/codex30_constants/reads_fixture_packet.json').read_text())
    assert reads_fixture['status'] == 'PASS' and reads_fixture['cases'] == 2000
    assert all(sha(ROOT / n) == h for n, h in reads_fixture['files'].items())
    instruction_dir = TARGET / 'scratch/codex30_instructions'
    for name, digest in {
        'check.py': 'f9da8fbaba71a25b1c14f4a42cbc11ece85ddf56874f20f0008b8e20abc41713',
        'check_link.py': '6e247f7b222fb43d5bdcd659b3c56d426fb883cdcf88f40137d51468ae92306c',
        'sdk_binding.py': 'd10021efd10506d110cfec38535668c696194a6dfdb972564cbc30fe136bd69f',
        'build.sh': '281df84044592e05bd7ed20d4637318aa379bb0da716b03575807ca06a82a69a',
        'link.mk': 'b4741e33a2244019fb4ad5ce40bb4983539d3d81c5cc7d1541cc9220a8d836f0',
        'select_dependencies.py': '15383ae09e7f59ceb428f86b1ce02277384e090f49d7ec7d5d0f3597429a0a57',
        'run_test.py': 'fb50b8b56e511a46e53ce13d2b93d057e268bd0af2461f1359cfc5c84bac8203',
        'compile_test.sh': 'c693f77c6bea95b7ece6c1f75fb395f2991bbaf6230b9e797c9a66962cb3abe2',
    }.items():
        assert sha(instruction_dir / name) == digest
    subprocess.run([sys.executable, str(instruction_dir / 'check.py')], check=True, capture_output=True)
    subprocess.run([sys.executable, str(instruction_dir / 'check_link.py')], check=True, capture_output=True)
    instruction_packet = json.loads((instruction_dir / 'clean_packet.json').read_text())
    assert instruction_packet['status'] == 'REVIEWABLE' and not instruction_packet['whole_file_identity']
    assert instruction_packet['anchor_sha256'] == ANCHOR_SHA and instruction_packet['negative_tests_passed']
    assert all(sha(ROOT / n) == h for n, h in instruction_packet['files'].items())
    instruction_gain = {(int(r['address'], 16), r['bytes']) for r in instruction_packet['rows']}
    assert len(instruction_gain) == 4 and sum(n for _, n in instruction_gain) == 613
    assert sum(r['excluded_table_bytes'] for r in instruction_packet['rows']) == 48
    instruction_link = json.loads((instruction_dir / 'link_packet.json').read_text())
    assert instruction_link['status'] == 'PASS' and not instruction_link['whole_file_identity']
    assert instruction_link['baseline_source_matches'] == 415 and instruction_link['linked_source_matches'] == 419
    assert not instruction_link['source_match_losses'] and instruction_link['dependency_source_credit'] == 0
    assert len(instruction_link['linked_lookup_proofs']) == 4
    assert instruction_link['baseline_extent_correction'] == {
        'symbol': '_DXGetErrorString9W@4', 'old_section_bytes': 72405,
        'instruction_bytes': 48462, 'full_section_still_verified': True}
    assert instruction_link['additional_baseline_extent_corrections'] == [{
        'symbol': '_DXGetErrorString9A@4', 'old_section_bytes': 72524,
        'instruction_bytes': 48427, 'full_section_still_verified': True}]
    assert all(sha(ROOT / n) == h for n, h in instruction_link['files'].items())
    instruction_fixture = json.loads((instruction_dir / 'fixture_packet.json').read_text())
    assert instruction_fixture['status'] == 'PASS' and instruction_fixture['cases'] == 10285
    assert all(sha(ROOT / n) == h for n, h in instruction_fixture['files'].items())
    node_dir = TARGET / 'scratch/codex35_nodes'
    for name, digest in {
        'check.py': '662f35a91c9d5ac91821aa0002681dee5e9d994d632ea9a7311f05dba77893c7',
        'check_link.py': 'ff9ce9447d0be727179c43369fa3c08c244fb522f3564f3fecb9679548b6f36b',
        'vtables.py': 'c233ab7ebea5f2f988904f8e92b453a2edbb38fa4307cfadd95c0304777fd6f8',
        'sdk_binding.py': '87f9fca6c6bb2748faea490b15e85b587cb77fa2df187bd401ba34951e30a6d8',
        'build.sh': '63e63046eae27335b2250e21fce625e24b82dde0e24c4f4a2dbfb2aca62a133d',
        'link.mk': '52ff051d6bf1e3f5045d1de14d71b1085792c07c88ac15250588bce8a58a507e',
        'select_dependencies.py': 'dd4c7c40990376e2018d28bc5bef09179494f5b870794129d557a8031b1fc402',
        'run_test.py': 'b0d464c8141a50903428b95dce1b0bd2941e8f66630cc8fbd25e0165c8a13b32',
        'compile_test.sh': 'eeb51f84b24045665dd05ff2374315aa983ef1bf0dc0679d6c448163559430ff',
    }.items():
        assert sha(node_dir / name) == digest
    subprocess.run([sys.executable, str(node_dir / 'check.py'), '--clean'], check=True, capture_output=True)
    subprocess.run([sys.executable, str(node_dir / 'check_link.py')], check=True, capture_output=True)
    node_packet = json.loads((node_dir / 'clean_packet.json').read_text())
    assert node_packet['status'] == 'REVIEWABLE' and not node_packet['whole_file_identity']
    assert node_packet['anchor_sha256'] == ANCHOR_SHA and node_packet['negative_tests_passed']
    assert all(sha(ROOT / n) == h for n, h in node_packet['files'].items())
    node_gain = {(int(r['address'], 16), r['bytes']) for r in node_packet['rows']}
    assert len(node_gain) == 72 and sum(n for _, n in node_gain) == 4783
    assert all(r['excluded_table_bytes'] == 0 for r in node_packet['rows'])
    node_link = json.loads((node_dir / 'link_packet.json').read_text())
    assert node_link['status'] == 'PASS' and not node_link['whole_file_identity']
    assert node_link['baseline_source_matches'] == 419 and node_link['linked_source_matches'] == 491
    assert not node_link['source_match_losses'] and node_link['dependency_source_credit'] == 0
    assert all(sha(ROOT / n) == h for n, h in node_link['files'].items())
    node_fixture = json.loads((node_dir / 'fixture_packet.json').read_text())
    assert node_fixture['status'] == 'PASS' and node_fixture['cases'] == 10496
    assert all(sha(ROOT / n) == h for n, h in node_fixture['files'].items())
    assembler_gain, support_gain, lexer_gain, preprocessor_gain, compiler_gain, clip_gain = set(), set(), set(), set(), set(), set()
    for family, count, byte_count, baseline_count, linked_count, cpu_count, pins in [
        ('codex30_assembler', 14, 1517, 491, 505, 1440, {'check.py': '122503199b8bd6eeeb62c43b2b608d741534ad5e73120c1ca81f8b4c1e9cb6dc', 'check_link.py': 'ad65993748bc22de451925bdc27a6ccb6e7775580787b7e748ee600e0460498c', 'vtables.py': '8da29b66d6b3e22d6a0c283d049240bed6ac6f3e1557a97d94966c94a6ec3f56', 'sdk_binding.py': '87f9fca6c6bb2748faea490b15e85b587cb77fa2df187bd401ba34951e30a6d8', 'build.sh': '269587b2397efba2641bac1bfdafb81a1218fba31568b57801949f0f66e79bcb', 'link.mk': '0aa38161eb7b031fa1242b119003025517593a23f30d724e2086162a2a81d388', 'select_dependencies.py': 'e9bdb5b9cb2b7c949bdd9888f3844f5239bdd746dbebfd7762a2e3f1e8db0611', 'run_test.py': 'ca98a472d4c5409ec34756402eaca3a161123f1997fdd77e55baf24080442ca6', 'compile_test.sh': '9ce4c7cbeacbd69136dc41edaa2e9d8a97d1700f5bb6027e338acdd7a2ce9a46'}),
        ('codex30_support', 11, 1162, 505, 516, 3584, {'check.py': '0be7f12571224aab64bb2a76c1516cedf3a6f2383e6487eecce712eca812cb4d', 'check_link.py': '6568a4c3659b6ce96d6076b510a19d78aaee017445ddae879447addecf0c0148', 'vtables.py': 'b2c8db5fc24d6426a7def14f0bed99d021a9cdd093fcba040f3a91025d4a97ef', 'sdk_binding.py': '87f9fca6c6bb2748faea490b15e85b587cb77fa2df187bd401ba34951e30a6d8', 'build.sh': '4ae4184a176cdb63456082deef9e084392864bb4bc8cb2eb9d4cd9c203f3006e', 'link.mk': '9b1737324df750c1708ab7a04884b4e60784a4b63c34332e974a1ca10d2302e7', 'select_dependencies.py': '38fd6db33515acee4bd4a3adf84b7c9dbc78e1c22cfdfc457fa50edec34260d7', 'run_test.py': '798bebc141b1038d2d8d985e0f61ac4f5b3a2a9081977f38627c32b62d73c28e', 'compile_test.sh': '7fa72226b5409d33d25df89f0ad4bb35ef007cd6a27e2e1b2ef59bc7330cd173'}),
        ('codex35_lexer', 7, 1037, 516, 523, 9976, {'check.py': 'c5ac7720e446aad60f8cb73c0e7d0dc10d9166b200ae615141f4f2cfe2fb12bf', 'check_link.py': 'b896f8aa9ecb55969a421a0a0b35376b56464ae1691fa1562041ebf370fc0268', 'vtables.py': '70baa3218665c48cab3a8b700fc1ef36ea66748247fe177738c8b158769bbe93', 'sdk_binding.py': '8da66f2fabfff0ed5c27e1e1fbafa9983cb344d6b5dedab1f841e7a77b01491d', 'build.sh': '2de410eb1eeb9968ec542ba98da6931ef5fefeaa0e8891f7cff2ddf2c068a119', 'link.mk': '7b00a7488676cb50b8f670d96d95974382932fff5617d40cab3ef02d578963c7', 'select_dependencies.py': '10463270c3c787ff7a9a680f423c3ce11295df34c8f0e0bd49d70c52a182cc81', 'run_test.py': 'd7e8c57070faecaa4e001afc425e1df3daac9837579ad8b17f41e2d5bb7ef52a', 'compile_test.sh': 'ec667ce430dcf346a2b4a45e30dafa4405292ac07afddd3557831b175c37a1a6'}),
        ('codex35_preprocessor', 25, 2199, 523, 548, 12259, {'check.py': '6645f73286332986a182792c7482e9a44c316c1acde6c9605f06d65b36dc450d', 'check_link.py': '8a2e304b695fd8068c86c0e9fc8d2c7a045ab682c3cbe5ebb46adc2c523c25a8', 'vtables.py': '286e8db166aecaf1298cb7284634d2c38878cded8b9e8943bff0ff5af5cbcf56', 'sdk_binding.py': '9d908b68e297aa20ede5577b82cb1a669802b73761010f1aba9024635735183f', 'build.sh': '163cdb6c383fc1f9cf1c8e8b71dcba78ffd072066834837cff30ee6d7e04e6b0', 'link.mk': 'd65f3e31c21260884c103370da33873b5efd01c42db76205fa181f08dff3f66f', 'select_dependencies.py': '5979913ca49cb48716ac3e1372d17f1b93095a653a96f84e11064ff8bc853b33', 'run_test.py': 'bc9a0753813ac46cf612d29d64b554eac6534910a950d8be6b006a5f734ca507', 'compile_test.sh': 'd8ef111e91b541e6db564f761701261728406b07acb41198ddae54d07c3d9c5a'}),
        ('codex35_compiler', 8, 757, 548, 556, 20355, {'check.py': '1ffb58a461240fe7153c93d6d34eadf68787b2f216f28d460d96a94f389c1e23', 'check_link.py': '0ada8b5cabe8fe3d7db827296f1972975aa74a2bf2006a40ee97e7726c142df1', 'vtables.py': '164015760b74b004fec21fc282354dd99ec3b19254f789b1c4b0992f58b5de8b', 'sdk_binding.py': 'f18f559c0c1aa4e465cb9da86cb8b27fba703fc24279fefff43945ac5db2035d', 'build.sh': 'f6ecade0e6670bc03d0b5e76273d0344b934bdcd62a6c9d68fd68f2ddec3943c', 'link.mk': 'beb69a59fcab7668f227ad67a5b7d05615ab97416b81e1a166af8fc31b94d8d4', 'select_link_dependencies.py': '3f45fc62c1702ea31c1effc8b0eafaf2f94d3588e1cbb5dddd35168ea297851f', 'run_clean_test.py': '06f06ef2fecbd24f889496c9cfe987417b72da2851b8334fb03c699a6866cbd3', 'compile_clean_test.sh': '96adde37717b019c76a3507279193fc95ef291bed23eef19835aa87972353e77', 'run_test.py': '53ad982f7206dd5b8869d24ce0bec31d638edd6e8cf58c73dd54fc757eba8125', 'test.cpp': '40153c8bd6e52361d6992f2e2328312ffa0a093f167643318ff0c991d13e4b62'}),
        ('codex35_clip', 9, 1066, 556, 557, 1284, {'check.py': '41635c4bdeea00c83cdddd7b54d659fd7294338b32f21bbb330838ef99208cb7', 'check_link.py': '9e5131bbece7d0d81596320d90252ec01d23a0515164334b030b226e42c96648', 'vtables.py': '9cba04fd6cfaa15618ea22e5c61e952f470a83af3dbde65070310982deb0b96d', 'sdk_binding.py': '8c744fb8229fd254edf8ea215f11bf0fafadfa2f4d69fc41bff94467e4f7040c', 'build.sh': '7b47858ed5b2a7752a9e964627acb5ccd745aa89372b2cdde4ca580a9b842057', 'link.mk': 'fd58cb5cb9dba409cb02143f93f9ace9cf4081bdad686833b9835812b7b19097', 'select_link_dependencies.py': '44540ea47d6e011c0d448379ddf874f34983ed1fa4090db4ca241697f036843b', 'run_test.py': 'bb6b107ec83d20c6ac0dbe1cf5c26d82143e507832a9cc178b12486d3398ee90', 'compile_test.sh': 'b913eccffae7cc54cc10734fa3b3a4c9fef311978eeb7f4e17f6ec852483243a'}),
        ('codex35_compiler_types', 2, 411, 557, 559, 1284, {
            'check.py': '64ba07a1792a4d64e8e6619cb1b6099953d1e3dbfecd92195abb79b286d0a41a',
            'check_link.py': 'c1ddaaf0d97259d86ea3d2dcb2a58019fd11a63af8f9c6043d94c3974bf88265',
            'referee.py': '1f7f5e7380267e5cfe11fc03ffa31a3cee0996c3777749314685a04e0d9ba740',
            'vtables.py': 'cbf165a0f317e882ffc91eaca082ea3bb7a715826a0a24ef610218f06831b730',
            'sdk_binding.py': '3fbb85d3acc340d9fa1ccf328e0eb15ea0e798e21502c779d98cce2fbe71606e',
            'build.sh': 'a3da48553b81fb476266694f4b0b93b4170193c1164e861793a83e30808e58d2',
            'link.mk': 'b6cdc0086e97143c5fbef2f9ad6b2ce44155337c1cc72d6818295f18587a14e0',
            'select_link_dependencies.py': 'd411f66abceed265907bab0232bef54478407b0589ae1e9822c88a8f343ba7bc',
            'run_clean_test.py': '283309602eb13a07c1a6677073a5129d0c69cc033577fa8d70b90b972be1629c',
            'compile_clean_test.sh': 'bafc65ef33a7a66f0719399a46a91c05c4a33d19174f27731147b9d430700099'}),
        ('codex31_program', 12, 2663, 559, 571, 1284, {
            'check.py': 'eb059e16ab89aac066d7e5cf98d1792514a8cff2af0b049cfeb82bbb569cddf5',
            'check_link.py': '7cac5b09a49985f1d2e13d526e9e31e817fd1d72194240cb1d15e6a620e81a9b',
            'vtables.py': '0e925d2b59ea7404db5ed9288cd9e65dfa5179c93a8c3d5bb69bc90dabb735c4',
            'sdk_binding.py': '0a4414bf24bc01d01014167365cac7385e36a11fc67d068c29b59721dd727b53',
            'build.sh': '5f675c9eb6f55a4952db68df07e4b49b98b0b570b5de4ba57f211fb5434d4a4c',
            'link.mk': 'a47f2cfd61fa5595a52d585378a3846cc539440a572419f5747af67593fd5c9a',
            'select_link_dependencies.py': '4d414c53d424e478abcccaaf43d03f905ca780c7523f3798b83af0eb4d3a1020',
            'run_clean_test.py': 'da4b78102113c16c1ce2a8b2472e5835f9de6d0033fa53acafa6dd6edbb5e370',
            'compile_clean_test.sh': 'f8610c5be416a61aba2b48df60a400b54a9ddcc9fa71f32be91a769db75e3b02'}),
        ('codex35_program_flow', 4, 945, 571, 575, 1284, {
            'check.py': 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d',
            'check_link.py': '37b0f363ca257c023ebf04bb95c2641a03f2f8e1600ce93944a29940f64dde30',
            'vtables.py': '0471ea47f47b1737f68b733137698b19a6cd73e339fcaeb01e75ec5c719d1909',
            'sdk_binding.py': 'e63f153274accaae64bf14f73f997062cea05b658ae02d158948418bc2fb1e28',
            'build.sh': '1c1e0efcbbd0c6beacd828f1b8e357e2dfba88dbc8cae1d5c8b888ba6e1a3503',
            'link.mk': '12a25ba5d3572fca6a0359e96211539989c0c4013a40918cec0a1b21f815fd55',
            'select_link_dependencies.py': 'e631f05c5b8653a9cde5f379bffbd1198978c61514df2dfea585e017c9c350a4',
            'run_clean_test.py': 'ffb1d0f67b40e10372624f7ce90eb203d48852bdaebce68ec77bdf3689681e6a',
            'compile_clean_test.sh': '6128401a2d7237cd898be2e588f6b74f43bd1f04c1afbb0ffdc89a643b4d3a83'}),
        ('codex35_program_varying', 2, 673, 575, 577, 1284, {
            'check.py': '3e4a4abdfe093d6acec180fce92654e9b15939abe649ae43d0219c22504ad4be',
            'check_link.py': '1ef15e5befdb6be92cccd615cd40f33cc6d53e0b5c1612ca3f891ca19f626c8c',
            'vtables.py': 'b1a051cff4026c84c502ea7d1287a3975879608d5922074d016cf4da93563426',
            'sdk_binding.py': '86c3f1cce75c47874c8f0d28ce0c97789b5394b1a3bb8ccdef048e260dbb707c',
            'build.sh': '91b285573803cb06412142559eccf967aba45f14bd780b7f6e928a47cc7ddee4',
            'link.mk': '99baef7928ab33942bfaa7ee68e4097bad3ba0265636913054dc335390af511e',
            'select_link_dependencies.py': '7caa6729c6bc357abc1960ec7b217f49b4ac28212aa3e6b8f78fc17069dc0875',
            'run_clean_test.py': '2593f7ae18d64df61949d80d657c4c536d869aca0378323a58763c2c508c009b',
            'compile_clean_test.sh': 'b7967a2712b8c8be87c802f8e44c26a34a60546d4003715c7997c16ecdf9de72'}),
        ('codex35_program_pruning', 1, 408, 577, 578, 1284, {
            'check.py': '967adc2d4aa4f5436afcc98ed491cbcc87d163145bd72dcba4d36ce5065b0c4f',
            'check_link.py': '0d00c48ed7ca79dcb6dfb8c074c15a465fe72194a707cccd4d9906a188956963',
            'vtables.py': '0a33a985b4bff6b7f853cf48b0ab816e04beca1eacac5fcdfa92e1917e9530ed',
            'sdk_binding.py': '017ab86683f1b1b31277006e797254954f7007362ab5ca63ebec7061761170bc',
            'build.sh': '2cf935a975078ef4e748fbbcd5cd75e8ba451a7f5b217f55cb2c3c2cd333fffb',
            'link.mk': '746d30546e6979a5a69c11f1a4011dadbfdee23100ea4a8ab946094146aca765',
            'select_link_dependencies.py': '8f35c012425c874e6800dce886ec59839c65468d873c92f073b47ce63ccba432',
            'run_clean_test.py': 'b58f8fd149be0b7dae3562ae4929fa7930ee7d5a57363f417497009b9d0d5f54',
            'compile_clean_test.sh': '6fbb609e958156c2553501f8cb0809f7458c7741eecc15394703fa6c072a5f5a'}),
        ('codex35_program_strip', 5, 643, 578, 583, 1284, {
            'check.py': 'b683f03cbb70a8b9e86a5c1cd0bf89c43f11c487f717e45f28e67f44be62b68a',
            'check_link.py': '872f47e50beee7609d740ce55ad6cc6b181d11b7579fe538ec2cd0736cf34d26',
            'vtables.py': '709068f243c8bc57f41cb841272558c78256a1fcdc4013d20d772be110426e26',
            'sdk_binding.py': '3222ef0e76d4f60cece65298c096a8af564258709b59434df83491ca963b8aa0',
            'build.sh': 'bbebd55c9575dea83f2f93b613f2c7ed2110eebefe892dacd14424fb531752db',
            'link.mk': 'dd45d6c88e49494d03a3c7c052336faa2b66006bddea57a0f9038cb0c5fe2995',
            'select_link_dependencies.py': 'e57dcb8fc0b8768fdf0bd19d69179df68fca364fb2905656254d34dfc8454553',
            'run_clean_test.py': 'e595ff10df35d0d9940684c844b87034fc0a6087ea4962f7500233b227211b16',
            'compile_clean_test.sh': 'f0ffa4272e616f18eadacf8a4dae57650008bf7e31dbfee3dbfbaf88bf2525e7'}),
        ('codex35_program_sort', 1, 279, 583, 584, 1284, {
            'check.py': '770b6323c0af1e28bd3a9457e5799342cd629e5c973c823920d34f399178bd59',
            'check_link.py': '3d790557dbe53770ff96dc3b254619b281ddfaa62b340f088b54b5122679ca21',
            'vtables.py': '9128978f55edae4b6ef5d6cdf18615d40931c36758980fb04e431ac6c62cb2df',
            'sdk_binding.py': '01b2c27438ec8d705e63b325167987aa05342263d331c09a6e68c200d6e1086c',
            'build.sh': 'cd9cba637997cb8b184f537760dd5407951683e579b3e436b8b9f7e3444cfd99',
            'link.mk': '78686132ed837ef9d54c49c58789359e0361eaf5afa4411d253137f8c62b8ed2',
            'select_link_dependencies.py': 'da27b0d9dfe15477c2ec8d2f33df74cbeb4c715c17330e9204acdc344a93e85a',
            'run_clean_test.py': 'f101ea0df21fef25ea9f324291f646d4c4dd85cd65b76cddc5bddde1e2255d4f',
            'compile_clean_test.sh': '85ffc6abdd5ea41fc6d7baff2dd0a7e3a26d8c0b86d5b08a668d6bde3cb791df'}),
    ]:
        directory = TARGET / 'scratch' / family
        for name, digest in pins.items():
            assert sha(directory / name) == digest
        subprocess.run([sys.executable, str(directory / 'check.py'), '--clean'], check=True, capture_output=True)
        subprocess.run([sys.executable, str(directory / 'check_link.py')], check=True, capture_output=True)
        packet = json.loads((directory / 'clean_packet.json').read_text())
        assert packet['status'] == 'REVIEWABLE' and not packet['whole_file_identity']
        assert packet['anchor_sha256'] == ANCHOR_SHA and packet['negative_tests_passed']
        assert all(sha(ROOT / n) == h for n, h in packet['files'].items())
        gain = {(int(r['address'], 16), r['bytes']) for r in packet['rows']}
        assert len(gain) == count and sum(n for _, n in gain) == byte_count
        if family == 'codex35_compiler_types':
            assert sorted(r['excluded_table_bytes'] for r in packet['rows']) == [0, 52]
            assert all(r['instruction_aware_referee_match'] == 100 for r in packet['rows'])
            assert sorted(r['original_referee_match'] for r in packet['rows']) == [95, 100]
        else:
            assert all(r['excluded_table_bytes'] == 0 for r in packet['rows'])
        link = json.loads((directory / 'link_packet.json').read_text())
        assert link['status'] == 'PASS' and not link['whole_file_identity']
        assert link['baseline_source_matches'] == baseline_count and link['linked_source_matches'] == linked_count
        assert not link['source_match_losses'] and link['dependency_source_credit'] == 0
        assert all(sha(ROOT / n) == h for n, h in link['files'].items())
        fixture_name = 'clean_fixture_packet.json' if family in ('codex35_compiler', 'codex35_compiler_types', 'codex31_program', 'codex35_program_flow', 'codex35_program_varying', 'codex35_program_pruning', 'codex35_program_strip', 'codex35_program_sort') else 'fixture_packet.json'
        fixture = json.loads((directory / fixture_name).read_text())
        assert fixture['status'] == 'PASS' and fixture['cases'] == cpu_count
        assert all(sha(ROOT / n) == h for n, h in fixture['files'].items())
        if family == 'codex30_assembler':
            assembler_gain = gain
        elif family == 'codex30_support':
            support_gain = gain
        elif family == 'codex35_lexer':
            lexer_gain = gain
        elif family == 'codex35_preprocessor':
            preprocessor_gain = gain
        elif family == 'codex35_compiler':
            compiler_gain = gain
        elif family == 'codex35_compiler_types':
            type_gain = gain
            assert type_gain == {(0x1006dca1, 98), (0x1006ddf3, 313)}
        elif family == 'codex31_program':
            program_gain = gain
            assert {(0x1006c418, 32), (0x1006db35, 32)} <= gain
        elif family == 'codex35_program_sort':
            sort_gain = gain
            assert sort_gain == {(0x10086920, 279)}
        elif family == 'codex35_program_strip':
            strip_gain = gain
            assert strip_gain == {(0x1006c34c, 27), (0x1006c367, 27), (0x1006c382, 27), (0x10086c88, 33), (0x10086f48, 529)}
        elif family == 'codex35_program_pruning':
            pruning_gain = gain
            assert pruning_gain == {(0x10087159, 408)}
        elif family == 'codex35_program_varying':
            varying_gain = gain
            assert varying_gain == {(0x10086f0d, 59), (0x1008d61e, 614)}
        elif family == 'codex35_program_flow':
            flow_gain = gain
            assert flow_gain == {(0x100865c6, 26), (0x1008ac46, 141), (0x1008acd3, 568), (0x100863a0, 210)}
            assert all(r['instruction_aware_referee_match'] == 100 for r in packet['rows'])
            assert sorted(r['original_referee_match'] for r in packet['rows']) == [97, 100, 100, 100]
        else:
            assert family == 'codex35_clip' and compiler_gain <= gain
            clip_gain = gain - compiler_gain
            assert clip_gain == {(0x10070bef, 309)}
    disjoint((address, size) for address, size in jpeg.items())
    disjoint(closed)
    disjoint(stl)
    disjoint([*jpeg.items(), *jpeg_extra, *closed, *stl, *standalone,
              *engine, *total_gain, *live_gain, *draw_credit, *crt, *asm, *extra, *output, *woutput, *large, *leaves,
              *globals_rows, *crt_input, *crt16_gain, *crt17_gain, *crt19_gain, *asm19_gain, *dx_credit, *dx25_credit,
              *crt35_gain, *sdk35_gain, *parser_gain, *reads_gain, *instruction_gain, *node_gain, *assembler_gain, *support_gain, *lexer_gain, *preprocessor_gain, *compiler_gain, *clip_gain, *type_gain, *program_gain, *flow_gain, *varying_gain, *pruning_gain, *strip_gain, *sort_gain])
    old_bytes = sum(jpeg.values()) + sum(size for _, size in jpeg_extra)
    new_bytes = sum(size for _, size in closed)
    stl_bytes = sum(size for _, size in stl)
    standalone_bytes = sum(size for _, size in standalone)
    engine_bytes = sum(size for _, size in engine)
    private_bytes = sum(size for _, size in total_gain)
    live_bytes = sum(size for _, size in live_gain)
    crt16_bytes = sum(n for _, n in crt16_gain)
    crt17_bytes = sum(n for _, n in crt17_gain)
    crt19_bytes = sum(n for _, n in crt19_gain)
    asm19_bytes = sum(n for _, n in asm19_gain)
    crt35_bytes = sum(n for _, n in crt35_gain)
    dx_bytes = sum(n for _, n in [*dx_credit, *dx25_credit, *sdk35_gain, *parser_gain, *reads_gain, *instruction_gain, *node_gain, *assembler_gain, *support_gain, *lexer_gain, *preprocessor_gain, *compiler_gain, *clip_gain, *type_gain, *program_gain, *flow_gain, *varying_gain, *pruning_gain, *strip_gain, *sort_gain])
    total = old_bytes + new_bytes + stl_bytes + standalone_bytes + engine_bytes + private_bytes + live_bytes + sum(n for _, n in draw_credit) + crt_bytes + asm_bytes + extra_bytes + 2010 + 2064 + 1357 + 707 + 2911 + 3452 + crt16_bytes + crt17_bytes + crt19_bytes + crt35_bytes + asm19_bytes + dx_bytes
    assert total >= (DENOMINATOR * 25 + 99) // 100
    print(f'PASS: disjoint source lower bound {total}/{DENOMINATOR} = '
          f'{total / DENOMINATOR:.6%}; JPEG {old_bytes}, closed tree {new_bytes}, '
          f'STL {stl_bytes}, standalone {standalone_bytes}, engine {engine_bytes}, '
          f'private linked gain {private_bytes}, live verified/src gain {live_bytes}, '
          f'private draw groups {sum(n for _, n in draw_credit)}, '
          f'CRT C source {crt_bytes + extra_bytes + 2010 + 2064 + 1357 + 707 + 2911 + 3452 + crt16_bytes + crt17_bytes + crt19_bytes + crt35_bytes}, '
          f'CRT ASM source {asm_bytes + asm19_bytes}, reconstructed SDK source {dx_bytes}')
    print(f'CRT batch: {len(crt16_gain)} new disjoint bodies, {crt16_bytes} bytes; duplicates excluded.')
    print(f'CRT17 batch: {len(crt17_gain)} new disjoint bodies, {crt17_bytes} bytes; duplicates excluded.')
    print(f'CRT19 batch: {len(crt19_gain)} new disjoint bodies, {crt19_bytes} bytes; '
          f'new original ASM instruction bytes {asm19_bytes}; duplicates and tables excluded.')
    print('SDK sibling batch: 3 new complete source bodies, 67696 unique code bytes; '
          'clean 4-TU module linked with all previous matches retained; tables excluded.')
    print(f'CRT35 batch: {len(crt35_gain)} new disjoint bodies, {crt35_bytes} bytes; '
          f'SDK35: {len(sdk35_gain)} bodies, {sum(n for _, n in sdk35_gain)} bytes; '
          '400 linked source matches, all previous retained; 361654 CPU comparisons passed.')
    print('Parser batch: 3 complete source bodies, 6082 instruction bytes; '
          '403 linked source matches retained/accepted; 96 full-output CPU cases passed.')
    print('Shader read batch: 12 complete source bodies, 475 instruction bytes; '
          '415 linked source matches, all 403 previous retained; 2000 full-output CPU cases passed.')
    print('Instruction/profile/cast batch: 4 complete source bodies, 613 instruction bytes; '
          '419 linked source matches, all 415 previous retained; 10285 CPU comparisons passed. '
          'DxErr W table is still fully checked, not decoded as instructions or counted again.')
    print('Shader-node batch: 72 complete source bodies, 4783 instruction bytes; '
          '491 linked source matches, all 419 previous retained; 10496 CPU comparisons passed. '
          'Typed vtables and empty SDK Print slots are fully checked but receive no new source credit.')
    print('Assembler batch: 14 complete source bodies, 1517 instruction bytes; 505 linked matches, all 491 retained; 1440 CPU comparisons passed.')
    print('Allocator/diagnostic batch: 11 complete source bodies, 1162 instruction bytes; 516 linked matches, all 505 retained; 3584 CPU comparisons passed.')
    print('Tokenizer batch: 7 complete source bodies, 1037 instruction bytes; 523 linked matches, all 516 retained; 9976 CPU comparisons passed.')
    print('Preprocessor batch: 25 complete source bodies, 2199 instruction bytes; 548 linked matches, all 523 retained; 12259 CPU comparisons passed.')
    print('Compiler batch: 8 complete source bodies, 757 instruction bytes; 556 linked matches, all 548 retained; 20355 clean-profile CPU comparisons passed. Unmatched evaluator/stack allocation remain SDK dependencies, zero extra source credit.')
    print('Clipping cohort: 9 complete source bodies, 1066 instruction bytes; only 309 new bytes counted, all 757 previous compiler bytes retained; 557 linked matches, all 556 retained; 1284 full shader-output CPU cases passed.')
    print('Compiler type/diagnostic cohort: 2 complete source bodies, 411 new instruction bytes; 52 table bytes excluded; 559 linked matches retain all 557; 1284 full shader-output CPU cases passed. Legacy raw GetTypeFlags score95 retained; decoded self-call normalization100 and independent full typed/binding proof pass.')
    print('Program cohort: 12 complete source bodies, 2663 new instruction bytes; 571 linked matches retain all559; 1284 full shader-output CPU cases passed. Optimizer draft and opaque dependencies excluded.')
    print('Program flow cohort: 4 complete source bodies, 945 new instruction bytes; 575 linked matches retain all571; 1284 integrated clean CPU shader outputs pass. Recursive helper raw97 is retained, decoded self-call100 and complete independent bindings pass; other drafts get zero extra credit.')
    print('Varying cohort: 2 complete source bodies, 673 new instruction bytes; 577 linked matches retain all575; 1284 integrated full-output CPU cases pass. Recursive helper and caller remain together in genuine source, no opaque dependency credit.')
    print('Uniform-pruning cohort: 1 complete source body, 408 new instruction bytes; 578 linked matches retain all577; 1284 integrated full-output CPU cases pass. SDK dependencies and drafts receive no additional credit.')
    print('Varying-pruning/accessor cohort: 5 complete source bodies, 643 new instruction bytes; 583 linked matches retain all578; 1284 integrated full-output CPU cases pass. Getter retention is not direct execution coverage; no opaque dependency credit.')
    print('Heap-sort cohort: 1 complete source body, 279 new instruction bytes; 584 linked matches retain all583; 1284 integrated full-output CPU cases pass. No opaque dependency credit.')
    goal31 = (DENOMINATOR * 31 + 99) // 100
    print(f'31% checkpoint: {"REACHED" if total >= goal31 else "PENDING"}; {max(0, goal31 - total)} further source instruction bytes needed.')
    goal = (DENOMINATOR * 35 + 99) // 100
    print(f'35% checkpoint: {"REACHED" if total >= goal else "PENDING"}; '
          f'{max(0, goal - total)} further source instruction bytes needed.')
    print('Draft functions, opaque SDK/CRT library bytes, and whole-file identity excluded.')


if __name__ == '__main__':
    main()
