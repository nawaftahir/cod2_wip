# c2slotmap13.py [build/ra]: after tools/c2slots13.sh, print each stack entry (offset, size, weight) with its member items.
import re,sys
d=sys.argv[1] if len(sys.argv)>1 else 'build/ra'
def words(b):
    ws=[]
    for m in re.findall(r'^0x[0-9a-f]+:\s+(.*)$',b,re.M):
        ws+=[int(x,16) for x in m.split() if re.fullmatch('[0-9a-f]{8}',x)]
    return ws
items={}
order=[]
for b in open(d+'/slots.out').read().split('Stopped on breakpoint')[1:]:
    ws=words(b)
    if len(ws)>=15:
        if ws[0] in items: break
        items[ws[0]]=(ws[7],ws[8],ws[14]); order.append(ws[0])
cur=None
for b in open(d+'/slots2.out').read().split('Stopped on breakpoint')[1:]:
    if b.startswith(' 3 '): break
    ebx=int(re.search(r'EBX:([0-9a-f]+)',b).group(1),16)
    off=ebx-(1<<32) if ebx>>31 else ebx
    if b.startswith(' 1 '):
        ws=words(b); print('ENTRY',off,'size',ws[2],'w',ws[3])
    else:
        eax=int(re.search(r'EAX:([0-9a-f]+)',b).group(1),16)
        print('   member', hex(eax), items.get(eax,'?'), 'idx', order.index(eax) if eax in items else -1)
