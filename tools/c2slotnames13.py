# c2slotnames13.py MANGLED: after tools/c2slots13.sh, print every slot item id, weight and symbol name (two winedbg passes).
import re,subprocess,sys
import os; W=os.path.dirname(os.path.abspath(__file__))+'/..'
fn=sys.argv[1]
def words(b):
    ws=[]
    for m in re.findall(r'^0x[0-9a-f]+:\s+(.*)$',b,re.M):
        ws+=[int(x,16) for x in m.split() if re.fullmatch('[0-9a-f]{8}',x)]
    return ws
items=[]
for b in open(W+'/build/ra/slots.out').read().split('Stopped on breakpoint')[1:]:
    ws=words(b)
    if len(ws)>=15:
        if any(ws[0]==i[0] for i in items): break
        items.append((ws[0],ws[7],ws[14]))
def run(cmds):
    open(W+'/build/ra/nm.cmd','w').write('cont\nbreak *0x10790cba\ncont\n'+''.join(c+'\n' for c in cmds)+'quit\n')
    subprocess.run(['bash','tools/c2dbg13.sh',fn,'build/ra/nm.cmd'],cwd=W,capture_output=True)
    return open(W+'/build/ra/dbg.out').read()
o=run(['x /4x 0x%x'%s for s,_,_ in items])
ptr={}
for m in re.finditer(r'^0x([0-9a-f]+):\s+([0-9a-f]{8}) ([0-9a-f]{8})',o,re.M): ptr[int(m.group(1),16)]=int(m.group(3),16)
o2=run(['x /s 0x%x'%ptr.get(s,0) for s,_,_ in items])
names=o2.split('Stopped on breakpoint')[1].splitlines()[1:]
for (s,i,w),n in zip(items,names): print(i,w,n[:60])
