"""Compare full tokenizer outputs and retained allocator/assembler regressions."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
inputs = [HERE / 'test.cpp', HERE / 'compile_test.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
          TARGET / 'src/codex_shader_lexer/lexer.cpp',
          TARGET / 'src/codex_shader_nodes/nodes.cpp',
          TARGET / 'src/codex_shader_support/support.h',
          TARGET / 'src/codex_shader_support/alloc.cpp',
          TARGET / 'src/codex_shader_support/errors.cpp',
          TARGET / 'src/codex_shader_assembler/asm_nodes.cpp',
          TARGET / 'src/codex_shader_assembler/assembler.cpp',
          HERE.parent / 'codex30_support/test.cpp',
          HERE.parent / 'codex30_assembler/test.cpp',
          *list((TARGET / 'build/codex35_lexer/libraries').glob('*.obj')),
          TARGET / 'build/codex35_lexer/dependencies/d3dx9.lib']
outputs = {}
def run(spec):
    fixture, mode, cases, lines = spec
    exe = HERE / (fixture + '_' + mode + '.exe')
    assert max(p.stat().st_mtime for p in inputs) <= (HERE / (fixture + '.obj')).stat().st_mtime <= exe.stat().st_mtime
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', str(TARGET) + ':/work',
        '-w', '/work', IMAGE, 'wine', 'scratch/codex35_lexer/' + exe.name], check=True, capture_output=True)
    assert len(result.stdout.splitlines()) == lines
    assert result.stdout.rstrip().endswith(('CASES %u' % cases).encode())
    return (fixture, mode), result.stdout
specs = [(f, m, c, n) for f, c, n in [('test', 6392, 6393), ('regression', 3584, 3586)]
         for m in ('original', 'source')]
with ThreadPoolExecutor(max_workers=2) as pool:
    outputs.update(pool.map(run, specs))
for fixture in ('test', 'regression'):
    assert outputs[fixture, 'original'] == outputs[fixture, 'source'], fixture + ' full output differs'
paths = [*inputs, Path(__file__), *(HERE / (f + '.obj') for f in ('test', 'regression')),
         *(HERE / (f + '_' + m + '.exe') for f, m, _, _ in specs)]
(HERE / 'fixture_packet.json').write_text(json.dumps({'status': 'PASS', 'image': IMAGE,
    'cases': 9976, 'tokenizer_cases': 6392, 'retained_regression_cases': 3584,
    'scope': 'Initialization errors preserve every byte; all bounded prefixes of identifiers, floats/exponents, suffixes, octal overflow and character escapes; nullable outputs, mode flags, full integer/floating bits and untouched token fields; complete diagnostics and allocated strings. Retains prior allocator/diagnostic/assembler cases. Original quirks preserved; no allocation-failure or game/GPU boot claim.',
    'output_sha256': {f: hashlib.sha256(outputs[f, 'source']).hexdigest() for f in ('test', 'regression')},
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}, indent=2) + '\n')
print('PASS: 6392 tokenizer + 3584 retained regression = 9976 full-output CPU comparisons')
