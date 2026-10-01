#!/usr/bin/env python3
"""Reuse the existing private SDK dependency selector; no dependency credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex30_reads')
source = source.replace("'shader_native_constants')", "'shader_native_constants', 'read_typed', 'shader_version')")
source = source.replace('len(replacements) == 40', 'len(replacements) == 52')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_dependencies.py'), '__name__': '__main__'})
response = HERE.parents[1] / 'build/codex30_reads/dependencies/members.rsp'
assert all(line.startswith('build\\codex30_reads\\dependencies\\')
           for line in response.read_text().splitlines())
