"""Compare EditWnd code and metadata by contents and referenced identities."""
import runpy,struct
m=runpy.run_path('research/codex_order/test_model.py')
v,img,t,o=(m[k] for k in ('verify','image','retail','ours'))
sym=m['data_symbol']
def u(pe,a,n=1):return struct.unpack('<%dI'%n,pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase,4*n))
def z(pe,a):return pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase,128).split(b'\0',1)[0]
def td(pe,a):return (u(pe,a,2)[1],z(pe,a+8))
vt=sym('??_7CEditWnd@@6B@');tv=0x54012c
names=v.known_names()
for r in v.read_tsv('ledger/matches.tsv'):
 if r['source']=='src/radiant/EditWnd.cpp':assert v.check(img,r['addr'],r['symbol'],names)[0]=='MATCH'
assert v.check(img,'0x0040c720','??_GCEditWnd@@UAEPAXI@Z',names)[0]=='MATCH'
# Bind inherited slots to the actual CEdit base vtable, avoiding incomplete library aliases.
section=next(x for x in t.sections if x.Name.rstrip(b'\0')==b'.rdata')
data=section.get_data();rbase=t.OPTIONAL_HEADER.ImageBase+section.VirtualAddress
c=u(t,u(t,tv-4)[0],5);h0=u(t,c[4],4);bases=u(t,h0[3],h0[2])
base_td=u(t,bases[1],6)[0]
assert td(t,base_td)==(0,b'.?AVCEdit@@')
pos=data.index(struct.pack('<4I',0,0,0,base_td));base_col=rbase+pos
base_vt=rbase+data.index(struct.pack('<I',base_col))+4
actual_base_vt=sym('??_7CEdit@@6B@')
for i,(a,b,pa,pb) in enumerate(zip(u(t,tv,77),u(o,vt,77),u(t,base_vt,77),u(o,actual_base_vt,77))):
 if a==pa:assert b==pb,(i,hex(a),hex(b))
 elif a==0x40c720:assert b==img.syms['??_GCEditWnd@@UAEPAXI@Z']
 else:assert names[a] in img.labels[b],(i,hex(a),hex(b))
cols=[u(pe,u(pe,a-4)[0],5) for pe,a in [(t,tv),(o,vt)]]
assert cols[0][:3]==cols[1][:3] and td(t,cols[0][3])==td(o,cols[1][3])==(0,b'.?AVCEditWnd@@')
h=[u(pe,c[4],4) for pe,c in zip((t,o),cols)]
assert h[0][:3]==h[1][:3]
for a,b in zip(u(t,h[0][3],h[0][2]),u(o,h[1][3],h[1][2])):
 x,y=u(t,a,6),u(o,b,6)
 assert x[1:]==y[1:] and td(t,x[0])==td(o,y[0]),(x,y)
# MFC runtime class and empty message map, including base and factory pointers.
a,b=u(t,0x540288,7),u(o,sym('?classCEditWnd@CEditWnd@@'),7)
assert z(t,a[0])==z(o,b[0])==b'CEditWnd'
assert a[1:3]==b[1:3] and a[5:]==b[5:]==(0,0)
assert b[3]==img.syms['?CreateObject@CEditWnd@@SGPAVCObject@@XZ'] and a[3]==0x40c6b0
assert b[4]==sym('?classCWnd@CWnd@@') and z(t,u(t,a[4])[0])==b'CWnd'
a,b=u(t,0x540268,2),u(o,sym('?messageMap@CEditWnd@@'),2)
assert a[0]==0x52ea90 and b[0]==sym('?messageMap@CWnd@@')
assert u(t,a[1],6)==u(o,b[1],6)==(0,0,0,0,0,0)
# The source range has 182 routine bytes and 42 alignment bytes, including final padding.
rs=[r for r in v.read_tsv('data/tu_map.tsv') if r['tu']=='radiant/EditWnd.cpp']
assert sum(int(r['size']) for r in rs)==182
for i,r in enumerate(rs):
 end=int(r['addr'],16)+int(r['size']);nxt=int(rs[i+1]['addr'],16) if i+1<len(rs) else 0x40c790
 assert set(t.get_data(end-t.OPTIONAL_HEADER.ImageBase,nxt-end))<={0xcc,0x90}
print('PASS: six game routines, generated destructor, 77 vtable slots, complete RTTI hierarchy, runtime class, message map and retail padding')
