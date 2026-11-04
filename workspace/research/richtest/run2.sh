set -e
cd /w/scratch/richtest
rich() { python3 -c "
import struct,sys
d=open(sys.argv[1],'rb').read(); e=d.find(b'Rich'); k=struct.unpack('<I',d[e+4:e+8])[0]
s=d.find(struct.pack('<I',0x536e6144^k))
print(sys.argv[1], ' '.join('%d/%d x%d'%(((struct.unpack('<I',d[i:i+4])[0]^k)>>16),((struct.unpack('<I',d[i:i+4])[0]^k)&0xffff),(struct.unpack('<I',d[i+4:i+8])[0]^k)) for i in range(s+16,e,8)))
" $1; }
L="wine /opt/msvc710/Vc7/bin/link.exe /nologo"
$L /LTCG /OUT:gc.exe m2.obj g1.obj >/dev/null 2>&1 || true
printf 'int fg(int);int main(){return fg(3);}\n' > m2.c
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 m2.c >/dev/null
printf 'extern "C" int fh(int);int main(){return fh(3);}\n' > m3.c
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Tc m3.c >/dev/null 2>&1 || true
printf 'int fh(int);int main(){return fh(3);}\n' > m3.c
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 m3.c >/dev/null
$L /LTCG /OUT:gc.exe m2.obj g1.obj >/dev/null; rich gc.exe
$L /LTCG /OUT:gp.exe m3.obj h1.obj >/dev/null; rich gp.exe
$L /OUT:pc.exe m2.obj c1.obj >/dev/null 2>&1 || $L /OUT:pc.exe m.obj c1.obj p1.obj g1.obj h1.obj >/dev/null 2>&1 || true
