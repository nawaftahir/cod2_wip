#!/bin/sh
# calls.sh: who calls AngleVectors (out of line) in our exe, and which fns hold an inlined copy (fsincos pairs)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b
objdump -d -M intel --no-show-raw-insn build/release/CoD2MP_s.exe > /tmp/w7b.dis
python3 - <<'EOF'
import re,bisect
m=[]
for l in open('build/release/CoD2MP_s.map',errors='replace'):
    p=l.split()
    if len(p)>=4 and p[0].startswith('0001:'):
        try: m.append((int(p[2],16),p[1]))
        except: pass
m.sort(); ks=[a for a,_ in m]
def fn(a): return m[bisect.bisect_right(ks,a)-1][1]
calls={}; fs={}
for l in open('/tmp/w7b.dis'):
    r=re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)',l)
    if not r: continue
    a=int(r.group(1),16)
    if r.group(2)=='call' and '4279c0' in r.group(3): calls[fn(a)]=calls.get(fn(a),0)+1
    if r.group(2)=='fsincos': fs[fn(a)]=fs.get(fn(a),0)+1
print('CALLERS', calls)
print('FSINCOS', {k:v for k,v in fs.items()})
EOF
