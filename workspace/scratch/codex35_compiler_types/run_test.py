"""Replay complete public shader outputs with explicit two-method ownership."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_expression/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0e0a76e08a739316cfd7ffe84d362e8a3b34bda79d93154e9836f599aa30b2a4'
source = prior.read_text()
start = source.index('inputs = [')
end = source.index("inputs +=", start)
source = source[:start] + """inputs = [HERE / name for name in ('types.cpp', 'compile.sh', 'compile_test.sh',
    'select_dependencies.py', 'dependency_selection.json', 'obj/types.obj', 'test.obj', 'dependencies.lib')]
inputs += [HERE.parent / 'codex35_expression/test.cpp', HERE.parent / 'codex35_compiler/compiler.cpp',
    TARGET / 'src/codex_shader_support/support.h', *list((ROOT / 'sdk/sum2004/Include').glob('*.h'))]
""" + source[end:]
source = source.replace("HERE / 'test.cpp', HERE / 'test.obj'", "HERE.parent / 'codex35_expression/test.cpp', HERE / 'test.obj'")
source = source.replace("== 5", "== 2")
before = "'?EmitExpression', '?EmitPositive', '?EmitLerp', '?EmitClip', '?EmitArgs'"
assert before in source
source = source.replace(before, "'?GetTypeFlags', '?Error'")
source = source.replace("('expression.obj', 'helpers.obj')", "('types.obj',)")
source = source.replace("('?EmitExpression', '?EmitPositive', '?EmitLerp', '?EmitClip', '?EmitArgs')", "('?GetTypeFlags', '?Error')")
source = source.replace("'expression.obj' if name == '?EmitExpression' else 'helpers.obj'", "'types.obj'")
source = source.replace('scratch/codex35_expression/', 'scratch/codex35_compiler_types/')
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'run_test.py'), '__name__': '__main__'})
