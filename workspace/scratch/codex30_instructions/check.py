"""Reuse complete parser body/binding proof for three table-free SDK bodies."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'a7de81ca77ba6de75cea6213795052867fdf88375929345644ce0272a2effb05'
source = prior.read_text()
source = source.replace("CLEAN = '--clean' in sys.argv", 'CLEAN = True')
source = source.replace('src/codex_parsers', 'src/codex_shader_instructions')
source = source.replace('build/codex30_parser', 'build/codex30_instructions')
source = source.replace("for prefix, code_bytes in [('d3dxtok', 1128), ('d3dxasm', 1263), ('d3dxshader', 3691)]:\n        name = '?' + prefix + '_parse@D3DXShader@@YGHXZ'", "for prefix, name, code_bytes in [('instruction_copy', '?Initialize@CInstruction@D3DXShader@@QAEJPAV12@@Z', 180), ('shader_profiles', '_D3DXGetPixelShaderProfile@4', 176), ('shader_profiles', '_D3DXGetVertexShaderProfile@4', 120)]:")
source = source.replace("assert any(s['sec'] == fn['sec'] and s['value'] == code_bytes for s in symbols.values())", 'assert len(body) == code_bytes')
source = source.replace("[SOURCES / (prefix + '.cpp'), SOURCES / (prefix + '_actions.inc'), SOURCES / 'parser_core.h']", "[SOURCES / (prefix + '.cpp')]")
source = source.replace("for n in ('d3dxtok', 'd3dxasm', 'd3dxshader')", "for n in ('instruction_copy', 'shader_profiles')")
source = source.replace("paths = [sdk, discovery_path,", "paths = [sdk, discovery_path, *(ROOT / 'sdk/sum2004/Include').glob('*.h'), *(ROOT / 'sdk/sum2004/Include').glob('*.inl'),")
source = source.replace('reconstructed SDK parser C++; SDK dependencies external', 'reconstructed SDK instruction/profile C++; SDK dependencies external')
source = source.replace("('shader_profiles', '_D3DXGetVertexShaderProfile@4', 120)", "('shader_profiles', '_D3DXGetVertexShaderProfile@4', 120), ('cparse_cast', '?IsCast@CParse@D3DXShader@@IAEHW4_D3DXCOMPONENT_TYPE@2@0@Z', 137)")
source = source.replace('assert len(body) == code_bytes', "assert len(body) == code_bytes or any(s['sec'] == fn['sec'] and s['value'] == code_bytes for s in symbols.values())")
source = source.replace("('instruction_copy', 'shader_profiles')", "('instruction_copy', 'shader_profiles', 'cparse_cast')")
source = source.replace("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?IsCast@CParse@D3DXShader@@IAEHW4_D3DXCOMPONENT_TYPE@2@0@Z' and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 40 and any(i.address == address + 40 and i.mnemonic == 'pop' for i in ins) and any(i.address == address + 41 and i.mnemonic == 'ret' and i.op_str == '8' for i in ins))")
source = source.replace('complete source parser bodies', 'complete source instruction/profile/cast bodies')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})
