"""Verify RADEditWnd code, base/member identity and class metadata."""
import runpy,struct
q=runpy.run_path('research/gemini_review/test_editwnd.py')
v,img,t,o,sym,u,td=(q[k] for k in ('v','img','t','o','sym','u','td'))
vt=sym('??_7CRADEditWnd@@6B@');tv=0x547dcc;names=v.known_names()
for r in v.read_tsv('ledger/matches.tsv'):
 if r['source']=='src/radiant/RADEditWnd.cpp':assert v.check(img,r['addr'],r['symbol'],names)[0]=='MATCH'
assert v.check(img,'0x0043b560','??_GCRADEditWnd@@UAEPAXI@Z',names)[0]=='MATCH'
c=[u(pe,u(pe,a-4)[0],5) for pe,a in [(t,tv),(o,vt)]]
assert c[0][:3]==c[1][:3] and td(t,c[0][3])==td(o,c[1][3])==(0,b'.?AVCRADEditWnd@@')
h=[u(pe,x[4],4) for pe,x in zip((t,o),c)]
assert h[0][:3]==h[1][:3]
for a,b in zip(u(t,h[0][3],h[0][2]),u(o,h[1][3],h[1][2])):
 x,y=u(t,a,6),u(o,b,6);assert x[1:]==y[1:] and td(t,x[0])==td(o,y[0])
base_td=u(t,u(t,h[0][3],h[0][2])[1],6)[0];assert td(t,base_td)==(0,b'.?AVCWnd@@')
section=next(x for x in t.sections if x.Name.rstrip(b'\0')==b'.rdata');data=section.get_data();rb=t.OPTIONAL_HEADER.ImageBase+section.VirtualAddress
base_col=rb+data.index(struct.pack('<4I',0,0,0,base_td));base_vt=rb+data.index(struct.pack('<I',base_col))+4
for a,b,pa,pb in zip(u(t,tv,76),u(o,vt,76),u(t,base_vt,76),u(o,sym('??_7CWnd@@6B@'),76)):
 if a==pa:assert b==pb
 elif a==0x43b560:assert b==img.syms['??_GCRADEditWnd@@UAEPAXI@Z']
 else:assert names[a] in img.labels[b]
a,b=u(t,0x547efc,2),u(o,sym('?messageMap@CRADEditWnd@@'),2)
assert a[0]==0x52ea90 and b[0]==sym('?messageMap@CWnd@@')
for i in range(3):
 x,y=u(t,a[1]+24*i,6),u(o,b[1]+24*i,6);assert x[:5]==y[:5]
 if i==2:assert x==y==(0,0,0,0,0,0)
 else:assert names[x[5]] in img.labels[y[5]]
# Both objects' vtable stores must bind to the parent or its real CEditWnd member.
from capstone.x86 import X86_OP_MEM,X86_OP_IMM
bindings={tv:vt,0x54012c:sym('??_7CEditWnd@@6B@')};seen=set()
for address in ['0x0043b500','0x0043b590']:
 raw,_=v.matcher.carve(address);start,code=img.code(names[int(address,16)])
 for x,y in zip(q['m']['md'].disasm(raw,int(address,16)),q['m']['md'].disasm(code,start)):
  for a,b in zip(x.operands,y.operands):
   if a.type==X86_OP_IMM and a.imm in bindings:assert b.imm==bindings[a.imm];seen.add(a.imm)
assert set(bindings)<=seen
print('PASS: five RADEditWnd game routines, generated destructor, 76 vtable slots, RTTI hierarchy, two message callbacks and real CEditWnd member bindings')
