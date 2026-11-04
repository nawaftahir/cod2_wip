"""Full linked vtable and typed SDK pointee proof, including empty Print slots."""
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

import pefile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
from check_shape import is_function


def prove():
    run = ROOT / 'gfx/target/build/codex35_nodes'
    sdk = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
    assert hashlib.sha256(sdk.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    matcher = load_matcher()
    retail = pefile.PE(data=matcher['_d'])
    linked = pefile.PE(str(run / 'gfx.dll'))
    entries = {}
    for line in (run / 'gfx.map').read_text().splitlines():
        match = re.match(r'\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$', line)
        if match:
            entries[match[1]] = (int(match[2], 16), match[3])
    relocs = lambda pe: {pe.OPTIONAL_HEADER.ImageBase + e.rva
        for block in pe.DIRECTORY_ENTRY_BASERELOC for e in block.entries if e.type == 3}
    linked_relocs, retail_relocs = relocs(linked), relocs(retail)
    original = list(members(sdk.read_bytes()))[75]
    coff = matcher['parse_coff'](original)
    symbols = {s['idx']: s for s in coff['symbols']}
    packet = json.loads((HERE / 'clean_packet.json').read_text())
    assert all(hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == h for p, h in packet['files'].items())
    tables, dependencies, extents = {}, {}, {}
    for row in packet['rows']:
        for binding in row['bindings']:
            if binding['kind'] != 'TYPED-SOURCE-VTABLE':
                continue
            name, target = binding['symbol'], int(binding['base'], 16)
            assert tables.setdefault(name, target) == target
            ours, owner = entries[name]
            assert owner == 'nodes.obj'
            assert {p - ours for p in linked_relocs if ours <= p < ours + 12} == {0, 4, 8}
            assert {p - target for p in retail_relocs if target <= p < target + 12} == {0, 4, 8}
            old, = [s for s in symbols.values() if s['name'] == name and s['sec'] > 0]
            section = coff['sections'][old['sec'] - 1]
            assert section['rawsize'] == 12 and len(section['relocs']) == 3
            original_slots = {r['vaddr']: symbols[r['sym']]['name'] for r in section['relocs']}
            a = linked.get_data(ours - linked.OPTIONAL_HEADER.ImageBase, 12)
            b = retail.get_data(target - retail.OPTIONAL_HEADER.ImageBase, 12)
            for slot in binding['slots']:
                p, callee = slot['offset'], slot['symbol']
                assert original_slots[p] == callee
                address, callee_owner = entries[callee]
                assert struct.unpack_from('<I', a, p)[0] == address
                assert struct.unpack_from('<I', b, p)[0] == int(slot['target'], 16)
                fn, = [s for s in symbols.values() if s['name'] == callee and s['sec'] > 0]
                assert is_function(original, fn) and fn['value'] == 0
                body = coff['sections'][fn['sec'] - 1]
                x = bytearray(linked.get_data(address - linked.OPTIONAL_HEADER.ImageBase, body['rawsize']))
                y = bytearray(retail.get_data(int(slot['target'], 16) - retail.OPTIONAL_HEADER.ImageBase, body['rawsize']))
                z = bytearray(original[body['rawptr']:body['rawptr'] + body['rawsize']])
                assert len(x) == len(y) == len(z) == body['rawsize']
                for r in body['relocs']:
                    off = r['vaddr']
                    x[off:off + 4] = y[off:off + 4] = z[off:off + 4] = bytes(4)
                assert x == y == z
                # Supplying zero-credit SDK code locators is not source coverage.
                if p == 8:
                    assert x == bytes([0xc3]) and ':' in callee_owner
                    result = {'name': callee, 'obj': callee_owner, 'size': 1,
                              'hits': [slot['target']], 'source_credit': 0}
                    assert dependencies.setdefault(callee, result) == result
                wrong = address + 1
                assert struct.unpack_from('<I', a, p)[0] != wrong
            extents[name] = {'address': ours, 'bytes': 12, 'object': str(run.relative_to(ROOT)) + '/libraries/nodes.obj'}
    assert len(tables) == len(dependencies) == len(extents) == 18
    return list(dependencies.values()), extents
