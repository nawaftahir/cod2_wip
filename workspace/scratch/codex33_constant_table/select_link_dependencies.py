"""Strict dependency selection for the 30 byte-proved constant-table bodies."""
import hashlib
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ed71669eff57de3cb940997b38a1b54b106016665e4fd3dd82fd0cc325cb0d5'
source = prior.read_text()
private_size = '''                    elif s['name'] == '?TypeSize@D3DXShader@@YGXPAVCConstantTable@1@PAU_D3DXSHADER_CONSTANTINFO@@PAU_D3DXSHADER_TYPEINFO@@IPAI3@Z':
                        assert s['sclass'] == 3 and s['naux'] == 0
                        replacement, rc, rf, owner = owners[s['name']]
                        rs = rc['sections'][rf['sec'] - 1]
                        rnames = {fn['idx']: fn for fn in rc['symbols']}
                        assert rf['sclass'] == 2 and rf['naux'] == 0 and rf['value'] == 0
                        assert sec['rawsize'] == rs['rawsize'] == 187
                        assert original[sec['rawptr']:sec['rawptr'] + 187] == replacement[rs['rawptr']:rs['rawptr'] + 187]
                        left = [(r['vaddr'], r['type'], syms[r['sym']]['name']) for r in sec['relocs']]
                        right = [(r['vaddr'], r['type'], rnames[r['sym']]['name']) for r in rs['relocs']]
                        assert left == right == [(77, 20, s['name'])]
                        assert original[sec['rawptr'] + 184:sec['rawptr'] + 187] == bytes((0xc2, 24, 0))
                        # Identical six-stack-argument stdcall ABI; recursive relocation remains source-bound.
                        raw[offset + 16] = 2
'''
for before, after in [
    ('codex35_pool_reads', 'codex33_constant_table'),
    ("'validation', 'pool_reads'):", "'validation', 'pool_reads', 'comment', 'conversions', 'buffers', 'casts', 'matched'):"),
    ('len(replacements) == 288', 'len(replacements) == 337'),
    ("                    elif s['sclass'] == 3:", private_size + "                    elif s['sclass'] == 3:"),
]:
    assert before in source, before
    source = source.replace(before, after)
if '--fixture' in sys.argv:
    source = source.replace('codex33_constant_table', 'codex33_constant_table/fixture')
    source = source.replace('len(replacements) == 337', 'len(replacements) == 32')
    source = source.replace('len(coalesced) == 1', 'len(coalesced) == 0')
    source = source.replace('link_dependency_selection.json', 'fixture_dependency_selection.json')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})
