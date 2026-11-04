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
root=Path('workspace/research/codex_order')
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
pow_proof=json.loads(Path('workspace/research/codex_order/pow_proof.json').read_text())
assert pow_proof['retail_sha256']==hashlib.sha256(link.RETAIL.read_bytes()).hexdigest()
assert pow_proof['source_sha256']==hashlib.sha256(Path('workspace/research/codex_order/prove_pow.cpp').read_bytes()).hexdigest()
assert pow_proof['exit_code']==0 and not pow_proof['retail_entry_point_run']
assert len(pow_proof['cases'])==5 and new['0x004d7790']['symbol']=='_pow'
log_proof=json.loads(Path('workspace/research/codex_order/log_proof.json').read_text())
assert log_proof['retail_sha256']==hashlib.sha256(link.RETAIL.read_bytes()).hexdigest()
assert log_proof['source_sha256']==hashlib.sha256(Path('workspace/research/codex_order/prove_log.cpp').read_bytes()).hexdigest()
assert log_proof['exit_code']==0 and not log_proof['retail_entry_point_run']
assert len(log_proof['cases'])==5 and log_proof['address']=='0x004d7a20'
# Compare actual message dispatch IDs/signatures; callback bodies remain to be reconstructed.
image=verify.Linked();ours=pefile.PE(str(link.EXE),fast_load=True)
# The log wrapper is absent from the name table; prove its two actual caller bindings.
address,code=image.code('?FUN_00401cd0@CAdvCurveEditDlg@@QAEXM@Z')
target,_=verify.matcher.carve('0x00401cd0')
_,target_calls=verify.masks(target,0x401cd0)
_,actual_calls=verify.masks(code,address)
log_calls=[field for field,destination in target_calls.items() if destination==0x4d7a20]
assert len(log_calls)==2
for field in log_calls:assert '_log' in image.labels.get(actual_calls[field],())
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
 callback=verify.known_names().get(target[5])
 if callback:assert callback in image.labels.get(actual[5],()),(i,target[5],actual[5],callback)
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
# Relocation masking must still bind the shared state to the correct source globals.
controls=data_symbol('?g_curveControls@@')
assert ours.get_data(controls-ours.OPTIONAL_HEADER.ImageBase,96)==retail.get_data(0x58fb80-base,96)
selection=data_symbol('?g_curveSelection@@')
subclass=data_symbol('?g_curveSubclass@@')
assert ours.get_data(selection-ours.OPTIONAL_HEADER.ImageBase,84)==retail.get_data(0x58fa58-base,84)
assert ours.get_data(subclass-ours.OPTIONAL_HEADER.ImageBase,204)==retail.get_data(0x58fab0-base,204)
presets = []
for start, count, symbol in ((0x58f9fc, 8, '?g_curveScalePresets@@'), (0x58fa1c, 7, '?g_curveSecondPresets@@'), (0x58fa38, 7, '?g_curveFirstPresets@@')):
 actual_address = data_symbol(symbol)
 target_pointers = struct.unpack('<%dI' % count, retail.get_data(start-base, 4*count))
 actual_pointers = struct.unpack('<%dI' % count, ours.get_data(actual_address-ours.OPTIONAL_HEADER.ImageBase, 4*count))
 for target_pointer, actual_pointer in zip(target_pointers, actual_pointers):
  target_string = retail.get_data(target_pointer-base, 128).split(b'\0', 1)[0]
  actual_string = ours.get_data(actual_pointer-ours.OPTIONAL_HEADER.ImageBase, 128).split(b'\0', 1)[0]
  assert target_string == actual_string, (symbol, target_string, actual_string)
 presets.append((start, 4*count, actual_address))
assert [item[2] for item in presets] == sorted(item[2] for item in presets)
assert presets[-1][2]<selection<subclass<controls,(presets,selection,subclass,controls)
globals_map=[(0x58fa58,84,selection),(0x58fab0,204,subclass),(0x58fb80,96,controls),(0x1233488,4,data_symbol('?g_curveParent@@')),(0x123348c,4,data_symbol('?g_curveUpdatePending@@'))]
globals_map.extend(presets)
globals_map.append((0x401860,1,image.syms['?FUN_00401860@@YGJPAUHWND__@@IIJ@Z']))
def import_names(pe):
 pe.parse_data_directories(directories=[pefile.DIRECTORY_ENTRY['IMAGE_DIRECTORY_ENTRY_IMPORT']])
 return {item.address:(entry.dll.lower(),item.name or item.ordinal) for entry in pe.DIRECTORY_ENTRY_IMPORT for item in entry.imports}
retail_imports=import_names(retail);actual_imports=import_names(ours)
bound=0;import_bound=0
for row in read('ledger/matches.tsv'):
 if row['source']!='src/radiant/AdvCurveDlg.cpp':continue
 target,_=verify.matcher.carve(row['addr']);address,actual=image.code(row['symbol'])
 for original,reconstructed in zip(md.disasm(target,int(row['addr'],16)),md.disasm(actual,address)):
  for operand,replacement in zip(original.operands,reconstructed.operands):
   if operand.type==X86_OP_IMM:value=operand.imm
   elif operand.type==X86_OP_MEM:value=operand.mem.disp
   else:continue
   if operand.type==X86_OP_MEM and value in retail_imports:
    assert replacement.type==X86_OP_MEM
    assert actual_imports.get(replacement.mem.disp)==retail_imports[value],(row['addr'],retail_imports[value])
    import_bound+=1
   for start,size,mapped in globals_map:
    if not start<=value<start+size:continue
    assert replacement.type==operand.type
    actual_value=replacement.imm if operand.type==X86_OP_IMM else replacement.mem.disp
    assert actual_value==mapped+value-start,(row['addr'],hex(value),hex(actual_value))
    bound+=1
assert bound>=20,bound
assert import_bound>=20,import_bound
names=verify.known_names()
for address in ('0x00401000','0x00401090','0x004010c0','0x00401180','0x00401310','0x00401340','0x00401450','0x00401550','0x00401560','0x00401580'):
 symbol=names[int(address,16)]
 assert image.syms[symbol]==int(address,16),(address,symbol)
 assert verify.check(image,address,symbol,names)[0]=='MATCH',address
print('PASS: live flags/bindings, 20 dispatch entries, virtual routing, shared data bindings, ten exact retail addresses')
