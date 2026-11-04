"""Reuse full-section SDK diagnostics; no source acceptance or credit."""
from pathlib import Path
import hashlib
import json
import struct
import sys
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})

ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
m = load_matcher()
object_name = sys.argv[1] if len(sys.argv) > 1 else 'compiler.obj'
raw = (HERE / 'obj' / object_name).read_bytes()
coff = m['parse_coff'](raw)
sdk = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))
refs = {n: r for r in json.loads((HERE.parent / 'codex35_sdk/discovery.json').read_text()) for n in r['symbols']}
packet = json.loads((HERE / ('probe_' + Path(object_name).stem + '.json')).read_text())

def fields(raw, coff, section):
    names = {s['idx']: s['name'] for s in coff['symbols']}
    return [(r['vaddr'], r['type'], names[r['sym']],
        struct.unpack_from('<I', raw, section['rawptr'] + r['vaddr'])[0]) for r in section['relocs']]

for row in packet['rows']:
    if not row['full_masked_equal']: continue
    symbol, = [s for s in coff['symbols'] if s['name'] == row['symbol'] and s['sec'] > 0]
    ref = refs[row['symbol']]
    original = sdk[ref['member']]
    old = m['parse_coff'](original)
    actual = fields(raw, coff, coff['sections'][symbol['sec'] - 1])
    expected = fields(original, old, old['sections'][ref['section'] - 1])
    assert actual == expected, (row['symbol'], actual, expected)
    row['typed_relocation_fields_equal'] = True
    row['relocations'] = actual
packet['status'] = 'TYPED SDK DIAGNOSTIC ONLY; retail binding/boundary/link acceptance pending'
packet['compiler_flags'] = ['/O1', '/Oy-', '/hotpatch', '/MT', '/Gy', '/d2QIftol'] if object_name == 'compiler.obj' else 'historical diagnostic; see REPORT.md'
packet['compiler_sha256'] = {name: hashlib.sha256((HERE.parent / 'codex19_dxerr/compiler' / name).read_bytes()).hexdigest() for name in ('cl.exe', 'c1xx.dll', 'c2.dll')}
(HERE / 'typed_probe.json').write_text(json.dumps(packet, indent=2) + '\n')
with (HERE / 'attempts.jsonl').open('a') as stream:
    stream.write(json.dumps(packet) + '\n')
