"""Full relocation-free shader-comment proof, including the earlier return tail."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_sdk/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc'
source = prior.read_text()
changes = [
    ('build/codex35_sdk', 'build/codex35_shader_comment'),
    ("HERE / 'discovery.json'", "HERE.parent / 'codex35_sdk/discovery.json'"),
    ("[('instruction_predicates', 25), ('shader_native_constants', 12)]", "[('comment', 1)]"),
    ("'src/codex_libraries'", "'src/codex_shader_comment'"),
    ("assert instructions[-1].mnemonic == 'ret'", """assert fn['name'] == '_D3DXFindShaderComment@16' and address == 0x10062db3 and len(code) == 231
            assert instructions[-1].address == address + 229
            assert instructions[-1].mnemonic == 'jmp' and int(instructions[-1].op_str, 16) == address + 180
            assert [(i.address - address, i.mnemonic, i.op_str) for i in instructions if 180 <= i.address - address <= 184] == [(180, 'pop', 'esi'), (181, 'pop', 'edi'), (182, 'pop', 'ebx'), (183, 'pop', 'ebp'), (184, 'ret', '0x10')]"""),
    ("'original_referee_match': 100, 'bindings': {},", "'section_bytes': len(code), 'excluded_table_bytes': 0, 'original_referee_match': 100, 'instruction_aware_referee_match': 100, 'bindings': {},"),
    ("'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'", "'class_layout_scope': 'public shader-comment API; no SDK class allocation'"),
    ("HERE / 'packet.json'", "HERE / 'clean_packet.json'"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
