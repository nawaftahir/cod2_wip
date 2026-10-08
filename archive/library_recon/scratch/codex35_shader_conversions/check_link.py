"""Retain all652 previous source matches and bind all ten new callbacks."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_comment/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0cdf62d2e12d74557cdb792823581e737fc1547741a5316e7986c02f609e55cb'
source = prior.read_text()
marker = "exec(compile(source, str(prior), 'exec'),"
assert source.count(marker) == 1
addition = "assert \"build/codex35_shader_comment\" in source, \"build/codex35_shader_comment\"\nsource = source.replace(\"build/codex35_shader_comment\", \"build/codex35_shader_conversions\")\nassert \"build/codex35_pool_reads\" in source, \"build/codex35_pool_reads\"\nsource = source.replace(\"build/codex35_pool_reads\", \"build/codex35_shader_comment\")\nassert \"== 651\" in source, \"== 651\"\nsource = source.replace(\"== 651\", \"== 652\")\nassert \"'baseline_source_matches': 651\" in source, \"'baseline_source_matches': 651\"\nsource = source.replace(\"'baseline_source_matches': 651\", \"'baseline_source_matches': 652\")\nassert \"all 651 previous\" in source, \"all 651 previous\"\nsource = source.replace(\"all 651 previous\", \"all 652 previous\")\nassert \"== 41429\" in source, \"== 41429\"\nsource = source.replace(\"== 41429\", \"== 42125\")\nassert \"'codex35_pool_reads'):\" in source, \"'codex35_pool_reads'):\"\nsource = source.replace(\"'codex35_pool_reads'):\", \"'codex35_pool_reads', 'codex35_shader_comment'):\")\n"
source = source.replace(marker, addition + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
