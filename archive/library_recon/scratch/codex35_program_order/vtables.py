"""Full generated transform-table proof in the private linked image."""
import hashlib
import json
from pathlib import Path
import re
import struct
import sys
import pefile

HERE = Path(__file__).resolve().parent
ORDERING_HERE = HERE
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members

prior = HERE.parent / 'codex35_predicate_order/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '5e99c63fd1d2fad047de54907af2eed9165eafe70abc65dc415118597b728fac'
source = prior.read_text().replace('codex35_predicate_order', 'codex35_program_order')
exec(compile(source, str(prior), 'exec'), globals())
ordering_prior_prove = prove


def prove():
    rows, extents = ordering_prior_prove()
    run = ROOT / 'gfx/target/build/codex35_program_order'
    packet = json.loads((ORDERING_HERE / 'clean_packet.json').read_text())
    assert all(hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == h for p, h in packet['files'].items())
    entries = {n: (int(v, 16), o) for n, v, o in re.findall(
        r'^\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$',
        (run / 'gfx.map').read_text(), re.M)}
    linked, retail = pefile.PE(str(run / 'gfx.dll')), pefile.PE(data=load_matcher()['_d'])
    relocs = lambda pe: {pe.OPTIONAL_HEADER.ImageBase + e.rva
        for block in pe.DIRECTORY_ENTRY_BASERELOC for e in block.entries if e.type == 3}
    tables = {}
    for row in packet['rows']:
        for edge in row['bindings']:
            if edge['kind'] == 'TYPED-SOURCE-VTABLE':
                assert tables.setdefault(edge['symbol'], edge) == edge
    expected = {'??_7CTransform@D3DXShader@@6B@': (8, 0x10110440),
                '??_7CTReorderInstructions@D3DXShader@@6B@': (12, 0x10110448)}
    assert tables.keys() == expected.keys()
    for name, edge in tables.items():
        size, target = expected[name]
        assert int(edge['base'], 16) == target
        ours, owner = entries[name]
        assert owner == 'program_order.obj'
        assert {p - ours for p in relocs(linked) if ours <= p < ours + size} == set(range(0, size, 4))
        assert {p - target for p in relocs(retail) if target <= p < target + size} == set(range(0, size, 4))
        assert {s['offset'] for s in edge['slots']} == set(range(0, size, 4))
        for slot in edge['slots']:
            p, callee = slot['offset'], slot['symbol']
            address, callee_owner = entries[callee]
            assert ':' not in callee_owner
            assert struct.unpack('<I', linked.get_data(ours + p - linked.OPTIONAL_HEADER.ImageBase, 4))[0] == address
            assert struct.unpack('<I', retail.get_data(target + p - retail.OPTIONAL_HEADER.ImageBase, 4))[0] == int(slot['target'], 16)
            assert address + 1 != struct.unpack('<I', linked.get_data(ours + p - linked.OPTIONAL_HEADER.ImageBase, 4))[0]
        assert name not in extents
        extents[name] = {'address': ours, 'bytes': size,
            'object': str((run / 'libraries/program_order.obj').relative_to(ROOT))}
    return rows, extents
