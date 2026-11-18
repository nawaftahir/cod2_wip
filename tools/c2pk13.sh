#!/bin/bash
# c2pk13.sh MANGLED N OUT: two winedbg passes; per pick: reg, regclass(ebp), temp(esp+0x18), ptrA(esp+8), ptrB(esp+0xc), and 8 dwords at ptrA/ptrB
cd "$(dirname "$0")/.."
N=${2:-60}
{ echo cont; echo "break *0x1077687e"; echo "break *0x107724f6"
  for i in $(seq $N); do echo cont; echo 'info reg'; echo 'x/8x $esp'; done; echo quit; } > build/ra/pk.cmd
bash tools/c2dbg13.sh "$1" build/ra/pk.cmd > /dev/null
python3 - > build/ra/pk_pass1.txt <<'PY'
import re
t=open('build/ra/dbg.out',errors='replace').read()
for p in t.split('Stopped on breakpoint')[1:]:
    if p.startswith(' 2'): break
    m=re.search(r'EAX:([0-9a-f]{8})',p); bp=re.search(r'EBP:([0-9a-f]{8})',p)
    if not m: continue
    e=int(m.group(1),16); reg=['edx','eax','ecx'][((e-0x108a9738)//4)%3]
    ws=' '.join(re.findall(r'0x[0-9a-f]{8}:\s+((?:[0-9a-f]{8}\s*)+)',p)).split()
    print(reg, bp.group(1), ws[6], ws[2], ws[3])
PY
n=$(wc -l < build/ra/pk_pass1.txt)
{ echo cont; echo "break *0x1077687e"; for i in $(seq $n); do echo cont; done
  awk '{print "x/8x 0x"$4; print "x/8x 0x"$5}' build/ra/pk_pass1.txt; echo quit; } > build/ra/pk.cmd
bash tools/c2dbg13.sh "$1" build/ra/pk.cmd > /dev/null
python3 - "$3" <<'PY'
import re,sys
t=open('build/ra/dbg.out',errors='replace').read()
mem={}
for a,ws in re.findall(r'(0x[0-9a-f]{8}):\s+((?:[0-9a-f]{8}\s*){4})',t):
    mem[int(a,16)]=ws.split()
def dump(a):
    a=int(a,16); return ' '.join(mem.get(a,['?'])+mem.get(a+16,['?']))
out=open(sys.argv[1],'w')
for k,l in enumerate(open('build/ra/pk_pass1.txt'),1):
    reg,cls,tmp,pa,pb=l.split()
    out.write(f'{k} {reg} cls={cls} t={tmp} A={pa}[{dump(pa)}] B={pb}[{dump(pb)}]\n')
PY
