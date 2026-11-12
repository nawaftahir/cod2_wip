#!/bin/bash
# c2opwalk13.sh NAME: log c2's colour-candidate operand walk (0x107825e5..0x10782720) for the function whose mangled name starts with NAME (a prefix keeps the cave small) -> build/ra/ow.txt.
# Needs a finished release build + one tools/ra13.sh run (build/ra/run.sh, c2.dll). Link output build/ra/ow.exe (== ox.exe but timestamp).
# Lines (all hex): T tuple op [t+9] class          = tuple visit (operands walked only when [t+9] bit0 set)
#                  U|D op kind type cls sym node   U = use list [t+0x28], D = def list [t+0x2c]
# kind = [op+8] byte, type = [op+0xa] word, cls = dword 0x10869140[type>>12]; the operand passes when kind==1 && cls == the
# T line class (then the node checks at 0x10782626 run).
#                  K|E sym node [n+4]b [n+5]b [n+0x10] [n+0x18] 0   = use|def operand that passed; node = [[op+0x1c]+8]
#                  N   sym node ... res   = 0x1078006c result for a use whose node passed kind 2 / [n+0x10]==0 / [n+5] bit0
W=$(cd "$(dirname "$0")/.." && pwd); T=$W/../../client-1.0/tools/oracle
cd "$W"; mkdir -p build/ra
[ -f build/ra/c2.dll ] || docker run --rm -v $W/build/ra:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
[ -f build/ra/run.sh ] || { echo "run tools/ra13.sh first"; exit 1; }
cat > build/ra/cave_ow.s <<EOF
.intel_syntax noprefix
.globl _start
.equ FWRITE, 0x10866108
.equ IOB, 0x1086610c
.equ CUR, 0x108b1f00
.equ TABLE, 0x10869140
_start:
# F 0x107724f6: compile start, arm when [sym+4] == name
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
  push 0x107724fc
  ret
# T 0x107825e5: tuple visit
caveT:
  pushad
  pushfd
  cmp dword ptr ds:CUR,0
  je 9f
  mov ebx,[esp+0x64]
  push offset strT
  call wstr
  add esp,4
  mov eax,[ebx+4]
  call hexw
  movzx eax,byte ptr [ebx+9]
  call hexw
  mov eax,[esp+0x68]
  call hexw
  push offset sNL
  call wstr
  add esp,4
9:
  popfd
  popad
  mov eax,[esp+0x40]
  test byte ptr [eax+9],1
  push 0x107825ed
  ret
# U 0x10782600: use-list operand (ebp)
caveU:
  pushad
  pushfd
  push offset strU
  call oplog
  add esp,4
  popfd
  popad
  cmp byte ptr [ebp+8],1
  mov ebx,[esp+0x10]
  push 0x10782608
  ret
# D 0x107826e4: def-list operand (ebp)
caveD:
  pushad
  pushfd
  push offset strD
  call oplog
  add esp,4
  popfd
  popad
  mov al,[ebp+8]
  cmp al,1
  mov esi,[esp+0x18]
  push 0x107826ed
  ret
# oplog(tag): caller frame = pushad+pushfd; walker's [esp+0x40] is at [esp+0x6c] here
oplog:
  cmp dword ptr ds:CUR,0
  je 9f
  push dword ptr [esp+4]
  call wstr
  add esp,4
  mov eax,[ebp+4]
  call hexw
  movzx eax,byte ptr [ebp+8]
  call hexw
  movzx eax,word ptr [ebp+0xa]
  call hexw
  movzx eax,word ptr [ebp+0xa]
  shr eax,12
  mov eax,[TABLE+eax*4]
  call hexw
  mov eax,[ebp+0x18]
  call hexw
  mov eax,[ebp+0x1c]
  call hexw
5:
  push offset sNL
  call wstr
  add esp,4
9:
  ret
# K 0x10782626: use operand passed the walk; esi = its node
caveK:
  mov eax,[ebp+0x1c]
  mov esi,[eax+8]
  pushad
  pushfd
  mov ebx,[ebp+0x18]
  push 0
  push offset strK
  call nlog
  add esp,8
  popfd
  popad
  push 0x1078262c
  ret
# E 0x10782713: def operand passed the walk (ebp = operand here)
caveE:
  pushad
  pushfd
  mov ebx,[ebp+0x18]
  mov esi,[ebp+0x1c]
  mov esi,[esi+8]
  push 0
  push offset strE
  call nlog
  add esp,8
  popfd
  popad
  mov eax,[ebp+0x1c]
  mov ebp,[eax+8]
  push 0x10782719
  ret
# N 0x1078266b: eax = 0x1078006c(tuple, operand edi) for node esi
caveN:
  pushad
  pushfd
  mov ebx,[edi+0x18]
  push eax
  push offset strN
  call nlog
  add esp,8
  popfd
  popad
  test eax,eax
  je 1f
  push 0x10782673
  ret
1:
  push 0x107839f7
  ret
# nlog(tag, extra): ebx = sym, esi = node: tag sym node [n+4]b [n+5]b [n+0x10] [n+0x18] extra
nlog:
  cmp dword ptr ds:CUR,0
  je 9f
  push dword ptr [esp+4]
  call wstr
  add esp,4
  mov eax,ebx
  call hexw
  mov eax,esi
  call hexw
  movzx eax,byte ptr [esi+4]
  call hexw
  movzx eax,byte ptr [esi+5]
  call hexw
  mov eax,[esi+0x10]
  call hexw
  mov eax,[esi+0x18]
  call hexw
  mov eax,[esp+8]
  call hexw
  push offset sNL
  call wstr
  add esp,4
9:
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
strT: .ascii "OWT\0"
strU: .ascii "OWU\0"
strD: .ascii "OWD\0"
strK: .ascii "OWK\0"
strE: .ascii "OWE\0"
strN: .ascii "OWN\0"
sNL: .ascii "\n\0"
hexd: .ascii "0123456789abcdef"
name: .ascii "$1\0"
EOF
as --32 build/ra/cave_ow.s -o build/ra/cave_ow.o && ld -m elf_i386 -Ttext=0x10865d50 build/ra/cave_ow.o -o build/ra/cave_ow.elf || exit 1
python3 - <<'PY' || exit 1
import struct, subprocess
b = bytearray(open('build/ra/c2.dll', 'rb').read())
sym = {l.split()[2]: int(l.split()[0], 16) for l in subprocess.check_output(['nm', 'build/ra/cave_ow.elf'], text=True).splitlines()}
cave = subprocess.run(['objcopy', '-O', 'binary', '-j', '.text', 'build/ra/cave_ow.elf', '/dev/stdout'], capture_output=True).stdout
assert len(cave) < 688, len(cave)
b[0x165d50:0x165d50 + len(cave)] = cave
# site, hook, bytes replaced (whole instructions; checked against stock bytes)
for va, k, n, orig in [(0x107724f6, 'caveF', 6, '8b130fb7426d'), (0x107825e5, 'caveT', 8, '8b442440f6400901'),
                       (0x10782600, 'caveU', 8, '807d08018b5c2410'), (0x107826e4, 'caveD', 9, '8a45083c018b742418'),
                       (0x10782626, 'caveK', 6, '8b451c8b7008'), (0x10782713, 'caveE', 6, '8b451c8b6808'), (0x1078266b, 'caveN', 8, '85c00f8484130000')]:
    o = va - 0x10700000
    assert b[o:o + n].hex() == orig, (hex(va), b[o:o + n].hex())
    b[o] = 0xe9; struct.pack_into('<i', b, o + 1, sym[k] - (va + 5)); b[o + 5:o + n] = b'\x90' * (n - 5)
open('build/ra/c2ow.dll', 'wb').write(b)
PY
sed 's#c2rd.dll#c2ow.dll#; s#ra\\ox#ra\\ow#g; s#build/ra/link.log#build/ra/owlink.log#; s#^grep.*#grep -a "^OW" build/ra/owlink.log | sed "s/^OW//" > build/ra/ow.txt#' build/ra/run.sh > build/ra/runow.sh
docker run --rm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/ra/runow.sh
chown -R $(id -u):$(id -g) build/ra 2>/dev/null
[ -f build/ra/ow.exe ] || { tail -3 build/ra/owlink.log; exit 1; }
echo "bytes differing from ox.exe (timestamp only): $(cmp -l build/ra/ow.exe build/ra/ox.exe | wc -l)"; wc -l build/ra/ow.txt
