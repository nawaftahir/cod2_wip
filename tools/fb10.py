# fb10.py EXE VA LEN: same-offset bytes of one VA range vs the 1.0 anchor (fn score for labs)
import sys,pefile
A='/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/CoD2MP_s.exe'
def rd(p,va,n):
    pe=pefile.PE(p,fast_load=True); return pe.get_data(va-pe.OPTIONAL_HEADER.ImageBase,n)
va=int(sys.argv[2],16); n=int(sys.argv[3])
a=rd(sys.argv[1],va,n); b=rd(A,va,n); print(sum(x==y for x,y in zip(a,b)),'/',n)
