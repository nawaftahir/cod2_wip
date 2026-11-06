#!/usr/bin/env python3
"""tail13.py [out.json]: classify every function that is not byte-identical in place (ours vs retail 1.3) by cause.
Run in the worktree after a clean build (needs build/release/CoD2MP_s.exe + .map, sizediff13.py). Prints class, fn count, bytes."""
import struct,re,collections,json,difflib
from capstone import *
import os,subprocess,sys
T=os.path.dirname(os.path.abspath(__file__))+'/..'
ANCHOR=os.environ.get('ANCHOR') or T+'/../../binaries/windows/1.3/CoD2MP_s.exe'
EXE=T+'/build/release/CoD2MP_s.exe'
def text(p):
    d=open(p,'rb').read()
    pe=struct.unpack_from('<I',d,0x3c)[0]; oh=struct.unpack_from('<H',d,pe+20)[0]
    for i in range(struct.unpack_from('<H',d,pe+6)[0]):
        n,vs,va,rs,ro=struct.unpack_from('<8sIIII',d,pe+24+oh+40*i)
        if n.startswith(b'.text'): return d[ro:ro+vs],0x400000+va
rt,rb=text(ANCHOR); ot,ob=text(EXE)
ties=set(l.strip() for l in open(T+'/data/ties13.txt') if l.startswith('?'))
mp={}
for l in open(T+'/build/release/CoD2MP_s.map',errors='ignore'):
    m=re.match(r'\s+0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f\s+(?:i\s+)?(\S+)',l)
    if m: mp[int(m.group(2),16)]=(m.group(1),m.group(3))
rows=[]
SD=subprocess.run([sys.executable,T+'/tools/sizediff13.py','-a'],capture_output=True,text=True,env=dict(os.environ,ANCHOR=ANCHOR)).stdout
for l in SD.splitlines():
    p=l.split()
    if len(p)<7 or not re.match(r'^[0-9a-f]{6}$',p[0]): continue
    oa=int(p[0],16); ra=int(p[1],16) if re.match(r'^[0-9a-f]{6}$',p[1]) else None
    rows.append((oa,ra,int(p[2]),int(p[3]) if p[3].isdigit() else None,' '.join(p[6:])))
md=Cs(CS_ARCH_X86,CS_MODE_32)
REG=re.compile(r'\b(eax|ebx|ecx|edx|esi|edi|ebp|ax|bx|cx|dx|si|di|al|bl|cl|dl|ah|bh|ch|dh)\b')
STK=re.compile(r'\[(esp|ebp)( [+-] 0x[0-9a-f]+)?\]')
def dis(t,b,a,n):
    out=[]
    for i in md.disasm(t[a-b:a-b+n],a):
        out.append((i.mnemonic,re.sub(r'0x[0-9a-f]{5,}','A',i.op_str)))
    while out and out[-1][0] in('int3','nop'): out.pop()
    return out
def classify(oa,ra,osz,rsz):
    ra=ra or oa
    a=dis(ot,ob,oa,osz); b=dis(rt,rb,ra,rsz or osz)
    L0a=[f'{m} {o}' for m,o in a]; L0b=[f'{m} {o}' for m,o in b]
    if L0a==L0b: return None
    f1=lambda L:[REG.sub('R',x) for x in L]
    f2=lambda L:[STK.sub('[S]',x) for x in f1(L)]
    if f1(L0a)==f1(L0b): return 'regalloc only'
    if f2(L0a)==f2(L0b): return 'stack slot only (with regalloc)'
    ma=[m for m,o in a]; mb=[m for m,o in b]
    ca=ma.count('call'); cb=mb.count('call')
    if len(a)==len(b) and ma==mb: return 'constant/operand'
    if ca!=cb: return 'call vs inline'
    if sorted(ma)==sorted(mb):
        ja=[m for m in ma if m.startswith('j')]; jb=[m for m in mb if m.startswith('j')]
        return 'branch layout / tail merge' if ja!=jb else 'scheduling only'
    # tolerate small count changes from repeated tails
    if abs(len(a)-len(b))<=2 and ma.count('push')==mb.count('push'): return 'scheduling only'
    return 'size / missing code'
res=collections.defaultdict(list)
for oa,ra,osz,rsz,nm in rows:
    mn,obj=mp.get(oa,(nm,''))
    c=classify(oa,ra,osz,rsz)
    if c is None: continue
    lib=obj.startswith('libcmt') or obj.startswith('libwww') or mn.startswith('_')
    if mn in ties: c='tie (flips on unrelated edits)'
    elif lib: c='CRT / libwww: '+c
    res[c].append((osz,mn,obj,oa))
for c,v in sorted(res.items(),key=lambda kv:-sum(x[0] for x in kv[1])):
    print(c,len(v),sum(x[0] for x in v))
if len(sys.argv)>1: json.dump({c:sorted(v,reverse=True) for c,v in res.items()},open(sys.argv[1],'w'))
