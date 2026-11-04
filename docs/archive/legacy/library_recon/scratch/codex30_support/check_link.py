import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_assembler/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ad65993748bc22de451925bdc27a6ccb6e7775580787b7e748ee600e0460498c'
source = prior.read_text().replace('codex30_assembler', 'codex30_support')
source = source.replace('build/codex35_nodes/bind.json', 'build/codex30_assembler/bind.json')
source = source.replace('== 491', '== 505').replace("'baseline_source_matches': 491", "'baseline_source_matches': 505").replace('all 491 previous', 'all 505 previous')
source = source.replace("'codex30_instructions', 'codex35_nodes')", "'codex30_instructions', 'codex35_nodes', 'codex30_assembler')")
source = source.replace('== 13470', '== 14632')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
