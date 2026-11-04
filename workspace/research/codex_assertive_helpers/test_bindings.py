"""Check restored helpers' Win32 imports and their shared directory buffer."""
import runpy
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

model = runpy.run_path('workspace/research/codex_order/test_model.py')
verify, image, md = model['verify'], model['image'], model['md']
buffer = model['data_symbol']('_assertWorkingDirectory')
imports = 0
buffers = []
for address, symbol in [('0x0047c4e0', '_FixWindowsDesktop'), ('0x0047c560', '_FUN_0047c560'), ('0x0047c580', '_FUN_0047c580')]:
    target, _ = verify.matcher.carve(address)
    actual_address, code = image.code(symbol)
    assert verify.check(image, address, symbol, verify.known_names())[0] == 'MATCH'
    for original, actual in zip(md.disasm(target, int(address, 16)), md.disasm(code, actual_address)):
        for operand, replacement in zip(original.operands, actual.operands):
            if operand.type == X86_OP_MEM and operand.mem.disp in model['retail_imports']:
                assert model['actual_imports'][replacement.mem.disp] == model['retail_imports'][operand.mem.disp]
                imports += 1
            if original.mnemonic == 'push' and operand.type == X86_OP_IMM and 0x52720e < operand.imm < 0x1400000:
                assert replacement.imm == buffer
                buffers.append(operand.imm)
assert imports == 5 and len(buffers) == 2 and buffers[0] == buffers[1], (imports, buffers)
print('PASS: three restored helpers, five Win32 identities and one shared directory buffer')
