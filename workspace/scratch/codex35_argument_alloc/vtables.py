"""Apply retained complete table proofs to the new driver image."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
ARGUMENT_HERE = HERE
prior = HERE.parent / 'codex35_pool_helpers/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'c19905ccf2adabca7ae8b409e51612d6ad2d9b3618ed26f02c2338cc5c5913c7'
source = prior.read_text().replace("'codex35_pool_helpers')", "'codex35_argument_alloc')").replace('gfx/target/build/codex35_pool_helpers', 'gfx/target/build/codex35_argument_alloc')
exec(compile(source, str(prior), 'exec'), globals())

argument_prior_prove = prove


def prove():
    import json
    import pefile
    import re
    import struct
    from audit_legacy import load_matcher
    from check_dxerr_dependency import members
    rows, extents = argument_prior_prove()
    root = ARGUMENT_HERE.parents[3]
    run = root / 'gfx/target/build/codex35_argument_alloc'
    sdk = root / 'sdk/sum2004/Lib/d3dx9.lib'
    assert hashlib.sha256(sdk.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    matcher = load_matcher()
    linked, retail = pefile.PE(str(run / 'gfx.dll')), pefile.PE(data=matcher['_d'])
    entries = {n: (int(v, 16), o) for n, v, o in re.findall(
        r'^\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$',
        (run / 'gfx.map').read_text(), re.M)}
    packet = json.loads((ARGUMENT_HERE / 'clean_packet.json').read_text())
    assert all(hashlib.sha256((root / p).read_bytes()).hexdigest() == h for p, h in packet['files'].items())
    name = '??0CArgument@D3DXShader@@QAE@XZ'
    caller = '?CopyArgument@CBaseProgram@D3DXShader@@QAEIPAVCArgument@2@@Z'
    proof, = [row for row in packet['rows'] if row['symbol'] == caller]
    edge, = [edge for edge in proof['bindings'] if edge['symbol'] == name]
    assert edge['offset'] == 26 and edge['base'] == '0x10085bf1' and edge['addend'] == 0
    assert edge['kind'] == 'AUTHENTIC-SDK-CALLEE-IDENTITY-ZERO-CREDIT'
    raw = list(members(sdk.read_bytes()))[87]
    coff = matcher['parse_coff'](raw)
    fn, = [fn for fn in coff['symbols'] if fn['name'] == name and fn['sec'] > 0]
    section = coff['sections'][fn['sec'] - 1]
    ours, owner = entries[name]
    assert fn['value'] == 0 and section['rawsize'] == 3 and not section['relocs']
    assert owner == 'd3dx9:member_0087.obj'
    assert raw[section['rawptr']:section['rawptr'] + 3] == linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, 3) == retail.get_data(0x85bf1, 3) == b'\x8b\xc1\xc3'
    for pe, start, callee in [(linked, entries[caller][0], ours), (retail, 0x10086240, 0x10085bf1)]:
        call = pe.get_data(start + 25 - pe.OPTIONAL_HEADER.ImageBase, 5)
        assert call[0] == 0xe8
        assert start + 30 + struct.unpack_from('<i', call, 1)[0] == callee
        assert start + 30 + struct.unpack_from('<i', call, 1)[0] != callee + 1
    assert name not in {row['name'] for row in rows}
    rows.append({'name': name, 'obj': owner, 'size': 3, 'hits': ['0x10085bf1'], 'source_credit': 0})
    return rows, extents
