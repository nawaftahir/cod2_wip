"""Check the bounded config changes and their target-binary evidence."""
from pathlib import Path
import csv
import hashlib
import json
import re
import struct
import sys
sys.path.insert(0,'tools')
import link
import verify
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_MEM, X86_OP_IMM
root=Path('research/codex_order')
def read(path):
 lines=[line for line in Path(path).read_text().splitlines() if line and not line.startswith('#')]
 return list(csv.DictReader(lines,delimiter='\t'))
flags=link.flags_for('src/radiant/AdvCurveDlg.cpp')
assert set(('/O2','/Oy-','/Op','/GS','/GL','/GX','/GR'))<=set(flags)
new={r['addr']:r for r in read('data/lib_funcs.tsv')}
fixes=json.loads((root/'library_bindings.json').read_text())
for address,fix in fixes.items():
 assert new[address]['symbol']==fix['symbol']
 assert new[address]['member']==fix['member']
 assert int(new[address]['size'])==len(verify.matcher.carve(address)[0])
# Verify each corrected MFC type from the destructor's own vtable store and RTTI.
retail=pefile.PE(str(link.RETAIL),fast_load=True);base=retail.OPTIONAL_HEADER.ImageBase
md=Cs(CS_ARCH_X86,CS_MODE_32);md.detail=True
for address,expected in [('0x00516647','CButton'),('0x005168e8','CEdit'),('0x004f57ba','CSliderCtrl')]:
 code,_=verify.matcher.carve(address);types=[]
 for ins in md.disasm(code,int(address,16)):
  if ins.mnemonic!='mov' or len(ins.operands)!=2 or ins.operands[0].type!=X86_OP_MEM or ins.operands[1].type!=X86_OP_IMM:continue
  value=ins.operands[1].imm
  if not base<value<base+retail.OPTIONAL_HEADER.SizeOfImage:continue
  try:
   locator=struct.unpack('<I',retail.get_data(value-base-4,4))[0]
   fields=struct.unpack('<5I',retail.get_data(locator-base,20))
   name=retail.get_data(fields[3]-base+8,100).split(b'\0',1)[0].decode('ascii')
  except (struct.error,UnicodeDecodeError):continue
  types.append(name)
 assert '.?AV'+expected+'@@' in types,(address,types)
 assert new[address]['symbol']=='??1'+expected+'@@UAE@XZ'
pow_proof=json.loads(Path('research/codex_order/pow_proof.json').read_text())
assert pow_proof['retail_sha256']==hashlib.sha256(link.RETAIL.read_bytes()).hexdigest()
assert pow_proof['source_sha256']==hashlib.sha256(Path('research/codex_order/prove_pow.cpp').read_bytes()).hexdigest()
assert pow_proof['exit_code']==0 and not pow_proof['retail_entry_point_run']
assert len(pow_proof['cases'])==5 and new['0x004d7790']['symbol']=='_pow'
# Compare actual message dispatch IDs/signatures; callback bodies remain to be reconstructed.
image=verify.Linked();ours=pefile.PE(str(link.EXE),fast_load=True)
mapping=link.MAP.read_text(errors='replace')
def data_symbol(prefix):
 match=re.search(r'^\s+\d{4}:[0-9a-f]{8}\s+'+re.escape(prefix)+r'\S*\s+([0-9a-f]{8})\s',mapping,re.M)
 assert match,prefix
 return int(match[1],16)
entries=data_symbol('?_messageEntries@CAdvCurveEditDlg@@')-ours.OPTIONAL_HEADER.ImageBase
parent,entry_pointer=struct.unpack('<2I',ours.get_data(data_symbol('?messageMap@CAdvCurveEditDlg@@')-ours.OPTIONAL_HEADER.ImageBase,8))
assert parent==data_symbol('?messageMap@CDialog@@')
assert entry_pointer==entries+ours.OPTIONAL_HEADER.ImageBase
for i in range(21):
 target=struct.unpack('<6I',retail.get_data(0x53d558-base+24*i,24))
 actual=struct.unpack('<6I',ours.get_data(entries+24*i,24))
 assert target[:5]==actual[:5],(i,target,actual)
 if i==20:assert actual==(0,0,0,0,0,0)
vtable=data_symbol('??_7CAdvCurveEditDlg@@6B@')-ours.OPTIONAL_HEADER.ImageBase
for slot,address in [(1,0x401310),(10,0x401550),(61,0x401450)]:
 assert struct.unpack('<I',ours.get_data(vtable+4*slot,4))[0]==address
for slot,target in ((68,0x401aa0),(81,0x4018e0),(83,0x401770),(84,0x401580)):
 actual=struct.unpack('<I',ours.get_data(vtable+4*slot,4))[0]
 names=verify.known_names()
 if target in names:
  assert names[target] in image.labels.get(actual,()),(slot,target,actual)
 else:
  assert actual==ours.OPTIONAL_HEADER.ImageBase,(slot,target,actual)
names=verify.known_names()
for address in ('0x00401000','0x00401090','0x004010c0','0x00401180','0x00401310','0x00401340','0x00401450','0x00401550'):
 symbol=names[int(address,16)]
 assert image.syms[symbol]==int(address,16),(address,symbol)
 assert verify.check(image,address,symbol,names)[0]=='MATCH',address
print('PASS: live first-TU flags, four proven library identities, 20 dispatch entries, verified virtual routing, eight exact retail RVAs')
