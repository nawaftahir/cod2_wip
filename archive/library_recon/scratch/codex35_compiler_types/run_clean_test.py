"""Full original/source CPU outputs; clean two-method and retained cohort ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_clip/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'bb6b107ec83d20c6ac0dbe1cf5c26d82143e507832a9cc178b12486d3398ee90'
source = prior.read_text().replace('codex35_clip', 'codex35_compiler_types')
source = source.replace("len(selection['source_objects']) == 194", "len(selection['source_objects']) == 196")
source = source.replace("len(selection['removed_definitions']) == 204", "len(selection['removed_definitions']) == 206")
changes = [
    ("HERE / 'compile_test.sh'", "HERE / 'compile_clean_test.sh'"),
    ("HERE / 'test.obj'", "HERE / 'clean_test.obj'"),
    ("exe = HERE / (mode + '.exe')", "exe = HERE / (mode + '_clean.exe')"),
    ("HERE / (mode + '.map')", "HERE / (mode + '_clean.map')"),
    ("HERE / (mode + '_output.log')", "HERE / (mode + '_clean_output.log')"),
    ("HERE / (mode + '_stderr.log')", "HERE / (mode + '_clean_stderr.log')"),
    ("HERE / (m + suffix)", "HERE / (m + '_clean' + suffix)"),
    ("HERE / 'fixture_packet.json'", "HERE / 'clean_fixture_packet.json'"),
    ("'?CompareSemantic'):", "'?CompareSemantic', '?Error', '?GetTypeFlags'):"),
    ("else 'compiler.obj'", "else 'types.obj' if name in ('?Error', '?GetTypeFlags') else 'compiler.obj'"),
    ('Nine-method clean compiler cohort', 'Eleven-method clean compiler cohort'),
]
extra = """
inputs += [TARGET / 'src/codex_shader_compiler_types/types.cpp',
    TARGET / 'src/codex_shader_support/support.h',
    *list((ROOT / 'sdk/sum2004/Include').glob('*.h'))]
for name in ('?Error@CCompiler@D3DXShader@@IAAJPAVCNode@2@IPBDZZ',
    '?GetTypeFlags@CCompiler@D3DXShader@@IAEIPAVCNode@2@PAK@Z'):
    assert selection['source_objects'][name] == hashlib.sha256(
        (TARGET / 'build/codex35_compiler_types/libraries/types.obj').read_bytes()).hexdigest()
"""
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, "\nfor before, after in changes:\n    assert before in source, before\n    source = source.replace(before, after)\nsource = source.replace('\\ndef run(mode):', extra + '\\ndef run(mode):')\n" + marker)
exec(compile(source, str(prior), 'exec'),
    {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__',
     'changes': changes, 'extra': extra})
