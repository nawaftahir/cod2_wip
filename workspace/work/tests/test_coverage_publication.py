"""A failed coverage check must preserve the last valid report."""
from pathlib import Path
import os
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
script = (work / 'tools/build.sh').read_text()
start = script.index('python3 work/tools/source_coverage.py ')
fragment = script[start:script.index('\npython3 work/tools/layout.py', start)]
with tempfile.TemporaryDirectory(prefix='gfx_coverage_publication_') as directory:
    root = Path(directory)
    (root / 'work/proof').mkdir(parents=True)
    (root / 'bin').mkdir()
    producer = root / 'bin/python3'
    producer.write_text('#!/bin/sh\nprintf "%s" "$PRODUCER_TEXT"\nexit "$PRODUCER_STATUS"\n')
    producer.chmod(0o755)
    report = root / 'work/proof/source_coverage_current.json'
    previous = '{"verified": 1}\n'
    report.write_text(previous)
    env = dict(os.environ, PATH=str(root / 'bin') + os.pathsep + os.environ['PATH'],
               PRODUCER_TEXT='partial failed output', PRODUCER_STATUS='37')
    result = subprocess.run(['sh', '-c', 'set -e\nbuild=unused\n' + fragment], cwd=root, env=env)
    assert result.returncode == 37 and report.read_text() == previous
    env.update(PRODUCER_TEXT='{"verified": 2}\n', PRODUCER_STATUS='0')
    subprocess.run(['sh', '-c', 'set -e\nbuild=unused\n' + fragment], cwd=root, env=env, check=True)
    assert report.read_text() == env['PRODUCER_TEXT']
    assert not report.with_suffix('.json.pending').exists()
print('PASS: failed coverage preserves prior proof; success publishes the complete report')
