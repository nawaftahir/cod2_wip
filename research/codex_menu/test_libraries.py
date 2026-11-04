"""Check archive bytes and the Win32 identities hidden by relocation masks."""
import json
from pathlib import Path
import struct
import sys

sys.path.insert(0, 'tools')
import lib_sweep
import link
import match_radiant as matcher
import pefile
import verify

fixes = json.loads(Path('research/codex_menu/bindings.json').read_text())
fixes['0x004dad56'] = dict(lib='libcmt.lib', member=r'build\intel\mt_obj\unlink.obj', symbol='_remove', size=42)
imports = {0x4f39f1: (0x52896c, b'ChooseColorA'), 0x500797: (0x528624, b'DestroyMenu'), 0x4dad56: (0x5283ac, b'DeleteFileA')}
retail = pefile.PE(str(link.RETAIL))
iat = {item.address: item.name for entry in retail.DIRECTORY_ENTRY_IMPORT for item in entry.imports}
image = verify.Linked()
names = verify.known_names()
rows = {row['addr']: row for row in link.read_tsv('data/lib_funcs.tsv')}
for address, fix in fixes.items():
    row = rows[address]
    assert all(str(row[key]) == str(value) for key, value in fix.items())
    directory = '/opt/msvc710/Vc7/' + ('atlmfc/lib/' if fix['lib'] == 'nafxcw.lib' else 'lib/')
    members = dict(lib_sweep.archive_members(directory + fix['lib']))
    obj = members[fix['member']]
    target, _ = matcher.carve(address)
    payload, mask, _ = matcher.object_function(obj, fix['symbol'])
    target_mask = matcher.absolute_masks(target, matcher.pe_relocations(int(address, 16), len(target), target))
    assert len(payload) == len(target) == fix['size']
    assert lib_sweep.same(target, target_mask, payload, mask), address
    if int(address, 16) in imports:
        slot, expected = imports[int(address, 16)]
        assert iat[slot] == expected
        offset = target.index(b'\xff\x15' + struct.pack('<I', slot)) + 2
        sections, symbols = matcher.parse_coff(obj)
        symbol = next(item for item in symbols if item['name'] == fix['symbol'])
        relocations = sections[symbol['section'] - 1]['relocations']
        relocation = next(item for item in relocations if item['position'] == symbol['value'] + offset)
        assert relocation['target'] == '__imp__' + expected.decode() + '@4'
    if fix['symbol'] in image.syms:
        assert verify.check(image, address, fix['symbol'], names)[0] == 'MATCH'
    if address == '0x004dad56':
        wrapper, _, _, calls = matcher.object_function(obj, '__unlink', with_calls=True)
        assert wrapper == b'\xe9\0\0\0\0' and calls == [(1, '_remove')]
print('PASS: five archive identities, three actual Win32 import bindings, unlink wrapper calls remove')
