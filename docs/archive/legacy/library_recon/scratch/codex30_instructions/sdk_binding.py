"""Prove SDK array and its field iterator before resolving its unnamed binding."""
import hashlib
from pathlib import Path
import re
import struct
import sys

import pefile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'gfx/tools'), str(ROOT / 'codex/renderer')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members


def prove(image, mapfile, anchor):
    sdk = ROOT / 'sdk/sum2004/Lib/d3dx9.lib'
    assert hashlib.sha256(sdk.read_bytes()).hexdigest() == '3eec8cbc4f3d2c3128ce454400820e5b905009b91fe7d8b6bbedb2432b818a88'
    assert hashlib.sha256(Path(anchor).read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
    raw = list(members(sdk.read_bytes()))[57]
    coff = load_matcher()['parse_coff'](raw)
    names = {s['idx']: s for s in coff['symbols']}
    fn, = [s for s in names.values() if s['name'] == '_D3DXGetTargetDescByVersion@12' and s['sec'] > 0]
    array, = [s for s in names.values() if s['name'] == '_g_Targets']
    section = coff['sections'][fn['sec'] - 1]
    data = coff['sections'][array['sec'] - 1]
    assert array['value'] == 0 and data['rawsize'] == 528
    assert section['rawsize'] == 79 and len(section['relocs']) == 3
    match, = re.findall(r'^\s*[0-9a-f]{4}:[0-9a-f]{8}\s+_D3DXGetTargetDescByVersion@12\s+([0-9a-f]{8})\s+f\s+\S+\s*$', Path(mapfile).read_text(), re.M)
    ours, retail = pefile.PE(str(image)), pefile.PE(str(anchor))
    start = int(match, 16)
    a = bytearray(ours.get_data(start - ours.OPTIONAL_HEADER.ImageBase, 79))
    b = bytearray(retail.get_data(0x63814, 79))
    source = raw[section['rawptr']:section['rawptr'] + 79]
    pairs, bases, offsets = set(), set(), []
    for r in section['relocs']:
        p = r['vaddr']
        assert r['type'] == 6 and names[r['sym']]['name'] == '_g_Targets'
        off = struct.unpack_from('<I', source, p)[0]
        ov, tv = struct.unpack_from('<I', a, p)[0], struct.unpack_from('<I', b, p)[0]
        bases.add((ov - off, tv - off))
        pairs.add((ov, tv))
        offsets.append(off)
        a[p:p + 4] = b[p:p + 4] = bytes(4)
    assert a == b and sorted(offsets) == [0, 8, 536] and len(bases) == 1
    ob, tb = bases.pop()
    assert tb == 0x1010c220
    left = bytearray(ours.get_data(ob - ours.OPTIONAL_HEADER.ImageBase, 528))
    right = bytearray(retail.get_data(tb - retail.OPTIONAL_HEADER.ImageBase, 528))
    original = bytearray(raw[data['rawptr']:data['rawptr'] + 528])
    relocs = lambda pe: {pe.OPTIONAL_HEADER.ImageBase + e.rva for block in pe.DIRECTORY_ENTRY_BASERELOC for e in block.entries if e.type == 3}
    orel, trel = relocs(ours), relocs(retail)
    assert {p - ob for p in orel if ob <= p < ob + 528} == {r['vaddr'] for r in data['relocs']}
    assert {p - tb for p in trel if tb <= p < tb + 528} == {r['vaddr'] for r in data['relocs']}
    assert {r['vaddr'] for r in data['relocs']} == set(range(0, 528, 12))
    for r in data['relocs']:
        p, symbol = r['vaddr'], names[r['sym']]
        literal = coff['sections'][symbol['sec'] - 1]
        assert r['type'] == 6 and symbol['value'] == 0 and not literal['relocs']
        value = raw[literal['rawptr']:literal['rawptr'] + literal['rawsize']]
        assert value.endswith(b'\0') and struct.unpack_from('<I', original, p)[0] == 0
        ov, tv = struct.unpack_from('<I', left, p)[0], struct.unpack_from('<I', right, p)[0]
        assert ours.get_data(ov - ours.OPTIONAL_HEADER.ImageBase, len(value)) == value
        assert retail.get_data(tv - retail.OPTIONAL_HEADER.ImageBase, len(value)) == value
        left[p:p + 4] = right[p:p + 4] = original[p:p + 4] = bytes(4)
    assert left == right == original
    # No next-string interpretation: 536 is one past the 44-record flags column.
    assert (ob + 536, tb + 536) in pairs and (ob + 8, tb + 8) in pairs
    assert (ob + 536, tb + 535) not in pairs
    return ob, tb, pairs


if __name__ == '__main__':
    ob, tb, pairs = prove(*sys.argv[1:4])
    binder = ROOT / 'gfx/tools/bindcheck.py'
    source = binder.read_text()
    assert hashlib.sha256(source.encode()).hexdigest() == '93a7a47a2d0d3fec4126fc71e58f5f8beb41b68dcc12f079cba0c3a79b492c4c'
    header = 'def resolve_bind(ov, tv, fb=()):\n'
    assert source.count(header) == 1
    source = source.replace(header, header + "    if set(fb) == sdk_pairs and (ov, tv) in sdk_pairs:\n        return '_g_Targets', ov - sdk_ob, sdk_ob, 528\n")
    exec(compile(source, str(binder), 'exec'), {'__file__': str(binder), 'sdk_ob': ob, 'sdk_pairs': pairs})
