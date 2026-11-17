import sys,io,contextlib,time
src=open('mv.py').read().split("res=[]")[0]
with contextlib.redirect_stdout(io.StringIO()): exec(src)
def apply(g,tu,c,x):
    # declare c right before x in TU tu: every caller with both gets c moved before x
    h=dict(g); ch=False
    for n in tus[tu]:
        e=h[n]
        if c in e and x in e and e.index(c)!=e.index(x)-1:
            e=list(e); e.remove(c); e.insert(e.index(x),c); h[n]=e; ch=True
    return h if ch else None
res=[]
TUS=sys.argv[1:] or list(tus)
ce=F('?Com_Error@');sub=set();stk=[];inside=None
for l in open(B+'dfs/ord.txt',errors='replace'):
    t,n=l[:2],l[2:].rstrip('\n')
    if t=='D ':
        stk.append(n)
        if n==ce: inside=len(stk)
        if inside: sub.add(n)
    elif t=='E ':
        if inside and len(stk)==inside: inside=None
        stk.pop()
TUS=sorted({fo[n][0] for n in sub if n in fo})
import os
K=int(os.environ['K']);N=int(os.environ['N']);TUS=TUS[K::N]
print('tus',len(TUS),flush=True)
for tu in TUS:
    ns=tus[tu]
    cs={c for n in ns for c in g[n]}
    xs={c for n in ns for c in g[n]}
    for c in cs:
        for x in xs:
            if x==c: continue
            h=apply(g,tu,c,x)
            if not h: continue
            cuts=dfs(h)
            if cuts==c0: continue
            G=g; g=h; o,P=order(cuts); g=G
            if o is None: continue
            chn=sum(1 for n in P if P[n]!=P0[n])
            res.append((score(o),-chn,tu,c,x))
            if score(o) and chn<300: print(res[-1],(o[T['ph']]<o[T['dc']]<o[T['die']],o[T['ma']]<o[T['fg']]<o[T['pd']],o[T['ub']]<o[T['ec']]<o[T['sub']]),flush=True)
res.sort(reverse=True)
for r in res[:30]: print(r)
