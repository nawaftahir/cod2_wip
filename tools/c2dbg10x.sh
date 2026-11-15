#!/bin/bash
# c2dbg13.sh MANGLED CMDFILE: LTCG relink of build/objs.rsp under winedbg with a c2.dll that hits int3 when c2 starts
# compiling MANGLED (hook F 0x107724f6, see client-1.0/tools/oracle/cave_rd.s). CMDFILE = winedbg commands run from there.
# Output: build/ra/dbg.out (winedbg log). Heap addresses match a plain ra13.sh run, so node addresses carry over.
W=$(cd "$(dirname "$0")/.." && pwd); T=$W/../../client-1.0/tools/oracle
cd "$W"; mkdir -p build/ra
[ -f build/ra/c2.dll ] || docker run --rm -v $W/build/ra:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
cat > build/ra/cave_dbg.s <<EOF
.intel_syntax noprefix
.globl _start
_start:
caveF:
  pushad
  pushfd
  mov edx,[ebx]
  mov esi,[edx+4]
  test esi,esi
  je 9f
  mov edi,offset name
2:
  mov al,[esi]
  cmp al,[edi]
  jne 9f
  inc esi
  inc edi
  test al,al
  jne 2b
  int3
9:
  popfd
  popad
  mov edx,[ebx]
  movzx eax, word ptr [edx+0x6d]
  push 0x107724fc
  ret
name: .ascii "$1\0"
EOF
as --32 build/ra/cave_dbg.s -o build/ra/cave_dbg.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave_dbg.o -o build/ra/cave_dbg.elf &&
  python3 $T/patch_ra.py build/ra/c2.dll build/ra/cave_dbg.elf build/ra/c2dbg.dll || exit 1
cp "$2" build/ra/dbg.cmd
sed 's#^wine /opt/msvc710/Vc7/bin/link.exe#winedbg --file /w/build/ra/dbg.cmd /opt/msvc710/Vc7/bin/link.exe#; s#c2rd.dll#c2dbg.dll#; s#ra\\ox#ra\\dx#g; s#build/ra/link.log#build/ra/dbg.out#; /^grep/d' build/ra/run.sh > build/ra/rundbg.sh
timeout ${TMO:-1500} docker run --rm -e TERM=xterm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/rundbg.sh
chown -R $(id -u):$(id -g) build/ra 2>/dev/null; wc -l build/ra/dbg.out
