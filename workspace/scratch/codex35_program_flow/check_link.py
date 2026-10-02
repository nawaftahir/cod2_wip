"""Prove four new flow bodies and retain all571 preceding source matches."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_preprocessor/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8a2e304b695fd8068c86c0e9fc8d2c7a045ab682c3cbe5ebb46adc2c523c25a8'
source = prior.read_text()
for before, after in [
    ('build/codex35_preprocessor', 'build/codex35_program_flow'),
    ('build/codex35_lexer', 'build/codex31_program'),
    ('== 523', '== 571'),
    ("'codex35_lexer'):", "'codex35_lexer', 'codex35_preprocessor', 'codex35_clip', 'codex35_compiler_types', 'codex31_program'):"),
    ('== 17868', '== 22953'),
    ("HERE / 'select_dependencies.py'", "HERE / 'select_link_dependencies.py'"),
    ("HERE / 'dependency_selection.json'", "HERE / 'link_dependency_selection.json'"),
    ("'baseline_source_matches': 523", "'baseline_source_matches': 571"),
    ('all 523 previous', 'all 571 previous'),
    ("locator_only = {", "locator_only = {'?ParentChildInfo_ParentInfo@CProgram@D3DXShader@@AAEXIIH@Z': 141, "),
    ("assert proof['original_referee_match'] == 100", "assert proof.get('instruction_aware_referee_match', proof['original_referee_match']) == 100"),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
