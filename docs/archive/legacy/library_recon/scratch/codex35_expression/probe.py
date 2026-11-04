"""Full typed SDK diagnostic only; never accepts source or grants coverage."""
import hashlib
import json
from pathlib import Path
import struct
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
prior = HERE.parent / 'codex30_constants/probe.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '95d68413ad4582c5da798955cff7b5f18484aceaed538972efb4544f4529f0dc'
exec(compile(prior.read_text(), str(prior), 'exec'),
    {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})
sys.path[:0] = [str(ROOT / 'gfx/tools'), str(ROOT / 'codex/renderer')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
m = load_matcher()
obj = HERE / 'obj' / sys.argv[1]
raw = obj.read_bytes()
coff = m['parse_coff'](raw)
sdk = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))
refs = {name: row for row in json.loads((HERE.parent / 'codex35_sdk/discovery.json').read_text())
    for name in row['symbols']}
packet_path = HERE / ('probe_' + obj.stem + '.json')
packet = json.loads(packet_path.read_text())
for row in packet['rows']:
    if not row['full_masked_equal']:
        continue
    fn, = [s for s in coff['symbols'] if s['name'] == row['symbol'] and s['sec'] > 0]
    ref = refs[row['symbol']]
    original = sdk[ref['member']]
    old = m['parse_coff'](original)
    fields = []
    for data, parsed, section in ((raw, coff, fn['sec']), (original, old, ref['section'])):
        names = {s['idx']: s['name'] for s in parsed['symbols']}
        sec = parsed['sections'][section - 1]
        fields.append([(r['vaddr'], r['type'], names[r['sym']],
            struct.unpack_from('<I', data, sec['rawptr'] + r['vaddr'])[0]) for r in sec['relocs']])
    row['typed_relocation_fields_equal'] = fields[0] == fields[1]
    row['relocations'] = fields
packet['status'] = 'SDK DIAGNOSTIC ONLY; zero credit, retail acceptance pending'
packet['compiler_flags'] = ['/O1', '/Oy-', '/hotpatch', '/MT', '/Gy', '/d2QIftol']
packet['input_hashes'] = {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
    for p in (HERE / sys.argv[2], HERE / 'helpers.cpp', HERE / 'expression.h', HERE / 'compile.sh', Path(__file__),
        prior, ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
        *(HERE.parent / 'codex19_dxerr/compiler' / n for n in ('cl.exe', 'c1xx.dll', 'c2.dll')))}
packet_path.write_text(json.dumps(packet, indent=2) + '\n')
with (HERE / 'attempts.jsonl').open('a') as stream:
    stream.write(json.dumps(packet) + '\n')
