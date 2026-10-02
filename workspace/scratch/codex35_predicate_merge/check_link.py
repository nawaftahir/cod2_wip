"""Reuse pinned full regression gates for duplicate-argument integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '37b0f363ca257c023ebf04bb95c2641a03f2f8e1600ce93944a29940f64dde30'
source = prior.read_text()
source = source.replace('build/codex35_program_flow', 'build/codex35_predicate_merge')
source = source.replace('build/codex31_program', 'build/codex35_instruction_duplicates')
source = source.replace('== 571', '== 590')
source = source.replace("'baseline_source_matches': 571", "'baseline_source_matches': 590")
source = source.replace('all 571 previous', 'all 590 previous')
source = source.replace('== 22953', '== 26969')
source = source.replace("'codex31_program'):", "'codex31_program', 'codex35_program_flow', 'codex35_program_varying', 'codex35_program_pruning', 'codex35_program_strip', 'codex35_program_sort', 'codex35_program_duplicates', 'codex35_instruction_duplicates'):")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
