#!/usr/bin/env python3
"""Reuse the complete, unmasked, no-relocation SDK-method proof."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_sdk/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc'
source = prior.read_text()
source = source.replace('build/codex35_sdk', 'build/codex30_reads')
source = source.replace("HERE / 'discovery.json'", "HERE.parent / 'codex35_sdk/discovery.json'")
source = source.replace("[('instruction_predicates', 25), ('shader_native_constants', 12)]", "[('read_typed', 11), ('shader_version', 1)]")
source = source.replace("'src/codex_libraries' / (stem + '.cpp')", "'src/codex_shader_constants' / (stem + '.cpp')")
source = source.replace("'original_referee_match': 100, 'bindings': {},", "'section_bytes': len(code), 'excluded_table_bytes': 0, 'original_referee_match': 100, 'bindings': {},")
source = source.replace("'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'", "'class_layout_scope': 'static read helpers only; no SDK instance allocation'")
source = source.replace("HERE / 'packet.json'", "HERE / 'clean_packet.json'")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
