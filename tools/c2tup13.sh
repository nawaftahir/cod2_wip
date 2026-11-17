#!/bin/bash
# c2tup13.sh NAME: log tuple allocs (A ret head kind) and replaces (P ret old new op), was: list scheduler (0x107b5338) for the fn whose mangled name starts with NAME -> build/ra/tup.txt.
# Needs a finished build + one tools/ra13.sh run. Lines (hex): R node prio idx est op = node enters the ready list
# (0x107b5309; list sorted prio desc, then idx asc); S cycle node prio idx est op unit = node picked (0x107b5261).
# E succidx latency flags = each successor edge of the picked node ([n+0xc] list).
# prio = [n+0x2c], idx = [n+0x36] (tie break, lower first), est = [n+0x30] earliest cycle, op = [[n+0x1c]+4].
W=$(cd "$(dirname "$0")/.." && pwd)
cd "$W"; mkdir -p build/ra
[ -f build/ra/c2.dll ] || docker run --rm -v $W/build/ra:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
[ -f build/ra/run.sh ] || { echo "run tools/ra13.sh first"; exit 1; }
cat > build/ra/cave_tup.s <<EOF
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
caveP:
  pushfd
  pushad
  cmp dword ptr ds:CUR,0
  je 8f
  mov ebx,eax
  push offset strP
  call wstr
  add esp,4
  mov eax,[esp+36]
  call hexw
  mov eax,[esp+24]
  call hexw
  mov eax,ebx
  call hexw
  mov eax,[ebx+4]
  call hexw
  push offset sNL
  call wstr
  add esp,4
8:
  popad
  popfd
  push esi
  mov esi,ecx
  mov ecx,[esi+0x10]
  jmp 0x10799b0a
caveA:
  pushfd
  pushad
  cmp dword ptr ds:CUR,0
  je 8f
  push offset strA
  call wstr
  add esp,4
  mov eax,[esp+36]
  call hexw
  movzx eax,bl
  mov ecx,[eax*4+0x10870d30]
  mov eax,[ecx*4+0x108a79e0]
  call hexw
  movzx eax,bl
  call hexw
  mov eax,[esp+48]
  call hexw
  mov eax,[esp+56]
  call hexw
  mov eax,[esp+60]
  call hexw
  mov eax,[esp+64]
  call hexw
  mov eax,[esp+68]
  call hexw
  mov eax,[esp+72]
  call hexw
  mov eax,[esp+76]
  call hexw
  mov eax,[esp+80]
  call hexw
  mov eax,[esp+84]
  call hexw
  mov eax,[esp+88]
  call hexw
  push offset sNL
  call wstr
  add esp,4
8:
  popad
  popfd
  movzx eax,bl
  mov ecx,[eax*4+0x10870d30]
  jmp 0x107afa42
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
strP: .ascii "SCP\0"
strA: .ascii "SCA\0"
sNL: .ascii "\n\0"
hexd: .ascii "0123456789abcdef"
name: .ascii "$1\0"
EOF
as --32 build/ra/cave_tup.s -o build/ra/cave_tup.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave_tup.o -o build/ra/cave_tup.elf || exit 1
python3 - <<'PY' || exit 1
import struct, subprocess
b = bytearray(open('build/ra/c2.dll', 'rb').read())
sym = {l.split()[2]: int(l.split()[0], 16) for l in subprocess.check_output(['nm', 'build/ra/cave_tup.elf'], text=True).splitlines()}
cave = subprocess.run(['objcopy', '-O', 'binary', '-j', '.text', 'build/ra/cave_tup.elf', '/dev/stdout'], capture_output=True).stdout
assert len(cave) < 688, len(cave)
b[0x165d50:0x165d50 + len(cave)] = cave
for va, k, n, orig in [(0x107724f6, 'caveF', 6, '8b130fb7426d'), (0x10799b04, 'caveP', 6, '568bf18b4e10'),
                       (0x107afa38, 'caveA', 10, '0fb6c38b0c85300d8710')]:
    o = va - 0x10700000
    assert b[o:o + n].hex() == orig, (hex(va), b[o:o + n].hex())
    b[o] = 0xe9; struct.pack_into('<i', b, o + 1, sym[k] - (va + 5)); b[o + 5:o + n] = b'\x90' * (n - 5)
open('build/ra/c2tup.dll', 'wb').write(b)
PY
sed 's#c2rd.dll#c2tup.dll#; s#ra\\ox#ra\\tup#g; s#build/ra/link.log#build/ra/tuplink.log#; s#^grep.*#grep -a "^SC" build/ra/tuplink.log | sed "s/^SC//" > build/ra/tup.txt#' build/ra/run.sh > build/ra/runtup.sh
docker run --rm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/runtup.sh
chown -R $(id -u):$(id -g) build/ra 2>/dev/null
[ -f build/ra/tup.exe ] || { tail -3 build/ra/tuplink.log; exit 1; }
echo "bytes differing from ox.exe (timestamp only): $(cmp -l build/ra/tup.exe build/ra/ox.exe | wc -l)"; wc -l build/ra/tup.txt
