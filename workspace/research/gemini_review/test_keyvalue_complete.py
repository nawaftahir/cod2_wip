"""Check the complete KeyValueSelect dialog, including the real control array."""
import sys,runpy,struct
sys.argv=['test_dialog_completion.py','keyvalue']
d=runpy.run_path('workspace/research/gemini_review/test_dialog_completion.py')
v,img,t,o,u,sym=(d[k] for k in ('v','img','t','o','u','sym'))
names=v.known_names();md=d['m']['md'];MEM=d['m']['X86_OP_MEM']
d['dialog']('CKeyValueSelectDlg',0x410e40,0x411030,0x540fb4,0x410f60,0x411040,3)
assert v.check(img,'0x00410f90','??1CKeyValueSelectDlg@@UAE@XZ',names)[0]=='MATCH'
# The new source uses the compiler's destructor, not an authored game routine.
assert not any(int(r['addr'],16)==0x410f90 for r in v.read_tsv('ledger/matches.tsv'))
ca,cc=img.code(names[0x410e40]);target,_=v.matcher.carve('0x00410e40')
actual=sym('?hwndEnt@@');imports=controls=cookies=0
for a,b in zip(md.disasm(target,0x410e40),md.disasm(cc,ca)):
    for x,y in zip(a.operands,b.operands):
        if x.type!=MEM:continue
        if x.mem.disp in (0x1129a1c,0x1129a24):
            assert y.mem.disp==actual+x.mem.disp-0x11299b0;controls+=1
        if x.mem.disp==0x58ea68:
            assert y.mem.disp==sym('___security_cookie');cookies+=1
        if x.mem.disp in d['m']['retail_imports']:
            assert d['m']['actual_imports'][y.mem.disp]==d['m']['retail_imports'][x.mem.disp];imports+=1
assert controls==2 and cookies==1 and imports>=1,(controls,cookies,imports)
def loaded(pe,a,n):
    rva=a-pe.OPTIONAL_HEADER.ImageBase
    section=pe.get_section_by_rva(rva);assert section is not None
    assert rva+n<=section.VirtualAddress+section.Misc_VirtualSize
    available=max(0,min(n,section.SizeOfRawData-(rva-section.VirtualAddress)))
    return pe.get_data(rva,available)+bytes(n-available)
assert loaded(t,0x11299b0,132)==loaded(o,actual,132)==bytes(132)
entity_code,_=v.matcher.carve('0x00476f10')
assert bytes.fromhex('81fe84000000') in entity_code
assert bytes.fromhex('8986b0991201') in entity_code
handler=img.syms['__ehhandler$??0CKeyValueSelectDlg@@QAE@PAVCWnd@@@Z']
left,right=d['blob'](0x52549e,handler,10)
infos=[u(pe,int.from_bytes(code[1:5],'little'),7) for pe,code in ((t,left),(o,right))]
assert infos[0][:2]==infos[1][:2]==(0x19930520,3) and infos[0][3:]==infos[1][3:]==(0,0,0,0)
# Each cleanup ends in a direct destructor jump; compare every byte and callee.
for j in range(3):
    x,y=u(t,infos[0][2]+8*j,2),u(o,infos[1][2]+8*j,2);assert x[0]==y[0]
    n=None
    for ins in md.disasm(t.get_data(x[1]-0x400000,32),x[1]):
        if ins.mnemonic=='jmp':n=ins.address+ins.size-x[1];break
    assert n in (8,11)
    d['blob'](x[1],y[1],n)
    print('UNWIND:',hex(x[1]),n,'bytes')
print('PASS: KeyValueSelectDlg FILE VERIFIED; 3 game routines / 360 B, separate 33/65 B destructors, full normalized class/EH data, control-array ownership/bounds, cookie and imports')
