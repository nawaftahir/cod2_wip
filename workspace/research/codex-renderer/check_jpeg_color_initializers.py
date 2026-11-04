#!/usr/bin/env python3
"""Close color/merged bindings; keep legacy-mask failures explicitly uncredited."""
import hashlib
import argparse
import io
import json
from contextlib import redirect_stdout
from pathlib import Path
import struct
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import check
from check_jpeg_dependencies import raw_target
from referee_branch_probe import proposed_mask


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_uo3oxv1l')
    parser.add_argument('--instruction-aware', action='store_true',
                        help='explicit audited local mask correction; legacy scores retained')
    parser.add_argument('--startup', action='store_true', help='also close actual master/startup callers')
    args = parser.parse_args()
    if args.startup and not args.instruction_aware:
        parser.error('--startup requires the audited --instruction-aware referee')
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    assert inputs['image'] == IMAGE and not inputs.get('reused_objects_from')
    for name, digest in inputs['dependencies'].items():
        assert sha(Path(inputs['reference']) / name) == digest
    row, = json.loads((run / 'results.json').read_text())
    assert row['command'][1:6] == ['/nologo', '/c', '/W3', '/O2', '/Gy']
    obj = run / (row['job'] + '.obj')
    assert sha(obj) == row['object_sha256']
    m = load_matcher()
    raw = obj.read_bytes()
    coff = m['parse_coff'](raw)
    symbols = {s['idx']: s for s in coff['symbols']}
    definitions = {s['name']: s for s in symbols.values() if s['sec'] > 0}
    base = json.loads((HERE / 'jpeg_dependency_packet.json').read_text())
    old = {int(r['address'], 16): r for r in base['functions'] if r['unresolved'] == 0}
    callbacks = {'_start_pass_dcolor': (0x1004bf00, 1),
                 '_start_pass_merged_upsample': (0x10050150, 21)}
    tables = {'_build_ycc_rgb_table': (0x1004bab0, 195),
              '_merged_build_ycc_rgb_table': (0x10050080, 195)}
    dependencies = {'_null_convert': (0x1004bca0, 120),
                    '_ycck_cmyk_convert': (0x1004bdb0, 330),
                    '_ycc_rgb_convert': (0x1004bb80, 286),
                    '_gray_rgb_convert': (0x1004bd50, 94),
                    '_merged_2v_upsample': (0x10050170, 199),
                    '_h2v2_merged_upsample': (0x100503d0, 555),
                    '_merged_1v_upsample': (0x10050240, 55),
                    '_h2v1_merged_upsample': (0x10050280, 327)}
    locations = {n: a for n, (a, size) in (callbacks | tables | dependencies).items()}
    locations['_grayscale_convert'] = 0x1004bd20
    callback_packet = HERE / 'jpeg_color_callbacks_packet.json'
    previous_callbacks = json.loads(callback_packet.read_text())
    assert previous_callbacks['code_bytes'] == 97
    for name, address, size, bindings in [
        ('_jcopy_sample_rows', 0x10057990, 58, {}),
        ('_grayscale_convert', 0x1004bd20, 39, {'_jcopy_sample_rows': 0x10057990}),
    ]:
        m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
        check(address, obj, name, matcher=m, bindings=bindings)
        assert m['cmd_diff'](hex(address), str(obj), name) == 100
    log = io.StringIO()
    legacy = m['pe_mask_for']
    records = []
    prerequisite_hashes = {}
    with redirect_stdout(log):
        for name, (address, size) in (callbacks | tables | dependencies).items():
            m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
            target = raw_target(m, address, size)
            decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target, address))
            assert sum(i.size for i in decoded) == size and decoded[-1].mnemonic == 'ret'
            padding = (-address - size) % 16
            assert raw_target(m, address + size, padding) == b'\xcc' * padding
            if name in dependencies:
                assert old[address]['bytes'] == size
                assert not old[address]['sites']
            check(address, obj, name, matcher=m, bindings={})
            score = m['cmd_diff'](hex(address), str(obj), name)
            if name in tables:
                section = coff['sections'][definitions[name]['sec'] - 1]
                assert not section['relocs'] and section['rawsize'] == size
                assert raw[section['rawptr']:section['rawptr'] + size] == target
                assert score == 97  # Recorded legacy false mask, not a source discrepancy.
                if args.instruction_aware:
                    m['pe_mask_for'] = lambda off, length, code, rva: proposed_mask(m, off, length, code, rva)
                    try:
                        assert m['cmd_diff'](hex(address), str(obj), name) == 100
                    finally:
                        m['pe_mask_for'] = legacy
            else:
                assert score == 100
        for name, address, total, code_size in [
            ('_jinit_color_deconverter', 0x1004bf10, 452, 429),
            ('_jinit_merged_upsampler', 0x10050600, 120, 120),
        ]:
            function = definitions[name]
            section = coff['sections'][function['sec'] - 1]
            assert section['rawsize'] == total
            target = raw_target(m, address, total)
            decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target[:code_size], address))
            assert sum(i.size for i in decoded) == code_size
            if name == '_jinit_merged_upsampler':
                assert decoded[-1].mnemonic == 'jmp'
                assert bytes(decoded[-1].bytes)[0] == 0xe9
                assert decoded[-1].address + 5 + struct.unpack(
                    '<i', bytes(decoded[-1].bytes)[1:])[0] == locations['_merged_build_ycc_rgb_table']
            else:
                assert decoded[-1].mnemonic == 'ret'
            starts = {i.address for i in decoded}
            if code_size != total:
                assert target[429:432] == bytes.fromhex('8d4900')
                assert all(struct.unpack_from('<I', target, p)[0] in starts for p in range(432, 452, 4))
            padding = (-address - total) % 16
            assert raw_target(m, address + total, padding) == b'\xcc' * padding
            bindings = {}
            for relocation in section['relocs']:
                item = symbols[relocation['sym']]
                if item['sec'] == function['sec']:
                    base_address = address + item['value']
                    assert base_address in starts or base_address == address + 432
                else:
                    base_address = locations[item['name']]
                bindings[item['name']] = base_address
            m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=total, thunk=False)
            check(address, obj, name, matcher=m, bindings=bindings)
            original_score = m['cmd_diff'](hex(address), str(obj), name)
            m['pe_mask_for'] = lambda off, size, code, rva: proposed_mask(m, off, size, code, rva)
            try:
                assert m['cmd_diff'](hex(address), str(obj), name) == 100
            finally:
                m['pe_mask_for'] = legacy
            for callee, destination in bindings.items():
                wrong = dict(bindings)
                wrong[callee] = destination + 4
                try:
                    check(address, obj, name, matcher=m, bindings=wrong)
                except ValueError as error:
                    assert 'wrong binding' in str(error)
                else:
                    raise AssertionError('wrong initializer binding accepted')
            records.append(dict(symbol=name, address=hex(address), code_bytes=code_size,
                                full_block_bytes=total, bindings=bindings,
                                legacy_score=original_score, instruction_aware_score=100,
                                negative_tests=len(bindings),
                                coverage_credit=code_size if args.instruction_aware else 0))
        if args.startup:
            proofs = dict(old)
            for filename in ['jpeg_quantizer_packet.json', 'jpeg_entropy_packet.json']:
                path = HERE / filename
                packet = json.loads(path.read_text())
                assert packet['anchor_sha256'] == EXPECTED and packet['image'] == IMAGE
                prerequisite_hashes[filename] = sha(path)
                proofs.update({int(r['address'], 16): r for r in packet['functions']})
            for filename in ['jpeg_dimensions_packet.json', 'jpeg_idct_block_packet.json']:
                prerequisite_hashes[filename] = sha(HERE / filename)
            native_path = run / 'raw_loader_probe_packet.json'
            native = json.loads(native_path.read_text())
            assert native['object_sha256'] == sha(obj) and native['parent_shapes'] == 131
            assert native['native_test_log_sha256'] == sha(run / 'raw_loader_native_test.log')
            prerequisite_hashes['native_probe'] = sha(native_path)
            dimensions = json.loads((HERE / 'jpeg_dimensions_packet.json').read_text())
            special = {'_jpeg_calc_output_dimensions': (0x1004f9e0, 548, dimensions['bindings']),
                       '_jinit_inverse_dct': (0x1004c410, 117, {'_start_pass': 0x1004c0e0})}
            locations.update({'_jinit_color_deconverter': 0x1004bf10,
                              '_jinit_merged_upsampler': 0x10050600})
            required = ['_prepare_range_limit_table', '_use_merged_upsample',
                        '_jinit_1pass_quantizer', '_jinit_2pass_quantizer',
                        '_jinit_upsampler', '_jinit_d_post_controller',
                        '_jinit_phuff_decoder', '_jinit_huff_decoder',
                        '_jinit_d_coef_controller', '_jinit_d_main_controller',
                        '_prepare_for_output_pass', '_finish_output_pass', '_output_pass_setup']
            for name in required:
                proof, = [p for p in proofs.values() if p['symbol'] == name]
                bindings = proof.get('bindings')
                if bindings is None:
                    bindings = {s['symbol']: (int(s['destination'], 16) - int(s['addend'], 16)) & 0xffffffff
                                for s in proof['sites']}
                special[name] = (int(proof['address'], 16), proof['bytes'], bindings)
            for name, (address, size, bindings) in special.items():
                m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
                check(address, obj, name, matcher=m, bindings=bindings)
                assert m['cmd_diff'](hex(address), str(obj), name) == 100
                locations[name] = address
            locations['_master_selection'] = 0x1004fc90
            for name, address, size in [('_master_selection', 0x1004fc90, 442),
                                        ('_jpeg_start_decompress', 0x1004a400, 241)]:
                m['INV'][f'{address:x}'] = dict(name=name, addr=f'{address:x}', size=size, thunk=False)
                section = coff['sections'][definitions[name]['sec'] - 1]
                target = raw_target(m, address, size)
                decoded = list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(target, address))
                assert sum(i.size for i in decoded) == size and decoded[-1].mnemonic == 'ret'
                padding = (-address - size) % 16
                assert raw_target(m, address + size, padding) == b'\xcc' * padding
                bindings = {symbols[r['sym']]['name']: locations[symbols[r['sym']]['name']]
                            for r in section['relocs']}
                check(address, obj, name, matcher=m, bindings=bindings)
                assert m['cmd_diff'](hex(address), str(obj), name) == 100
                for callee, destination in bindings.items():
                    wrong = dict(bindings)
                    wrong[callee] = destination + 4
                    try:
                        check(address, obj, name, matcher=m, bindings=wrong)
                    except ValueError as error:
                        assert 'wrong binding' in str(error)
                    else:
                        raise AssertionError('wrong startup binding accepted')
                records.append(dict(symbol=name, address=hex(address), code_bytes=size,
                                    full_block_bytes=size, bindings=bindings, legacy_score=100,
                                    negative_tests=len(bindings), coverage_credit=size))
    log_name = ('color_startup.log' if args.startup else
                'color_closure.log' if args.instruction_aware else 'color_initializers.log')
    (run / log_name).write_text(log.getvalue())
    packet = dict(anchor_sha256=EXPECTED, image=IMAGE, run=str(run),
                  inputs_sha256=sha(run / 'inputs.json'), object_sha256=sha(obj),
                  checker_sha256=sha(__file__), probe_sha256=sha(HERE / 'referee_branch_probe.py'),
                  matcher_loader_sha256=sha(HERE / 'audit_legacy.py'),
                  callbacks_packet_sha256=sha(callback_packet),
                  base_packet_sha256=sha(HERE / 'jpeg_dependency_packet.json'),
                  log_path=str(run / log_name), log_sha256=sha(run / log_name), functions=records,
                  code_bytes=1644 if args.startup else 961 if args.instruction_aware else 22,
                  callbacks=callbacks, prerequisite_hashes=prerequisite_hashes,
                  pending_code_bytes=0 if args.instruction_aware else 939,
                  table_builders=tables,
                  referee_mode='instruction-aware' if args.instruction_aware else 'legacy-diagnostic',
                  legacy_tool_sha256=sha(HERE.parent.parent / 'glm/tools/match_gfx.py'),
                  strict_checker_sha256=sha(HERE / 'check_shape.py'),
                  status='BINDINGS-CLOSED' if args.instruction_aware else
                         'BINDINGS-CLOSED; INITIALIZERS/TABLES HELD FOR REFEREE-FIX REVIEW',
                  whole_file_identity=False)
    filename = ('jpeg_startup_packet.json' if args.startup else
                'jpeg_color_closure_packet.json' if args.instruction_aware else 'jpeg_color_initializers_packet.json')
    (HERE / filename).write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', packet['code_bytes'], 'code bytes;', packet['pending_code_bytes'], 'held; not V4')


if __name__ == '__main__':
    main()
