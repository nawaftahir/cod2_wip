"""Check camera-window metadata, callbacks, strings and actual import bindings."""
import runpy
import struct

model = runpy.run_path('workspace/research/codex_order/test_model.py')
verify, image, retail, ours, md = (model[key] for key in ('verify', 'image', 'retail', 'ours', 'md'))
symbol = model['data_symbol']
base, actual_base = retail.OPTIONAL_HEADER.ImageBase, ours.OPTIONAL_HEADER.ImageBase
names = verify.known_names()
runtime = symbol('?classCCamWnd@CCamWnd@@')
actual = struct.unpack('<7I', ours.get_data(runtime-actual_base, 28))
target = struct.unpack('<7I', retail.get_data(0x53f110-base, 28))
assert actual[1:3] == target[1:3] == (0x168, 0xffff)
assert ours.get_data(actual[0]-actual_base, 8) == retail.get_data(target[0]-base, 8) == b'CCamWnd\0'
assert actual[3] == image.syms['?CreateObject@CCamWnd@@SGPAVCObject@@XZ']
assert actual[4] == symbol('?classCWnd@CWnd@@')
_, getter = image.code('?GetRuntimeClass@CCamWnd@@UBEPAUCRuntimeClass@@XZ')
assert getter == b'\xb8' + struct.pack('<I', runtime) + b'\xc3'

message_map = symbol('?messageMap@CCamWnd@@')
parent, entries = struct.unpack('<2I', ours.get_data(message_map-actual_base, 8))
assert parent == symbol('?messageMap@CWnd@@')
assert entries == symbol('?_messageEntries@CCamWnd@@')
for index in range(20):
    target_entry = struct.unpack('<6I', retail.get_data(0x53ef30-base+24*index, 24))
    actual_entry = struct.unpack('<6I', ours.get_data(entries-actual_base+24*index, 24))
    assert actual_entry[:5] == target_entry[:5], index
    callback = names.get(target_entry[5])
    if callback:
        assert callback in image.labels.get(actual_entry[5], ()), (index, callback)
    if index == 19:
        assert actual_entry == (0, 0, 0, 0, 0, 0)
_, getter = image.code('?GetMessageMap@CCamWnd@@MBEPBUAFX_MSGMAP@@XZ')
assert getter == b'\xb8' + struct.pack('<I', message_map) + b'\xc3'

vtable = symbol('??_7CCamWnd@@6B@')
for pe, address, image_base in ((retail, 0x53eb24, base), (ours, vtable, actual_base)):
    locator = struct.unpack('<I', pe.get_data(address-image_base-4, 4))[0]
    fields = struct.unpack('<5I', pe.get_data(locator-image_base, 20))
    assert pe.get_data(fields[3]-image_base+8, 32).split(b'\0', 1)[0] == b'.?AVCCamWnd@@'
target_callback = 0x403010
actual_callback = image.syms['?CamWndProc@@YGJPAUHWND__@@IIJ@Z']
retail_imports, actual_imports = model['retail_imports'], model['actual_imports']
imports, strings, callbacks = 0, 0, 0
for row in model['read']('ledger/matches.tsv'):
    if row['source'] != 'src/radiant/CamWnd.cpp':
        continue
    target, _ = verify.matcher.carve(row['addr'])
    address, code = image.code(row['symbol'])
    assert verify.check(image, row['addr'], row['symbol'], names)[0] == 'MATCH'
    for original, actual in zip(md.disasm(target, int(row['addr'], 16)), md.disasm(code, address)):
        for operand, replacement in zip(original.operands, actual.operands):
            if operand.type == model['X86_OP_IMM']:
                value, replaced = operand.imm, replacement.imm
                if value in (0x53ef1c, 0x53eef8, 0x53eefc):
                    assert retail.get_data(value-base, 80).split(b'\0', 1)[0] == ours.get_data(replaced-actual_base, 80).split(b'\0', 1)[0]
                    strings += 1
                if value == target_callback:
                    assert replaced == actual_callback
                    callbacks += 1
                if value == 0x53eb24:
                    assert replaced == vtable
            elif operand.type == model['X86_OP_MEM'] and operand.mem.disp in retail_imports:
                assert actual_imports[replacement.mem.disp] == retail_imports[operand.mem.disp]
                imports += 1
assert imports == 15 and strings == 5 and callbacks == 1, (imports, strings, callbacks)
register = '?AfxRegisterClass@@YGHPAUtagWNDCLASSA@@@Z'
target, meta = verify.matcher.carve('0x004fae53')
address, main_body = image.code(register)
assert meta['name'] == 'AfxRegisterClass' and len(target) == 257 and len(main_body) == 241
# The map labels the final 16-byte EH cleanup separately; the inventory includes it.
assert any(label.startswith('$L') for label in image.labels[address+len(main_body)])
full_body = image.pe.get_data(address-image.base, len(target))
target_mask, target_calls = verify.masks(target, 0x4fae53)
actual_mask, actual_calls = verify.masks(full_body, address)
assert all(a == b or i in target_mask | actual_mask for i, (a, b) in enumerate(zip(target, full_body)))
for field, destination in target_calls.items():
    if destination in names:
        assert names[destination] in image.labels.get(actual_calls[field], ())
assert verify.check(image, '0x00403090', names[0x403090], names | {0x4fae53: register})[0] == 'MATCH'
print('PASS: camera class size/factory, message map, separate getters, window callback, literals and imports')
