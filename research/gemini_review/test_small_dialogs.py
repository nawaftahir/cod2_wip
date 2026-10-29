"""Check actual dialog metadata, callback routing and default constants."""
import runpy
import struct
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

model = runpy.run_path('research/codex_order/test_model.py')
verify, image, md = model['verify'], model['image'], model['md']
retail, ours = model['retail'], model['ours']
def words(pe, address, count):
    return struct.unpack('<%dI' % count, pe.get_data(address - pe.OPTIONAL_HEADER.ImageBase, 4 * count))
def type_name(pe, vtable):
    try:
        locator = words(pe, vtable - 4, 1)[0]
        descriptor = words(pe, locator, 5)[3]
        return pe.get_data(descriptor - pe.OPTIONAL_HEADER.ImageBase + 8, 100).split(b'\0', 1)[0]
    except (struct.error, IndexError):
        return b''
for cls, ctor, getter, parent, count, helper in [
    ('CLstToolBar', '0x00411040', '0x00411090', 'CToolBar', 1, '0x00411050'),
    ('CScaleDialog', '0x0043c710', '0x0043c7b0', 'CDialog', 0, '0x0043c740'),
    ('CDialogThick', '0x004097d0', '0x00409870', 'CDialog', 0, '0x00409800'),
]:
    symbol = verify.known_names()[int(ctor, 16)]
    target, _ = verify.matcher.carve(ctor)
    start, code = image.code(symbol)
    stores = []
    for original, actual in zip(md.disasm(target, int(ctor, 16)), md.disasm(code, start)):
        if original.mnemonic == 'mov' and len(original.operands) == 2:
            dest, value = original.operands
            if dest.type == X86_OP_MEM and dest.mem.disp == 0 and value.type == X86_OP_IMM and 0x52720e < value.imm < 0x58f800:
                stores.append((value.imm, actual.operands[1].imm))
        for operand, actual_operand in zip(original.operands, actual.operands):
            if operand.type == X86_OP_MEM and 0x52720e < operand.mem.disp < 0x58f800 and operand.mem.disp not in model['retail_imports']:
                assert retail.get_data(operand.mem.disp - retail.OPTIONAL_HEADER.ImageBase, 4) == ours.get_data(actual_operand.mem.disp - ours.OPTIONAL_HEADER.ImageBase, 4)
    vtable = model['data_symbol']('??_7' + cls + '@@6B@')
    assert len(stores) == 1 and stores[0][1] == vtable, (cls, stores, vtable)
    assert words(ours, vtable, 2)[1] == image.syms['??_G' + cls + '@@UAEPAXI@Z']
    target_map = struct.unpack_from('<I', verify.matcher.carve(getter)[0], 1)[0]
    _, getter_code = image.code(verify.known_names()[int(getter, 16)])
    actual_map = struct.unpack_from('<I', getter_code, 1)[0]
    parent_map, actual_entries = words(ours, actual_map, 2)
    assert parent_map == model['data_symbol']('?messageMap@' + parent + '@@')
    target_entries = words(retail, target_map, 2)[1]
    for i in range(count + 1):
        expected = words(retail, target_entries + 24 * i, 6)
        actual = words(ours, actual_entries + 24 * i, 6)
        assert expected[:5] == actual[:5], (cls, i, expected, actual)
        if i == count:
            assert expected == actual == (0, 0, 0, 0, 0, 0)
        else:
            assert verify.known_names()[expected[5]] in image.labels[actual[5]]
    status, detail = verify.check(image, helper, '??_G' + cls + '@@UAEPAXI@Z', verify.known_names())
    if cls == 'CScaleDialog':
        assert status == 'MATCH', (cls, status, detail)
    else:
        assert status in ('MISMATCH', 'CALLEE'), (cls, status, detail)
    print(cls, 'generated helper:', status, detail, 'RTTI:', type_name(retail, stores[0][0]), '/', type_name(ours, vtable))
print('PASS: three constructor vtables/default constants, parent maps and real dispatch entries; ScaleDialog generated helper MATCH; two helper blockers diagnosed')
