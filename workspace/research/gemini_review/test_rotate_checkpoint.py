"""Verify retained RotateDlg code and data without claiming its missing callbacks."""
import runpy,struct,sys
sys.argv=['test_dialog_completion.py','checkpoint']
d=runpy.run_path('workspace/research/gemini_review/test_dialog_completion.py')
v,img,t,o,u,sym=(d[k] for k in ('v','img','t','o','u','sym'))
md=d['m']['md'];MEM=d['m']['X86_OP_MEM'];IMM=d['m']['X86_OP_IMM'];names=v.known_names()
rows=[r for r in v.read_tsv('ledger/matches.tsv') if r['source']=='src/radiant/RotateDlg.cpp']
assert len(rows)==6 and sum(int(r['size']) for r in rows)==498
for r in rows:assert v.check(img,r['addr'],r['symbol'],names)[0]=='MATCH',r
for a,s in (('0x0043c1e0','??_GCRotateDlg@@UAEPAXI@Z'),('0x00416350','??1CRotateDlg@@UAE@XZ')):
    assert v.check(img,a,s,names)[0]=='MATCH',(a,s)
strings=imports=stores=0
for r in rows:
    target,_=v.matcher.carve(r['addr']);a,code=img.code(r['symbol'])
    for x,y in zip(md.disasm(target,int(r['addr'],16)),md.disasm(code,a)):
        for p,q in zip(x.operands,y.operands):
            if p.type==MEM and p.mem.disp in d['m']['retail_imports']:
                assert d['m']['actual_imports'][q.mem.disp]==d['m']['retail_imports'][p.mem.disp];imports+=1
            if p.type==IMM and p.imm==0x53d753:
                assert d['z'](o,q.imm)==b'';strings+=1
            if p.type==IMM and p.imm in (0x54810c,0x52dfdc):
                cls='CRotateDlg' if p.imm==0x54810c else 'CSpinButtonCtrl'
                assert q.imm==sym('??_7'+cls+'@@6B@');stores+=1
assert strings==3 and stores==4 and imports>=1,(strings,stores,imports)
get=img.code(names[0x43c290])[1];am=int.from_bytes(get[1:5],'little');tm=0x548264
assert u(t,tm)[0]==0x52cae4 and u(o,am)[0]==sym('?messageMap@CDialog@@')
for j in range(5):
    x,y=u(t,u(t,tm,2)[1]+24*j,6),u(o,u(o,am,2)[1]+24*j,6)
    assert x[:5]==y[:5]
    if j==4:assert x==y==(0,)*6
    else:assert y[5]==o.OPTIONAL_HEADER.ImageBase
print('PASS: six RotateDlg game routines / 498 B, separate 34/200 B helpers, three string literals, four constructor vtables, import and message identities')
print('PARTIAL: four callback bodies remain unresolved; complete EH audit pending; no full-file claim')
