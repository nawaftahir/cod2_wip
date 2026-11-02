"""API address stores need paired relocations,writable destinations and unique pointees."""
from pathlib import Path
import ast
import capstone
import struct
w=Path(__file__).resolve().parents[1];gfx=w.parents[1]
tree=ast.parse((gfx/'tools/bindcheck.py').read_text());fn=next(n for n in tree.body if isinstance(n,ast.FunctionDef) and n.name=='api_pointer_places')
md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ns=dict(md=md,osecs='ours',asecs='target',secname=lambda sections,a:'.data' if 0x20000000<=a<0x20001000 else '.text')
exec(compile(ast.Module(body=[fn],type_ignores=[]),'<actual-api-pointer-helper>','exec'),ns);place=ns['api_pointer_places']
def store(dest,fn):return b'\xc7\x05'+struct.pack('<II',dest,fn)
va=0x10001000;t=0x10002000;ov=0x10003000;tv=0x10004000
ours=store(0x20000000,ov)+b'\xc3';target=store(0x20000100,tv)+b'\xc3';orel={va+2,va+6};arel={t+2,t+6}
assert place(ours,target,va,t,orel,arel)=={ov:tv}
for missing in orel:assert place(ours,target,va,t,orel-{missing},arel)=={}
for missing in arel:assert place(ours,target,va,t,orel,arel-{missing})=={}
assert place(ours,b'\x90'+target[1:],va,t,orel,arel)=={}
assert place(store(0x10005000,ov),target,va,t,orel,arel)=={}
assert place(ours,store(0x10006000,tv),va,t,orel,arel)=={}
assert place(ours,target,va,t,set(),set())=={}
ours2=ours[:-1]+store(0x20000004,ov)+b'\xc3';target2=target[:-1]+store(0x20000104,tv+16)+b'\xc3'
assert place(ours2,target2,va,t,orel|{va+12,va+16},arel|{t+12,t+16})=={}
assert place(b'\xc3',b'\xc3',va,t,set(),set())=={}
print('PASS: actual paired API store extraction;missing relocations,wrong opcodes,non-data destinations,ambiguous targets and unreferenced RET rejected')
