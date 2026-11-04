"""Complete program-cohort proof, reusing the pinned compiler/SDK referee."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ffb58a461240fe7153c93d6d34eadf68787b2f216f28d460d96a94f389c1e23'
source = prior.read_text()
overrides = [
    ('codex_shader_compiler', 'codex_shader_program'),
    ('build/codex35_compiler/libraries', 'build/codex31_program/libraries'),
    ("candidate = OBJECTS / ('compiler.obj' if CLEAN else 'compiler_matched.obj')",
     "candidate = OBJECTS / ('program.obj' if CLEAN else 'program_matched.obj')"),
    ('assert len(functions) == 8', 'assert len(functions) == 12'),
    ("prefix = 'compiler' if CLEAN else 'compiler_matched'", "prefix = 'program'"),
    ('def node_references(m, oracle, refs, pe):', 'def node_references(m, oracle, refs, pe, member=75):'),
    ('    raw = oracle[75]', '    raw = oracle[member]'),
    ("'member': 75,", "'member': member,"),
    ('    refs = runtime_references(m, oracle, refs, pe)', '''    previous = None
    while previous != {n: tuple(r['placements']) for n, r in refs.items()}:
        previous = {n: tuple(r['placements']) for n, r in refs.items()}
        refs = node_references(m, oracle, refs, pe, member=73)
        refs = node_references(m, oracle, refs, pe, member=87)
        refs = node_references(m, oracle, refs, pe, member=88)
        refs = node_references(m, oracle, refs, pe, member=90)
    refs = runtime_references(m, oracle, refs, pe)'''),
    ('complete source compiler bodies', 'complete source program bodies'),
    ('reconstructed SDK compiler C++; remaining SDK/runtime methods external',
     'reconstructed SDK program C++; remaining SDK/runtime methods external'),
    ('    paths = [sdk, discovery_path,', "    paths = [sdk, discovery_path, ROOT / 'gfx/target/src/codex_shader_support/support.h',"),
    ("[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp']",
     "[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h']"),
    ("'compile_flags': '/O1 /Oy- /hotpatch /MT /Gy /d2QIftol'",
     "'compile_flags': '/O1 /Oy- /hotpatch /MT /Gy /d2QIftol' + ('' if CLEAN else ' /DPROGRAM_MATCHED_ONLY')"),
]
marker = "'overrides': overrides}"
assert source.count(marker) == 1
source = source.replace(marker, "'overrides': overrides + program_overrides}")
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'check.py'), '__name__': '__main__', 'program_overrides': overrides})
