"""Replay full outputs with clean program ownership and strict SDK selection."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex31_program/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '64f33748c44be6f37c5f3ec729bd39545213eabc8a5112e84f4d124ca50e8467'
source = prior.read_text()
header = """inputs = [HERE / 'compile_clean_test.sh', HERE / 'select_link_dependencies.py',
    HERE / 'link_dependency_selection.json', HERE / 'clean_test.obj',
    TARGET / 'src/codex_shader_program_flow/flow.cpp',
    TARGET / 'src/codex_shader_nodes/nodes.cpp', TARGET / 'src/codex_shader_support/support.h',
    HERE.parent / 'codex35_expression/test.cpp', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
    TARGET / 'build/codex35_program_flow/dependencies/d3dx9.lib',
    TARGET / 'build/codex35_program_flow/dependencies/runtime_new.lib',
    *list((TARGET / 'build/codex35_program_flow/libraries').glob('*.obj')),
    *list((ROOT / 'sdk/sum2004/Include').glob('*.h')),
    *(HERE.parent / 'codex19_dxerr/compiler' / name for name in ('cl.exe', 'c1xx.dll', 'c2.dll'))]
selection = json.loads((HERE / 'link_dependency_selection.json').read_text())
assert len(selection['source_objects']) == 212 and len(selection['removed_definitions']) == 232
assert {r['symbol'] for r in selection['removed_definitions']} == set(selection['source_objects'])
proof = json.loads((HERE / 'clean_packet.json').read_text())
assert proof['status'] == 'REVIEWABLE' and len(proof['rows']) == 4
cohort_names = {row['symbol'] for row in proof['rows']}
assert len(cohort_names) == 4
digest = hashlib.sha256((TARGET / 'build/codex35_program_flow/libraries/flow.obj').read_bytes()).hexdigest()
assert all(selection['source_objects'][name] == digest for name in cohort_names)
"""
changes = [
    ("HERE / 'compile_test.sh'", "HERE / 'compile_clean_test.sh'"),
    ("HERE / 'test.obj'", "HERE / 'clean_test.obj'"),
    ("exe = HERE / (mode + '.exe')", "exe = HERE / (mode + '_clean.exe')"),
    ("HERE / (mode + '.map')", "HERE / (mode + '_clean.map')"),
    ("HERE / (mode + '_output.log')", "HERE / (mode + '_clean_output.log')"),
    ("HERE / (mode + '_stderr.log')", "HERE / (mode + '_clean_stderr.log')"),
    ("HERE / (m + suffix)", "HERE / (m + '_clean' + suffix)"),
    ("HERE / 'fixture_packet.json'", "HERE / 'clean_fixture_packet.json'"),
    ("for name in selection['source_objects']:", "for name in cohort_names:"),
    ("'program_matched.obj' if mode", "'flow.obj' if mode"),
    ('Other SDK methods are opaque dependencies;',
     'Four-method clean program-flow cohort and retained clean helper families supplied as recorded; remaining SDK methods are opaque dependencies;'),
]
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, """
start = source.index('inputs = [')
end = source.index('\\ndef run(mode):', start)
source = source[:start] + clean_header + source[end:]
for before, after in clean_changes:
    assert before in source, before
    source = source.replace(before, after)
""" + marker)
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__',
      'clean_header': header, 'clean_changes': changes})
