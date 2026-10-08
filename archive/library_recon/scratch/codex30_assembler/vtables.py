"""Full prior/new linked table proof, including inherited base-node equality."""
import hashlib
from pathlib import Path
import re
import struct

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_nodes/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'c233ab7ebea5f2f988904f8e92b453a2edbb38fa4307cfadd95c0304777fd6f8'


def prove():
    scope = {'__file__': str(prior), '__name__': 'prior_tables'}
    code = prior.read_text().replace('build/codex35_nodes', 'build/codex30_assembler')
    exec(compile(code, str(prior), 'exec'), scope)
    old_rows, old_extents = scope['prove']()
    code = code.replace("[75]", "[60]").replace("'nodes.obj'", "'asm_nodes.obj'")
    code = code.replace("'/libraries/nodes.obj'", "'/libraries/asm_nodes.obj'")
    code = code.replace('== 18', '== 2')
    code = code.replace("                fn, = [s for s in symbols.values() if s['name'] == callee and s['sec'] > 0]\n                assert is_function(original, fn) and fn['value'] == 0\n                body = coff['sections'][fn['sec'] - 1]", '''                dependency_original, dependency_coff = original, coff
                defined = [s for s in symbols.values() if s['name'] == callee and s['sec'] > 0]
                if not defined:
                    assert callee == '?IsEqual@CNode@D3DXShader@@UAEHPAV12@@Z'
                    dependency_original = list(members(sdk.read_bytes()))[75]
                    dependency_coff = matcher['parse_coff'](dependency_original)
                    defined = [s for s in dependency_coff['symbols'] if s['name'] == callee and s['sec'] > 0]
                fn, = defined
                assert is_function(dependency_original, fn) and fn['value'] == 0
                body = dependency_coff['sections'][fn['sec'] - 1]''')
    code = code.replace("original[body['rawptr']:body['rawptr'] + body['rawsize']]",
                        "dependency_original[body['rawptr']:body['rawptr'] + body['rawsize']]")
    scope = {'__file__': str(HERE / 'vtables.py'), '__name__': 'assembler_tables'}
    exec(compile(code, str(prior), 'exec'), scope)
    new_rows, new_extents = scope['prove']()
    assert not old_extents.keys() & new_extents.keys()
    assert len(old_rows) == len(old_extents) == 18 and len(new_rows) == len(new_extents) == 2
    # Generic comparison omits five-byte SDK/CRT thunks. Certify this dependency
    # in full and bind its JMP to the named free implementation, not a byte alias.
    run = HERE.parents[1] / 'build/codex30_assembler'
    entries = {}
    for line in (run / 'gfx.map').read_text().splitlines():
        match = re.match(r'\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f\s+)?(?:i\s+)?(\S+)\s*$', line)
        if match:
            entries[match[1]] = (int(match[2], 16), match[3])
    pefile = scope['pefile']
    linked, retail = pefile.PE(str(run / 'gfx.dll')), pefile.PE(data=scope['load_matcher']()['_d'])
    address, owner = entries['??3@YAXPAX@Z']
    assert ':' in owner
    original = (HERE.parent / 'codex30_cpp/obj/mt/delete.obj').read_bytes()
    assert hashlib.sha256(original).hexdigest() == 'aead5eabbcdf9cd490a1d80ae60de7cdce13269a57372dedc055c055a000da24'
    coff = scope['load_matcher']()['parse_coff'](original)
    definition, = [s for s in coff['symbols'] if s['name'] == '??3@YAXPAX@Z' and s['sec'] > 0]
    section = coff['sections'][definition['sec'] - 1]
    assert section['rawsize'] == 5 and section['relocs'] == [dict(section['relocs'][0], vaddr=1, type=20)]
    callee = next(s['name'] for s in coff['symbols'] if s['idx'] == section['relocs'][0]['sym'])
    assert callee == '_free'
    ours = linked.get_data(address - linked.OPTIONAL_HEADER.ImageBase, 5)
    theirs = retail.get_data(0x100f7865 - retail.OPTIONAL_HEADER.ImageBase, 5)
    assert ours[0] == theirs[0] == original[section['rawptr']] == 0xe9
    assert address + 5 + struct.unpack_from('<i', ours, 1)[0] == entries['_free'][0]
    assert 0x100f7865 + 5 + struct.unpack_from('<i', theirs, 1)[0] == 0x100f84d0
    assert entries['_free'][0] + 1 != address + 5 + struct.unpack_from('<i', ours, 1)[0]
    runtime_locator = {'name': '??3@YAXPAX@Z', 'obj': owner, 'size': 5,
                       'hits': ['0x100f7865'], 'source_credit': 0}
    return old_rows + new_rows + [runtime_locator], dict(old_extents, **new_extents)
