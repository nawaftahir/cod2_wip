#!/bin/bash
# c2sched13.sh NAME: log c2's list scheduler (0x107b5338) for the fn whose mangled name starts with NAME -> build/ra/sch.txt.
# Needs a finished build + one tools/ra13.sh run. Lines (hex): R node prio idx est op = node enters the ready list
# (0x107b5309; list sorted prio desc, then idx asc); S cycle node prio idx est op unit = node picked (0x107b5261).
# E succidx latency flags = each successor edge of the picked node ([n+0xc] list).
# prio = [n+0x2c], idx = [n+0x36] (tie break, lower first), est = [n+0x30] earliest cycle, op = [[n+0x1c]+4].
W=$(cd "$(dirname "$0")/.." && pwd)
cd "$W"; mkdir -p build/ra
[ -f build/ra/c2.dll ] || docker run --rm -v $W/build/ra:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
[ -f build/ra/run.sh ] || { echo "run tools/ra13.sh first"; exit 1; }
cat > build/ra/cave_sch.s <<EOF
.intel_syntax noprefix
.globl _start
.equ FWRITE, 0x10866108
.equ IOB, 0x1086610c
.equ CUR, 0x108b1f00
_start:
caveF:
  pushad
  pushfd
  mov dword ptr ds:CUR,0
  mov edx,[ebx]
  mov esi,[edx+4]
  test esi,esi
  je 9f
  mov edi,offset name
2:
  mov al,[edi]
  test al,al
  je 3f
  cmp al,[esi]
  jne 9f
  inc esi
  inc edi
  jmp 2b
3:
  mov dword ptr ds:CUR,1
9:
  popfd
  popad
  mov edx,[ebx]
  movzx eax, word ptr [edx+0x6d]
  jmp 0x107724fc
caveR:
  pushad
  pushfd
  cmp dword ptr ds:CUR,0
  je 8f
  mov ebx,ecx
  push offset strR
  call wstr
  add esp,4
  call node
  push offset sNL
  call wstr
  add esp,4
8:
  popfd
  popad
  mov eax,ds:0x108a8044
  jmp 0x107b530e
caveS:
  pushfd
  pushad
  cmp dword ptr ds:CUR,0
  je 8f
  mov ebx,edi
  push offset strS
  call wstr
  add esp,4
  mov eax,ds:0x108a8018
  call hexw
  call node
  movzx eax,bp
  call hexw
  push offset sNL
  call wstr
  add esp,4
  mov esi,[ebx+0xc]
6:
  test esi,esi
  je 8f
  push offset strE
  call wstr
  add esp,4
  mov eax,[esi+0xc]
  movzx eax,word ptr [eax+0x36]
  call hexw
  movzx eax,word ptr [esi+0x14]
  call hexw
  movzx eax,byte ptr [esi+0x16]
  call hexw
  push offset sNL
  call wstr
  add esp,4
  mov esi,[esi]
  jmp 6b
8:
  popad
  popfd
  mov [edi+0x3a],bp
  mov [edi+0x3c],dl
  jmp 0x107b5268
node:
  mov eax,ebx
  call hexw
  mov eax,[ebx+0x2c]
  call hexw
  movzx eax,word ptr [ebx+0x36]
  call hexw
  mov eax,[ebx+0x30]
  call hexw
  mov eax,[ebx+0x1c]
  test eax,eax
  je 1f
  mov eax,[eax+4]
1:
  call hexw
  ret
wstr:
  mov edx,[esp+4]
  mov ecx,edx
4:
  cmp byte ptr [ecx],0
  je 3f
  inc ecx
  jmp 4b
3:
  sub ecx,edx
  mov eax,ds:IOB
  lea eax,[eax+0x40]
  push eax
  push ecx
  push 1
  push edx
  call dword ptr ds:FWRITE
  add esp,16
  ret
hexw:
  sub esp,12
  mov byte ptr [esp],' '
  mov ecx,8
5:
  mov edx,eax
  and edx,15
  mov dl,[hexd+edx]
  mov [esp+ecx],dl
  shr eax,4
  dec ecx
  jne 5b
  mov byte ptr [esp+9],0
  push esp
  call wstr
  add esp,16
  ret
strR: .ascii "SCR\0"
strS: .ascii "SCS\0"
strE: .ascii "SCE\0"
sNL: .ascii "\n\0"
hexd: .ascii "0123456789abcdef"
name: .ascii "$1\0"
EOF
as --32 build/ra/cave_sch.s -o build/ra/cave_sch.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave_sch.o -o build/ra/cave_sch.elf || exit 1
python3 - <<'PY' || exit 1
import struct, subprocess
b = bytearray(open('build/ra/c2.dll', 'rb').read())
sym = {l.split()[2]: int(l.split()[0], 16) for l in subprocess.check_output(['nm', 'build/ra/cave_sch.elf'], text=True).splitlines()}
cave = subprocess.run(['objcopy', '-O', 'binary', '-j', '.text', 'build/ra/cave_sch.elf', '/dev/stdout'], capture_output=True).stdout
assert len(cave) < 688, len(cave)
b[0x165d50:0x165d50 + len(cave)] = cave
for va, k, n, orig in [(0x107724f6, 'caveF', 6, '8b130fb7426d'), (0x107b5309, 'caveR', 5, 'a144808a10'),
                       (0x107b5261, 'caveS', 7, '66896f3a88573c')]:
    o = va - 0x10700000
    assert b[o:o + n].hex() == orig, (hex(va), b[o:o + n].hex())
    b[o] = 0xe9; struct.pack_into('<i', b, o + 1, sym[k] - (va + 5)); b[o + 5:o + n] = b'\x90' * (n - 5)
open('build/ra/c2sch.dll', 'wb').write(b)
PY
sed 's#c2rd.dll#c2sch.dll#; s#ra\\ox#ra\\sch#g; s#build/ra/link.log#build/ra/schlink.log#; s#^grep.*#grep -a "^SC" build/ra/schlink.log | sed "s/^SC//" > build/ra/sch.txt#' build/ra/run.sh > build/ra/runsch.sh
docker run --rm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/runsch.sh
chown -R $(id -u):$(id -g) build/ra 2>/dev/null
[ -f build/ra/sch.exe ] || { tail -3 build/ra/schlink.log; exit 1; }
echo "bytes differing from ox.exe (timestamp only): $(cmp -l build/ra/sch.exe build/ra/ox.exe | wc -l)"; wc -l build/ra/sch.txt
