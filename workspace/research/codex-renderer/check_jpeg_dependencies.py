#!/usr/bin/env python3
"""Replay JPEG matches and account for direct relocations without guessed symbols."""
from collections import Counter
import argparse
from contextlib import redirect_stdout
import hashlib
import io
import json
from pathlib import Path
import struct
import subprocess
from capstone import Cs, CS_ARCH_X86, CS_MODE_32, CS_GRP_JUMP, CS_OP_IMM

from audit_legacy import load_matcher, EXPECTED
from batch_existing import HERE, IMAGE
from check_shape import branch_fields, check
from check_jpeg_boundaries import main as check_boundaries


def raw_target(m, address, size):
    rva = address - 0x10000000
    for va, virtual_size, raw_start, raw_size in m['SECS'].values():
        if va <= rva and rva + size <= va + min(virtual_size, raw_size):
            start = raw_start + rva - va
            return m['_d'][start:start + size]
    raise ValueError('requested data is not completely raw-backed')


def require_binding(target, base, addend):
    if target != (base + addend) & 0xffffffff:
        raise ValueError('source-matched callee destination differs')


def main():
    require_binding(0x1004, 0x1000, 4)
    try:
        require_binding(0x1005, 0x1000, 4)
    except ValueError:
        pass
    else:
        raise AssertionError('wrong callee accepted')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, default=HERE / 'baseline_jpeg_ux9623q1')
    parser.add_argument('--encoder-discovery', type=Path,
                        help='hashed saved-object discovery; restrict to earlier encoder region')
    parser.add_argument('--encoder-inline', type=Path,
                        help='fresh jcmaster utility-inline build replacing encoder candidates')
    parser.add_argument('--encoder-preprocess', type=Path,
                        help='fresh utility-inline pre_process_data supplemental proof')
    parser.add_argument('--encoder-coeff', type=Path,
                        help='fresh coefficient group with explicitly audited inventory omissions')
    parser.add_argument('--utility-discovery', type=Path,
                        help='fresh decoder utility-inline supplemental candidates')
    parser.add_argument('--api-run', type=Path,
                        help='fresh unmatched API draft; source integration only, no byte credit')
    parser.add_argument('--missing-discovery', type=Path, action='append',
                        help='hashed referenced missing-entry discovery, direct closure still required')
    parser.add_argument('--toolchain-ftol2', type=Path,
                        help='authenticated SDK object for symbol binding only; not reconstructed source')
    parser.add_argument('--memory-run', type=Path,
                        help='fresh no-backing-store memory group; retain prior allocation matches')
    parser.add_argument('--decode-run', type=Path,
                        help='fresh actual decoder caller/controller group; retain prior module matches')
    args = parser.parse_args()
    run = args.run.resolve()
    inputs = json.loads((run / 'inputs.json').read_text())
    if inputs['image'] != IMAGE:
        raise ValueError('toolchain identity differs')
    reference = Path(inputs['reference'])
    for name, digest in inputs['dependencies'].items():
        if hashlib.sha256((reference / name).read_bytes()).hexdigest() != digest:
            raise ValueError('source/header changed: ' + name)
    objects = Path(inputs['reused_objects_from']) if inputs.get('reused_objects_from') else run
    rows = json.loads((run / 'results.json').read_text())
    rows = [dict(r, object_root=str(objects), reference_root=str(reference)) for r in rows]
    m = load_matcher()
    boundary_packet = None
    if run == (HERE / 'baseline_jpeg_ux9623q1').resolve():
        boundary_packet = check_boundaries()
        for proof in boundary_packet['functions']:
            address = int(proof['address'], 16)
            if m['INV'][f'{address:x}']['size'] != proof['old_inventory_size']:
                raise ValueError('audited inventory extent changed')
            m['INV'][f'{address:x}']['size'] = proof['bytes']
            row = next(r for r in rows if r['source'] == proof['source'])
            if any(p['address'] == proof['address'] for p in row.get('matches', [])):
                raise ValueError('supplemental proof already counted')
            row['matches'].append(dict(address=proof['address'], symbol=proof['symbol'],
                                       bytes=proof['bytes'], audited_full_body=True))
        inline_run = HERE / 'baseline_jpeg_yd16dq0p'
        inline_inputs = json.loads((inline_run / 'inputs.json').read_text())
        if inline_inputs['image'] != IMAGE or inline_inputs.get('reused_objects_from'):
            raise ValueError('inline build identity differs')
        inline_reference = Path(inline_inputs['reference'])
        for name, digest in inline_inputs['dependencies'].items():
            if hashlib.sha256((inline_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('inline source/header changed: ' + name)
        inline_rows = json.loads((inline_run / 'results.json').read_text())
        if len(inline_rows) != 1 or inline_rows[0]['source'] != 'jcphuff.c':
            raise ValueError('unexpected inline source scope')
        rows = [r for r in rows if r['source'] != 'jcphuff.c']
        rows.append(dict(inline_rows[0], object_root=str(inline_run),
                         reference_root=str(inline_reference)))
        for proof in boundary_packet['functions']:
            if proof['source'] == 'jcphuff.c':
                rows[-1]['matches'].append(dict(address=proof['address'], symbol=proof['symbol'],
                                               bytes=proof['bytes'], audited_full_body=True))
    if args.encoder_discovery:
        discovery = args.encoder_discovery.resolve()
        extra_inputs = json.loads((discovery / 'inputs.json').read_text())
        if extra_inputs['image'] != IMAGE:
            raise ValueError('encoder toolchain identity differs')
        extra_reference = Path(extra_inputs['reference'])
        for name, digest in extra_inputs['dependencies'].items():
            if hashlib.sha256((extra_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('encoder inputs changed: ' + name)
        extra_objects = Path(extra_inputs['reused_objects_from']) if extra_inputs.get('reused_objects_from') else discovery
        existing = {(p['address'], p['symbol']) for r in rows for p in r.get('matches', [])}
        for extra in json.loads((discovery / 'results.json').read_text()):
            selected = [p for p in extra.get('matches', [])
                        if 0x10042000 <= int(p['address'], 16) < 0x10047000
                        and p['bytes'] >= 20 and (p['address'], p['symbol']) not in existing]
            for match in selected:
                address = int(match['address'], 16)
                old = m['INV'][f'{address:x}']['size']
                size = match['bytes']
                if old != size:
                    if match.get('old_inventory_size') != old or not old < size <= old + 16:
                        raise ValueError('encoder discovery boundary requires re-audit')
                    code = raw_target(m, address, size)
                    padding = (-address - size) % 16
                    if code[-1] != 0xc3 or raw_target(m, address + size, padding) != b'\xcc' * padding:
                        raise ValueError('encoder discovered tail/padding differs')
                    m['INV'][f'{address:x}']['size'] = size
            if selected:
                rows.append(dict(extra, matches=selected, object_root=str(extra_objects),
                                 reference_root=str(extra_reference)))
    if args.encoder_inline:
        supplement = args.encoder_inline.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('encoder inline requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('encoder inline inputs changed: ' + name)
        supplied_rows = json.loads((supplement / 'results.json').read_text())
        if len(supplied_rows) != 1 or supplied_rows[0]['source'] != 'jcmaster.c':
            raise ValueError('unexpected encoder inline source scope')
        replacement = supplied_rows[0]
        found = {(p['address'], p['symbol']) for p in replacement.get('matches', [])}
        for r in rows:
            if r['source'] == 'jcmaster.c':
                for p in r.get('matches', []):
                    if (p['address'], p['symbol']) not in found:
                        replacement['matches'].append(dict(p))
                        found.add((p['address'], p['symbol']))
        rows = [r for r in rows if r['source'] != 'jcmaster.c']
        rows.append(dict(replacement, object_root=str(supplement),
                         reference_root=str(supplied_reference)))
    if args.encoder_preprocess:
        supplement = args.encoder_preprocess.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('encoder preprocess requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('encoder preprocess inputs changed: ' + name)
        replacement = next(r for r in json.loads((supplement / 'results.json').read_text())
                           if r['source'] == 'jcprepct.c')
        selected = [p for p in replacement.get('matches', [])
                    if p['address'] == '0x10048630' and p['symbol'] == '_pre_process_data']
        if len(selected) != 1:
            raise ValueError('missing unique preprocess candidate')
        address, size, old = 0x10048860, 612, 598
        if m['INV'][f'{address:x}']['size'] != old:
            raise ValueError('preprocess context inventory changed')
        code = raw_target(m, address, 0x10048ad0 - address)
        if code[size - 1] != 0xc3 or code[size:] != b'\xcc' * (0x10048ad0 - address - size):
            raise ValueError('preprocess context full boundary differs')
        m['INV'][f'{address:x}']['size'] = size
        selected.append(dict(address=hex(address), symbol='_pre_process_context',
                             bytes=size, old_inventory_size=old))
        rows.append(dict(replacement, matches=selected, object_root=str(supplement),
                         reference_root=str(supplied_reference)))
    coefficient_boundaries = []
    if args.encoder_coeff:
        supplement = args.encoder_coeff.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('encoder coefficient requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('encoder coefficient inputs changed: ' + name)
        replacement = next(r for r in json.loads((supplement / 'results.json').read_text())
                           if r['source'] == 'jccoefct.c')
        for address, symbol, size, next_start, old in (
            (0x10041db0, '_start_pass_coef', 224, 0x10041e90, None),
            (0x10041e90, '_compress_data', 692, 0x10042150, None),
            (0x100423a0, '_compress_output', 521, 0x100425b0, 518),
        ):
            entry = m['INV'].get(f'{address:x}')
            if (old is None and entry is not None) or (old is not None and entry['size'] not in (old, size)):
                raise ValueError('coefficient inventory changed; re-audit needed')
            code = raw_target(m, address, next_start - address)
            if code[size - 1] != 0xc3 or code[size:] != b'\xcc' * (next_start - address - size):
                raise ValueError('coefficient full return/padding boundary differs')
            m['INV'][f'{address:x}'] = dict(name=symbol, addr=f'{address:x}', size=size, thunk=False)
            replacement['matches'].append(dict(address=hex(address), symbol=symbol, bytes=size))
            coefficient_boundaries.append(dict(address=hex(address), bytes=size,
                                               old_inventory_size=old, next_start=hex(next_start)))
        rows = [r for r in rows if r['source'] != 'jccoefct.c']
        rows.append(dict(replacement, object_root=str(supplement),
                         reference_root=str(supplied_reference)))
    if args.utility_discovery:
        supplement = args.utility_discovery.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('utility discovery requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('utility discovery inputs changed: ' + name)
        expected = {'0x1004aae0': ('jdcoefct.c', '_decompress_onepass', 667, 679),
                    '0x1004b2f0': ('jdcoefct.c', '_decompress_smooth_data', 1606, 1612),
                    '0x10051800': ('jdsample.c', '_int_upsample', 316, 316)}
        found = set()
        for replacement in json.loads((supplement / 'results.json').read_text()):
            selected = []
            for match in replacement.get('matches', []):
                if match['address'] not in expected:
                    continue
                source, symbol, old, size = expected[match['address']]
                address = int(match['address'], 16)
                if replacement['source'] != source or match['symbol'] != symbol or match['bytes'] != size:
                    raise ValueError('unexpected utility candidate')
                if m['INV'][f'{address:x}']['size'] != old:
                    raise ValueError('utility inventory changed')
                m['INV'][f'{address:x}']['size'] = size
                selected.append(match)
                found.add(match['address'])
            if selected:
                rows.append(dict(replacement, matches=selected, object_root=str(supplement),
                                 reference_root=str(supplied_reference)))
        if found != set(expected):
            raise ValueError('missing utility discovery candidate')
    memory_addresses = set()
    if args.memory_run:
        supplement = args.memory_run.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('memory group requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('memory input changed: ' + name)
        replacement, = json.loads((supplement / 'results.json').read_text())
        if replacement['source'] not in ('jmemmgr.c', 'jpeg_api_group.c'):
            raise ValueError('unexpected memory source')
        prior = {(p['address'], p['symbol'], p['bytes']) for r in rows
                 if r['source'] == 'jmemmgr.c' for p in r.get('matches', [])}
        expected = {('0x10055190', '_realize_virt_arrays', 360),
                    ('0x10055800', '_self_destruct', 51),
                    ('0x10055440', '_access_virt_sarray', 329),
                    ('0x10055590', '_access_virt_barray', 345)}
        if replacement['source'] == 'jpeg_api_group.c':
            expected.add(('0x10055840', '_jinit_memory_mgr', 160))
            replacement = dict(replacement, matches=[p for p in replacement['matches']
                if p['symbol'] != '_default_decompress_parms'])
        found = {(p['address'], p['symbol'], p['bytes']) for p in replacement['matches']}
        if found != prior | expected:
            raise ValueError('memory scope or retained matches differ')
        for p in replacement['matches']:
            address = int(p['address'], 16)
            key = p['address'][2:]
            old = m['INV'].get(key)
            if old is None:
                if (p.get('old_inventory_size', -1) is not None
                        or not supplied.get('missing_entry_discovery')
                        or address not in {struct.unpack_from('<I', m['_d'], offset)[0]
                                           for offset in m['PE_RELOCS']}):
                    raise ValueError('memory entry lacks independent reference evidence')
            elif old['size'] != p['bytes']:
                if p.get('old_inventory_size') != old['size']:
                    raise ValueError('memory inventory extent differs')
            if old is None or old['size'] != p['bytes']:
                size = p['bytes']
                code = raw_target(m, address, size)
                padding = (-address - size) % 16
                if code[-1] != 0xc3 or raw_target(m, address + size, padding) != b'\xcc' * padding:
                    raise ValueError('memory corrected extent/padding differs')
                m['INV'][key] = dict(name=p['symbol'], addr=key, size=size, thunk=False)
        rows = [r for r in rows if r['source'] != 'jmemmgr.c']
        rows.append(dict(replacement, object_root=str(supplement),
                         reference_root=str(supplied_reference)))
        memory_addresses = {int(p['address'], 16) for p in replacement['matches']}
    missing_addresses = set()
    for discovery_arg in args.missing_discovery or []:
        discovery = discovery_arg.resolve()
        supplied = json.loads((discovery / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or not supplied.get('missing_entry_discovery'):
            raise ValueError('missing-entry discovery identity differs')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('missing-entry discovery inputs changed: ' + name)
        referenced = {struct.unpack_from('<I', m['_d'], p)[0] for p in m['PE_RELOCS']}
        for key in list(m['INV']):
            try:
                referenced.update(branch_fields(m['carve'](int(key, 16))[0], int(key, 16)).values())
            except (ValueError, KeyError):
                continue
        object_root = Path(supplied['reused_objects_from']) if supplied.get('reused_objects_from') else discovery
        existing = {p['address'] for r in rows for p in r.get('matches', [])}
        for replacement in json.loads((discovery / 'results.json').read_text()):
            selected = []
            for match in replacement.get('matches', []):
                address = int(match['address'], 16)
                if match['address'] in existing or match.get('old_inventory_size', -1) is not None:
                    continue
                if (not 0x10040000 <= address < 0x10059000 or address % 16
                        or address not in referenced or f'{address:x}' in m['INV']):
                    raise ValueError('missing entry lacks independent reference/alignment evidence')
                m['INV'][f'{address:x}'] = dict(name=match['symbol'], addr=f'{address:x}',
                                               size=match['bytes'], thunk=False)
                missing_addresses.add(address)
                selected.append(match)
            if selected:
                rows.append(dict(replacement, matches=selected, object_root=str(object_root),
                                 reference_root=str(supplied_reference)))
    decode_addresses = set()
    decode_new_addresses = set()
    if args.decode_run:
        supplement = args.decode_run.resolve()
        supplied = json.loads((supplement / 'inputs.json').read_text())
        supplied_reference = Path(supplied['reference'])
        if supplied['image'] != IMAGE or supplied.get('reused_objects_from'):
            raise ValueError('decoder group requires fresh pinned build')
        for name, digest in supplied['dependencies'].items():
            if hashlib.sha256((supplied_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('decoder input changed: ' + name)
        replacement, = json.loads((supplement / 'results.json').read_text())
        if replacement['source'] != 'jpeg_decode_group.c':
            raise ValueError('unexpected decoder group source')
        modules = {'jdmainct.c', 'jdmaster.c', 'jdapistd.c', 'jdcoefct.c',
                   'jdpostct.c', 'jddctmgr.c', 'jdcolor.c', 'jdsample.c'}
        prior = {(p['address'], p['symbol'], p['bytes']) for r in rows
                 if r['source'] in modules for p in r.get('matches', [])}
        found = {(p['address'], p['symbol'], p['bytes']) for p in replacement['matches']}
        expected = {('0x1004c410', '_jinit_inverse_dct', 117),
                    ('0x10051c10', '_jinit_upsampler', 498),
                    ('0x1004db80', '_jinit_d_main_controller', 205),
                    ('0x1004b940', '_jinit_d_coef_controller', 364),
                    ('0x10051650', '_jinit_d_post_controller', 131)}
        if 'static __forceinline void\nstart_iMCU_row' in (supplied_reference / 'jdcoefct.c').read_text():
            expected.add(('0x1004aa30', '_start_input_pass', 92))
        tiny_callbacks = [('0x100516e0', '_start_pass_upsample', 26),
                          ('0x100517e0', '_fullsize_upsample', 11),
                          ('0x100517f0', '_noop_upsample', 11),
                          ('0x1004ad90', '_dummy_consume_data', 3)]
        object_path = supplement / (replacement['job'] + '.obj')
        object_raw = object_path.read_bytes()
        if hashlib.sha256(object_raw).hexdigest() != replacement['object_sha256']:
            raise ValueError('decoder callback object changed')
        object_coff = m['parse_coff'](object_raw)
        symbol_table_offset = struct.unpack_from('<I', object_raw, 8)[0]
        pointer_references = {struct.unpack_from('<I', m['_d'], offset)[0] for offset in m['PE_RELOCS']}
        for address_text, symbol_name, size in tiny_callbacks:
            address = int(address_text, 16)
            symbol = next(s for s in object_coff['symbols'] if s['name'] == symbol_name and s['sec'] > 0)
            section = object_coff['sections'][symbol['sec'] - 1]
            symbol_type = struct.unpack_from('<H', object_raw,
                                             symbol_table_offset + symbol['idx'] * 18 + 14)[0]
            if (address not in pointer_references or symbol['value'] != 0 or symbol_type != 0x20
                    or section['rawsize'] != size or section['relocs']):
                raise ValueError('tiny callback lacks typed complete object/reference evidence')
            code = raw_target(m, address, size)
            if (object_raw[section['rawptr']:section['rawptr'] + size] != code or code[-1] != 0xc3
                    or raw_target(m, address + size, (-address - size) % 16)
                    != b'\xcc' * ((-address - size) % 16)):
                raise ValueError('tiny callback bytes or complete boundary differ')
            if address_text[2:] in m['INV']:
                raise ValueError('tiny callback unexpectedly overlaps existing inventory')
            replacement['matches'].append(dict(address=address_text, symbol=symbol_name, bytes=size,
                                                old_inventory_size=None, callback_pointer_proof=True))
            expected.add((address_text, symbol_name, size))
        found = {(p['address'], p['symbol'], p['bytes']) for p in replacement['matches']}
        decode_new_addresses = {int(p[0], 16) for p in expected}
        if found != prior | expected:
            raise ValueError('decoder group scope or retained matches differ')
        referenced = {struct.unpack_from('<I', m['_d'], offset)[0] for offset in m['PE_RELOCS']}
        for key in list(m['INV']):
            try:
                referenced.update(branch_fields(m['carve'](int(key, 16))[0], int(key, 16)).values())
            except (ValueError, KeyError):
                continue
        for p in replacement['matches']:
            address, size = int(p['address'], 16), p['bytes']
            key = p['address'][2:]
            old = m['INV'].get(key)
            if old is None:
                if p.get('old_inventory_size', -1) is not None or address not in referenced:
                    raise ValueError('decoder entry lacks incoming reference proof')
            elif old['size'] != size and p.get('old_inventory_size') != old['size']:
                raise ValueError('decoder extent correction differs')
            if old is None or old['size'] != size:
                if (raw_target(m, address, size)[-1] != 0xc3
                        or raw_target(m, address + size, (-address - size) % 16)
                        != b'\xcc' * ((-address - size) % 16)):
                    raise ValueError('decoder extent/padding differs')
                m['INV'][key] = dict(name=p['symbol'], addr=key, size=size, thunk=False)
        rows = [r for r in rows if r['source'] not in modules]
        rows.append(dict(replacement, object_root=str(supplement),
                         reference_root=str(supplied_reference)))
        decode_addresses = {int(p['address'], 16) for p in replacement['matches']}
    proofs, definitions = [], {}
    for row in rows:
        if not row.get('matches'):
            continue
        obj = Path(row['object_root']) / (row['job'] + '.obj')
        raw = obj.read_bytes()
        if hashlib.sha256(raw).hexdigest() != row['object_sha256']:
            raise ValueError('object changed: ' + str(obj))
        coff = m['parse_coff'](raw)
        symbols = {s['idx']: s for s in coff['symbols']}
        for match in row['matches']:
            address = int(match['address'], 16)
            log = io.StringIO()
            with redirect_stdout(log):
                check(address, obj, match['symbol'], matcher=m)
                if m['cmd_diff'](hex(address), str(obj), match['symbol']) != 100:
                    raise ValueError('original referee regression')
            symbol = next(s for s in symbols.values() if s['name'] == match['symbol'])
            key = (row['source'], symbol['name'])
            if key in definitions and definitions[key] != address:
                raise ValueError('ambiguous source-function destination')
            definitions[key] = address
            proofs.append((row, match, raw, coff, symbols, symbol))
    runtime_symbols = {}
    if args.toolchain_ftol2:
        vendor_raw = args.toolchain_ftol2.read_bytes()
        digest = hashlib.sha256(vendor_raw).hexdigest()
        if digest != '33f11763619e4b5b87fa5397ffd7e86ab33cb4ca7414dc188b288df7878cf128':
            raise ValueError('SDK ftol2 object identity differs')
        vendor_coff = m['parse_coff'](vendor_raw)
        vendor_symbol = next(s for s in vendor_coff['symbols']
                             if s['name'] == '__ftol2' and s['sclass'] == 2 and s['sec'] > 0)
        vendor_section = vendor_coff['sections'][vendor_symbol['sec'] - 1]
        vendor_code = vendor_raw[vendor_section['rawptr']:vendor_section['rawptr'] + vendor_section['rawsize']]
        if (vendor_symbol['value'] or len(vendor_code) != 117 or vendor_section['relocs']
                or vendor_code != raw_target(m, 0x1010a8a8, 117)):
            raise ValueError('complete SDK ftol2 body differs')
        runtime_symbols['__ftol2'] = dict(address='0x1010a8a8', bytes=117,
            object_sha256=digest, image=IMAGE,
            origin='/opt/msvc710/Vc7/crt/src/intel/dll_lib/ftol2.obj',
            raw_byte_identity=True, reconstructed_source=False, credited_bytes=0)
    records = []
    utility = next(p for p in proofs if p[0]['source'] == 'jdinput.c')
    utility_row, _, utility_raw, utility_coff, utility_symbols, _ = utility
    natural = next(s for s in utility_symbols.values() if s['name'] == '_jpeg_natural_order')
    natural_section = utility_coff['sections'][natural['sec'] - 1]
    natural_content = utility_raw[natural_section['rawptr']:natural_section['rawptr'] + 320]
    if (natural['value'] or natural_section['rawsize'] != 320 or natural_section['relocs'] or
            natural_content != raw_target(m, 0x10191200, 320)):
        raise ValueError('complete source natural-order initializer differs')
    natural_evidence = dict(source='jutils.c included in jdinput.c', address='0x10191200',
                            bytes=320, object_sha256=utility_row['object_sha256'],
                            sha256=hashlib.sha256(natural_content).hexdigest())
    quantizer = next(p for p in proofs if p[0]['source'] == 'jquant1.c')
    _, _, quant_raw, quant_coff, quant_symbols, _ = quantizer
    order = next(s for s in quant_symbols.values() if 'RGB_order' in s['name'])
    order_section = quant_coff['sections'][order['sec'] - 1]
    expected_order = struct.pack('<3i', 1, 2, 0)
    start = order_section['rawptr'] + order['value']
    if (any(order['value'] <= r['vaddr'] < order['value'] + 12 for r in order_section['relocs']) or
            quant_raw[start:start + 12] != expected_order or raw_target(m, 0x101911f0, 12) != expected_order):
        raise ValueError('source/target BGR priority table differs')
    for row, match, raw, coff, symbols, function in proofs:
        section = coff['sections'][function['sec'] - 1]
        candidate = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
        address = int(match['address'], 16)
        target = m['carve'](address)[0]
        branches = branch_fields(target, address)
        sites = []
        for relocation in section['relocs']:
            p = relocation['vaddr']
            symbol = symbols[relocation['sym']]
            destination = branches[p] if p in branches else struct.unpack_from('<I', target, p)[0]
            addend = struct.unpack_from('<I', candidate, p)[0]
            status = 'UNRESOLVED'
            evidence = None
            if symbol['name'] == '_jpeg_natural_order' and relocation['type'] == 6:
                require_binding(destination, 0x10191200, addend)
                status = 'COMPLETE-SOURCE-DATA-SUPPORTED'
                evidence = natural_evidence
            elif symbol['name'] in runtime_symbols and relocation['type'] == 20:
                evidence = runtime_symbols[symbol['name']]
                require_binding(destination, int(evidence['address'], 16), addend)
                status = 'AUTHENTIC-TOOLCHAIN-SYMBOL-BINDING'
            elif (row['source'], symbol['name']) in definitions:
                base = definitions[(row['source'], symbol['name'])]
                require_binding(destination, base, addend)
                status = 'CALLEE-SHAPE-SUPPORTED'
                evidence = dict(source=row['source'], address=hex(base))
            elif (args.memory_run and row['source'] in ('jmemmgr.c', 'jpeg_api_group.c')
                  and symbol['name'] in ('_first_pool_slop', '_extra_pool_slop')
                  and relocation['type'] == 6 and symbol['sec'] > 0):
                base, values = {'_first_pool_slop': (0x101910dc, (1600, 16000)),
                                '_extra_pool_slop': (0x101910e4, (0, 5000))}[symbol['name']]
                data = coff['sections'][symbol['sec'] - 1]
                value = symbol['value']
                content = struct.pack('<2i', *values)
                if (value + 8 > data['rawsize'] or not data['flags'] & 0x40
                        or data['flags'] & 0x20
                        or any(value <= r['vaddr'] < value + 8 for r in data['relocs'])
                        or raw[data['rawptr'] + value:data['rawptr'] + value + 8] != content
                        or raw_target(m, base, 8) != content):
                    raise ValueError('complete two-pool slop array differs')
                require_binding(destination, base, addend)
                status = 'COMPLETE-SOURCE-DATA-SUPPORTED'
                evidence = dict(symbol_base=hex(base), bytes=8,
                                sha256=hashlib.sha256(content).hexdigest())
            elif symbol['sec'] > 0 and symbol['sec'] != function['sec'] and relocation['type'] == 6:
                data = coff['sections'][symbol['sec'] - 1]
                if (not data['relocs'] and data['rawsize'] and data['rawptr'] and
                        data['flags'] & 0x40 and not data['flags'] & 0x20):
                    base = (destination - addend - symbol['value']) & 0xffffffff
                    content = raw[data['rawptr']:data['rawptr'] + data['rawsize']]
                    try:
                        retail = raw_target(m, base, len(content))
                    except ValueError:
                        retail = None
                    if retail == content:
                        status = 'COMPLETE-SOURCE-DATA-SUPPORTED'
                        evidence = dict(section_base=hex(base), bytes=len(content),
                                        sha256=hashlib.sha256(content).hexdigest())
            sites.append(dict(offset=p, symbol=symbol['name'], destination=hex(destination),
                              addend=hex(addend), type=relocation['type'], status=status, evidence=evidence))
        records.append(dict(source=row['source'], address=match['address'], symbol=match['symbol'],
            bytes=match['bytes'], source_sha256=row['source_sha256'], object_sha256=row['object_sha256'],
            command=row['command'], sites=sites, unresolved=sum(s['status'] == 'UNRESOLVED' for s in sites)))
        records[-1]['reference_root'] = row['reference_root']
        records[-1]['object_root'] = row['object_root']
    counts = Counter(s['status'] for r in records for s in r['sites'])
    encoder_checks = []
    if args.encoder_discovery:
        decoder = Cs(CS_ARCH_X86, CS_MODE_32)
        decoder.detail = True
        for row, match, raw, coff, symbols, function in proofs:
            address = int(match['address'], 16)
            if (not (address in missing_addresses or address in memory_addresses or address in decode_addresses or 0x10041d00 <= address < 0x10047000 or address in
                     (0x10048630, 0x10048860, 0x1004aae0, 0x1004b2f0, 0x10051800))
                    or match['symbol'] == '_validate_script'):
                continue
            size = match['bytes']
            code = raw_target(m, address, size)
            instructions = list(decoder.disasm(code, address))
            if sum(i.size for i in instructions) != size or instructions[-1].mnemonic != 'ret':
                raise ValueError('encoder complete return boundary differs')
            instruction_starts = {i.address for i in instructions}
            for instruction in instructions:
                if instruction.group(CS_GRP_JUMP):
                    if instruction.operands[0].type == CS_OP_IMM:
                        destination = instruction.operands[0].imm
                        if address <= destination < address + size:
                            if destination not in instruction_starts:
                                raise ValueError('encoder branch enters instruction middle')
                        elif instruction.mnemonic != 'jmp':
                            raise ValueError('encoder conditional branch escapes body')
            padding = (-address - size) % 16
            if raw_target(m, address + size, padding) != b'\xcc' * padding:
                raise ValueError('encoder alignment padding differs')
            record = next(r for r in records if r['address'] == match['address'])
            if record['unresolved']:
                if address not in missing_addresses and address not in decode_new_addresses:
                    raise ValueError('previously closed supplemental binding regressed')
                continue
            bindings = {}
            for site in record['sites']:
                base = (int(site['destination'], 16) - int(site['addend'], 16)) & 0xffffffff
                if site['symbol'] in bindings and bindings[site['symbol']] != base:
                    raise ValueError('encoder symbol has inconsistent bindings')
                bindings[site['symbol']] = base
            obj = Path(row['object_root']) / (row['job'] + '.obj')
            with redirect_stdout(io.StringIO()):
                check(address, obj, match['symbol'], matcher=m, bindings=bindings)
            for name, base in bindings.items():
                try:
                    with redirect_stdout(io.StringIO()):
                        check(address, obj, match['symbol'], matcher=m,
                              bindings=dict(bindings, **{name: (base + 4) & 0xffffffff}))
                except ValueError as error:
                    if 'wrong binding' not in str(error):
                        raise
                else:
                    raise ValueError('encoder wrong binding accepted')
            encoder_checks.append(dict(address=match['address'], bytes=size,
                                       alignment_padding=padding, negative_bindings=len(bindings)))
    # This overlay must retain the prior checked cluster, not trade old matches for new ones.
    required = set()
    for previous in ['baseline_jpeg_j88osvbx', 'baseline_jpeg_uztgv3j1']:
        for row in json.loads((HERE / previous / 'results.json').read_text()):
            required.update((match['address'], match['symbol']) for match in row.get('matches', []))
    current = {(r['address'], r['symbol']) for r in records}
    if not required <= current:
        raise ValueError('prior source match regression: ' + str(required - current))
    packet = dict(status='DEPENDENCY-REVIEW', anchor_sha256=EXPECTED, image=IMAGE,
        original_referee_replayed=True, objects_from=str(objects), dependencies=inputs['dependencies'],
        relocation_counts=dict(counts), functions=records,
        bgr_order_table=dict(address='0x101911f0', values=[1, 2, 0], source='jquant1.c'),
        indirect_call_abis_reviewed=False, independent_review=False, whole_file_identity=False)
    packet['boundary_proofs'] = boundary_packet
    packet['natural_order_table'] = natural_evidence
    packet['encoder_discovery'] = str(args.encoder_discovery) if args.encoder_discovery else None
    packet['encoder_inline'] = str(args.encoder_inline) if args.encoder_inline else None
    packet['encoder_preprocess'] = str(args.encoder_preprocess) if args.encoder_preprocess else None
    packet['encoder_coeff'] = str(args.encoder_coeff) if args.encoder_coeff else None
    packet['coefficient_boundary_corrections'] = coefficient_boundaries
    packet['utility_discovery'] = str(args.utility_discovery) if args.utility_discovery else None
    packet['missing_discovery'] = [str(p.resolve()) for p in args.missing_discovery or []]
    packet['runtime_symbol_identity_only'] = runtime_symbols
    packet['encoder_boundary_negative_checks'] = encoder_checks
    if boundary_packet:
        packet['inline_inputs'] = inline_inputs
    test = HERE / 'test_jpeg_input.c'
    executable = run / 'input_fixture32'
    host_command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
                    '-Werror', '-Wno-unused-parameter', '-I' + str(reference),
                    '-DJPEG_INPUT_SOURCE=' + json.dumps(str(reference / 'jdinput.c')),
                    str(test), '-o', str(executable)]
    subprocess.run(host_command, check=True)
    subprocess.run([str(executable)], check=True)
    packet.update(input_host_fixture_passed=True, host_command=host_command,
                  test_sha256=hashlib.sha256(test.read_bytes()).hexdigest(), prior_matches_retained=len(required))
    bgr_test = HERE / 'test_jpeg_bgr.c'
    bgr_executable = run / 'bgr_fixture32'
    bgr_command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
                   '-Werror', '-Wno-unused-parameter',
                   '-DJPEG_COLOR_SOURCE=' + json.dumps(str(reference / 'jdcolor.c')),
                   str(bgr_test), str(reference / 'jutils.c'), '-o', str(bgr_executable)]
    subprocess.run(bgr_command, check=True)
    subprocess.run([str(bgr_executable)], check=True)
    packet.update(bgr_host_fixture_passed=True, bgr_command=bgr_command,
                  bgr_test_sha256=hashlib.sha256(bgr_test.read_bytes()).hexdigest())
    if encoder_checks:
        roundtrip_test = HERE / 'test_jpeg_roundtrip.c'
        roundtrip_sources = [p for p in sorted(reference.glob('j*.c')) if p.name != 'jutils.c']
        roundtrip_command = ['cc', '-m32', '-malign-double', '-std=c89', '-O2',
                             '-I' + str(reference), str(roundtrip_test)]
        roundtrip_command += [str(p) for p in roundtrip_sources]
        roundtrip_command += ['-lm', '-o', str(run / 'roundtrip_fixture32')]
        subprocess.run(roundtrip_command, check=True)
        subprocess.run([str(run / 'roundtrip_fixture32')], check=True)
        packet['encoder_roundtrip'] = dict(passed=True, command=roundtrip_command,
            fixture_sha256=hashlib.sha256(roundtrip_test.read_bytes()).hexdigest(),
            adapter='Host initialization, not reconstructed retail Create APIs',
            original_runtime_equivalence=False)
        if args.api_run:
            api_run = args.api_run.resolve()
            api_inputs = json.loads((api_run / 'inputs.json').read_text())
            api_reference = Path(api_inputs['reference'])
            if api_inputs['image'] != IMAGE or api_inputs.get('reused_objects_from'):
                raise ValueError('API integration requires fresh pinned draft build')
            for name, digest in api_inputs['dependencies'].items():
                if hashlib.sha256((api_reference / name).read_bytes()).hexdigest() != digest:
                    raise ValueError('API draft inputs changed: ' + name)
            api_sources = [api_reference / p.name if p.name in ('jcapimin.c', 'jdapimin.c')
                           else p for p in roundtrip_sources]
            api_command = ['cc', '-m32', '-malign-double', '-std=c89', '-O2',
                           '-DJPEG_API_CREATE', '-I' + str(reference), str(roundtrip_test)]
            api_command += [str(p) for p in api_sources]
            api_command += ['-lm', '-o', str(run / 'api_roundtrip_fixture32')]
            subprocess.run(api_command, check=True)
            subprocess.run([str(run / 'api_roundtrip_fixture32')], check=True)
            packet['api_source_integration'] = dict(passed=True, inputs=api_inputs,
                command=api_command, fixture_sha256=hashlib.sha256(roundtrip_test.read_bytes()).hexdigest(),
                byte_match=False, new_code_bytes=0, original_runtime_equivalence=False)
    if args.memory_run:
        memory_test = HERE / 'test_jpeg_allocators.c'
        memory_reference = Path(json.loads((args.memory_run / 'inputs.json').read_text())['reference'])
        memory_executable = args.memory_run / 'memory_fixture32'
        memory_command = ['cc', '-m32', '-malign-double', '-std=c89', '-Wall', '-Wextra',
                          '-Werror', '-Wno-unused-parameter', '-DJPEG_MEMORY_VIRTUAL',
                          '-DJPEG_MEMORY_SOURCE="' + str(memory_reference / 'jmemmgr.c') + '"',
                          str(memory_test)]
        if (memory_reference / 'jpeg_api_group.c').exists():
            memory_command.append('-D__declspec(x)=')
        if args.decode_run:
            decode_inputs = json.loads((args.decode_run / 'inputs.json').read_text())
            decode_reference = Path(decode_inputs['reference'])
            memory_command += ['-DJPEG_MAIN_SOURCE="' + str(decode_reference / 'jdmainct.c') + '"',
                               '-DJPEG_POST_SOURCE="' + str(decode_reference / 'jdpostct.c') + '"',
                               '-DJPEG_SAMPLE_SOURCE="' + str(decode_reference / 'jdsample.c') + '"',
                               '-DJPEG_COEF_SOURCE="' + str(decode_reference / 'jdcoefct.c') + '"',
                               '-D__forceinline=__inline__']
        if '#include "jutils.c"' not in (memory_reference / 'jmemmgr.c').read_text():
            memory_command.append(str(reference / 'jutils.c'))
        memory_command += ['-o', str(memory_executable)]
        subprocess.run(memory_command, check=True)
        subprocess.run([str(memory_executable)], check=True)
        packet['memory_source_integration'] = dict(run=str(args.memory_run),
            passed=True, command=memory_command,
            fixture_sha256=hashlib.sha256(memory_test.read_bytes()).hexdigest(),
            original_runtime_equivalence=False)
        memory_inputs = json.loads((args.memory_run / 'inputs.json').read_text())
        for name, digest in memory_inputs['dependencies'].items():
            if hashlib.sha256((memory_reference / name).read_bytes()).hexdigest() != digest:
                raise ValueError('memory input changed during replay: ' + name)
        if args.decode_run:
            for name, digest in decode_inputs['dependencies'].items():
                if hashlib.sha256((decode_reference / name).read_bytes()).hexdigest() != digest:
                    raise ValueError('decoder input changed during replay: ' + name)
            packet['decoder_source_integration'] = dict(run=str(args.decode_run),
                passed=True, fixture='Main/post/upsampler/coefficient callbacks and buffer setup with actual memory source',
                remaining_initializer_interfaces_unresolved=True, original_runtime_equivalence=False)
    encoded = json.dumps(packet, indent=2) + '\n'
    (HERE / 'jpeg_dependency_packet.json').write_text(encoded)
    (run / 'dependency_packet.json').write_text(encoded)
    print('PASS: replayed', len(records), 'functions;', dict(counts))
    print('No unresolved direct relocations:', sum(r['unresolved'] == 0 for r in records),
          'functions /', sum(r['bytes'] for r in records if r['unresolved'] == 0), 'bytes')


if __name__ == '__main__':
    main()
