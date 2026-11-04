"""Check the two usable library proposals from the rejected density/ZWnd batch."""
import struct
import sys
sys.path.insert(0, 'tools')
import lib_sweep, link, verify
m = verify.matcher
members = dict(lib_sweep.archive_members('/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib'))
fixes = (
    ('0x005054cc', r'INTEL\$NW\wingdi.obj', '?FromHandle@CDC@@SGPAV1@PAUHDC__@@@Z', 14),
    ('0x00516827', r'INTEL\$NW\winctrl1.obj', '??1CComboBox@@UAE@XZ', 56),
)
for address, member, symbol, size in fixes:
    code, mask, selected, calls = m.object_function(members[member], symbol, with_calls=True)
    target, _ = m.carve(address)
    va = int(address, 16)
    tm = m.absolute_masks(target, m.pe_relocations(va, len(target), target))
    assert selected == symbol and len(code) == len(target) == size
    assert m.normalize(code, mask | tm) == m.normalize(target, mask | tm), address
    actual = verify.masks(target, va)[1]
    if va == 0x5054cc:
        assert calls == [(3, '?afxMapHDC@@YGPAVCHandleMap@@H@Z'), (10, '?FromHandle@CHandleMap@@QAEPAVCObject@@PAX@Z')]
        assert actual == {3: 0x505450, 10: 0x503312}
        assert verify.known_names()[0x505450] == calls[0][1]
    else:
        assert [name for _, name in calls] == ['__EH_prolog', '?DestroyWindow@CWnd@@UAEHXZ', '??1CWnd@@UAE@XZ']
        assert all(verify.known_names()[actual[offset]] == name for offset, name in calls)
        assert b'\xc7\x06\x04\xd2\x52\x00' in target
        pe = verify.pefile.PE(str(link.RETAIL), fast_load=True)
        def u(address): return struct.unpack('<I', pe.get_data(address-0x400000, 4))[0]
        descriptor = u(u(0x52d204-4)+12)
        assert pe.get_data(descriptor-0x400000+8, 80).split(b'\0', 1)[0] == b'.?AVCComboBox@@'
    for path in ('data/lib_funcs.tsv', 'data/lib_overrides.tsv'):
        row = next(r for r in link.read_tsv(path) if r['addr'] == address)
        assert row['member'] == member and row['symbol'] == symbol, (path, address)
    print('PASS:', address, symbol, size, 'normalized archive bytes and target callee/type evidence')
