"""Complete typed proof of the two special/literal source bodies."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text().replace('codex35_program_flow', 'codex35_output_groups').replace('codex_shader_program_flow', 'codex_shader_output_groups')
source = source.replace('flow_matched.obj', 'output_groups.obj').replace('flow.obj', 'output_groups.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'output_groups'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 3')
source = source.replace("(ins[-1].mnemonic == 'ret' or name ==", "(ins[-1].mnemonic == 'ret' or name == '?VectorizeLeft_PerComponent@CProgram@D3DXShader@@AAEJPAVCInstruction@2@@Z' and code_bytes == 1006 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 161 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 161 <= i.address - address <= 165] == [(161, 'pop', 'edi'), (162, 'pop', 'esi'), (163, 'pop', 'ebx'), (164, 'leave', ''), (165, 'ret', '4')] or name ==")
source = source.replace("(ins[-1].mnemonic == 'ret' or name ==", "(ins[-1].mnemonic == 'ret' or name == '?VectorizeLeft_DotProduct@CProgram@D3DXShader@@AAEJPAVCInstruction@2@@Z' and code_bytes == 1221 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 40 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 40 <= i.address - address <= 44] == [(40, 'pop', 'edi'), (41, 'pop', 'esi'), (42, 'pop', 'ebx'), (43, 'leave', ''), (44, 'ret', '4')] or name ==")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
