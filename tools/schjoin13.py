# schjoin.py SCH OW: per sched block, picks with op, prio, idx and the tuple's def/use operand syms (from c2owt13 T/U/D lines)
import sys
ops={};cur=None
for l in open(sys.argv[2]):
    f=l.split()
    if not f: continue
    if f[0]=='T': cur=f[1];ops.setdefault(cur,[])
    elif f[0] in('U','D') and cur and len(f)>=6: ops[cur].append(f[0]+':'+f[5][-5:])
last=-1;b=0
for l in open(sys.argv[1]):
    f=l.split()
    if len(f)<8 or f[0]!='S': continue
    try: c=int(f[1],16)
    except: continue
    if c<last or (c==0 and last>0): b+=1; print()
    last=c
    print('b%d c%d op%s p%s i%d %s'%(b,c,f[6][-3:],f[3][-4:],int(f[4],16),' '.join(dict.fromkeys(ops.get(f[7],['?'])))))
