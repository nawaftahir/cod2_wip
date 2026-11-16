import sys,io,contextlib,time
src=open(__file__.rsplit('/',1)[0]+'/declmv13.py').read().split("res=[]")[0]
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
for tu in TUS:
    ns=tus[tu]
    cs={c for n in ns for c in g[n] if c in cyc}
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
res.sort(reverse=True)
for r in res[:30]: print(r)
