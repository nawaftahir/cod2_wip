"""Four complete SDK constant-buffer callbacks, including callback identity proof."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_sdk/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc'
source = prior.read_text()
changes = [
    ('build/codex35_sdk', 'build/codex35_shader_buffers'),
    ("HERE / 'discovery.json'", "HERE.parent / 'codex35_sdk/discovery.json'"),
    ("[('instruction_predicates', 25), ('shader_native_constants', 12)]", "[('buffers', 4)]"),
    ("'src/codex_libraries'", "'src/codex_shader_buffers'"),
    ("stem == 'shader_native_constants'", "stem == 'buffers'"),
    ("'original_referee_match': 100, 'bindings': {},", "'section_bytes': len(code), 'excluded_table_bytes': 0, 'original_referee_match': 100, 'instruction_aware_referee_match': 100, 'bindings': {},"),
    ("'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'", "'class_layout_scope': 'static callbacks and public SDK ID3DXBuffer; no private class allocation'"),
    ("HERE / 'packet.json'", "HERE / 'clean_packet.json'"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
