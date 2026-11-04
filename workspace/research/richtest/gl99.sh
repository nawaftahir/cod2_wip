#!/bin/sh
# Which /GL C++ build stamps prodid 99 (retail) instead of 100? Tries flag variants, PCH and .c-as-C++.
# Run from radiant/: docker run --rm -v $PWD:/w -w /w cod2-radiant-msvc71 sh workspace/research/richtest/gl99.sh
mkdir -p /tmp/gl99 && cd /tmp/gl99
CL="wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2"
LINK="wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG"
rich() { python3 -c "
import struct,sys
d=open(sys.argv[1],'rb').read(); e=d.find(b'Rich'); k=struct.unpack('<I',d[e+4:e+8])[0]
s=d.find(struct.pack('<I',0x536e6144^k)); out=[]
for i in range(s+16,e,8):
    a,b=struct.unpack('<II',d[i:i+8]); a^=k; b^=k
    if (a&0xffff)==3077 and (a>>16) in (95,96,97,98,99,100,101): out.append('%d x%d'%(a>>16,b))
print(sys.argv[2], ' '.join(out))
" $1 "$2"; }
printf 'struct A{virtual int f(){return 1;}};\nextern "C" int fh(int a){A x;return a+x.f();}\n' > f1.cpp
cp f1.cpp f1c.c
printf '#include "pch.h"\nstruct A{virtual int f(){return 1;}};\nextern "C" int fh(int a){A x;return a+x.f();}\n' > f2.cpp
printf '#define P 1\n' > pch.h
printf '#include "pch.h"\n' > pch.cpp
printf 'int fh(int);int main(){return fh(3);}\n' > fm.c
$CL fm.c >/dev/null
try() { label=$1; shift; rm -f f.exe; $LINK /OUT:f.exe fm.obj "$@" >/dev/null 2>&1 && rich f.exe "$label" || echo "$label: link failed"; }
for fl in "/GL" "/GL /G6" "/GL /G7" "/GL /arch:SSE" "/GL /GX /GR" "/GL /Zc:forScope" "/GL /Ze /Zp8" "/GL /Gm" "/GL /ZI" "/GL /Gd /Gs"; do
  rm -f f1.obj; $CL $fl f1.cpp >/dev/null 2>&1; [ -f f1.obj ] && try "C++ $fl" f1.obj || echo "C++ $fl: compile failed"
done
rm -f f1c.obj; $CL /GL /TP f1c.c >/dev/null 2>&1; [ -f f1c.obj ] && try ".c as /TP /GL" f1c.obj
rm -f pch.obj f2.obj; $CL /GL /Yc"pch.h" pch.cpp >/dev/null 2>&1 && $CL /GL /Yu"pch.h" f2.cpp >/dev/null 2>&1
[ -f f2.obj ] && try "PCH /Yc+/Yu /GL" pch.obj f2.obj || echo "PCH: compile failed"
rm -f pch.obj f2.obj; $CL /Yc"pch.h" pch.cpp >/dev/null 2>&1 && $CL /GL /Yu"pch.h" f2.cpp >/dev/null 2>&1
[ -f f2.obj ] && try "PCH plain /Yc, /GL /Yu" pch.obj f2.obj || echo "PCH mixed: compile failed"
# the @comp.id each object carries
for o in f1.obj f1c.obj f2.obj pch.obj; do [ -f $o ] && python3 -c "
import sys; sys.path.insert(0,'/w/tools'); import match_radiant as m
_,s=m.parse_coff(open('$o','rb').read()); print('$o', [(x['value']>>16, x['value']&0xffff) for x in s if x['name']=='@comp.id'])"; done
