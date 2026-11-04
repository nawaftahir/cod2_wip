"""The real single export must populate all98 callback addresses in their retail slots."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import build_dir
import json
import sys
import capstone
import pefile
w=Path(__file__).resolve().parents[1];b=build_dir()
sys.path.insert(0,str(w.parents[1]/'tools'))
from pdbsyms import map_symbols
image=pefile.PE(str(b/'gfx.dll'));base=image.OPTIONAL_HEADER.ImageBase
exports=image.DIRECTORY_ENTRY_EXPORT.symbols
assert len(exports)==1 and exports[0].name==b'GetRefAPI' and exports[0].ordinal==1
entry=base+exports[0].address
symbols={name:va for va,name,obj,isfn in map_symbols(b/'gfx.map',str(b/'gfx.dll'),str(b/'gfx.pdb')) if isfn}
rows=json.loads((w/'proof/latest/api59_source_inventory.json').read_text())
assert len(rows)==98 and len({r['slot'] for r in rows})==98
oracle=json.loads((w/'proof/retail/refapi_pinned.json').read_text())
assert {r['slot']:r['target'] for r in rows}=={s['slot']:s['target'] for s in oracle['slots'] if s['target']!='0x0'}
bind=json.loads((b/'bind.json').read_text());assert bind['_GetRefAPI']=={'t':'0x10013270','n':1051,'obj':'r_init.obj','why':[]}
md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32);md.detail=True
text=next(s for s in image.sections if s.Name.rstrip(b'\0')==b'.text');lo=base+text.VirtualAddress;hi=lo+text.Misc_VirtualSize
stores={}
for ins in md.disasm(image.get_data(entry-base,1051),entry):
 if ins.mnemonic!='mov' or len(ins.operands)!=2:continue
 dest,value=ins.operands
 if dest.type==capstone.x86.X86_OP_MEM and not dest.mem.base and not dest.mem.index and value.type==capstone.x86.X86_OP_IMM and lo<=value.imm<hi:
  assert dest.mem.disp not in stores;stores[dest.mem.disp]=value.imm
assert len(stores)==98
start=min(stores);assert {int((p-start)/4) for p in stores}=={r['slot'] for r in rows}
for r in rows:
 name=r['name'];hits={va for sym,va in symbols.items() if sym.startswith('?'+name+'@@') or sym=='_'+name}
 assert len(hits)==1,(name,hits)
 assert stores[start+4*r['slot']]==hits.pop(),r
assert image.get_memory_mapped_image()[start-base:start-base+432]==bytes(432)
print('PASS: sole retail export/ordinal,1051-byte initializer bound,98 linked callback targets in correct slots,432-byte zero table')
