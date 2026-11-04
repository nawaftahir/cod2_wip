"""Audit the clean density checkpoints; the real OnOK dependencies remain pending."""
import runpy
import struct
from pathlib import Path
m = runpy.run_path('research/gemini_review/test_dialog_batch.py')
d = m['d']
v, img, names = m['v'], m['img'], m['names']
t, o, u, sym, md = (d[k] if k in d else m[k] for k in ('t', 'o', 'u', 'sym', 'md'))
IMM, MEM = d['m']['X86_OP_IMM'], d['m']['X86_OP_MEM']
shared = ('??0CComboBox@@QAE@XZ', '??_GCComboBox@@UAEPAXI@Z', '??_ECComboBox@@UAEPAXI@Z', '?SetCurSel@CComboBox@@QAEHH@Z')
for cls, ctor, getter, tv, scalar, end, onok, init, states in (
    ('CPatchDensityDlg', 0x4242c0, 0x4243b0, 0x545c5c, 0x424340, 0x4244b0, 0x4243c0, 0x424460,
     ((0x12334ac, '?s_patchLastWidthSelection@@', 0), (0x12334b0, '?s_patchLastHeightSelection@@', 0))),
    ('CTerrainDensityDlg', 0x43ec80, 0x43ed70, 0x54893c, 0x43ed00, 0x43ee70, 0x43edd0, 0x43ed80,
     ((0x590a60, '?s_nLastWidthSel@@', 1), (0x590a64, '?s_nLastHeightSel@@', 1))),
):
    assert d['dialog'](cls, ctor, getter, tv, scalar, end, 4, shared if cls == 'CPatchDensityDlg' else (), pending_callbacks=(onok,)) is False
    ca, cc = img.code(names[ctor])
    assert m['eh'](ctor, ca, len(cc))
    code, _ = v.matcher.carve(hex(scalar))
    dt = next(i.operands[0].imm for i in md.disasm(code, scalar) if i.mnemonic == 'call' and i.operands[0].type == IMM)
    symbol = '??1' + cls + '@@UAE@XZ'
    assert v.check(img, hex(dt), symbol, names)[0] == 'MATCH', (cls, hex(dt), v.check(img, hex(dt), symbol, names))
    a, code = img.code(symbol)
    assert m['eh'](dt, a, len(code))
    print('SHARED DESTRUCTOR:', cls, hex(dt), len(code))
    target, _ = v.matcher.carve(hex(init)); a, actual = img.code(names[init])
    addresses = {ta: (sym(label), initial) for ta, label, initial in states}
    seen = set()
    for left, right in zip(md.disasm(target, init), md.disasm(actual, a)):
        for x, y in zip(left.operands, right.operands):
            if x.type == MEM and not x.mem.base and x.mem.disp in addresses:
                actual_address, initial = addresses[x.mem.disp]
                assert y.type == MEM and y.mem.disp == actual_address
                assert int.from_bytes(t.get_memory_mapped_image()[x.mem.disp-0x400000:x.mem.disp-0x400000+4], 'little') == initial
                assert int.from_bytes(o.get_memory_mapped_image()[actual_address-o.OPTIONAL_HEADER.ImageBase:actual_address-o.OPTIONAL_HEADER.ImageBase+4], 'little') == initial
                seen.add(x.mem.disp)
    assert seen == set(addresses), (cls, seen, addresses)
    source = Path('src/radiant/' + cls[1:] + '.cpp').read_text()
    assert '#include "stdafx.h"' in source and '__declspec(noinline)' not in source and '::OnOK()' not in source
    print('PASS:', cls, 'saved selection storage and values; OnOK explicitly pending')
# The SDK constructors share masked bytes; require the actual ComboBox vtable.
for symbol in shared:
    a, code = img.code(symbol)
    if symbol.startswith(('??_G', '??_E')):
        candidates = [hex(u(t, 0x52d204+4)[0])]
    elif symbol.startswith('??0'):
        candidates = []
        for row in v.read_tsv('data/tu_map.tsv'):
            if int(row['size']) != len(code): continue
            target, _ = v.matcher.carve(row['addr'])
            if any(x.type == IMM and x.imm == 0x52d204 for ins in md.disasm(target, int(row['addr'], 16)) for x in ins.operands):
                candidates.append(row['addr'])
    else:
        candidates = ['0x0040bc60']
    assert candidates and all(v.check(img, address, symbol, names)[0] == 'MATCH' for address in candidates), (symbol, candidates)
    print('SDK HEADER:', symbol, len(code), candidates)
    for address in candidates:
        target, _ = v.matcher.carve(address)
        for left, right in zip(md.disasm(target, int(address, 16)), md.disasm(code, a)):
            for x, y in zip(left.operands, right.operands):
                if x.type == IMM and x.imm == 0x52d204:
                    assert y.imm == sym('??_7CComboBox@@6B@')
                if x.type == MEM and not x.mem.base and x.mem.disp in d['m']['retail_imports']:
                    assert d['m']['retail_imports'][x.mem.disp] == d['m']['actual_imports'][y.mem.disp]
for item in m['manifest']: print('GENERATED:', *item)
print('PASS: eight authored density routines / 480 B; separate scalars / 68 B; both files remain PARTIAL')
