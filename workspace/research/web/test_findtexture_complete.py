"""Complete-file proof for src/radiant/FindTextureDlg.cpp."""
import runpy
import struct
import sys

sys.argv = ['test_dialog_completion.py', 'findtexture']
d = runpy.run_path('workspace/research/gemini_review/test_dialog_completion.py')
v, img, t, o, u, sym, blob, dialog = (
    d[k] for k in ('v', 'img', 't', 'o', 'u', 'sym', 'blob', 'dialog')
)
md = d['m']['md']
IMM = d['m']['X86_OP_IMM']
names = v.known_names()
source = 'src/radiant/FindTextureDlg.cpp'

assert dialog(
    'CFindTextureDlg',
    0x40fca0,
    0x40fe00,
    0x540c7c,
    0x40fd60,
    0x4100c0,
    expected_count=15,
    expected_shared=('_$E4', '??B?$CSimpleStringT@D$0A@@ATL@@QBEPBDXZ'),
    dispatches=3,
    source=source,
    allow_generated_elsewhere=True,
)

ctor = '??0CFindTextureDlg@@QAE@PAVCWnd@@@Z'
dtor = '??1CFindTextureDlg@@UAE@XZ'
scalar = '??_GCFindTextureDlg@@UAEPAXI@Z'
assert v.check(img, '0x0040fd60', scalar, names)[0] == 'MATCH'
assert v.check(img, '0x005269b0', '_$E4', names)[0] == 'MATCH'

find_obj = sym('?g_TexFindDlg@@')
find_ref = sym('?g_dlgFind@@')
active = sym('?g_bFindActive@@')
ret_init, _ = v.matcher.carve('0x005269b0')
oa, our_init = img.code('_$E4')
ri = list(md.disasm(ret_init, 0x5269b0))
oi = list(md.disasm(our_init, oa))
assert len(ri) == len(oi) == 2 and ri[0].mnemonic == oi[0].mnemonic == 'mov'
assert ri[0].operands[0].mem.disp == 0x1233868
assert oi[0].operands[0].mem.disp == find_ref
ret_obj = ri[0].operands[1].imm
assert oi[0].operands[1].imm == find_obj
assert u(t, 0x1233868)[0] == u(o, find_ref)[0] == 0
assert t.get_data(0x58fbec - t.OPTIONAL_HEADER.ImageBase, 1) == b'\x01'
assert o.get_data(active - o.OPTIONAL_HEADER.ImageBase, 1) == b'\x01'

def matching_caller(retail_addr, target_symbol, size):
    target = img.syms[target_symbol]
    found = []
    for name in img.syms:
        try:
            start, code = img.code(name)
        except (ValueError, KeyError):
            continue
        if len(code) != size or target not in v.masks(code, start)[1].values():
            continue
        if v.check(img, hex(retail_addr), name, names)[0] == 'MATCH':
            found.append((name, start, code))
    assert len(found) == 1, (hex(retail_addr), target_symbol, [(x[0], hex(x[1])) for x in found])
    return found[0]

ctor_life = matching_caller(0x526990, ctor, 24)
dtor_life = matching_caller(0x526f20, dtor, 13)
ret_ctor, _ = v.matcher.carve('0x00526990')
ret_dtor, _ = v.matcher.carve('0x00526f20')
assert struct.pack('<I', ret_obj) in ret_ctor
assert struct.pack('<I', find_obj) in ctor_life[2]
assert struct.pack('<I', ret_obj) in ret_dtor
assert struct.pack('<I', find_obj) in dtor_life[2]

def code_span(pe, addr):
    code = pe.get_data(addr - pe.OPTIONAL_HEADER.ImageBase, 128)
    for ins in md.disasm(code, addr):
        if ins.mnemonic in ('jmp', 'ret'):
            return ins.address + ins.size - addr
    raise AssertionError(('no cleanup terminator', hex(addr)))

def check_eh(retail_addr, symbol):
    actual_addr, actual = img.code(symbol)
    retail, _ = v.matcher.carve(hex(retail_addr))
    for left, right in zip(md.disasm(retail, retail_addr), md.disasm(actual, actual_addr)):
        if left.mnemonic not in ('push', 'mov'):
            continue
        for x, y in zip(left.operands, right.operands):
            if x.type != IMM or y.type != IMM:
                continue
            if not any(s.startswith('__ehhandler$') for s in img.labels[y.imm]):
                continue
            handler_left, handler_right = blob(x.imm, y.imm, 10)
            infos = [u(pe, int.from_bytes(code[1:5], 'little'), 7)
                     for pe, code in ((t, handler_left), (o, handler_right))]
            assert infos[0][:2] == infos[1][:2]
            assert infos[0][0] == 0x19930520 and infos[0][3:] == infos[1][3:] == (0, 0, 0, 0)
            for i in range(infos[0][1]):
                tx, ox = u(t, infos[0][2] + i * 8, 2), u(o, infos[1][2] + i * 8, 2)
                assert tx[0] == ox[0]
                n = code_span(t, tx[1])
                assert n == code_span(o, ox[1])
                blob(tx[1], ox[1], n)
            return True
    return False

assert check_eh(0x40fca0, ctor)
assert not check_eh(0x40fc10, dtor)

literal = b'Radiant::TextureFindWindow\x00'
assert t.__data__.count(literal) >= 1
assert o.__data__.count(literal) >= 1

print('PASS: FindTextureDlg FILE VERIFIED; 15 game routines / 1013 B; '
      '33 B scalar helper; 86-slot CDialog metadata, three message callbacks, '
      'registry literal, ctor EH, reference initializer and full lifetime chain')
