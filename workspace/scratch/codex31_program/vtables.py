"""Reuse the complete typed vtable checks; vtables add no source credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
PROGRAM_HERE = HERE
prior = HERE.parent / 'codex35_compiler_types/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'cbf165a0f317e882ffc91eaca082ea3bb7a715826a0a24ef610218f06831b730'
exec(compile(prior.read_text().replace('codex35_compiler_types', 'codex31_program'), str(prior), 'exec'), globals())

prior_prove = prove


def prove():
    import json
    import pefile
    import re
    import struct
    from audit_legacy import load_matcher
    from check_dxerr_dependency import members
    rows, extents = prior_prove()
    root = PROGRAM_HERE.parents[3]
    run = root / 'gfx/target/build/codex31_program'
    sdk = root / 'sdk/sum2004/Lib/d3dx9.lib'
    assert hashlib.sha256(sdk.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    matcher = load_matcher()
    oracle = list(members(sdk.read_bytes()))
    linked, retail = pefile.PE(str(run / 'gfx.dll')), pefile.PE(data=matcher['_d'])
    entries = {n: (int(v, 16), o) for n, v, o in re.findall(
        r'^\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$',
        (run / 'gfx.map').read_text(), re.M)}
    packet = json.loads((PROGRAM_HERE / 'clean_packet.json').read_text())
    assert all(hashlib.sha256((root / p).read_bytes()).hexdigest() == h for p, h in packet['files'].items())
    for member, cls, target in [(88, 'CInstruction', 0x100853af), (87, 'CArgument', 0x10085bf4)]:
        name = '??1' + cls + '@D3DXShader@@QAE@XZ'
        helper = '??_G' + cls + '@D3DXShader@@QAEPAXI@Z'
        proof, = [r for r in packet['rows'] if r['symbol'] == helper]
        binding, = [b for b in proof['bindings'] if b['symbol'] == name]
        assert binding['kind'] == 'AUTHENTIC-SDK-CALLEE-IDENTITY-ZERO-CREDIT'
        assert binding['offset'] == 9 and binding['addend'] == 0 and int(binding['base'], 16) == target
        raw = oracle[member]
        coff = matcher['parse_coff'](raw)
        fn, = [s for s in coff['symbols'] if s['name'] == name and s['sec'] > 0]
        body = coff['sections'][fn['sec'] - 1]
        ours, owner = entries[name]
        assert fn['value'] == 0 and body['rawsize'] == 1 and not body['relocs'] and ':' in owner
        assert raw[body['rawptr']:body['rawptr'] + 1] == linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, 1) == retail.get_data(target - retail.OPTIONAL_HEADER.ImageBase, 1) == b'\xc3'
        source_start = entries[helper][0]
        for pe, start, callee in [(linked, source_start, ours), (retail, int(proof['address'], 16), target)]:
            call = pe.get_data(start + 8 - pe.OPTIONAL_HEADER.ImageBase, 5)
            assert call[0] == 0xe8 and start + 13 + struct.unpack_from('<i', call, 1)[0] == callee
            assert start + 13 + struct.unpack_from('<i', call, 1)[0] != callee + 1
        rows.append({'name': name, 'obj': owner, 'size': 1, 'hits': [hex(target)], 'source_credit': 0})
    return rows, extents
