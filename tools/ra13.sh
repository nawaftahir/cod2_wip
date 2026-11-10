#!/bin/bash
# ra13.sh TAG: relink the current build/obj with the logging c2 (register-colour oracle, client-1.0/tools/oracle) -> build/ra/TAG.txt,
# build/ra/ox.exe + ox.map (code identical to the release link). Needs a finished `make release` (build/objs.rsp, build/tree, build/lib).
# Logs EVERY function (cave_all: armed when RA_FN is unset; wine did not hand RA_FN to getenv here). Read with
# `python3 client-1.0/tools/oracle/split_all.py build/ra/TAG.txt out '?mangled@@name'` + `cpick.py out/f000.txt`.
W=$(cd "$(dirname "$0")/.." && pwd); T=$W/../../client-1.0/tools/oracle
cd "$W"; mkdir -p build/ra
if [ ! -f build/ra/c2rd.dll ]; then
  docker run --rm -v $W/build/ra:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
  python3 - "$T" <<'PY'
import sys
s=open(sys.argv[1]+'/cave_rd.s').read()
a="  mov edi,ds:ENVP\n  test edi,edi\n  je 9f\n"
assert a in s
open('build/ra/cave_all.s','w').write(s.replace(a,a.replace('9f','3f'),1))
PY
  as --32 build/ra/cave_all.s -o build/ra/cave.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave.o -o build/ra/cave.elf &&
    python3 $T/patch_ra.py build/ra/c2.dll build/ra/cave.elf build/ra/c2rd.dll || exit 1
fi
cat > build/ra/run.sh <<'EOS'
cp /w/build/ra/c2rd.dll /opt/msvc710/Vc7/bin/c2.dll
cd /w
wine /opt/msvc710/Vc7/bin/link.exe /nologo /LTCG /SAFESEH:NO /FORCE /OPT:NOREF /OPT:NOICF /FIXED:NO /SUBSYSTEM:WINDOWS /STACK:0x10000,0x1000 '/MAP:build\ra\ox.map' '/OUT:build\ra\ox.exe' '@build\objs.rsp' 'build\cod2mp.res' winmm.lib wsock32.lib 'build\lib\mss32.lib' 'build\lib\d3d9.lib' 'build\lib\dsound.lib' kernel32.lib user32.lib gdi32.lib advapi32.lib shell32.lib 'build\lib\libwww.lib' libcmt.lib > build/ra/link.log 2>&1
grep -a '^[FNPC]' build/ra/link.log > build/ra/$TAG.txt
EOS
docker run --rm -e TAG=${1:-all} -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/run.sh
chown -R $(id -u):$(id -g) build/ra 2>/dev/null; wc -l build/ra/${1:-all}.txt
