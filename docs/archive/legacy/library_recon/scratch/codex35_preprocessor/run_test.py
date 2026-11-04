"""Full preprocessor output comparison plus unchanged tokenizer/support fixtures."""
from concurrent.futures import ThreadPoolExecutor
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
TARGET = HERE.parents[1]
ROOT = TARGET.parents[1]
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
RUN = TARGET / 'build/codex35_preprocessor'
inputs = [HERE / 'test.cpp', HERE / 'compile_test.sh', ROOT / 'sdk/sum2004/Lib/d3dx9.lib',
          HERE.parent / 'codex35_lexer/test.cpp', HERE.parent / 'codex30_support/test.cpp',
          HERE.parent / 'codex30_assembler/test.cpp',
          *list((RUN / 'libraries').glob('*.obj')), RUN / 'dependencies/d3dx9.lib',
          RUN / 'dependencies/runtime_new.lib',
          TARGET / 'src/codex_shader_preprocessor/preprocessor.cpp',
          TARGET / 'src/codex_shader_lexer/lexer.cpp', TARGET / 'src/codex_shader_nodes/nodes.cpp',
          TARGET / 'src/codex_shader_support/support.h', TARGET / 'src/codex_shader_support/alloc.cpp',
          TARGET / 'src/codex_shader_support/errors.cpp',
          TARGET / 'src/codex_shader_assembler/asm_nodes.cpp', TARGET / 'src/codex_shader_assembler/assembler.cpp']


def run(spec):
    fixture, mode, cases, lines = spec
    exe = HERE / (fixture + '_' + mode + '.exe')
    assert max(p.stat().st_mtime for p in inputs) <= (HERE / (fixture + '.obj')).stat().st_mtime <= exe.stat().st_mtime
    result = subprocess.run(['docker', 'run', '--rm', '--network', 'none', '-v', str(TARGET) + ':/work',
        '-w', '/work', IMAGE, 'wine', 'scratch/codex35_preprocessor/' + exe.name], capture_output=True)
    assert result.returncode == 0, (fixture, mode, result.returncode, result.stderr[-4000:], result.stdout[-1000:])
    assert len(result.stdout.splitlines()) == lines, (fixture, mode, len(result.stdout.splitlines()), result.stdout[-1000:])
    assert result.stdout.rstrip().endswith(('CASES %u' % cases).encode()), result.stdout[-1000:]
    return (fixture, mode), result.stdout


specs = [(f, m, c, n) for f, c, n in [('test', 2283, 2284), ('tokenizer', 6392, 6393), ('regression', 3584, 3586)]
         for m in ('original', 'source')]
with ThreadPoolExecutor(max_workers=2) as pool:
    outputs = dict(pool.map(run, specs))
for fixture in ('test', 'tokenizer', 'regression'):
    assert outputs[fixture, 'original'] == outputs[fixture, 'source'], fixture + ' full output differs'
paths = [*inputs, Path(__file__), *(HERE / (f + '.obj') for f in ('test', 'tokenizer', 'regression')),
         *(HERE / (f + '_' + m + '.exe') for f, m, _, _ in specs)]
(HERE / 'fixture_packet.json').write_text(json.dumps({'status': 'PASS', 'image': IMAGE,
    'cases': 12259, 'preprocessor_cases': 2283, 'retained_regression_cases': 9976,
    'scope': 'Hash and signed character inputs; bounded escaping including untouched output; helper constructors and recursive chain destruction; block stack; nullable file/line/buffer outputs; conditional/error sequences; numeric, functional and redefined macros; pragma parsing; public shader assembly. Complete outputs and diagnostics compared. Retains original tokenizer/allocator/diagnostic/assembler fixtures unchanged. No allocation-failure or game/GPU boot claim.',
    'output_sha256': {f: hashlib.sha256(outputs[f, 'source']).hexdigest() for f in ('test', 'tokenizer', 'regression')},
    'files': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}}, indent=2) + '\n')
print('PASS: 2283 preprocessor + 9976 retained regression = 12259 full-output CPU comparisons')
