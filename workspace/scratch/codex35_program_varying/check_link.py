"""Retain all575 previous matches and prove the complete varying method."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '37b0f363ca257c023ebf04bb95c2641a03f2f8e1600ce93944a29940f64dde30'
source = prior.read_text().replace('build/codex35_program_flow', 'build/codex35_program_varying').replace('build/codex31_program', 'build/codex35_program_flow')
source = source.replace('== 571', '== 575').replace("'baseline_source_matches': 571", "'baseline_source_matches': 575").replace('all 571 previous', 'all 575 previous').replace('== 22953', '== 23626')
source = source.replace("'codex31_program'):", "'codex31_program', 'codex35_program_flow'):")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
