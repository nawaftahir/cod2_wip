"""Full linked helper proof, preserving all 622 previous source matches."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_order/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'fd3166a813d026a3f2755fc98a9ece91eb9434ae5af28d02b3d40ec543a61b40'
source = prior.read_text()
source = source.replace('build/codex35_program_order', 'build/codex35_pool_helpers')
source = source.replace('build/codex35_predicate_order', 'build/codex35_program_order')
source = source.replace('== 614', '== 622').replace("'baseline_source_matches': 614", "'baseline_source_matches': 622").replace('all 614 previous', 'all 622 previous')
source = source.replace('== 33039', '== 33463')
source = source.replace("'codex35_predicate_order'):", "'codex35_predicate_order', 'codex35_program_order'):")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
