"""Full public shader-output replay; enforce ownership of all twelve methods."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_expression/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0e0a76e08a739316cfd7ffe84d362e8a3b34bda79d93154e9836f599aa30b2a4'
source = prior.read_text()
start = source.index('inputs = [')
end = source.index('inputs +=', start)
source = source[:start] + """inputs = [HERE / name for name in ('program.cpp', 'compile.sh', 'compile_test.sh',
    'select_dependencies.py', 'dependency_selection.json', 'obj/program_matched.obj', 'test.obj', 'dependencies.lib')]
inputs += [HERE.parent / 'codex35_expression/test.cpp', TARGET / 'src/codex_shader_support/support.h',
    *list((ROOT / 'sdk/sum2004/Include').glob('*.h'))]
""" + source[end:]
source = source.replace("HERE / 'test.cpp', HERE / 'test.obj'", "HERE.parent / 'codex35_expression/test.cpp', HERE / 'test.obj'")
source = source.replace("assert len(selection['removed_definitions']) == 5", "assert {row['symbol'] for row in selection['removed_definitions']} == selection['source_objects'].keys() and len(selection['source_objects']) == 12")
before = """assert {name.split('@')[0] for name in selection['source_objects']} == {
    '?EmitExpression', '?EmitPositive', '?EmitLerp', '?EmitClip', '?EmitArgs'}"""
assert before in source
source = source.replace(before, "assert len(selection['removed_definitions']) >= 12")
source = source.replace("('expression.obj', 'helpers.obj')", "('program_matched.obj',)")
start = source.index("    for name in ('?EmitExpression'")
end = source.index('    result = subprocess.run', start)
source = source[:start] + """    for name in selection['source_objects']:
        lines = [line for line in mapping.splitlines() if name in line.split()]
        expected = 'program_matched.obj' if mode == 'source' else None
        assert len(lines) == 1, (name, lines)
        owner = lines[0].split()[-1]
        assert owner == expected if expected else owner.startswith('d3dx9:'), (name, owner)
""" + source[end:]
source = source.replace('scratch/codex35_expression/', 'scratch/codex31_program/')
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'run_test.py'), '__name__': '__main__'})
