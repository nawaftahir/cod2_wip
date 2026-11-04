"""Audit the three submitted dialogs, including their out-of-range generated code."""
import runpy,sys
sys.argv=['test_dialog_completion.py','batch']
d=runpy.run_path('workspace/research/gemini_review/test_dialog_completion.py')
v,img,t,o,u,sym,blob,dialog=(d[k] for k in ('v','img','t','o','u','sym','blob','dialog'))
md=d['m']['md'];IMM=d['m']['X86_OP_IMM'];MEM=d['m']['X86_OP_MEM'];names=v.known_names()
manifest=[]
def code_span(pe,a):
    code=pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase,128)
    for ins in md.disasm(code,a):
        if ins.mnemonic in ('jmp','ret'):
            return ins.address+ins.size-a
    raise AssertionError(('no cleanup terminator',hex(a)))
def eh(ta,oa,size):
    for left,right in zip(md.disasm(t.get_data(ta-0x400000,size),ta),md.disasm(o.get_data(oa-o.OPTIONAL_HEADER.ImageBase,size),oa)):
        if left.mnemonic not in ('push','mov'):continue
        for x,y in zip(left.operands,right.operands):
            if x.type!=IMM or y.type!=IMM or not any(s.startswith('__ehhandler$') for s in img.labels[y.imm]):continue
            assert 0x401000<=x.imm<0x52720e
            a,b=blob(x.imm,y.imm,10)
            infos=[u(pe,int.from_bytes(code[1:5],'little'),7) for pe,code in ((t,a),(o,b))]
            assert infos[0][:2]==infos[1][:2] and infos[0][0]==0x19930520 and infos[0][3:]==infos[1][3:]==(0,0,0,0)
            count=infos[0][1]
            for i in range(count):
                tx,ox=u(t,infos[0][2]+i*8,2),u(o,infos[1][2]+i*8,2)
                assert tx[0]==ox[0]
                n=code_span(t,tx[1]);assert n==code_span(o,ox[1])
                blob(tx[1],ox[1],n)
                manifest.append((hex(tx[1]),n,'unwind cleanup'))
            manifest.append((hex(x.imm),10,'EH handler; FuncInfo 28 B, unwind table '+str(count*8)+' B'))
            return True
    assert not any(s.startswith('__ehhandler$') for a in range(oa,oa+size) for s in img.labels[a])
for cls,ctor,getter,tv,helper,end,count in (
 ('CNewProjDlg',0x4241e0,0x4242b0,0x545adc,0x424260,0x4242c0,3),
 ('CDlgEvent',0x40bcf0,0x40bdd0,0x53ff64,0x40bd70,0x40bde0,3),
 ('CTextureLayout',0x43f710,0x43f830,0x548ec4,0x43f7a0,0x43f8a0,5),
):
    shared=('?SetRange@CSpinButtonCtrl@@QAEXFF@Z','??0CSpinButtonCtrl@@QAE@XZ','??_GCSpinButtonCtrl@@UAEPAXI@Z','??_ECSpinButtonCtrl@@UAEPAXI@Z') if cls=='CTextureLayout' else ()
    dialog(cls,ctor,getter,tv,helper,end,count,shared)
    scalar,_=v.matcher.carve(hex(helper));calls=v.masks(scalar,helper)[1]
    dt=calls[min(calls)];symbol='??1'+cls+'@@UAE@XZ'
    status,detail=v.check(img,hex(dt),symbol,names)
    assert status=='MATCH',(cls,hex(dt),status,detail)
    da,dc=img.code(symbol);manifest.append((hex(dt),len(dc),cls+' shared destructor'))
    eh(dt,da,len(dc))
    ca,cc=img.code(names[ctor]);assert eh(ctor,ca,len(cc)) is True
    # Every vtable written into a subobject must name the same real class.
    target,_=v.matcher.carve(hex(ctor))
    for a,b in zip(md.disasm(target,ctor),md.disasm(cc,ca)):
        if a.mnemonic!='mov' or len(a.operands)!=2:continue
        x,y=a.operands
        if x.type!=MEM or y.type!=IMM or not 0x52720e<y.imm<0x58f800:continue
        av=b.operands[1].imm
        tc,oc=u(t,u(t,y.imm-4)[0],5),u(o,u(o,av-4)[0],5)
        assert d['td'](t,tc[3])==d['td'](o,oc[3])
    print('PASS:',cls,'shared destructor and generated cleanup bindings')
for item in manifest:print('MANIFEST:',*item)

# MFC header bodies may be emitted by the earliest TU that uses them.
spin_scalar=u(t,0x52dfdc+4)[0]
assert v.check(img,hex(spin_scalar),'??_GCSpinButtonCtrl@@UAEPAXI@Z',names)[0]=='MATCH'
for symbol in ('??0CSpinButtonCtrl@@QAE@XZ','?SetRange@CSpinButtonCtrl@@QAEXFF@Z'):
    a,code=img.code(symbol)
    candidates=[]
    for r in v.read_tsv('data/tu_map.tsv'):
        if int(r['size'])!=len(code):continue
        if v.check(img,r['addr'],symbol,names)[0]!='MATCH':continue
        target,_=v.matcher.carve(r['addr'])
        if symbol.startswith('??0') and b'\xdc\xdf\x52\x00' not in target:continue
        for x,y in zip(md.disasm(target,int(r['addr'],16)),md.disasm(code,a)):
            for xo,yo in zip(x.operands,y.operands):
                if xo.type==MEM and xo.mem.disp in d['m']['retail_imports']:
                    assert d['m']['actual_imports'][yo.mem.disp]==d['m']['retail_imports'][xo.mem.disp]
        candidates.append(r['addr'])
    assert candidates,(symbol,len(code))
    print('SHARED HEADER:',symbol,len(code),'bytes; equal retail bodies',candidates)
runpy.run_path('workspace/research/gemini_review/test_sdk_context.py')
print('PASS: NewProjDlg, DlgEvent and TextureLayout FILE VERIFIED, including complete member-class helper and metadata bindings; no helper game credit')
