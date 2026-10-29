"""Pin the spin-control destructor alias using retail RTTI and archive code."""
import sys,struct
sys.path.insert(0,'tools')
import link,verify,lib_sweep
m=verify.matcher
symbol='??1CSpinButtonCtrl@@UAE@XZ'
member=r'INTEL\$NW\winctrl2.obj'
data=next(data for name,data in lib_sweep.archive_members('/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib') if name==member)
code,mask,selected,calls=m.object_function(data,symbol,with_calls=True)
target,_=m.carve('0x004f56ee');tm=m.absolute_masks(target,m.pe_relocations(0x4f56ee,len(target),target))
assert selected==symbol and len(code)==len(target)==56
assert m.normalize(target,mask|tm)==m.normalize(code,mask|tm)
assert [name for _,name in calls]==['__EH_prolog','?DestroyWindow@CWnd@@UAEHXZ','??1CWnd@@UAE@XZ']
t=verify.pefile.PE(str(link.RETAIL),fast_load=True)
def u(a,n=1):return struct.unpack('<%dI'%n,t.get_data(a-0x400000,4*n))
assert b'\xc7\x06\xdc\xdf\x52\x00' in target
locator=u(0x52dfdc-4)[0];descriptor=u(locator,5)[3]
assert t.get_data(descriptor-0x400000+8,80).split(b'\0',1)[0]==b'.?AVCSpinButtonCtrl@@'
for path in ('data/lib_funcs.tsv','data/lib_overrides.tsv'):
    row=next(r for r in link.read_tsv(path) if r['addr']=='0x004f56ee')
    assert row['symbol']==symbol and row['member']==member
print('PASS: CSpinButtonCtrl RTTI, 56 normalized archive bytes, three archive callees and durable library alias')
