import sys; sys.path.insert(0,'tools'); import verify, link
L=verify.Linked(); names=verify.known_names()
done={r['addr'] for r in link.read_tsv('ledger/matches.tsv')}
src=sys.argv[1]
rows=[r for r in link.read_tsv('data/tu_map.tsv') if r['tu']==src[4:] and r['addr'] not in done]
ledg={r['symbol'] for r in link.read_tsv('ledger/matches.tsv')}
for s in L.of_source(src):
    if s in ledg or s.startswith('__real') or '@3' in s: continue
    for r in rows:
        st,d=verify.check(L,r['addr'],s,names)
        if st=='MATCH': print('%s\t%s\t%s\t%s'%(r['addr'],r['size'],src,s)); break
    else: print('NONE',s)
