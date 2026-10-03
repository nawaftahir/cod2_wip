"""Full linked driver proof, preserving all 647 previous source matches."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '37b0f363ca257c023ebf04bb95c2641a03f2f8e1600ce93944a29940f64dde30'
source = prior.read_text()
source = source.replace('build/codex35_program_flow', 'build/codex35_argument_alloc')
source = source.replace('build/codex31_program', 'build/codex35_output_groups')
source = source.replace('== 571', '== 647').replace("'baseline_source_matches': 571", "'baseline_source_matches': 647").replace('all 571 previous', 'all 647 previous')
source = source.replace('== 22953', '== 40000')
source = source.replace("'codex31_program'):", "'codex31_program', 'codex35_program_flow', 'codex35_program_varying', 'codex35_program_pruning', 'codex35_program_strip', 'codex35_program_sort', 'codex35_program_duplicates', 'codex35_instruction_duplicates', 'codex35_predicate_merge', 'codex35_program_coalesce', 'codex35_vectorize_helpers', 'codex35_program_cleanup', 'codex35_instruction_order', 'codex35_transform_order', 'codex35_transform_driver', 'codex35_predicate_order', 'codex35_program_order', 'codex35_pool_helpers', 'codex32_program_drivers', 'codex32_program_diagnostics', 'codex32_special_literals', 'codex32_swizzle', 'codex32_argument_helpers', 'codex35_register_split', 'codex35_output_groups'):")
marker = "exec(compile(source, str(prior), 'exec'),"
assert source.count(marker) == 1
addition = "source = source.replace('locator_only = {', \"locator_only = {'??1CTransform@D3DXShader@@UAE@XZ': 7, '?Apply@CTransform@D3DXShader@@UAEJXZ': 6, '??1CTReorderInstructions@D3DXShader@@UAE@XZ': 7, \")\n"
addition += '''source = source.replace("    assert parsers['verified_instruction_bytes'] == 40000", """    duplicates = [row for row in parsers['rows'] if row['symbol'] == '??_GCArgument@D3DXShader@@QAEPAXI@Z']
    assert len(duplicates) == 2
    assert all(row['bytes'] == row['section_bytes'] == 32 and row['address'] == '0x1006db35' for row in duplicates)
    duplicate, = [row for row in duplicates if '/codex35_argument_alloc/' in row['object']]
    parsers['rows'].remove(duplicate)
    parsers['verified_instruction_bytes'] -= 32
    assert parsers['verified_instruction_bytes'] == 40000""")
'''
source = source.replace(marker, addition + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
