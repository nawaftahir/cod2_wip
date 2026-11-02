
RB_PushMatrixStack 1003e480/46
1003e480 mov      eax, dword ptr [0x10730550]
1003e485 imul     eax, eax, 0xcd0
1003e48b push     esi
1003e48c push     edi
1003e48d lea      esi, [eax + 0x1072dee0]
1003e493 lea      edi, [eax + 0x1072ebb0]
1003e499 mov      ecx, 0x334
1003e49e rep movsd dword ptr es:[edi], dword ptr [esi]
1003e4a0 mov      eax, dword ptr [0x10730550]
1003e4a5 inc      eax
1003e4a6 pop      edi
1003e4a7 mov      dword ptr [0x10730550], eax
1003e4ac pop      esi
1003e4ad ret      

RB_TessPoly 1003ef30/489
1003ef30 push     ebp
1003ef31 mov      ebp, esp
1003ef33 and      esp, 0xfffffff8
1003ef36 push     ecx
1003ef37 mov      eax, dword ptr [0x1072d9cc]
1003ef3c push     ebx
1003ef3d push     esi
1003ef3e mov      esi, 1
1003ef43 cmp      eax, esi
1003ef45 push     edi
1003ef46 je       0x1003ef65
1003ef48 mov      eax, dword ptr [0x1072d9d0]
1003ef4d test     eax, eax
1003ef4f jne      0x1003ef5a
1003ef51 mov      eax, dword ptr [0x1072d9e0]
1003ef56 test     eax, eax
1003ef58 je       0x1003ef5f
1003ef5a call     0x1003a8d0
1003ef5f mov      dword ptr [0x1072d9cc], esi
1003ef65 mov      ebx, dword ptr [ebp + 8]
1003ef68 movzx    eax, word ptr [ebx + 0xa]
1003ef6c mov      ecx, dword ptr [0x1072d9d4]
1003ef72 lea      edx, [eax + ecx]
1003ef75 cmp      edx, 0x154a
1003ef7b jg       0x1003ef93
1003ef7d mov      ecx, dword ptr [0x1072d9d0]
1003ef83 add      eax, -2
1003ef86 lea      edx, [ecx + eax*2]
1003ef89 add      edx, eax
1003ef8b cmp      edx, 0x100000
1003ef91 jle      0x1003ef98
1003ef93 call     0x1002df40
1003ef98 mov      eax, dword ptr [0x101ce708]
1003ef9d cmp      dword ptr [eax + 8], 2
1003efa1 jne      0x1003f057
1003efa7 xor      edx, edx
1003efa9 cmp      word ptr [ebx + 0xa], dx
1003efad jbe      0x1003f07e
1003efb3 xor      esi, esi
1003efb5 jmp      0x1003efc0
1003efb7 lea      esp, [esp]
1003efbe mov      edi, edi
1003efc0 mov      ecx, dword ptr [0x1072d9d4]
1003efc6 lea      eax, [ecx + edx]
1003efc9 mov      ecx, dword ptr [ebx + 0xc]
1003efcc mov      edi, dword ptr [ecx + esi]
1003efcf add      ecx, esi
1003efd1 shl      eax, 5
1003efd4 add      eax, 0x106d3200
1003efd9 mov      dword ptr [eax], edi
1003efdb mov      edi, dword ptr [ecx + 4]
1003efde mov      dword ptr [eax + 4], edi
1003efe1 mov      ecx, dword ptr [ecx + 8]
1003efe4 mov      dword ptr [eax + 8], ecx
1003efe7 mov      ecx, dword ptr [0x1072d9d4]
1003efed mov      eax, dword ptr [ebx + 0xc]
1003eff0 mov      eax, dword ptr [eax + esi + 0x18]
1003eff4 add      ecx, edx
1003eff6 shl      ecx, 5
1003eff9 mov      dword ptr [ecx + 0x106d320c], eax
1003efff mov      ecx, dword ptr [0x1072d9d4]
1003f005 lea      eax, [ecx + edx]
1003f008 mov      ecx, dword ptr [ebx + 0xc]
1003f00b mov      edi, dword ptr [ecx + esi + 0x1c]
1003f00f shl      eax, 5
1003f012 add      eax, 0x106d3210
1003f017 mov      dword ptr [eax], edi
1003f019 lea      ecx, [ecx + esi + 0x1c]
1003f01d mov      ecx, dword ptr [ecx + 4]
1003f020 mov      dword ptr [eax + 4], ecx
1003f023 mov      eax, dword ptr [0x1072d9d4]
1003f028 mov      ecx, dword ptr [ebx + 0xc]
1003f02b mov      edi, dword ptr [ecx + esi + 0x24]
1003f02f add      eax, edx
1003f031 shl      eax, 5
1003f034 add      eax, 0x106d3218
1003f039 lea      ecx, [ecx + esi + 0x24]
1003f03d mov      dword ptr [eax], edi
1003f03f mov      ecx, dword ptr [ecx + 4]
1003f042 mov      dword ptr [eax + 4], ecx
1003f045 movzx    eax, word ptr [ebx + 0xa]
1003f049 inc      edx
1003f04a add      esi, 0x44
1003f04d cmp      edx, eax
1003f04f jl       0x1003efc0
1003f055 jmp      0x1003f07e
1003f057 movzx    ecx, word ptr [ebx + 0xa]
1003f05b mov      edi, dword ptr [0x1072d9d4]
1003f061 imul     ecx, ecx, 0x44
1003f064 mov      esi, dword ptr [ebx + 0xc]
1003f067 imul     edi, edi, 0x44
1003f06a mov      edx, ecx
1003f06c shr      ecx, 2
1003f06f add      edi, 0x106d3200
1003f075 rep movsd dword ptr es:[edi], dword ptr [esi]
1003f077 mov      ecx, edx
1003f079 and      ecx, 3
1003f07c rep movsb byte ptr es:[edi], byte ptr [esi]
1003f07e movzx    ecx, word ptr [ebx + 0xa]
1003f082 sub      ecx, 2
1003f085 xor      eax, eax
1003f087 test     ecx, ecx
1003f089 jle      0x1003f102
1003f08b jmp      0x1003f090
1003f08d lea      ecx, [ecx]
1003f090 mov      edi, dword ptr [0x1072d9d0]
1003f096 mov      edx, dword ptr [0x1072d9b0]
1003f09c mov      si, word ptr [0x1072d9d4]
1003f0a3 mov      word ptr [edx + edi*2], si
1003f0a7 mov      edx, dword ptr [0x1072d9d4]
1003f0ad mov      edi, dword ptr [0x1072d9d0]
1003f0b3 mov      esi, dword ptr [0x1072d9b0]
1003f0b9 lea      edx, [eax + edx + 1]
1003f0bd mov      word ptr [esi + edi*2 + 2], dx
1003f0c2 mov      edx, dword ptr [0x1072d9d4]
1003f0c8 mov      esi, dword ptr [0x1072d9d0]
1003f0ce mov      edi, dword ptr [0x1072d9b0]
1003f0d4 lea      edx, [eax + edx + 2]
1003f0d8 mov      word ptr [edi + esi*2 + 4], dx
1003f0dd mov      edi, dword ptr [0x1072d9d0]
1003f0e3 add      edi, 3
1003f0e6 inc      eax
1003f0e7 cmp      eax, ecx
1003f0e9 mov      dword ptr [0x1072d9d0], edi
1003f0ef jl       0x1003f090
1003f0f1 movzx    eax, word ptr [ebx + 0xa]
1003f0f5 add      dword ptr [0x1072d9d4], eax
1003f0fb pop      edi
1003f0fc pop      esi
1003f0fd pop      ebx
1003f0fe mov      esp, ebp
1003f100 pop      ebp
1003f101 ret      
1003f102 movzx    ecx, word ptr [ebx + 0xa]
1003f106 mov      eax, dword ptr [0x1072d9d4]
1003f10b pop      edi
1003f10c add      eax, ecx
1003f10e pop      esi
1003f10f mov      dword ptr [0x1072d9d4], eax
1003f114 pop      ebx
1003f115 mov      esp, ebp
1003f117 pop      ebp
1003f118 ret      

RB_TessTriangles 100415f0/153
100415f0 push     ebp
100415f1 mov      ebp, esp
100415f3 and      esp, 0xfffffff8
100415f6 push     ecx
100415f7 mov      eax, dword ptr [0x1072d9e0]
100415fc test     eax, eax
100415fe push     esi
100415ff mov      esi, dword ptr [ebp + 8]
10041602 je       0x1004161f
10041604 mov      eax, dword ptr [0x1072d9e8]
10041609 cmp      eax, dword ptr [esi + 0x1c]
1004160c jne      0x1004161a
1004160e movzx    ecx, word ptr [esi + 0x20]
10041612 cmp      dword ptr [0x1072d9e4], ecx
10041618 je       0x1004161f
1004161a call     0x1002df40
1004161f movzx    edx, word ptr [esi + 0x22]
10041623 add      edx, dword ptr [0x1072d9e0]
10041629 cmp      edx, 0x100000
1004162f jle      0x10041636
10041631 call     0x1002df40
10041636 mov      edx, dword ptr [0x1072d9b4]
1004163c mov      dword ptr [0x1072d9b8], 1
10041646 movzx    eax, word ptr [esi + 0x22]
1004164a mov      ecx, dword ptr [esi + 0x24]
1004164d shl      eax, 1
1004164f push     eax
10041650 mov      eax, dword ptr [0x1072d9e0]
10041655 push     ecx
10041656 lea      ecx, [edx + eax*2]
10041659 push     ecx
1004165a call     0x1005eaf0
1004165f movzx    edx, word ptr [esi + 0x22]
10041663 mov      eax, dword ptr [0x1072d9e0]
10041668 add      esp, 0xc
1004166b add      eax, edx
1004166d mov      dword ptr [0x1072d9e0], eax
10041672 mov      eax, dword ptr [esi + 0x1c]
10041675 mov      dword ptr [0x1072d9e8], eax
1004167a movzx    ecx, word ptr [esi + 0x20]
1004167e mov      dword ptr [0x1072d9e4], ecx
10041684 pop      esi
10041685 mov      esp, ebp
10041687 pop      ebp
10041688 ret      

RB_TessStaticModelCached 10041510/209
10041510 mov      ecx, dword ptr [0x1072d9e0]
10041516 push     esi
10041517 push     edi
10041518 mov      edi, dword ptr [esp + 0xc]
1004151c mov      eax, dword ptr [edi + 4]
1004151f movsx    eax, word ptr [eax + 4]
10041523 lea      esi, [eax + eax*2]
10041526 add      ecx, esi
10041528 cmp      ecx, 0x100000
1004152e jle      0x10041535
10041530 call     0x1002df40
10041535 mov      edx, dword ptr [0x101ce7ec]
1004153b mov      dword ptr [0x1072d9b8], 2
10041545 mov      dword ptr [0x1072d9e8], 0
1004154f mov      dword ptr [0x1072d9e4], 0x10000
10041559 mov      eax, dword ptr [edx + 8]
1004155c test     eax, eax
1004155e je       0x100415ab
10041560 mov      eax, dword ptr [0x1072d9bc]
10041565 mov      ecx, dword ptr [eax]
10041567 push     ecx
10041568 push     0x1019a3b4
1004156d call     0x10060c70
10041572 mov      edx, dword ptr [0x101ce7ec]
10041578 mov      ecx, dword ptr [edx + 8]
1004157b add      esp, 8
1004157e test     ecx, ecx
10041580 je       0x100415ab
10041582 mov      ecx, dword ptr [0x10764584]
10041588 test     ecx, ecx
1004158a setne    dl
1004158d test     dl, dl
1004158f je       0x100415ab
10041591 push     eax
10041592 push     0x10193358
10041597 push     ecx
10041598 call     0x100f6d05
1004159d mov      eax, dword ptr [0x10764584]
100415a2 push     eax
100415a3 call     0x100f6c3d
100415a8 add      esp, 0x10
100415ab mov      eax, dword ptr [0x1072d9e0]
100415b0 mov      ecx, dword ptr [0x1072d9b4]
100415b6 lea      ecx, [ecx + eax*2]
100415b9 add      eax, esi
100415bb mov      dword ptr [0x1072d9e0], eax
100415c0 mov      eax, dword ptr [edi + 8]
100415c3 mov      eax, dword ptr [eax]
100415c5 lea      edx, [esi + esi]
100415c8 push     edx
100415c9 lea      edx, [eax + eax*2]
100415cc mov      eax, dword ptr [0x101d49b8]
100415d1 lea      edx, [eax + edx*4]
100415d4 push     edx
100415d5 push     ecx
100415d6 call     0x1005eaf0
100415db add      esp, 0xc
100415de pop      edi
100415df pop      esi
100415e0 ret      

RB_TessXModelRigid 100413c0/326
100413c0 push     ebp
100413c1 mov      ebp, esp
100413c3 and      esp, 0xfffffff8
100413c6 sub      esp, 0x14
100413c9 mov      eax, dword ptr [0x1072d9d0]
100413ce push     ebx
100413cf xor      ebx, ebx
100413d1 cmp      eax, ebx
100413d3 push     esi
100413d4 push     edi
100413d5 jne      0x100413df
100413d7 cmp      dword ptr [0x1072d9e0], ebx
100413dd je       0x100413e4
100413df call     0x1003a8d0
100413e4 mov      eax, dword ptr [0x101ce7ec]
100413e9 cmp      dword ptr [eax + 8], ebx
100413ec je       0x1004143e
100413ee mov      ecx, dword ptr [0x1072d9bc]
100413f4 mov      edx, dword ptr [ecx]
100413f6 push     edx
100413f7 push     0x1019a3dc
100413fc call     0x10060c70
10041401 mov      ecx, dword ptr [0x101ce7ec]
10041407 mov      edx, dword ptr [ecx + 8]
1004140a add      esp, 8
1004140d cmp      edx, ebx
1004140f je       0x1004143e
10041411 mov      edx, dword ptr [0x10764584]
10041417 cmp      edx, ebx
10041419 setne    cl
1004141c cmp      cl, bl
1004141e je       0x1004143e
10041420 push     eax
10041421 push     0x10193358
10041426 push     edx
10041427 call     0x100f6d05
1004142c mov      edx, dword ptr [0x10764584]
10041432 add      esp, 0xc
10041435 push     edx
10041436 call     0x100f6c3d
1004143b add      esp, 4
1004143e mov      eax, dword ptr [ebp + 8]
10041441 mov      edi, dword ptr [eax + 4]
10041444 movsx    ecx, word ptr [edi + 2]
10041448 movsx    edx, word ptr [edi + 4]
1004144c mov      esi, dword ptr [edi + 0x14]
1004144f cmp      dword ptr [0x1076674c], esi
10041455 mov      dword ptr [esp + 0x1c], ebx
10041459 mov      dword ptr [esp + 0x18], ebx
1004145d mov      dword ptr [esp + 0xc], ebx
10041461 mov      dword ptr [esp + 0x10], ecx
10041465 mov      dword ptr [esp + 0x14], edx
10041469 je       0x10041470
1004146b call     0x1003ecb0
10041470 mov      edx, dword ptr [0x101ce708]
10041476 mov      esi, dword ptr [edx + 8]
10041479 mov      eax, dword ptr [edi + 0x10]
1004147c xor      ecx, ecx
1004147e cmp      esi, 2
10041481 setne    cl
10041484 dec      ecx
10041485 and      ecx, 0xffffffe4
10041488 add      ecx, 0x40
1004148b mov      edi, ecx
1004148d cmp      dword ptr [0x10766750], eax
10041493 jne      0x100414a5
10041495 cmp      dword ptr [0x10766754], ebx
1004149b jne      0x100414a5
1004149d cmp      dword ptr [0x10766758], edi
100414a3 je       0x100414b2
100414a5 push     eax
100414a6 xor      ebx, ebx
100414a8 xor      esi, esi
100414aa call     0x1003ed20
100414af add      esp, 4
100414b2 mov      eax, dword ptr [0x10730550]
100414b7 imul     eax, eax, 0xcd0
100414bd lea      esi, [eax + 0x1072dee0]
100414c3 lea      edi, [eax + 0x1072ebb0]
100414c9 mov      ecx, 0x334
100414ce rep movsd dword ptr es:[edi], dword ptr [esi]
100414d0 mov      eax, dword ptr [0x10730550]
100414d5 mov      ecx, dword ptr [ebp + 8]
100414d8 inc      eax
100414d9 mov      dword ptr [0x10730550], eax
100414de mov      eax, dword ptr [0x1072de40]
100414e3 push     eax
100414e4 call     0x1003eea0
100414e9 add      esp, 4
100414ec lea      ecx, [esp + 0xc]
100414f0 push     ecx
100414f1 push     ebx
100414f2 call     0x1003a580
100414f7 add      esp, 8
100414fa call     0x1003e4b0
100414ff pop      edi
10041500 pop      esi
10041501 pop      ebx
10041502 mov      esp, ebp
10041504 pop      ebp
10041505 ret      

outlined rigid matrix copy (descriptive) 1003eea0/123
1003eea0 mov      eax, dword ptr [0x10730550]
1003eea5 mov      edx, dword ptr [ecx + 8]
1003eea8 imul     eax, eax, 0xcd0
1003eeae add      eax, 0x1072def0
1003eeb3 mov      dword ptr [eax], edx
1003eeb5 mov      edx, dword ptr [ecx + 0xc]
1003eeb8 mov      dword ptr [eax + 4], edx
1003eebb mov      edx, dword ptr [ecx + 0x10]
1003eebe mov      dword ptr [eax + 8], edx
1003eec1 xor      edx, edx
1003eec3 mov      dword ptr [eax + 0xc], edx
1003eec6 push     esi
1003eec7 mov      esi, dword ptr [ecx + 0x14]
1003eeca mov      dword ptr [eax + 0x10], esi
1003eecd mov      esi, dword ptr [ecx + 0x18]
1003eed0 mov      dword ptr [eax + 0x14], esi
1003eed3 mov      esi, dword ptr [ecx + 0x1c]
1003eed6 mov      dword ptr [eax + 0x18], esi
1003eed9 mov      dword ptr [eax + 0x1c], edx
1003eedc mov      esi, dword ptr [ecx + 0x20]
1003eedf mov      dword ptr [eax + 0x20], esi
1003eee2 mov      esi, dword ptr [ecx + 0x24]
1003eee5 mov      dword ptr [eax + 0x24], esi
1003eee8 mov      esi, dword ptr [ecx + 0x28]
1003eeeb mov      dword ptr [eax + 0x28], esi
1003eeee mov      dword ptr [eax + 0x2c], edx
1003eef1 mov      edx, dword ptr [ecx + 0x2c]
1003eef4 mov      dword ptr [eax + 0x30], edx
1003eef7 mov      edx, dword ptr [ecx + 0x30]
1003eefa mov      dword ptr [eax + 0x34], edx
1003eefd mov      ecx, dword ptr [ecx + 0x34]
1003ef00 mov      edx, dword ptr [esp + 8]
1003ef04 mov      dword ptr [eax + 0x38], ecx
1003ef07 mov      dword ptr [eax + 0x3c], 0x3f800000
1003ef0e mov      eax, dword ptr [edx + 0x38]
1003ef11 pop      esi
1003ef12 mov      dword ptr [esp + 4], eax
1003ef16 jmp      0x1003de30
