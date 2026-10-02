"""Full public shader outputs with source ownership for the clean clipping cohort."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_expression/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0e0a76e08a739316cfd7ffe84d362e8a3b34bda79d93154e9836f599aa30b2a4'
source = prior.read_text()
before = "inputs = [HERE / name for name in ('expression.cpp', 'helpers.cpp', 'expression.h', 'compile.sh',\n    'test.cpp', 'compile_test.sh', 'select_dependencies.py', 'dependency_selection.json',\n    'obj/expression.obj', 'obj/helpers.obj', 'test.obj', 'dependencies.lib')]"
after = """inputs = [HERE / 'compile_test.sh', HERE / 'select_link_dependencies.py', HERE / 'link_dependency_selection.json',
    HERE / 'test.obj', TARGET / 'src/codex_shader_compiler_clip/compiler.cpp',
    HERE.parent / 'codex35_expression/test.cpp',
    TARGET / 'build/codex35_clip/dependencies/d3dx9.lib', TARGET / 'build/codex35_clip/dependencies/runtime_new.lib',
    *list((TARGET / 'build/codex35_clip/libraries').glob('*.obj'))]"""
assert before in source
source = source.replace(before, after)
start = source.index("selection = json.loads(")
end = source.index('\ndef run(mode):', start)
source = source[:start] + """selection = json.loads((HERE / 'link_dependency_selection.json').read_text())
assert len(selection['source_objects']) == 194 and len(selection['removed_definitions']) == 204
assert {r['symbol'] for r in selection['removed_definitions']} == set(selection['source_objects'])
cohort = TARGET / 'build/codex35_clip/libraries/compiler.obj'
assert selection['source_objects']['?EmitClip@CCompiler@D3DXShader@@IAEJPAVCNode@2@PAII@Z'] == hashlib.sha256(cohort.read_bytes()).hexdigest()
""" + source[end:]
source = source.replace("HERE / 'test.cpp', HERE / 'test.obj'", "HERE.parent / 'codex35_expression/test.cpp', HERE / 'test.obj'")
source = source.replace("('?EmitExpression', '?EmitPositive', '?EmitLerp', '?EmitClip', '?EmitArgs')", "('?EmitClip', '?EmitTemp', '?EvalValue', '?EvalRange_Mul', '?Scratch', '?StackFree', '?IsFullySemantic', '?CompareSemantic')")
source = source.replace("'expression.obj' if name == '?EmitExpression' else 'helpers.obj'", "'compiler.obj'")
source = source.replace('scratch/codex35_expression/', 'scratch/codex35_clip/')
source = source.replace('Other SDK methods are opaque dependencies;', 'Nine-method clean compiler cohort, other clean helper families supplied as recorded; remaining SDK methods are opaque dependencies;')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_test.py'), '__name__': '__main__'})
