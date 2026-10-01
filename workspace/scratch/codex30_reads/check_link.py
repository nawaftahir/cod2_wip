#!/usr/bin/env python3
"""Retain the parser source proofs and check the additional read-helper link."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b36393e4c8ebf219b70545dc81c6a29ea4e4d9c7ab702c3aefa6331361dec67c'
source = prior.read_text().replace('build/codex30_parser', 'build/codex30_reads')
source = source.replace("old.accepted(TARGET / 'build/codex35_sdk/bind.json')", "old.accepted(TARGET / 'build/codex30_parser/bind.json')")
source = source.replace('len(baseline) == 400', 'len(baseline) == 403')
source = source.replace("    helpers = json.loads", "    earlier = json.loads((HERE.parent / 'codex30_parser/clean_packet.json').read_text())\n    parsers['rows'] += earlier['rows']\n    parsers['files'].update(earlier['files'])\n    parsers['verified_instruction_bytes'] += earlier['verified_instruction_bytes']\n    helpers = json.loads")
source = source.replace("parsers['verified_instruction_bytes'] == 6082", "parsers['verified_instruction_bytes'] == 6557")
source = source.replace("'baseline_source_matches': 400", "'baseline_source_matches': 403")
source = source.replace('all 400 previous', 'all 403 previous')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})
