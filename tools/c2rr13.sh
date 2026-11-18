#!/bin/bash
# c2rr13.sh WT MANGLED OUT [N]: log c2 round-robin resets/sets/picks for one fn (WT ignored; runs in this tree)
cd "$(dirname "$0")/.."; shift 0
N=${4:-80}
{ echo cont; echo "break *0x10775844"; echo "break *0x107dff94"; echo "break *0x10776893"; echo "break *0x1077687e"
  for i in $(seq $N); do echo cont; echo 'p/x $eax'; echo 'p/x $ecx'; echo 'p/x $esi'; done; echo quit; } > build/ra/rr.cmd
bash tools/c2dbg13.sh "$2" build/ra/rr.cmd > /dev/null 2>&1
python3 - build/ra/dbg.out > $3 <<'PY'
import re,sys
t=open(sys.argv[1],errors='replace').read()
names={'10775844':'RESETfn','107dff94':'RESET2d3','10776893':'SET','1077687e':'PICK'}
cur=None; vals=[]
for line in t.splitlines():
    m=re.search(r'Stopped on breakpoint \d+ at 0x([0-9a-f]+)',line)
    if m:
        if cur: print(cur,*vals)
        cur=names.get(m.group(1),m.group(1)); vals=[]; continue
    m=re.match(r'\s*(0x[0-9a-f]+)\s*$',line)
    if m and cur: vals.append(m.group(1))
if cur: print(cur,*vals)
PY
