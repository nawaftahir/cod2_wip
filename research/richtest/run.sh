set -e
cd /w/scratch/richtest
printf 'int fc(int a){return a+1;}\n' > c1.c
printf 'extern "C" int fp(int a){return a+2;}\n' > p1.cpp
printf 'int fg(int a){return a+3;}\n' > g1.c
printf 'extern "C" int fh(int a){return a+4;}\n' > h1.cpp
printf 'int fc(int);int fp(int);int fg(int);int fh(int);\nint main(){return fc(1)+fp(2)+fg(3)+fh(4);}\n' > m.c
CL="wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2"
$CL c1.c >/dev/null; $CL /Tp p1.cpp >/dev/null; $CL /GL g1.c >/dev/null; $CL /GL /Tp h1.cpp >/dev/null; $CL m.c >/dev/null
wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG /OUT:t.exe m.obj c1.obj p1.obj g1.obj h1.obj >/dev/null
python3 - <<'EOF'
import struct
def rich(p):
    d=open(p,'rb').read(); e=d.find(b"Rich"); k=struct.unpack("<I",d[e+4:e+8])[0]
    s=d.find(struct.pack("<I",0x536e6144^k)); out=[]
    for i in range(s+16,e,8):
        a,b=struct.unpack("<II",d[i:i+8]); a^=k; b^=k; out.append((a>>16,a&0xffff,b))
    return out
print("test exe (objects: 1 plain C main + 1 C, 1 C++, 1 /GL C, 1 /GL C++):")
for r in rich("t.exe"): print("  prodid %3d build %5d count %d" % r)
EOF
