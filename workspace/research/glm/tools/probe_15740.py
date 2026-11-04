import os,subprocess,sys
BASE=os.getcwd()
subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work/src/draft",
 "cod2-msvc71","sh","-c","cl /nologo /W0 /O2 /c 10015740_FUN_10015740.c /Fo../../build/objs_red/p15.obj"],
 capture_output=True)
sys.path.insert(0,'tools'); import match_gfx as M
from capstone import *
blob=open('build/objs_red/p15.obj','rb').read()
coff=M.parse_coff(blob)
for k,s in enumerate(coff['sections']):
    if s['flags']&0x20 and s['rawsize']:
        data=blob[s['rawptr']:s['rawptr']+s['rawsize']]
        md=Cs(CS_ARCH_X86,CS_MODE_32); n=0
        for i in md.disasm(data,0):
            if i.mnemonic=='call':
                print(f"+{i.address:#x} call {i.op_str}")
                n+=1
            if i.mnemonic=='jmp' and n>0:
                print(f"+{i.address:#x} jmp {i.op_str}")
        print("relocs:",[r['vaddr'] for r in s.get('relocs',[])][:10])
