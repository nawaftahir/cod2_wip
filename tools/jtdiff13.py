#!/usr/bin/env python3
# jtdiff13.py EXE MAP: jump-table / code-pointer dwords in .text that differ from retail (the referee masks them), grouped by function.
# Same code, other table target = another cross-jump survivor (see KNOWLEDGE 17).
import pefile,struct,re,bisect,sys
import os
R=os.path.dirname(os.path.abspath(__file__))+'/../../../'
a=pefile.PE(R+'binaries/windows/1.3/CoD2MP_s.exe'); b=pefile.PE(sys.argv[1])
ta=a.sections[0]; tb=b.sections[0]
da=ta.get_data(); db=tb.get_data()
base=0x401000
lo,hi=0x401000,0x401000+len(da)
syms=[]
for l in open(sys.argv[2],errors='replace'):
    m=re.match(r'\s+0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f',l)
    if m: syms.append((int(m.group(2),16),m.group(1)))
syms.sort(); ad=[s[0] for s in syms]
out={}
n=len(da)
for o in range(0,n-3,4):
    x=struct.unpack_from('<I',da,o)[0]; y=struct.unpack_from('<I',db,o)[0]
    if x!=y and lo<=x<hi and lo<=y<hi:
        i=bisect.bisect_right(ad,base+o)-1
        out.setdefault(syms[i][1] if i>=0 else '?',[]).append((hex(base+o),hex(x),hex(y)))
for k,v in sorted(out.items(),key=lambda kv:-len(kv[1]))[:40]: print(len(v),k,v[0])
print(len(out),'fns',sum(len(v) for v in out.values()),'dwords')
