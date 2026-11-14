#!/bin/bash
# c2rl13.sh NAME: log 0x26a reload creation (R, hook 0x1077c213) and colour-node creation (V, hook 0x1077c13e: sym, id via caller col) for the fn whose mangled name starts with NAME -> build/ra/ow.txt. Stripped copy of c2opwalk13.sh.
# Needs a finished release build + one tools/ra13.sh run (build/ra/run.sh, c2.dll). Link output build/ra/ow.exe (== ox.exe but timestamp).
# Lines (all hex): T tuple op [t+9] class          = tuple visit (operands walked only when [t+9] bit0 set)
#                  U|D op kind type cls sym node   U = use list [t+0x28], D = def list [t+0x2c]
# kind = [op+8] byte, type = [op+0xa] word, cls = dword 0x10869140[type>>12]; the operand passes when kind==1 && cls == the
# T line class (then the node checks at 0x10782626 run).
#                  K|E sym node [n+4]b [n+5]b [n+0x10] [n+0x18] 0   = use|def operand that passed; node = [[op+0x1c]+8]
#                  G   freebits node ... n16 = (freebits = first free-set word, bit r = c2 reg id r) GAIN=1 mode (no T/U/D): worklist insertion 0x10784b8f, rejected when n16 <= 0
#                  I|P n3 node ... n16 = GAIN mode: linked into the sorted worklist (0x10784bf4) | popped (0x10782a5e)
#                  X   sym node ... reg = GAIN mode: neighbour whose free set the chosen reg emptied (0x107832c9 -> mark 0x107a90e6)
#                  A|B edx node ... n3 = GAIN=2 mode (only I/P/X/A/B): n3 accumulation, A = referenced (+= [n+0x18]*edx), B = live only (-= edx), C = live only on the esi==2 path (-= weight ebp), Q = def point (+= [n+0x18]*edx); WGT=1 adds W weight block .. depth per block (drops C and X)
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
.equ GAIN, ${GAIN:-0}
.equ WGT, ${WGT:-0}
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
  jmp 0x107724fc
# V 0x1077c13e: colour node created, edi = sym, eax = new id
caveV:
  mov eax,ds:0x10882154
  mov [esi+0x1c],eax
  pushad
  pushfd
  mov ebx,edi
  push eax
  push offset strV
  call nlog
  add esp,8
  popfd
  popad
  jmp 0x1077c146
# Y 0x107820d7: recycled colour node esi (keeps id [esi+0x1c]), edi = sym
caveY:
  mov eax,[esi+0x30]
  mov ds:0x108a92d8,eax
  pushad
  pushfd
  mov ebx,edi
  push dword ptr [esi+0x1c]
  push offset strY
  call nlog
  add esp,8
  popfd
  popad
  jmp 0x1077c14c
# R 0x1077c213: 0x26a reload creation, edi = var
caveR:
  mov edi,eax
  pushad
  pushfd
  mov ebx,edi
  mov esi,edi
  push dword ptr [esp+0x24+0x2c]
  push offset strR
  call nlog
  add esp,8
  popfd
  popad
  cmp byte ptr [edi+4],0xd
  jmp 0x1077c219

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
strR: .ascii "OWR\0"
strV: .ascii "OWV\0"
strY: .ascii "OWY\0"
strE: .ascii "OWE\0"
strI: .ascii "OWI\0"
strP: .ascii "OWP\0"
strG: .ascii "OWG\0"
strX: .ascii "OWX\0"
.if GAIN == 2
strA: .ascii "OWA\0"
strB: .ascii "OWB\0"
strC: .ascii "OWC\0"
strQ: .ascii "OWQ\0"
strW: .ascii "OWW\0"
.endif
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
for va, k, n, orig in [(0x107724f6, 'caveF', 6, '8b130fb7426d'), (0x1077c213, 'caveR', 6, '8bf8807f040d'), (0x1077c13e, 'caveV', 8, 'a15421881089461c'), (0x107820d7, 'caveY', 8, '8b4630a3d8928a10'), (0x107825e5, 'caveT', 8, '8b442440f6400901'),
                       (0x10782600, 'caveU', 8, '807d08018b5c2410'), (0x107826e4, 'caveD', 9, '8a45083c018b742418'),
                       (0x10782626, 'caveK', 6, '8b451c8b7008'), (0x10782713, 'caveE', 6, '8b451c8b6808'), (0x1078266b, 'caveN', 8, '85c00f8484130000'),
                       (0x10784bf4, 'caveI', 5, '8941188bc7'), (0x10782a5e, 'caveP', 5, '8b45403bc7'),
                       (0x10783a45, 'caveA', 9, '8b580c80e1ef884806'), (0x10783a7b, 'caveB', 5, '2bca89480c'), (0x107c21ce, 'caveC', 7, '2bcde9a818fcff'), (0x10782919, 'caveQ', 6, '8b48188b580c'), (0x1078245a, 'caveW', 7, '894424248b431c'),
                       (0x107832c9, 'caveX', 9, '833800 0f8414 5e0200'.replace(' ', '')),
                       (0x10784b8f, 'caveG', 5, '8b4740 85c0'.replace(' ', ''))]:
    if k not in sym: continue
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
