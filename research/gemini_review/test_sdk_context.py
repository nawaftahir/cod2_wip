"""Check the measured MFC header profile and the complete SpinButton class binding."""
import sys,runpy,struct
sys.argv=['test_dialog_completion.py','sdk']
d=runpy.run_path('research/gemini_review/test_dialog_completion.py')
v,img,t,o,u,sym,td=(d[k] for k in ('v','img','t','o','u','sym','td'));names=v.known_names()
for a,s in [('0x00425060','??_GCSpinButtonCtrl@@UAEPAXI@Z'),('0x00402860','??3CObject@@SGXPAX@Z'),('0x00425050','??0CSpinButtonCtrl@@QAE@XZ'),('0x00425030','?SetRange@CSpinButtonCtrl@@QAEXFF@Z'),('0x004f56b7','?CreateEx@CSpinButtonCtrl@@UAEHKKABUtagRECT@@PAVCWnd@@I@Z')]:
    assert v.check(img,a,s,names)[0]=='MATCH',(a,s,v.check(img,a,s,names))
tv,av=0x52dfdc,sym('??_7CSpinButtonCtrl@@6B@')
cols=[u(pe,u(pe,a-4)[0],5) for pe,a in ((t,tv),(o,av))]
assert cols[0][:3]==cols[1][:3] and td(t,cols[0][3])==td(o,cols[1][3])==(0,b'.?AVCSpinButtonCtrl@@')
assert u(o,cols[1][3])[0]==sym('??_7type_info@@6B@')
h=[u(pe,c[4],4) for pe,c in zip((t,o),cols)];assert h[0][:3]==h[1][:3]
for a,b in zip(u(t,h[0][3],h[0][2]),u(o,h[1][3],h[1][2])):
    x,y=u(t,a,6),u(o,b,6);assert x[1:]==y[1:] and td(t,x[0])==td(o,y[0])
base_td=u(t,u(t,h[0][3],h[0][2])[1],6)[0];assert td(t,base_td)==(0,b'.?AVCWnd@@')
section=next(s for s in t.sections if s.Name.rstrip(b'\0')==b'.rdata');data=section.get_data();rb=0x400000+section.VirtualAddress
col=rb+data.index(struct.pack('<4I',0,0,0,base_td));bv=rb+data.index(struct.pack('<I',col))+4
for j,(a,b,pa,pb) in enumerate(zip(u(t,tv,78),u(o,av,78),u(t,bv,76)+(0,0),u(o,sym('??_7CWnd@@6B@'),76)+(0,0))):
    if 2<=j<76:assert a==pa and b==pb,j
    elif j==0:assert b==img.syms['?GetRuntimeClass@CSpinButtonCtrl@@UBEPAUCRuntimeClass@@XZ']
    elif j==1:assert b==img.syms['??_GCSpinButtonCtrl@@UAEPAXI@Z']
    else:assert names[a] in img.labels[b],(j,hex(a))
getter=t.get_data(u(t,tv)[0]-0x400000,6);assert getter[0]==0xb8 and getter[5]==0xc3
r1,r2=u(t,int.from_bytes(getter[1:5],'little'),7),u(o,sym('?classCSpinButtonCtrl@CSpinButtonCtrl@@'),7)
assert d['z'](t,r1[0])==d['z'](o,r2[0])==b'CSpinButtonCtrl'
assert r1[1:4]==r2[1:4]==(0x50,0xffff,0) and r1[5:]==r2[5:]==(0,0)
assert d['z'](t,u(t,r1[4])[0])==b'CWnd' and r2[4]==sym('?classCWnd@CWnd@@')
print('PASS: MFC header routines, 78 SpinButton virtual slots, full RTTI/runtime data, both Create exports and member destruction bindings')
