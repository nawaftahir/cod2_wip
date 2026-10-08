"""Complete, unmasked source/SDK/retail equality for five native shader helpers."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_sdk/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc'
source = prior.read_text()
for before, after in [
    ('build/codex35_sdk', 'build/codex33_shader_helpers'),
    ("HERE / 'discovery.json'", "HERE.parent / 'codex35_sdk/discovery.json'"),
    ("[('instruction_predicates', 25), ('shader_native_constants', 12)]", "[('native_helpers', 5)]"),
    ("'src/codex_libraries' / (stem + '.cpp')", "'src/codex_shader_native_helpers' / (stem + '.cpp')"),
    ("'original_referee_match': 100, 'bindings': {},", "'section_bytes': len(code), 'excluded_table_bytes': 0, 'original_referee_match': 100, 'bindings': {},"),
    ("'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'", "'class_layout_scope': 'binary-confirmed access views only, no SDK instance allocation size claimed'"),
    ("HERE / 'packet.json'", "HERE / 'clean_packet.json'"),
    ("TARGET / 'src/codex_libraries/shader_build.mk'", "TARGET / 'src/codex_shader_native_helpers/helpers.h'"),
    ("assert source.stat().st_mtime <= obj.stat().st_mtime", "assert max(source.stat().st_mtime_ns, (source.parent / 'helpers.h').stat().st_mtime_ns) <= obj.stat().st_mtime_ns"),
    ("'identity': 'SDK typed section' if stem == 'instruction_predicates'", "'identity': 'SDK typed section' if stem in ('instruction_predicates', 'native_helpers')"),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
