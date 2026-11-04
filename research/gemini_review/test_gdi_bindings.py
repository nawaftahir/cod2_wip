"""Prove the two GDI library identities from archive code and actual import binding."""
import sys
sys.path.insert(0,'tools')
import lib_sweep, match_radiant as m, link, pefile
fixes={
 '0x00505804':('?Detach@CGdiObject@@QAEPAXXZ',42),
 '0x0050582e':('?DeleteObject@CGdiObject@@QAEHXZ',22),
}
member,data=next((name,data) for name,data in lib_sweep.archive_members('/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib') if name==r'INTEL\$NW\wingdi.obj')
sections,symbols=m.parse_coff(data)
for addr,(symbol,size) in fixes.items():
    code,mask,selected,calls=m.object_function(data,symbol,with_calls=True)
    target,_=m.carve(addr);tm=m.absolute_masks(target,m.pe_relocations(int(addr,16),len(target),target))
    assert selected==symbol and len(code)==len(target)==size
    assert m.normalize(target,tm)==m.normalize(code,mask),addr
    print('PASS:',addr,member,symbol,size,'normalized archive bytes; calls',calls)
entry=next(s for s in symbols if s['name']==fixes['0x0050582e'][0])
relocs=sections[entry['section']-1]['relocations']
assert {r['target'] for r in relocs} >= {'?Detach@CGdiObject@@QAEPAXXZ','__imp__DeleteObject@4'}
retail=pefile.PE(str(link.RETAIL));imports={i.address:(e.dll.lower(),i.name) for e in retail.DIRECTORY_ENTRY_IMPORT for i in e.imports}
assert imports[0x528198]==(b'gdi32.dll',b'DeleteObject')
code,_=m.carve('0x0050582e')
assert b'\xff\x15\x98\x81\x52\x00' in code
print('PASS: actual retail IAT 0x528198 is GDI32 DeleteObject, matching the wingdi.obj relocation')
for path in ('data/lib_funcs.tsv','data/lib_overrides.tsv'):
    rows={r['addr']:r for r in link.read_tsv(path)}
    for addr,(symbol,size) in fixes.items():
        assert rows[addr]['symbol']==symbol and rows[addr]['member']==member,(path,addr)
print('PASS: reviewed library table and durable overrides retain both GDI identities')
