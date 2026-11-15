# vnames.py TREE DBGSCRIPT: name the vars visited at 0x10784b8f (initial colour worklist): id, gain [n+0x40], name
import re,subprocess,sys
T,S=sys.argv[1],sys.argv[2];fn='?DSound_UpdateSample@@YAHPAUdsound_sample_t@@PADI@Z' if len(sys.argv)<4 else sys.argv[3]
def run(body,n=1):
    open(T+'/build/ra/vn.cmd','w').write('cont\nbreak *0x10784b8f\ncont\n'+body+'quit\n')
    subprocess.run(['bash','tools/'+S,fn,'build/ra/vn.cmd'],cwd=T,capture_output=True,timeout=1700)
    return open(T+'/build/ra/dbg.out').read()
o=run(''.join('x /x $edi\nx /x $edi+0x1c\nx /x $edi+0x40\ncont\n' for _ in range(22)))
rows=[]
for b in o.split('Stopped on breakpoint')[1:]:
    w=re.findall(r'^\S*\s+([0-9a-f]{8})',b,re.M)
    if len(w)>=3: rows.append([int(x,16) for x in w[:3]])
o2=run(''.join('x /2x 0x%x\n'%r[0] for r in rows))
p={int(m.group(1),16):int(m.group(3),16) for m in re.finditer(r'^0x([0-9a-f]+):\s+([0-9a-f]{8}) ([0-9a-f]{8})',o2,re.M)}
o3=run(''.join('x /s 0x%x\n'%p.get(r[0],0) for r in rows))
nm=o3.split('Stopped on breakpoint')[1].splitlines()[1:]
for r,n in zip(rows,nm):
    g=r[2]-(1<<32) if r[2]>>31 else r[2]
    print('%3x %4d %s'%(r[1],g,n.strip()[:50]))
