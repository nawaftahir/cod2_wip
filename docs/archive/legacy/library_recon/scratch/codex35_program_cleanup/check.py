"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_instruction_duplicates/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8eef2b8e1aa771e0b286b0c483a6c7ef64dd34ba5d48f0d3aec8a60059c3ea07'
source = prior.read_text()
source = source.replace('codex35_instruction_duplicates', 'codex35_program_cleanup')
source = source.replace('codex_shader_instruction_duplicates', 'codex_shader_program_cleanup')
source = source.replace('instructions.obj', 'cleanup.obj')
source = source.replace("prefix = 'instructions'", "prefix = 'cleanup'")
source = source.replace('assert len(functions) == 3', 'assert len(functions) == 2')
boundary = "(ins[-1].mnemonic == 'ret' or name == '?DeadLinkRemove@CProgram@D3DXShader@@AAEJXZ' and code_bytes == 406 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 394 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 394 <= i.address - address <= 398] == [(394, 'pop', 'edi'), (395, 'pop', 'esi'), (396, 'pop', 'ebx'), (397, 'leave', ''), (398, 'ret', '')])"
assert source.count('marker = ') == 1
source = source.replace('marker = ', 'overrides.append((' + repr("ins[-1].mnemonic == 'ret'") + ', ' + repr(boundary) + '))\nmarker = ', 1)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
