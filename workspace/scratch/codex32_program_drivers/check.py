"""Reuse full typed proof; certify Link's exact SDK tail-jump boundary."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex32_program_drivers')
source = source.replace('codex_shader_program_flow', 'codex_shader_program_drivers')
source = source.replace('flow_matched.obj', 'drivers.obj').replace('flow.obj', 'drivers.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'drivers'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 2')
source = source.replace('complete source program-flow bodies', 'complete source program-driver bodies')
boundary = "(ins[-1].mnemonic == 'ret' or name == '?Link@CProgram@D3DXShader@@IAEJXZ' and code_bytes == 91 and ins[-1].address == address + 86 and ins[-1].mnemonic == 'jmp' and refs['?DeadLinkRemove@CProgram@D3DXShader@@AAEJXZ']['placements'] == [hex(int(ins[-1].op_str, 16))] and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 78 <= i.address - address <= 80] == [(78, 'pop', 'edi'), (79, 'pop', 'esi'), (80, 'mov', 'ecx, dword ptr [ecx + 0xe0]')])"
tail_edge = "assert int(i.op_str, 16) in starts or name == '?Link@CProgram@D3DXShader@@IAEJXZ' and code_bytes == 91 and i.address == address + 86 and i.mnemonic == 'jmp' and refs['?DeadLinkRemove@CProgram@D3DXShader@@AAEJXZ']['placements'] == [hex(int(i.op_str, 16))]"
source = source.replace('marker = ', 'overrides.extend([(' + repr("ins[-1].mnemonic == 'ret'") + ', ' + repr(boundary) + '), (' + repr('assert int(i.op_str, 16) in starts') + ', ' + repr(tail_edge) + ')])\nmarker = ', 1)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
