for sz in 320 31c 318 314 310 30c; do
  sed -i "s/unsigned char frm\[0x[0-9a-f]*\];/unsigned char frm[0x$sz];/" src/tu/addlight.c
  cl -c -nologo -W0 /O2 src/tu/addlight.c /Fobuild/objs_red/fp.obj >/dev/null 2>&1
  sub=$(python3 - <<PY
import sys;sys.path.insert(0,'tools'); import match_gfx as M
from capstone import *
blob=open('build/objs_red/fp.obj','rb').read()
coff=M.parse_coff(blob)
for k,s in enumerate(coff['sections']):
    if s['flags']&0x20 and s['rawsize']:
        data=blob[s['rawptr']:s['rawptr']+s['rawsize']]
        for i in Cs(CS_ARCH_X86,CS_MODE_32).disasm(data,0):
            if i.mnemonic=='sub': print(hex(i.op_str) if False else i.op_str); break
        break
PY
)
  echo "frm=0x$sz sub=$sub"
done
