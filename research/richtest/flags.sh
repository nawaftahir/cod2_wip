cd /w/scratch/richtest
rich() { python3 -c "
import struct,sys
d=open(sys.argv[1],'rb').read(); e=d.find(b'Rich'); k=struct.unpack('<I',d[e+4:e+8])[0]
s=d.find(struct.pack('<I',0x536e6144^k)); out=[]
for i in range(s+16,e,8):
    a,b=struct.unpack('<II',d[i:i+8]); a^=k; b^=k
    if (a&0xffff)==3077 and (a>>16) in (95,96,99,100): out.append('%d x%d'%(a>>16,b))
print(sys.argv[2], ' '.join(out))
" $1 "$2"; }
printf 'extern "C" int fh(int a){return a+4;}\n' > f1.cpp
printf 'int fh(int);int main(){return fh(3);}\n' > fm.c
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 fm.c >/dev/null
for fl in "/GL" "/GL /GX" "/GL /MT" "/GL /Zi" "/GL /GX /MT /Zi /Oy- /Op" "/GL /TC" "/GL /Zc:wchar_t" "/GL /Gy /GF /GR"; do
  rm -f f1.obj
  wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 $fl /Tpf1.cpp >/dev/null 2>&1 || wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 $fl f1.cpp >/dev/null 2>&1
  [ -f f1.obj ] || { echo "$fl: compile failed"; continue; }
  wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG /OUT:f.exe fm.obj f1.obj >/dev/null 2>&1 && rich f.exe "C++ $fl:"
done
