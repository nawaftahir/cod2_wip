"""Full original/clean-source fixture; unmatched SDK callees get no source credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE / 'run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '53ad982f7206dd5b8869d24ce0bec31d638edd6e8cf58c73dd54fc757eba8125'
clean = HERE.parents[1] / 'src/codex_shader_compiler/compiler.cpp'
assert clean.read_text().split('#ifndef COMPILER_DECLARATIONS_ONLY')[0] == (HERE / 'compiler.cpp').read_text().split('#ifndef COMPILER_DECLARATIONS_ONLY')[0]
source = prior.read_text()
changes = [
    ("HERE / 'compiler.cpp', HERE / 'compile.sh'", "clean, HERE / 'compiler.cpp', HERE / 'build.sh'"),
    ("HERE / 'compile_test.sh'", "HERE / 'compile_clean_test.sh'"),
    ("HERE / 'obj/compiler.obj'", "TARGET / 'build/codex35_compiler/libraries/compiler.obj'"),
    ("HERE / 'test.obj'", "HERE / 'clean_test.obj'"),
    ("HERE / 'select_dependencies.py'", "HERE / 'select_link_dependencies.py'"),
    ("HERE / 'dependency_selection.json'", "HERE / 'link_dependency_selection.json'"),
    ("HERE / 'dependencies/d3dx9.lib'", "TARGET / 'build/codex35_compiler/dependencies/d3dx9.lib', TARGET / 'build/codex35_compiler/dependencies/runtime_new.lib'"),
    ("    TARGET / 'src/codex_shader_nodes/nodes.cpp',", "    TARGET / 'src/codex_shader_nodes/nodes.cpp', *list((TARGET / 'build/codex35_compiler/libraries').glob('*.obj')),"),
    ("(mode + '.exe')", "('clean_' + mode + '.exe')"),
    ("(mode + '.map')", "('clean_' + mode + '.map')"),
    ("'compile_test.sh', 'test.obj'", "'compile_clean_test.sh', 'clean_test.obj'"),
    ("assert rows[0].endswith('compiler.obj' if mode == 'source' else 'd3dx9:ccompiler.obj')\n        if mode == 'source': assert ':' not in rows[0].split()[-1]", "dependency = name in ('?StackAlloc@', '?EvalRange@')\n        expected = 'd3dx9:ccompiler.obj' if mode == 'original' else 'd3dx9:member_0073.obj' if dependency else 'compiler.obj'\n        assert rows[0].split()[-1] == expected, rows[0]\n        if mode == 'source' and not dependency: assert ':' not in rows[0].split()[-1]"),
    ("(mode + '_output.log')", "('clean_' + mode + '_output.log')"),
    ("(m + suffix)", "('clean_' + m + suffix)"),
    ("'fixture_packet.json'", "'clean_fixture_packet.json'"),
    ("'scope': '1969", "'scope': 'Eight clean source methods; StackAlloc and EvalRange are original SDK dependencies, never reconstructed-source credit. 1969"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__', 'clean': clean})
