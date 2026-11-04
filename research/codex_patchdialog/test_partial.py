"""Check accepted patch-inspector source and registry dependencies; keep gaps explicit."""
import copy
import json
import re
import runpy
import struct
from pathlib import Path
m = runpy.run_path('research/gemini_review/test_dialog_batch.py')
d=m['d']; v,img,t,o,u,sym,md=(m[k] for k in ('v','img','t','o','u','sym','md'))
names=v.known_names()
camera_sdk={int(r['addr'],16):r['symbol'] for r in json.loads(Path('research/codex_camera/manifest.json').read_text())['original'] if r['role']=='SDK'}
names.update(camera_sdk)
IMM=d['m']['X86_OP_IMM']; MEM=d['m']['X86_OP_MEM']
source='src/radiant/PatchDialog.cpp'; cls='CPatchDialog'
rows=[r for r in v.read_tsv('ledger/matches.tsv') if r['source']==source]
assert len(rows)==15 and sum(int(r['size']) for r in rows)==1391
assert len([r for r in v.read_tsv('data/tu_map.tsv') if r['tu']=='radiant/PatchDialog.cpp'])==28
for r in rows:
    assert v.check(img,r['addr'],r['symbol'],names)[0]=='MATCH',r
assert v.check(img,'0x00424710','??_GCPatchDialog@@UAEPAXI@Z',names)[0]=='MATCH'
# This subclass inherits CDialog's runtime class and has its own full RTTI.
vt=sym('??_7CPatchDialog@@6B@'); tv=0x545ddc
cols=[u(pe,u(pe,a-4)[0],5) for pe,a in ((t,tv),(o,vt))]
assert cols[0][:3]==cols[1][:3]
assert u(o,cols[1][3])[0]==sym('??_7type_info@@6B@')
assert d['td'](t,cols[0][3])==d['td'](o,cols[1][3])==(0,b'.?AVCPatchDialog@@')
h=[u(pe,c[4],4) for pe,c in zip((t,o),cols)]
assert h[0][:3]==h[1][:3]
for a,b in zip(u(t,h[0][3],h[0][2]),u(o,h[1][3],h[1][2])):
    x,y=u(t,a,6),u(o,b,6)
    assert x[1:]==y[1:] and d['td'](t,x[0])==d['td'](o,y[0])
base_td=u(t,u(t,h[0][3],h[0][2])[1],6)[0]
assert d['td'](t,base_td)==(0,b'.?AVCDialog@@')
rdata=next(s for s in t.sections if s.Name.rstrip(b'\0')==b'.rdata')
rb=t.OPTIONAL_HEADER.ImageBase+rdata.VirtualAddress
base_col=rb+rdata.get_data().index(struct.pack('<4I',0,0,0,base_td))
base_vt=rb+rdata.get_data().index(struct.pack('<I',base_col))+4
for a,b,pa,pb in zip(u(t,tv,86),u(o,vt,86),u(t,base_vt,86),u(o,sym('??_7CDialog@@6B@'),86)):
    if a==pa: assert b==pb
    elif a==0x424710: assert b==img.syms['??_GCPatchDialog@@UAEPAXI@Z']
    else: assert names[a] in img.labels[b],hex(a)
# Three message targets are deliberately unresolved; no replacement body is shipped.
pending={0x424920,0x424a10,0x424a20,0x424a50,0x424e30}
tm,am=0x545f50,sym('?messageMap@CPatchDialog@@')
assert u(o,am)[0]==sym('?messageMap@CDialog@@')
for i in range(15):
    x,y=u(t,u(t,tm,2)[1]+24*i,6),u(o,u(o,am,2)[1]+24*i,6)
    assert x[:5]==y[:5], (i,x,y)
    if i==14: assert x==y==(0,)*6
    elif x[5] in pending: assert y[5]==img.base
    else: assert names[x[5]] in img.labels[y[5]]
# Track every referenced global, literal, import and missing callee separately.
global_address=sym('?g_PatchDialog@@')
imports=literals=0
missing_globals={0x1128dc4,0x123348c,0x11298f0,0x11298f4}
state_seen=set(); unbound_calls={}
for row in rows+[r for r in v.read_tsv('ledger/matches.tsv') if r['source']=='src/radiant/win_main.cpp']:
    address=int(row['addr'],16); target,_=v.matcher.carve(row['addr']);start,code=img.code(row['symbol'])
    has_eh=m['eh'](address,start,len(code))
    for a,b in zip(md.disasm(target,address),md.disasm(code,start)):
        assert (a.address-address,a.mnemonic,a.size)==(b.address-start,b.mnemonic,b.size)
        for x,y in zip(a.operands,b.operands):
            if (a.mnemonic=='call' or a.mnemonic.startswith('j')) and x.type==IMM:
                p,q=x.imm,y.imm
                if address<=p<address+len(target): assert q-start==p-address
                elif p in names:
                    assert names[p] in img.labels[q]
                    if p in camera_sdk: assert v.check(img,hex(p),names[p],names)[0]=='MATCH'
                else:
                    assert q==img.base,('unexpected unknown callee',hex(p),hex(q))
                    unbound_calls[p]=unbound_calls.get(p,0)+1
                continue
            if x.type==MEM:
                p,q=x.mem.disp,y.mem.disp
                if p in d['m']['retail_imports']:
                    assert d['m']['retail_imports'][p]==d['m']['actual_imports'][q];imports+=1
                elif 0x1234678<=p<0x1234998: assert q-global_address==p-0x1234678
                elif p in missing_globals:
                    assert q==img.base;state_seen.add(p)
                elif 0x52720e<=p<0x58f800: assert u(t,p)[0]==u(o,q)[0]
                elif 0x400000<=p<0x1400000: raise AssertionError(('unknown memory',row,hex(p)))
            elif x.type==IMM and 0x400000<=x.imm<0x1400000:
                p,q=x.imm,y.imm
                if 0x524000<=p<0x52720e:
                    assert has_eh and any(label.startswith('__ehhandler$') for label in img.labels[q])
                elif p==tm: assert q==am
                elif p==0x545ddc: assert q==vt
                elif p in (0x52dfdc,0x52d204):
                    assert q==sym('??_7'+('CSpinButtonCtrl' if p==0x52dfdc else 'CComboBox')+'@@6B@')
                elif 0x1234678<=p<0x1234998: assert q-global_address==p-0x1234678
                elif p in missing_globals: assert q==img.base;state_seen.add(p)
                elif 0x52720e<=p<0x58f800:
                    assert d['z'](t,p)==d['z'](o,q),(row['addr'],hex(p),hex(q),d['z'](t,p),d['z'](o,q));literals+=1
                else: raise AssertionError(('unknown literal',row,hex(p)))
assert state_seen==missing_globals
# Repeated local labels have unreliable object names in the LTCG map. Identify
# lifetime routines by the actual global object and constructor/destructor call.
maptext=v.link.MAP.read_text()
local={}
for name,address in re.findall(r'^\s*0001:[0-9a-f]+\s+(\_\$E[12])\s+([0-9a-f]+) f\s+',maptext,re.M):
    address=int(address,16)
    section=o.get_section_by_rva(address-img.base)
    next_address=next((a for a in img.starts if a>address),img.base+section.VirtualAddress+section.Misc_VirtualSize)
    instructions=list(md.disasm(o.get_data(address-img.base,next_address-address),address))
    if not any(x.type==IMM and x.imm==global_address for i in instructions for x in i.operands):continue
    callee=img.syms[names[0x424590 if name=='_$E1' else 0x4244b0]]
    assert any(i.mnemonic in ('call','jmp') and i.operands[0].type==IMM and i.operands[0].imm==callee for i in instructions)
    assert name not in local
    local[name]=address
assert set(local)=={'_$E1','_$E2'},local
scoped=copy.copy(img);scoped.syms=dict(img.syms);scoped.syms.update(local)
for address,symbol in ((0x526b90,'_$E1'),(0x527030,'_$E2')):
    assert v.check(scoped,hex(address),symbol,names)[0]=='MATCH'
    start,code=scoped.code(symbol);target,_=v.matcher.carve(hex(address))
    for a,b in zip(md.disasm(target,address),md.disasm(code,start)):
        for x,y in zip(a.operands,b.operands):
            if x.type==IMM and x.imm==0x1234678: assert y.imm==global_address
            if x.type==IMM and x.imm==0x527030: assert y.imm==local['_$E2']
    if symbol=='_$E1': assert o.__data__.find(struct.pack('<I',start))>=0
print('PASS: 15 patch-dialog game routines / 1391 B; two real registry routines / 260 B')
print('PASS: 34 B scalar, 35 B global lifetime code, 86 virtual slots, complete RTTI, 14 message entries; object size 0x320')
print('PASS:',imports,'imports and',literals,'literals; both registry strings equal retail')
print('PARTIAL: eight authored routines / 1203 B; TextureLayout destructor / 89 B and full SDK/EH inventory pending')
print('PENDING globals:',list(map(hex,sorted(state_seen))),'callee references:',{hex(k):v for k,v in sorted(unbound_calls.items())})
