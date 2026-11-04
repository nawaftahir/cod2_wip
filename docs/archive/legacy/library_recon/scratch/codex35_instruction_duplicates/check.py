"""Complete source proof with an explicitly pinned shared return epilogue."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
overrides = [
    ('codex_shader_program_flow', 'codex_shader_instruction_duplicates'),
    ('build/codex35_program_flow/libraries', 'build/codex35_instruction_duplicates/libraries'),
    ("candidate = OBJECTS / ('flow.obj' if CLEAN else 'flow_matched.obj')", "candidate = OBJECTS / 'instructions.obj'"),
    ('assert len(functions) == 4', 'assert len(functions) == 3'),
    ("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'instructions'"),
    ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?CompareDuplicateInstructions@D3DXShader@@YGHIIPBX@Z' and code_bytes == 415 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 338 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 338 <= i.address - address <= 342] == [(338, 'pop', 'edi'), (339, 'pop', 'esi'), (340, 'pop', 'ebx'), (341, 'leave', ''), (342, 'ret', '8')])"),
]
marker = "'flow_overrides': overrides}"
assert source.count(marker) == 1
source = source.replace(marker, "'flow_overrides': overrides + instruction_overrides}")
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'check.py'), '__name__': '__main__', 'instruction_overrides': overrides})
