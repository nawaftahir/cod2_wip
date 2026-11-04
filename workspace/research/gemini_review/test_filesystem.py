"""Independent checks for the three-function Gemini delivery."""
import runpy

model = runpy.run_path('workspace/research/codex_order/test_model.py')
image, retail, ours, md = (model[key] for key in ('image', 'retail', 'ours', 'md'))
verify = model['verify']
base = retail.OPTIONAL_HEADER.ImageBase
actual_base = ours.OPTIONAL_HEADER.ImageBase
immediate, memory = model['X86_OP_IMM'], model['X86_OP_MEM']

def instructions(address, symbol):
    target, _ = verify.matcher.carve(address)
    actual_address, code = image.code(symbol)
    return list(zip(md.disasm(target, int(address, 16)), md.disasm(code, actual_address)))

language = instructions('0x00481040', '?IwdFileLanguage@@YAPBDPBD@Z')
flip = language[0][1].operands[1].mem.disp
buffers = [actual.operands[1].imm for original, actual in language
           if original.mnemonic == 'add' and original.operands[1].type == immediate
           and original.operands[1].imm == 0x124a980]
assert len(buffers) == 3 and len(set(buffers)) == 1
buffer = buffers[0]
assert not buffer - 4 <= flip < buffer + 128
# Both statics must start zero, through the PE loader's BSS initialization.
for address, size in ((flip, 4), (buffer, 128)):
    section = ours.get_section_by_rva(address - actual_base)
    offset = address - actual_base - section.VirtualAddress
    assert section.SizeOfRawData <= offset and offset + size <= section.Misc_VirtualSize

bindings = {0x124a39c: flip, 0x124a980: buffer, 0x124a976: buffer - 10,
            0x1233508: model['data_symbol']('?fs_searchpaths@@')}
bound = 0
strings = 0
groups = [language,
          instructions('0x004810e0', '?iwdsort@@YAHPBX0@Z'),
          instructions('0x004811e0', '?FS_AddSearchPath@@YAXPAUsearchpath_t@@@Z')]
for group in groups:
    for original, actual in group:
        for operand, replacement in zip(original.operands, actual.operands):
            if operand.type not in (immediate, memory):
                continue
            value = operand.imm if operand.type == immediate else operand.mem.disp
            actual_value = replacement.imm if replacement.type == immediate else replacement.mem.disp
            if value in bindings:
                assert operand.type == replacement.type and actual_value == bindings[value]
                bound += 1
            if value in (0x5511e8, 0x5511e0):
                expected = retail.get_data(value-base, 32).split(b'\0', 1)[0]
                assert ours.get_data(actual_value-actual_base, 32).split(b'\0', 1)[0] == expected
                strings += 1
assert bound == 10 and strings == 4, (bound, strings)
print('PASS: Gemini strings, alternating buffers, zero-initialized statics and shared searchpath bindings')
