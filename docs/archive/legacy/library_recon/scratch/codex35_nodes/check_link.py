"""Retain all prior linked source and certify the new complete node bodies."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_instructions/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '6e247f7b222fb43d5bdcd659b3c56d426fb883cdcf88f40137d51468ae92306c'
source = prior.read_text().replace('codex30_instructions', 'codex35_nodes')
source = source.replace("build/codex30_reads/bind.json", "build/codex30_instructions/bind.json")
source = source.replace('len(baseline) == 415', 'len(baseline) == 419')
source = source.replace("'baseline_source_matches': 415", "'baseline_source_matches': 419")
source = source.replace('all 415 previous', 'all 419 previous')
source = source.replace("('codex30_parser', 'codex30_reads')", "('codex30_parser', 'codex30_reads', 'codex30_instructions')")
source = source.replace("parsers['verified_instruction_bytes'] == 7170", "parsers['verified_instruction_bytes'] == 11953")
source = source.replace("assert baseline['_DXGetErrorString9W@4'] == ('0x100de367', 72405)", "assert baseline['_DXGetErrorString9W@4'] == ('0x100de367', 48462)")
source = source.replace("assert baseline['_DXGetErrorString9A@4'] == ('0x100cc81b', 72524)", "assert baseline['_DXGetErrorString9A@4'] == ('0x100cc81b', 48427)")
# cmp.py deliberately skips call-dense functions below its search-anchor floor.
# The complete source/SDK/linked-body proof ran before this placement refinement.
refinements = [
    ("    parsers = json.loads", "    locator_only = {'??0CNodeList@D3DXShader@@QAE@XZ': 22, '??0CNodeToken@D3DXShader@@QAE@XZ': 18}\n    parsers = json.loads"),
    ("            assert proof['address'] in row['hits']", "            if row['name'] in locator_only and not row['hits']:\n                assert proof['bytes'] == locator_only[row['name']]\n                assert proof['original_referee_match'] == 100\n                assert any(p['symbol'] == row['name'] and p['retail_va'] == proof['address'] and p['full_section_bytes'] == proof['bytes'] for p in linked_parsers)\n            else:\n                assert proof['address'] in row['hits']"),
    ("    (RUN / 'cmp_placed.json').write_text", "    table_proof = load(HERE / 'vtables.py', 'node_table_proof')\n    sdk_locators, table_extents = table_proof.prove()\n    assert not ({r['name'] for r in comparisons} & {r['name'] for r in sdk_locators})\n    comparisons += sdk_locators\n    literal_ends.update(table_extents)\n    (RUN / 'cmp_placed.json').write_text"),
    ("compare, binder, HERE / 'sdk_binding.py',", "compare, binder, HERE / 'sdk_binding.py', HERE / 'vtables.py',"),
]
for old, new in refinements:
    marker = '\nexec(compile(source'
    assert source.count(marker) == 1
    source = source.replace(marker, '\nsource = source.replace(%r, %r)' % (old, new) + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
