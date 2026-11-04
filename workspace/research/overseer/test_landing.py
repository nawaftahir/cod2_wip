"""Exercise landing's Git safety using isolated repositories and a fake verifier."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

root = Path.cwd()
def run(args, cwd, **kwargs):
    return subprocess.run(args, cwd=cwd, check=True, capture_output=True, text=True, **kwargs).stdout.strip()

def git(cwd, *args):
    return run(['git', *args], cwd)

docker = '''#!/usr/bin/env python3
import json, os, pathlib, subprocess, sys
p = pathlib.Path(sys.argv[sys.argv.index('-v') + 1].split(':')[0])
mode = os.environ.get('LAND_TEST_MODE')
if mode == 'verify-fail': sys.exit(1)
if mode in ('advance', 'dirty-during'):
 (p/'src/a.cpp').write_text('int value = 2;\\n')
 if mode == 'advance':
  subprocess.run(['git','add','src/a.cpp'],cwd=p,check=True)
  subprocess.run(['git','commit','-qm','next work'],cwd=p,check=True)
(p/'build').mkdir(exist_ok=True)
(p/'build/verify.json').write_text(json.dumps({'unverified_in_src':0}))
'''
ci = '''#!/bin/sh
touch ci-ran
if [ "$LAND_TEST_MODE" = ci-fail ]; then exit 1; fi
if [ "$LAND_TEST_MODE" = dirty-ci ]; then
  echo 'int value = 3;' > .agents/gemini/src/a.cpp
fi
'''
with tempfile.TemporaryDirectory(prefix='landing-', dir=root/'scratch') as directory:
    for mode in ('outside', 'dirty', 'verify-fail', 'advance', 'dirty-during', 'ci-fail', 'dirty-ci', 'success'):
        repo = Path(directory)/mode
        repo.mkdir()
        git(repo, 'init', '-q', '-b', 'main')
        for key in ('user.name', 'user.email'):
            git(repo, 'config', key, git(root, 'config', key))
        for folder in ('src', 'ledger', 'tools', 'build/bin'):
            (repo/folder).mkdir(parents=True, exist_ok=True)
        (repo/'.gitignore').write_text('.agents/\nbuild/\nci-ran\n')
        (repo/'src/a.cpp').write_text('int value = 0;\n')
        (repo/'ledger/meter.json').write_text('{"unverified_in_src":0}\n')
        (repo/'ledger/defer.tsv').write_text('addr\tagent\tdate\treason\n')
        shutil.copyfile(root/'tools/land.sh', repo/'tools/land.sh')
        (repo/'tools/land.sh').chmod(0o755)
        (repo/'tools/ci_local.sh').write_text(ci)
        (repo/'tools/ci_local.sh').chmod(0o755)
        (repo/'build/bin/docker').write_text(docker)
        (repo/'build/bin/docker').chmod(0o755)
        git(repo, 'add', '.')
        git(repo, 'commit', '-qm', 'base')
        base = git(repo, 'rev-parse', 'HEAD')
        remote = Path(directory)/(mode+'.git')
        git(repo, 'init', '-q', '--bare', str(remote))
        git(repo, 'remote', 'add', 'origin', str(remote))
        git(repo, 'push', '-q', 'origin', 'main')
        worker = repo/'.agents/gemini'
        git(repo, 'worktree', 'add', '-q', '-b', 'agent/gemini', str(worker))
        changed = worker/('outside.txt' if mode == 'outside' else 'src/a.cpp')
        changed.write_text('int value = 1;\n')
        git(worker, 'add', str(changed.relative_to(worker)))
        git(worker, 'commit', '-qm', 'delivery')
        delivery = git(worker, 'rev-parse', 'HEAD')
        if mode == 'dirty':
            (worker/'src/a.cpp').write_text('int pending = 1;\n')
        env = dict(os.environ, PATH=str(repo/'build/bin')+os.pathsep+os.environ['PATH'], LAND_TEST_MODE=mode)
        result = subprocess.run(['tools/land.sh','gemini'],cwd=repo,env=env,capture_output=True,text=True)
        assert (result.returncode == 0) == (mode in ('success','dirty-ci')), (mode,result.stdout,result.stderr)
        if mode not in ('success','dirty-ci'):
            assert git(remote, 'rev-parse', 'refs/heads/main') == base, mode
            if mode != 'ci-fail':
                assert git(repo, 'rev-parse', 'HEAD') == base, mode
        if mode in ('outside','dirty','verify-fail','ci-fail','dirty-ci','dirty-during'):
            assert git(worker, 'rev-parse', 'HEAD') == delivery, mode
        if mode in ('dirty','dirty-during','dirty-ci'):
            assert git(worker, 'status', '--porcelain'), mode
        if mode == 'advance':
            assert git(worker, 'rev-parse', 'HEAD') != delivery
            assert (worker/'src/a.cpp').read_text() == 'int value = 2;\n'
        if mode == 'success':
            assert git(worker, 'rev-parse', 'HEAD') == git(repo, 'rev-parse', 'HEAD')
            assert git(remote, 'rev-parse', 'refs/heads/main') == git(repo, 'rev-parse', 'HEAD')
        print('PASS:', mode)
