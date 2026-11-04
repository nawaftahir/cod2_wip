#!/usr/bin/env python3
"""Complete loader/service bindings; CRT reference identity gets no engine credit."""
import argparse
import hashlib
import io
import json
from contextlib import redirect_stdout
from pathlib import Path
import struct
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import EXPECTED, ROOT, load_matcher
from batch_existing import HERE, IMAGE
from check_shape import check
from check_jpeg_dependencies import raw_target


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_fkc_izp2')
    parser.add_argument('--sprintf-run', type=Path, default=HERE / 'authcrt_ttgts880')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    assert Path(inputs['reference']) in [HERE / 'scratch/codex_jpeg_service_abi',
                                        HERE / 'scratch/codex_jpeg_source_callbacks']
    for name, digest in inputs['dependencies'].items():
        assert sha(Path(inputs['reference']) / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher(instruction_aware=True)
    legacy = load_matcher()
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    definitions = {s['name']: s for s in symbols.values() if s['sec'] > 0}
    service_slots = {'_jpeg_renderer_read_file': 0x101d4afc, '_jpeg_renderer_free_file': 0x101d4b00,
                     '_jpeg_renderer_temp_alloc': 0x101d49d8, '_jpeg_renderer_alloc': 0x101d49dc,
                     '_jpeg_renderer_free': 0x101d49e0, '_jpeg_renderer_error': 0x101d49cc,
                     '_jpeg_renderer_print': 0x101d49c8, '_jpeg_renderer_max_texture_size': 0x101d4c84}
    locations = dict(service_slots)
    prerequisites = {}
    for filename in ['jpeg_constructor_packet.json', 'jpeg_startup_packet.json',
                     'jpeg_renderer_bridge_packet.json', 'jpeg_input_block_packet.json',
                     'jpeg_dependency_packet.json']:
        path = HERE / filename
        packet = json.loads(path.read_text())
        assert packet['anchor_sha256'] == EXPECTED
        prerequisites[filename] = sha(path)
        for proof in packet.get('functions', []):
            if proof.get('unresolved', 0) == 0:
                locations[proof['symbol']] = int(proof['address'], 16)
    assert json.loads((HERE / 'jpeg_constructor_packet.json').read_text())['object_sha256'] == sha(obj)
    assert json.loads((HERE / 'jpeg_startup_packet.json').read_text())['object_sha256'] == sha(obj)
    sprintf_run = args.sprintf_run.resolve()
    runtime_inputs = json.loads((sprintf_run / 'inputs.json').read_text())
    assert runtime_inputs['image'] == IMAGE
    for name, digest in runtime_inputs['dependency_hashes'].items():
        assert sha(ROOT / 'glm/crt71' / name) == digest
    runtime_row, = json.loads((sprintf_run / 'results.json').read_text())
    runtime_obj = sprintf_run / runtime_row['object']
    assert runtime_row['source'] == 'sprintf.c' and sha(runtime_obj) == runtime_row['object_sha256']
    runtime_bindings = {'__output': 0x100fa4e6, '__flsbuf': 0x100fa320}
    log = io.StringIO()
    records = []
    data_records = {}

    def constant_string(symbol, destination, addend):
        section = coff['sections'][symbol['sec'] - 1]
        assert section['flags'] & 0x40 and not section['flags'] & 0x20
        start = symbol['value']
        available = raw[section['rawptr'] + start:section['rawptr'] + section['rawsize']]
        length = available.index(0) + 1
        assert not any(start <= r['vaddr'] < start + length for r in section['relocs'])
        base = (destination - addend) & 0xffffffff
        assert available[:length] == raw_target(m, base, length)
        if symbol['name'] in data_records:
            assert data_records[symbol['name']] == dict(address=hex(base), bytes=length)
        data_records[symbol['name']] = dict(address=hex(base), bytes=length)
        return base

    with redirect_stdout(log):
        m['INV']['100f5f14'] = dict(name='_sprintf', addr='100f5f14', size=88, thunk=False)
        legacy['INV']['100f5f14'] = dict(m['INV']['100f5f14'])
        runtime_legacy_score = legacy['cmd_diff']('0x100f5f14', str(runtime_obj), '_sprintf')
        check(0x100f5f14, runtime_obj, '_sprintf', matcher=m, bindings=runtime_bindings)
        assert m['cmd_diff']('0x100f5f14', str(runtime_obj), '_sprintf') == 100
        for name, address in runtime_bindings.items():
            try:
                check(0x100f5f14, runtime_obj, '_sprintf', matcher=m,
                      bindings=dict(runtime_bindings, **{name: address + 4}))
            except ValueError as error:
                assert 'wrong binding' in str(error)
            else:
                raise AssertionError('wrong CRT binding accepted')
        locations['_sprintf'] = 0x100f5f14
        table = definitions['_jpeg_std_message_table']
        section = coff['sections'][table['sec'] - 1]
        entries = [r for r in section['relocs'] if table['value'] <= r['vaddr'] < table['value'] + 500]
        assert len(entries) == 124
        assert {r['vaddr'] for r in entries} == set(range(table['value'], table['value'] + 496, 4))
        for relocation in entries:
            assert relocation['type'] == 6
            offset = relocation['vaddr'] - table['value']
            destination = struct.unpack('<I', raw_target(m, 0x10190ee8 + offset, 4))[0]
            addend = struct.unpack_from('<I', raw, section['rawptr'] + relocation['vaddr'])[0]
            constant_string(symbols[relocation['sym']], destination, addend)
        assert raw[section['rawptr'] + table['value'] + 496:section['rawptr'] + table['value'] + 500] == bytes(4)
        assert raw_target(m, 0x10190ee8 + 496, 4) == bytes(4)
        locations['_jpeg_std_message_table'] = 0x10190ee8
        expected = [('_format_message', 0x10052050, 167), ('_reset_error_mgr', 0x10052100, 17),
                    ('_image_jpeg_alloc', 0x10014610, 6), ('_image_jpeg_free', 0x10014620, 13),
                    ('_image_jpeg_error', 0x10014630, 17), ('_image_jpeg_print', 0x10014650, 22),
                    ('_image_jpeg_init_source', 0x1004a950, 12),
                    ('_image_jpeg_skip_input', 0x1004a960, 21),
                    ('_image_jpeg_term_source', 0x1004a980, 1), ('_R_LoadJpg', 0x10014940, 785)]
        for name, address, size in expected:
            symbol = definitions[name]
            section = coff['sections'][symbol['sec'] - 1]
            candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
            target = raw_target(m, address, size)
            decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target, address))
            assert sum(i.size for i in decoded) == size
            assert decoded[-1].mnemonic == ('jmp' if name == '_image_jpeg_alloc' else 'ret')
            padding = (-address - size) % 16
            assert raw_target(m, address + size, padding) == b'\xcc' * padding
            bindings = {}
            for relocation in section['relocs']:
                p = relocation['vaddr']
                item = symbols[relocation['sym']]
                if item['name'] in locations:
                    base = locations[item['name']]
                else:
                    assert item['name'].startswith('??_C@') and relocation['type'] == 6
                    base = constant_string(item, struct.unpack_from('<I', target, p)[0],
                                           struct.unpack_from('<I', candidate, p)[0])
                bindings[item['name']] = base
            for scope in (m, legacy):
                scope['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
            original_score = legacy['cmd_diff'](hex(address), str(obj), name)
            check(address, obj, name, matcher=m, bindings=bindings)
            assert m['cmd_diff'](hex(address), str(obj), name) == 100
            for callee, base in bindings.items():
                try:
                    check(address, obj, name, matcher=m,
                          bindings=dict(bindings, **{callee: base + 4}))
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                else:
                    raise AssertionError('wrong loader binding accepted')
            records.append(dict(symbol=name, address=hex(address), bytes=size, bindings=bindings,
                                legacy_score=original_score, strict_score=100,
                                negative_tests=len(bindings), unresolved=0))
            locations[name] = address
    (run / 'loader_checks.log').write_text(log.getvalue())
    native_path = run / 'raw_loader_probe_packet.json'
    native = json.loads(native_path.read_text())
    assert native['object_sha256'] == sha(obj) and native['parent_shapes'] == 131
    assert native['fixture_sha256'] == sha(HERE / 'test_jpeg_image_loader_services.c')
    assert native['native_test_log_sha256'] == sha(run / 'raw_loader_native_test.log')
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  inputs_sha256=sha(run / 'inputs.json'), object_sha256=sha(obj),
                  functions=records, code_bytes=sum(r['bytes'] for r in records),
                  data=data_records, message_table_entries=125, message_table_bytes=500,
                  checker_sha256=sha(__file__), prerequisite_hashes=prerequisites,
                  mask_adapter_sha256=sha(HERE / 'referee_branch_probe.py'),
                  matcher_loader_sha256=sha(HERE / 'audit_legacy.py'),
                  strict_checker_sha256=sha(HERE / 'check_shape.py'),
                  legacy_tool_sha256=sha(ROOT / 'glm/tools/match_gfx.py'),
                  native_packet_sha256=sha(native_path), checks_log_sha256=sha(run / 'loader_checks.log'),
                  runtime_binding=dict(run=str(sprintf_run), inputs_sha256=sha(sprintf_run / 'inputs.json'),
                                       object_sha256=sha(runtime_obj), symbol='_sprintf', address='0x100f5f14',
                                       bytes=88, bindings=runtime_bindings, credited_code_bytes=0,
                                       legacy_score=runtime_legacy_score, instruction_aware_score=100,
                                       sdk_redistributability_approval=False,
                                       transitive_crt_dependency_closure=False),
                  referee_mode='instruction-aware; legacy scores retained', whole_file_identity=False)
    (HERE / 'jpeg_loader_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', packet['code_bytes'], 'engine/JPEG code bytes, complete500-byte message table; CRT88 binding-only; not V4')


if __name__ == '__main__':
    main()
