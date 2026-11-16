# mv.py: search one prototype move (declare callee c first in TU t) that shifts the target compile passes
import sys, re, time
sys.path.insert(0,'/home/nawaf/cod2/test/dev/cod2_wip/client-1.0/tools/oracle')
sys.path.insert(0,'/home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w29/tools')
from sim import fnobj
from peel13 import passes, load
sys.setrecursionlimit(100000)
B='/home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w29/build/'
g, roots, cur, st = {}, [], None, []
obs_cut=set()
for l in open(B+'dfs/ord.txt', errors='replace'):
    t,n=l[:2],l[2:].rstrip('\n')
    if t=='D ':
        if not st: roots.append(n)
        g.setdefault(n,[]); 
        if st: g[st[-1]].append(n)
        st.append(n)
    elif t=='E ': st.pop()
    elif t=='T ': g[st[-1]].append(n)
    elif t=='C ': g[st[-1]].append(n); obs_cut.add((st[-1],n))
# D lines of a child also are edges of the parent; T may duplicate them: dedupe keeping first
for n in g:
    seen=[]; [seen.append(c) for c in g[n] if c not in seen]; g[n]=seen
def dfs(g):
    s,cuts={},set()
    def visit(n):
        s[n]=2
        for c in g.get(n,()):
            v=s.get(c,0)
            if v==2: cuts.add((n,c))
            elif v==0 and c in g: visit(c)
        s[n]=1
    for n in roots:
        if not s.get(n): visit(n)
    for n in g:
        if not s.get(n): visit(n)
    return cuts
c0=dfs(g)
print('cuts sim',len(c0),'obs',len(obs_cut),'same',len(c0&obs_cut))
lst=[l.rstrip('\n') for l in open(B+'dfs/symlist.txt')]
def order(cuts):
    need={n:{c for c in g.get(n,()) if c in g and (n,c) not in cuts and c!=n} for n in lst}
    done,out,left,P=set(),[],list(lst),{}
    p=0
    while left:
        rest=[]
        for n in left:
            if need[n]<=done: done.add(n); out.append(n); P[n]=p
            else: rest.append(n)
        if len(rest)==len(left): return None,None
        left=rest; p+=1
    return {n:i for i,n in enumerate(out)},P
def F(k): return [n for n in g if n.startswith(k)][0]
T=dict(dc=F('?CL_DemoCompleted@'),ph=F('?Pickup_Health@'),die=F('?Die@Particle@'),fg=F('?fire_grenade@'),
 ma=F('?Mantle_CreateAnims@'),pd=F('?player_die@'),ec=F('?Com_ErrorCleanup@'),ub=F('?UI_BuildFindPlayerList@'),sub=F('?Com_GetSubtitleStringEdReference@'))
def score(o):
    return ((o[T['ph']]<o[T['dc']]<o[T['die']]) + (o[T['ma']]<o[T['fg']]<o[T['pd']]) + (o[T['ub']]<o[T['ec']]<o[T['sub']]))
o0,P0=order(c0)
print('base score',score(o0))
fo=fnobj(B+'release/CoD2MP_s.map')
tus={}
for n in g:
    if n in fo: tus.setdefault(fo[n][0],[]).append(n)
cyc={b for a,b in c0}|{a for a,b in c0}
res=[]
t0=time.time()
for tu,ns in tus.items():
    cs={c for n in ns for c in g[n][1:] if c in cyc}
    for c in cs:
        h=dict(g)
        for n in ns:
            if c in h[n] and h[n][0]!=c:
                e=list(h[n]); e.remove(c); h[n]=[c]+e
        gg=g; g=h; cuts=dfs(g); g=gg
        if cuts==c0: continue
        g=h; o,P=order(cuts); g=gg
        if o is None: continue
        ch=sum(1 for n in P if P[n]!=P0[n])
        res.append((score(o),-ch,tu,c,len(cuts^c0)))
print("moves",len(res))
for r in sorted(res,reverse=True)[:25]: print(r)
