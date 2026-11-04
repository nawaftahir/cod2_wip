"""Whole-file xmodel_utils retail audit (11 code bodies plus data binding).

Do not count this file complete unless the unchanged referee, the exact
retail TU inventory, object ownership, emit order, code gaps, literal bindings,
and cross-function static-data references all agree.
"""
import sys
sys.path.insert(0, 'tools')
import verify as v
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

SOURCE = 'src/xanim/xmodel_utils.cpp'
START, END = 0x004acb50, 0x004acfbe
img = v.Linked()
ret = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
names = v.known_names()
mapped = sorted([r for r in v.read_tsv('data/tu_map.tsv')
                 if r['tu'] in (SOURCE, SOURCE.removeprefix('src/'))],
                key=lambda r: int(r['addr'],16))
rows = sorted([r for r in v.read_tsv('ledger/matches.tsv')
               if r['source']==SOURCE],
              key=lambda r: int(r['addr'],16))
assert len(rows)==len(mapped)==11, ('unaccounted xmodel entry',len(rows),len(mapped))
assert {(r['addr'],r['size']) for r in rows}=={(r['addr'],r['size']) for r in mapped}
assert not [r for r in v.read_tsv('ledger/compiler.tsv') if r['source']==SOURCE]
wanted={r['symbol'] for r in rows}
actual=set(img.of_source(SOURCE))
assert actual==wanted, {'missing':wanted-actual,'extra':actual-wanted}
assert [img.syms[r['symbol']] for r in rows]==sorted(img.syms[r['symbol']] for r in rows)

def read(pe,a,n):
    data=pe.get_data(a-pe.OPTIONAL_HEADER.ImageBase,n)
    assert len(data)==n,(hex(a),n)
    return data
def string(pe,a):
    section=pe.get_section_by_rva(a-pe.OPTIONAL_HEADER.ImageBase)
    if section is None or (section.Characteristics&0x20000000):return None
    # Match referenced printable strings, not accidental fragments of numeric data
    raw=read(pe,a,192).split(b'\0',1)[0]
    if len(raw)<3 or not all(32<=b<=126 for b in raw):return None
    return raw

md=v.matcher.Cs(v.matcher.CS_ARCH_X86,v.matcher.CS_MODE_32)
md.detail=True
cursor=START
string_pairs=0
cross={}
for row in rows:
    ta,sz=int(row['addr'],16),int(row['size'])
    assert START<=ta and ta+sz<=END and ta>=cursor
    assert set(read(ret,cursor,ta-cursor))<={0x90,0xcc},(hex(cursor),hex(ta))
    status,why=v.check(img,row['addr'],row['symbol'],names)
    assert status=='MATCH',(row['symbol'],status,why)
    tcode=read(ret,ta,sz)
    oa,ocode=img.code(row['symbol'])
    assert len(ocode)==sz
    t_ins=list(md.disasm(tcode,ta))
    o_ins=list(md.disasm(ocode,oa))
    assert len(t_ins)==len(o_ins),(row['symbol'],len(t_ins),len(o_ins))
    for ti,oi in zip(t_ins,o_ins):
        assert (ti.address-ta)==(oi.address-oa) and ti.mnemonic==oi.mnemonic
        for a,b in zip(ti.operands,oi.operands):
            if a.type==b.type==X86_OP_IMM:
                left,right=a.imm,b.imm
                ts=string(ret,left) if ret.OPTIONAL_HEADER.ImageBase<=left<ret.OPTIONAL_HEADER.ImageBase+ret.OPTIONAL_HEADER.SizeOfImage else None
                if ts:
                    os=string(img.pe,right)
                    assert os==ts,(row['symbol'],hex(ti.address),ts,os)
                    string_pairs+=1
            if a.type==b.type==X86_OP_MEM:
                # Compare aliasing of the absolute BSS/static references across
                # all functions: two original uses of a global must hit the
                # same candidate global, not unrelated zero-initialized memory.
                left,right=a.mem.disp,b.mem.disp
                if (a.mem.base==0 and a.mem.index==0 and
                    0x01000000<=left<0x01300000 and
                    img.base<=right<img.base+img.pe.OPTIONAL_HEADER.SizeOfImage):
                    prev=cross.setdefault(left,right)
                    assert prev==right,(row['symbol'],hex(left),hex(prev),hex(right))
    cursor=ta+sz
assert set(read(ret,cursor,END-cursor))<={0x90,0xcc},(hex(cursor),hex(END))
assert sum(int(r['size']) for r in rows)==1090
assert string_pairs>=3, ('insufficient source-to-retail literals',string_pairs)
assert len(cross)>=4, ('static binding evidence absent',cross)
# Linking must preserve the real script caller after reconstruction.
assert names[0x004a87b0]=='_SL_GetString'
print('PASS:', SOURCE, '11/11 routines, 1090 B; 44 B padding;',
      string_pairs,'literal bindings;',len(cross),
      'consistent static data references; no extra source-owned functions')
