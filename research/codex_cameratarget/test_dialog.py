"""Check camera-target dialog bindings beyond relocation-masked code equality."""
import runpy
import struct
import sys

sys.path.insert(0, 'tools')
import lib_sweep

model = runpy.run_path('research/codex_order/test_model.py')
verify, image, retail, ours = (model[key] for key in ('verify', 'image', 'retail', 'ours'))
symbol = model['data_symbol']
base = retail.OPTIONAL_HEADER.ImageBase
actual_base = ours.OPTIONAL_HEADER.ImageBase
vtable = symbol('??_7CCameraTargetDlg@@6B@')
for pe, address, image_base in ((retail, 0x53d75c, base), (ours, vtable, actual_base)):
    locator = struct.unpack('<I', pe.get_data(address-image_base-4, 4))[0]
    fields = struct.unpack('<5I', pe.get_data(locator-image_base, 20))
    assert pe.get_data(fields[3]-image_base+8, 64).split(b'\0', 1)[0] == b'.?AVCCameraTargetDlg@@'

message_map = symbol('?messageMap@CCameraTargetDlg@@')
parent, entries = struct.unpack('<2I', ours.get_data(message_map-actual_base, 8))
assert parent == symbol('?messageMap@CDialog@@')
assert entries == symbol('?_messageEntries@CCameraTargetDlg@@')
target_entry = struct.unpack('<6I', retail.get_data(0x53d8bc-base, 24))
actual_entry = struct.unpack('<6I', ours.get_data(entries-actual_base, 24))
assert target_entry[:5] == actual_entry[:5] == (0x111, 0, 0x80b3, 0x80b3, 0x35)
assert actual_entry[5] == image.syms['?OnPopupNewcameraFixed@CCameraTargetDlg@@IAEXXZ']
assert ours.get_data(entries-actual_base+24, 24) == bytes(24)

names = verify.known_names()
for address in (0x402940, 0x4029f0, 0x402a20, 0x402a50, 0x402a60):
    assert verify.check(image, hex(address), names[address], names)[0] == 'MATCH'
# The original constructor consumes the getter result as IAtlStringMgr::GetNilString.
target, _ = verify.matcher.carve('0x00402940')
address, code = image.code('??0CCameraTargetDlg@@QAE@PAVCWnd@@@Z')
assert b'\x8b\x10\x8b\xc8\xff\x52\x0c\x83\xc0\x10' in target
getter = '?AfxGetStringManager@@YGPAUIAtlStringMgr@ATL@@XZ'
assert verify.check(image, '0x004ff4c3', getter, names)[0] == 'MATCH'
_, target_calls = verify.masks(target, 0x402940)
_, actual_calls = verify.masks(code, address)
field = next(field for field, destination in target_calls.items() if destination == 0x4ff4c3)
assert getter in image.labels[actual_calls[field]]
set_string = '?SetString@?$CSimpleStringT@D$0A@@ATL@@QAEXPBDH@Z'
field = next(field for field, destination in target_calls.items() if destination == 0x402b30)
assert set_string in image.labels[actual_calls[field]]
assert verify.check(image, '0x00402b30', set_string, names)[0] == 'MATCH'
archive = dict(lib_sweep.archive_members('/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib'))
payload, mask, _ = verify.matcher.object_function(archive[r'INTEL\$NW\strcore.obj'], getter)
target_getter, _ = verify.matcher.carve('0x004ff4c3')
assert payload == b'\xb8\0\0\0\0\xc3' and mask == {1, 2, 3, 4}
assert target_getter[:1] == payload[:1] and target_getter[-1:] == payload[-1:]
assert struct.pack('<I', vtable) in code
md = model['md']
for original, actual in zip(md.disasm(target, 0x402940), md.disasm(code, address)):
    if original.mnemonic == 'push' and original.operands[0].type == model['X86_OP_IMM'] and original.operands[0].imm == 0x53d753:
        assert ours.get_data(actual.operands[0].imm-actual_base, 1) == b'\0'
_, getter_code = image.code('?GetMessageMap@CCameraTargetDlg@@MBEPBUAFX_MSGMAP@@XZ')
assert getter_code == b'\xb8' + struct.pack('<I', message_map) + b'\xc3'
print('PASS: five dialog routines, RTTI, message dispatch, constructor vtable and string-manager binding')
