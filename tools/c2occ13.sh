#!/bin/bash
# c2occ13.sh MANGLED OUT [N]: per local pick, log start pointer, each candidate reg with its occupant and the conflict-bitset test
cd "$(dirname "$0")/.."
N=${3:-160}
{ echo cont; echo "break *0x10775b43"; echo "break *0x10775b66"; echo "break *0x10775baf"; echo "break *0x1077687e"
  for i in $(seq $N); do echo cont; echo 'p/x $eax'; echo 'p/x $ecx'; echo 'p/x $esi'; echo 'p/x $ebx'; echo 'x/4x 0x108a74f0'; done; echo quit; } > build/ra/occ.cmd
[ -n "$PARSE_ONLY" ] || bash tools/c2dbg13.sh "$1" build/ra/occ.cmd > /dev/null 2>&1
python3 - build/ra/dbg.out > $2 <<'PY'
import re,sys
t=open(sys.argv[1],errors='replace').read()
names={'10775b43':'START','10775b66':'OCC','10775baf':'BITS','1077687e':'PICK'}
R={1:'eax',2:'ecx',3:'edx'}
cur=None; vals=[]; occ=[]
def out():
    if not cur: return
    e,c,s,b=(vals+['0x0']*4)[:4]
    if cur=='START': print(f"START t={b} ptr={e} occ eax={occ[1] if len(occ)>3 else '?'} ecx={occ[2] if len(occ)>3 else '?'} edx={occ[3] if len(occ)>3 else '?'}")
    elif cur=='OCC': print(f"  cand {R.get(int(s,16),s)} occupant={c}")
    elif cur=='BITS': print(f"  cand {R.get(int(s,16),s)} conflictbit={b}")
    else: print(f"  PICK {R.get(int(s,16),s)} cls={c}")
for line in t.splitlines():
    m=re.search(r'Stopped on breakpoint \d+ at 0x([0-9a-f]+)',line)
    if m:
        out(); cur=names.get(m.group(1),m.group(1)); vals=[]; occ=[]; continue
    m=re.match(r'\s*(0x[0-9a-f]+|0)\s*$',line)
    if m and cur: vals.append(m.group(1)); continue
    m=re.match(r'\s*0x108a74f0:\s+((?:[0-9a-f]{8}\s*){4})',line)
    if m and cur: occ=m.group(1).split()
out()
PY
