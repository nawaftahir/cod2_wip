
1003b0c0/580
1003b0c0 mov      eax, dword ptr [0x101ce708]
1003b0c5 mov      ecx, dword ptr [eax + 8]
1003b0c8 sub      esp, 0x64
1003b0cb cmp      ecx, 2
1003b0ce jne      0x1003b0eb
1003b0d0 mov      ecx, dword ptr [esp + 0x70]
1003b0d4 mov      edx, dword ptr [esp + 0x6c]
1003b0d8 mov      eax, dword ptr [esp + 0x68]
1003b0dc push     ecx
1003b0dd push     edx
1003b0de push     eax
1003b0df call     0x1003aed0
1003b0e4 add      esp, 0xc
1003b0e7 add      esp, 0x64
1003b0ea ret      
1003b0eb mov      eax, dword ptr [0x101d1b9c]
1003b0f0 fld      dword ptr [0x1072ddf0]
1003b0f6 fmul     dword ptr [eax + 0x1b4]
1003b0fc push     esi
1003b0fd fld      dword ptr [0x1072de10]
1003b103 push     edi
1003b104 fmul     dword ptr [eax + 0x1bc]
1003b10a mov      ecx, 0x10
1003b10f mov      esi, 0x10191368
1003b114 lea      edi, [esp + 0x2c]
1003b118 faddp    st(1)
1003b11a fld      dword ptr [0x1072de00]
1003b120 fmul     dword ptr [eax + 0x1b8]
1003b126 faddp    st(1)
1003b128 fstp     dword ptr [esp + 0x1c]
1003b12c fld      dword ptr [0x1072ddf4]
1003b132 fmul     dword ptr [eax + 0x1b4]
1003b138 fld      dword ptr [0x1072de14]
1003b13e fmul     dword ptr [eax + 0x1bc]
1003b144 faddp    st(1)
1003b146 fld      dword ptr [0x1072de04]
1003b14c fmul     dword ptr [eax + 0x1b8]
1003b152 faddp    st(1)
1003b154 fstp     dword ptr [esp + 0x20]
1003b158 fld      dword ptr [0x1072ddf8]
1003b15e fmul     dword ptr [eax + 0x1b4]
1003b164 fld      dword ptr [0x1072de18]
1003b16a fmul     dword ptr [eax + 0x1bc]
1003b170 faddp    st(1)
1003b172 fld      dword ptr [0x1072de08]
1003b178 fmul     dword ptr [eax + 0x1b8]
1003b17e faddp    st(1)
1003b180 fstp     dword ptr [esp + 0x24]
1003b184 fld      dword ptr [0x1072de1c]
1003b18a fmul     dword ptr [eax + 0x1bc]
1003b190 fld      dword ptr [0x1072de0c]
1003b196 fmul     dword ptr [eax + 0x1b8]
1003b19c faddp    st(1)
1003b19e fld      dword ptr [0x1072ddfc]
1003b1a4 fmul     dword ptr [eax + 0x1b4]
1003b1aa rep movsd dword ptr es:[edi], dword ptr [esi]
1003b1ac faddp    st(1)
1003b1ae fstp     dword ptr [esp + 0x28]
1003b1b2 mov      edi, dword ptr [0x10730550]
1003b1b8 imul     edi, edi, 0xcd0
1003b1be add      edi, 0x1072e220
1003b1c4 mov      ecx, 0x10
1003b1c9 lea      esi, [esp + 0x2c]
1003b1cd rep movsd dword ptr es:[edi], dword ptr [esi]
1003b1cf call     0x1003e130
1003b1d4 lea      ecx, [esp + 0x2c]
1003b1d8 push     ecx
1003b1d9 call     0x1003df90
1003b1de mov      edx, dword ptr [esp + 0x7c]
1003b1e2 push     edx
1003b1e3 call     0x1003ad40
1003b1e8 fld      dword ptr [esp + 0x30]
1003b1ec fmul     dword ptr [0x1019be58]
1003b1f2 mov      ecx, dword ptr [esp + 0x24]
1003b1f6 mov      edx, dword ptr [esp + 0x28]
1003b1fa mov      esi, dword ptr [esp + 0x2c]
1003b1fe mov      edi, dword ptr [esp + 0x30]
1003b202 fstp     dword ptr [esp + 0x14]
1003b206 fld      dword ptr [esp + 0x30]
1003b20a mov      dword ptr [eax], ecx
1003b20c fmul     dword ptr [esp + 0x7c]
1003b210 mov      dword ptr [eax + 4], edx
1003b213 mov      dword ptr [eax + 8], esi
1003b216 mov      dword ptr [eax + 0xc], edi
1003b219 fstp     dword ptr [esp + 0x10]
1003b21d mov      dword ptr [eax + 0x40], ecx
1003b220 fld      dword ptr [esp + 0x30]
1003b224 mov      dword ptr [eax + 0x44], edx
1003b227 fmul     dword ptr [esp + 0x78]
1003b22b mov      dword ptr [eax + 0x48], esi
1003b22e mov      dword ptr [eax + 0x4c], edi
1003b231 add      esp, 8
1003b234 fstp     dword ptr [esp + 0x10]
1003b238 mov      dword ptr [eax + 0x80], ecx
1003b23e mov      dword ptr [eax + 0x84], edx
1003b244 mov      dword ptr [eax + 0x88], esi
1003b24a fld      dword ptr [esp + 0x10]
1003b24e mov      dword ptr [eax + 0x8c], edi
1003b254 mov      dword ptr [eax + 0xc8], esi
1003b25a mov      dword ptr [eax + 0xcc], edi
1003b260 mov      dword ptr [eax + 0xc0], ecx
1003b266 mov      dword ptr [eax + 0xc4], edx
1003b26c fadd     dword ptr [eax]
1003b26e pop      edi
1003b26f pop      esi
1003b270 fstp     dword ptr [eax]
1003b272 fld      dword ptr [esp]
1003b275 fadd     dword ptr [eax + 4]
1003b278 fstp     dword ptr [eax + 4]
1003b27b fld      dword ptr [esp + 4]
1003b27f fadd     dword ptr [eax + 8]
1003b282 fstp     dword ptr [eax + 8]
1003b285 fld      dword ptr [esp + 8]
1003b289 fadd     dword ptr [eax + 0x40]
1003b28c fstp     dword ptr [eax + 0x40]
1003b28f fld      dword ptr [eax + 0x44]
1003b292 fsub     dword ptr [esp]
1003b295 fstp     dword ptr [eax + 0x44]
1003b298 fld      dword ptr [esp + 4]
1003b29c fadd     dword ptr [eax + 0x48]
1003b29f fstp     dword ptr [eax + 0x48]
1003b2a2 fld      dword ptr [eax + 0x80]
1003b2a8 fsub     dword ptr [esp + 8]
1003b2ac fstp     dword ptr [eax + 0x80]
1003b2b2 fld      dword ptr [eax + 0x84]
1003b2b8 fsub     dword ptr [esp]
1003b2bb fstp     dword ptr [eax + 0x84]
1003b2c1 fld      dword ptr [esp + 4]
1003b2c5 fadd     dword ptr [eax + 0x88]
1003b2cb fstp     dword ptr [eax + 0x88]
1003b2d1 fld      dword ptr [eax + 0xc0]
1003b2d7 fsub     dword ptr [esp + 8]
1003b2db fstp     dword ptr [eax + 0xc0]
1003b2e1 fld      dword ptr [esp]
1003b2e4 fadd     dword ptr [eax + 0xc4]
1003b2ea fstp     dword ptr [eax + 0xc4]
1003b2f0 fld      dword ptr [esp + 4]
1003b2f4 fadd     dword ptr [eax + 0xc8]
1003b2fa fstp     dword ptr [eax + 0xc8]
1003b300 add      esp, 0x64
1003b303 ret      

1003b310/407
1003b310 mov      ecx, dword ptr [0x1072ddc8]
1003b316 mov      edx, dword ptr [0x101d1b9c]
1003b31c fld      dword ptr [ecx + 0xf4]
1003b322 fmul     dword ptr [edx + 0x1bc]
1003b328 sub      esp, 0x2c
1003b32b fld      dword ptr [ecx + 0xe4]
1003b331 push     ebx
1003b332 fmul     dword ptr [edx + 0x1b8]
1003b338 push     ebp
1003b339 push     esi
1003b33a push     edi
1003b33b mov      edi, dword ptr [esp + 0x40]
1003b33f faddp    st(1)
1003b341 fld      dword ptr [ecx + 0xd4]
1003b347 fmul     dword ptr [edx + 0x1b4]
1003b34d faddp    st(1)
1003b34f fcom     dword ptr [0x1019bc84]
1003b355 fnstsw   ax
1003b357 test     ah, 0x41
1003b35a jp       0x1003b36c
1003b35c fstp     st(0)
1003b35e fld      dword ptr [0x1019bc84]
1003b364 pop      edi
1003b365 pop      esi
1003b366 pop      ebp
1003b367 pop      ebx
1003b368 add      esp, 0x2c
1003b36b ret      
1003b36c fld      dword ptr [ecx + 0xe8]
1003b372 mov      ebx, dword ptr [0x101d4c6c]
1003b378 fmul     dword ptr [edx + 0x1bc]
1003b37e mov      ebp, dword ptr [0x101d4c70]
1003b384 fld      dword ptr [ecx + 0xd8]
1003b38a mov      dword ptr [esp + 0x14], ebx
1003b38e fmul     dword ptr [edx + 0x1b8]
1003b394 mov      dword ptr [esp + 0x1c], ebp
1003b398 faddp    st(1)
1003b39a fld      dword ptr [edx + 0x1b4]
1003b3a0 fmul     dword ptr [ecx + 0xc8]
1003b3a6 faddp    st(1)
1003b3a8 fld      dword ptr [ecx + 0xec]
1003b3ae fmul     dword ptr [edx + 0x1bc]
1003b3b4 fld      dword ptr [ecx + 0xdc]
1003b3ba fmul     dword ptr [edx + 0x1b8]
1003b3c0 faddp    st(1)
1003b3c2 fld      dword ptr [ecx + 0xcc]
1003b3c8 fmul     dword ptr [edx + 0x1b4]
1003b3ce faddp    st(1)
1003b3d0 fstp     dword ptr [esp + 0x2c]
1003b3d4 fld      dword ptr [0x1019bc78]
1003b3da fdiv     st(2)
1003b3dc fst      dword ptr [esp + 0x10]
1003b3e0 fmul     st(1)
1003b3e2 fadd     dword ptr [0x1019bc78]
1003b3e8 fimul    dword ptr [esp + 0x14]
1003b3ec fisub    dword ptr [esp + 0x40]
1003b3f0 fmul     dword ptr [0x1019bcb0]
1003b3f6 fstp     dword ptr [esp + 0x14]
1003b3fa fstp     st(0)
1003b3fc fstp     st(0)
1003b3fe fld      qword ptr [0x1019bd80]
1003b404 fstp     qword ptr [esp + 0x20]
1003b408 fld      dword ptr [esp + 0x14]
1003b40c fadd     qword ptr [esp + 0x20]
1003b410 fistp    dword ptr [esp + 0x18]
1003b414 fld      dword ptr [esp + 0x10]
1003b418 mov      ecx, dword ptr [esp + 0x18]
1003b41c fmul     dword ptr [esp + 0x2c]
1003b420 fadd     dword ptr [0x1019bc78]
1003b426 fimul    dword ptr [esp + 0x1c]
1003b42a fisub    dword ptr [esp + 0x44]
1003b42e fmul     dword ptr [0x1019bcb0]
1003b434 fstp     dword ptr [esp + 0x1c]
1003b438 fld      qword ptr [0x1019bd80]
1003b43e fstp     qword ptr [esp + 0x20]
1003b442 fld      dword ptr [esp + 0x1c]
1003b446 fadd     qword ptr [esp + 0x20]
1003b44a fistp    dword ptr [esp + 0x18]
1003b44e mov      esi, dword ptr [esp + 0x18]
1003b452 mov      eax, dword ptr [esp + 0x44]
1003b456 add      eax, esi
1003b458 test     ecx, ecx
1003b45a lea      edx, [ecx + edi]
1003b45d jge      0x1003b461
1003b45f xor      ecx, ecx
1003b461 cmp      edx, ebx
1003b463 jle      0x1003b467
1003b465 mov      edx, ebx
1003b467 test     esi, esi
1003b469 jge      0x1003b46d
1003b46b xor      esi, esi
1003b46d cmp      eax, ebp
1003b46f jle      0x1003b473
1003b471 mov      eax, ebp
1003b473 cmp      edx, ecx
1003b475 jle      0x1003b35e
1003b47b cmp      eax, esi
1003b47d jle      0x1003b35e
1003b483 sub      eax, esi
1003b485 sub      edx, ecx
1003b487 imul     eax, edx
1003b48a imul     edi, dword ptr [esp + 0x44]
1003b48f mov      dword ptr [esp + 0x1c], eax
1003b493 fild     dword ptr [esp + 0x1c]
1003b497 mov      dword ptr [esp + 0x1c], edi
1003b49b pop      edi
1003b49c pop      esi
1003b49d fidiv    dword ptr [esp + 0x14]
1003b4a1 pop      ebp
1003b4a2 pop      ebx
1003b4a3 add      esp, 0x2c
1003b4a6 ret      

1003b4b0/156
1003b4b0 sub      esp, 0xc
1003b4b3 push     0x10
1003b4b5 push     0x10
1003b4b7 call     0x1003b310
1003b4bc fst      dword ptr [esi + 0x18]
1003b4bf fld      dword ptr [0x1019bc84]
1003b4c5 add      esp, 8
1003b4c8 fxch     st(1)
1003b4ca fucompp  
1003b4cc fnstsw   ax
1003b4ce test     ah, 0x44
1003b4d1 jnp      0x1003b548
1003b4d3 mov      ecx, dword ptr [0x101d1b9c]
1003b4d9 fld      dword ptr [ecx + 0x1b4]
1003b4df mov      eax, dword ptr [0x1072ddc8]
1003b4e4 fmul     dword ptr [0x1019bdbc]
1003b4ea mov      edx, dword ptr [esi + 0x20]
1003b4ed push     0x2003
1003b4f2 push     0
1003b4f4 fadd     dword ptr [eax]
1003b4f6 push     0x10191348
1003b4fb push     0x10191348
1003b500 fstp     dword ptr [esp + 0x10]
1003b504 fld      dword ptr [ecx + 0x1b8]
1003b50a fmul     dword ptr [0x1019bdbc]
1003b510 fadd     dword ptr [eax + 4]
1003b513 fstp     dword ptr [esp + 0x14]
1003b517 fld      dword ptr [ecx + 0x1bc]
1003b51d lea      ecx, [esp + 0x10]
1003b521 fmul     dword ptr [0x1019bdbc]
1003b527 push     ecx
1003b528 push     eax
1003b529 push     edx
1003b52a fadd     dword ptr [eax + 8]
1003b52d fstp     dword ptr [esp + 0x24]
1003b531 call     dword ptr [0x101d4b30]
1003b537 add      esp, 0x1c
1003b53a test     eax, eax
1003b53c mov      dword ptr [esi + 0x20], eax
1003b53f je       0x1003b548
1003b541 mov      dword ptr [esi + 0x18], 0
1003b548 add      esp, 0xc
1003b54b ret      

1003b550/506
1003b550 mov      eax, dword ptr [0x1072ddb0]
1003b555 sub      esp, 8
1003b558 and      eax, 0x80000001
1003b55d push     ebx
1003b55e push     ebp
1003b55f mov      ebp, dword ptr [esp + 0x14]
1003b563 push     esi
1003b564 push     edi
1003b565 jns      0x1003b56c
1003b567 dec      eax
1003b568 or       eax, 0xfffffffe
1003b56b inc      eax
1003b56c mov      ecx, dword ptr [0x1072de30]
1003b572 lea      ebx, [eax + ecx*2]
1003b575 mov      eax, dword ptr [ebp + ebx*4 + 0x24]
1003b579 test     eax, eax
1003b57b jne      0x1003b58c
1003b57d mov      esi, ebp
1003b57f call     0x1003b4b0
1003b584 pop      edi
1003b585 pop      esi
1003b586 pop      ebp
1003b587 pop      ebx
1003b588 add      esp, 8
1003b58b ret      
1003b58c mov      eax, dword ptr [0x1072d9d0]
1003b591 test     eax, eax
1003b593 jne      0x1003b59e
1003b595 mov      eax, dword ptr [0x1072d9e0]
1003b59a test     eax, eax
1003b59c je       0x1003b5a3
1003b59e call     0x1003a8d0
1003b5a3 mov      eax, dword ptr [0x101d1b3c]
1003b5a8 cmp      dword ptr [0x1072d9bc], eax
1003b5ae mov      edi, eax
1003b5b0 mov      esi, 3
1003b5b5 jne      0x1003b5bf
1003b5b7 cmp      dword ptr [0x1072d9c0], esi
1003b5bd je       0x1003b5e0
1003b5bf mov      eax, dword ptr [0x1072d9d0]
1003b5c4 test     eax, eax
1003b5c6 jne      0x1003b5d1
1003b5c8 mov      eax, dword ptr [0x1072d9e0]
1003b5cd test     eax, eax
1003b5cf je       0x1003b5d6
1003b5d1 call     0x1003a8d0
1003b5d6 push     0x1f
1003b5d8 call     0x1003a5f0
1003b5dd add      esp, 4
1003b5e0 mov      eax, dword ptr [0x10730550]
1003b5e5 imul     eax, eax, 0xcd0
1003b5eb lea      esi, [eax + 0x1072dee0]
1003b5f1 lea      edi, [eax + 0x1072ebb0]
1003b5f7 mov      ecx, 0x334
1003b5fc rep movsd dword ptr es:[edi], dword ptr [esi]
1003b5fe fild     dword ptr [0x1072de3c]
1003b604 fdivr    dword ptr [0x1019bdc4]
1003b60a mov      byte ptr [esp + 0x1e], 0
1003b60f mov      byte ptr [esp + 0x1d], 0
1003b614 mov      byte ptr [esp + 0x1c], 0
1003b619 mov      byte ptr [esp + 0x1f], 0xff
1003b61e mov      edx, dword ptr [esp + 0x1c]
1003b622 push     edx
1003b623 sub      esp, 8
1003b626 inc      dword ptr [0x10730550]
1003b62c fstp     dword ptr [esp + 4]
1003b630 fild     dword ptr [0x1072de38]
1003b636 fdivr    dword ptr [0x1019bdc4]
1003b63c fstp     dword ptr [esp]
1003b63f call     0x1003b0c0
1003b644 mov      al, byte ptr [ebx + ebp + 0x2c]
1003b648 add      esp, 0xc
1003b64b test     al, al
1003b64d je       0x1003b6c6
1003b64f push     1
1003b651 push     4
1003b653 mov      dword ptr [esp + 0x18], 0
1003b65b mov      eax, dword ptr [ebp + ebx*4 + 0x24]
1003b65f mov      ecx, dword ptr [eax]
1003b661 lea      edx, [esp + 0x18]
1003b665 push     edx
1003b666 push     eax
1003b667 call     dword ptr [ecx + 0x1c]
1003b66a cmp      eax, 1
1003b66d jne      0x1003b691
1003b66f mov      esi, dword ptr [0x1010c0e0]
1003b675 push     0
1003b677 call     esi
1003b679 mov      eax, dword ptr [ebp + ebx*4 + 0x24]
1003b67d mov      ecx, dword ptr [eax]
1003b67f push     1
1003b681 push     4
1003b683 lea      edx, [esp + 0x18]
1003b687 push     edx
1003b688 push     eax
1003b689 call     dword ptr [ecx + 0x1c]
1003b68c cmp      eax, 1
1003b68f je       0x1003b675
1003b691 test     eax, eax
1003b693 je       0x1003b699
1003b695 mov      byte ptr [ebp + 0x10], 1
1003b699 mov      eax, dword ptr [0x101d481c]
1003b69e mov      ecx, dword ptr [esp + 0x10]
1003b6a2 cmp      ecx, eax
1003b6a4 mov      dword ptr [esp + 0x1c], eax
1003b6a8 jbe      0x1003b6ae
1003b6aa mov      byte ptr [ebp + 0x10], 1
1003b6ae test     ecx, ecx
1003b6b0 mov      dword ptr [esp + 0x14], ecx
1003b6b4 fild     dword ptr [esp + 0x14]
1003b6b8 jge      0x1003b6c0
1003b6ba fadd     dword ptr [0x1019bc80]
1003b6c0 fidiv    dword ptr [esp + 0x1c]
1003b6c4 jmp      0x1003b6cc
1003b6c6 fld      dword ptr [0x1019bc84]
1003b6cc mov      eax, dword ptr [0x1072de30]
1003b6d1 test     eax, eax
1003b6d3 jne      0x1003b6dc
1003b6d5 mov      dword ptr [ebp + 0x14], 0
1003b6dc fadd     dword ptr [ebp + 0x14]
1003b6df fst      dword ptr [ebp + 0x14]
1003b6e2 mov      eax, dword ptr [0x1072de34]
1003b6e7 mov      ecx, dword ptr [0x1072de30]
1003b6ed dec      eax
1003b6ee cmp      ecx, eax
1003b6f0 jne      0x1003b719
1003b6f2 fcomp    dword ptr [0x1019bc78]
1003b6f8 fnstsw   ax
1003b6fa test     ah, 0x41
1003b6fd jne      0x1003b706
1003b6ff mov      dword ptr [ebp + 0x14], 0x3f800000
1003b706 mov      al, byte ptr [ebp + 0x10]
1003b709 test     al, al
1003b70b jne      0x1003b713
1003b70d mov      ecx, dword ptr [ebp + 0x14]
1003b710 mov      dword ptr [ebp + 0x18], ecx
1003b713 mov      byte ptr [ebp + 0x10], 0
1003b717 jmp      0x1003b71b
1003b719 fstp     st(0)
1003b71b mov      eax, dword ptr [ebp + ebx*4 + 0x24]
1003b71f mov      edx, dword ptr [eax]
1003b721 push     2
1003b723 push     eax
1003b724 call     dword ptr [edx + 0x18]
1003b727 call     0x1003a8d0
1003b72c mov      eax, dword ptr [ebp + ebx*4 + 0x24]
1003b730 mov      ecx, dword ptr [eax]
1003b732 push     1
1003b734 push     eax
1003b735 call     dword ptr [ecx + 0x18]
1003b738 mov      byte ptr [ebx + ebp + 0x2c], 1
1003b73d call     0x1003e4b0
1003b742 pop      edi
1003b743 pop      esi
1003b744 pop      ebp
1003b745 pop      ebx
1003b746 add      esp, 8
1003b749 ret      

1003b750/570
1003b750 mov      eax, dword ptr [0x101d1b9c]
1003b755 sub      esp, 0x38
1003b758 push     ebx
1003b759 push     esi
1003b75a push     edi
1003b75b mov      edi, dword ptr [eax + 0x164]
1003b761 lea      ebx, [eax + 0x1b4]
1003b767 cmp      dword ptr [0x1072d9bc], edi
1003b76d mov      esi, 1
1003b772 jne      0x1003b77c
1003b774 cmp      dword ptr [0x1072d9c0], esi
1003b77a je       0x1003b79d
1003b77c mov      eax, dword ptr [0x1072d9d0]
1003b781 test     eax, eax
1003b783 jne      0x1003b78e
1003b785 mov      eax, dword ptr [0x1072d9e0]
1003b78a test     eax, eax
1003b78c je       0x1003b793
1003b78e call     0x1003a8d0
1003b793 push     0x1f
1003b795 call     0x1003a5f0
1003b79a add      esp, 4
1003b79d or       eax, 0xffffffff
1003b7a0 push     eax
1003b7a1 call     0x1003ac40
1003b7a6 mov      ecx, dword ptr [ebx + 8]
1003b7a9 mov      edi, eax
1003b7ab mov      eax, dword ptr [0x101d1b9c]
1003b7b0 fld      dword ptr [eax + 0x16c]
1003b7b6 mov      dword ptr [esp + 0x14], ecx
1003b7ba fmul     dword ptr [0x1019bf28]
1003b7c0 add      esp, 4
1003b7c3 fstp     dword ptr [esp + 0xc]
1003b7c7 fld      dword ptr [esp + 0x10]
1003b7cb fmul     dword ptr [esp + 0x10]
1003b7cf fcomp    dword ptr [0x1019bf24]
1003b7d5 fnstsw   ax
1003b7d7 test     ah, 0x41
1003b7da jne      0x1003b7ee
1003b7dc mov      dword ptr [esp + 0x38], 0x3f800000
1003b7e4 mov      dword ptr [esp + 0x3c], 0
1003b7ec jmp      0x1003b805
1003b7ee fld      dword ptr [ebx]
1003b7f0 mov      edx, dword ptr [ebx + 4]
1003b7f3 fchs     
1003b7f5 mov      dword ptr [esp + 0x38], edx
1003b7f9 fstp     dword ptr [esp + 0x10]
1003b7fd mov      eax, dword ptr [esp + 0x10]
1003b801 mov      dword ptr [esp + 0x3c], eax
1003b805 fld      dword ptr [ebx + 4]
1003b808 lea      esi, [esp + 0x14]
1003b80c fmul     dword ptr [0x1019bc84]
1003b812 fld      dword ptr [esp + 0x3c]
1003b816 fmul     dword ptr [ebx + 8]
1003b819 fsubp    st(1)
1003b81b fstp     dword ptr [esp + 0x14]
1003b81f fld      dword ptr [esp + 0x38]
1003b823 fmul     dword ptr [ebx + 8]
1003b826 fld      dword ptr [ebx]
1003b828 fmul     dword ptr [0x1019bc84]
1003b82e fsubp    st(1)
1003b830 fstp     dword ptr [esp + 0x18]
1003b834 fld      dword ptr [esp + 0x3c]
1003b838 fmul     dword ptr [ebx]
1003b83a fld      dword ptr [esp + 0x38]
1003b83e fmul     dword ptr [ebx + 4]
1003b841 fsubp    st(1)
1003b843 fstp     dword ptr [esp + 0x1c]
1003b847 call     0x100590b0
1003b84c fstp     st(0)
1003b84e fld      dword ptr [esp + 0x14]
1003b852 fmul     dword ptr [esp + 0xc]
1003b856 fstp     dword ptr [esp + 0x14]
1003b85a fld      dword ptr [esp + 0x18]
1003b85e fmul     dword ptr [esp + 0xc]
1003b862 fstp     dword ptr [esp + 0x18]
1003b866 fld      dword ptr [esp + 0x1c]
1003b86a fmul     dword ptr [esp + 0xc]
1003b86e fstp     dword ptr [esp + 0x1c]
1003b872 fld      dword ptr [esp + 0x18]
1003b876 fmul     dword ptr [ebx + 8]
1003b879 fld      dword ptr [esp + 0x1c]
1003b87d fmul     dword ptr [ebx + 4]
1003b880 fsubp    st(1)
1003b882 fstp     dword ptr [esp + 0x20]
1003b886 fld      dword ptr [esp + 0x1c]
1003b88a fmul     dword ptr [ebx]
1003b88c fld      dword ptr [esp + 0x14]
1003b890 fmul     dword ptr [ebx + 8]
1003b893 fsubp    st(1)
1003b895 fstp     dword ptr [esp + 0x24]
1003b899 fld      dword ptr [esp + 0x14]
1003b89d fmul     dword ptr [ebx + 4]
1003b8a0 fld      dword ptr [esp + 0x18]
1003b8a4 fmul     dword ptr [ebx]
1003b8a6 fsubp    st(1)
1003b8a8 fstp     dword ptr [esp + 0x28]
1003b8ac fld      dword ptr [esp + 0x20]
1003b8b0 fadd     dword ptr [esp + 0x14]
1003b8b4 fstp     dword ptr [esp + 0x2c]
1003b8b8 fld      dword ptr [esp + 0x24]
1003b8bc fadd     dword ptr [esp + 0x18]
1003b8c0 fstp     dword ptr [esp + 0x30]
1003b8c4 fld      dword ptr [esp + 0x28]
1003b8c8 fadd     dword ptr [esp + 0x1c]
1003b8cc fstp     dword ptr [esp + 0x34]
1003b8d0 fld      dword ptr [esp + 0x14]
1003b8d4 fsub     dword ptr [esp + 0x20]
1003b8d8 fstp     dword ptr [esp + 0x38]
1003b8dc fld      dword ptr [esp + 0x18]
1003b8e0 fsub     dword ptr [esp + 0x24]
1003b8e4 fstp     dword ptr [esp + 0x3c]
1003b8e8 fld      dword ptr [esp + 0x1c]
1003b8ec fsub     dword ptr [esp + 0x28]
1003b8f0 fstp     dword ptr [esp + 0x40]
1003b8f4 fld      dword ptr [esp + 0x2c]
1003b8f8 fadd     dword ptr [ebx]
1003b8fa fstp     dword ptr [edi]
1003b8fc fld      dword ptr [esp + 0x30]
1003b900 fadd     dword ptr [ebx + 4]
1003b903 fstp     dword ptr [edi + 4]
1003b906 fld      dword ptr [esp + 0x34]
1003b90a fadd     dword ptr [ebx + 8]
1003b90d fstp     dword ptr [edi + 8]
1003b910 fld      dword ptr [esp + 0x38]
1003b914 fadd     dword ptr [ebx]
1003b916 fstp     dword ptr [edi + 0x24]
1003b919 fld      dword ptr [esp + 0x3c]
1003b91d fadd     dword ptr [ebx + 4]
1003b920 fstp     dword ptr [edi + 0x28]
1003b923 fld      dword ptr [esp + 0x40]
1003b927 push     0
1003b929 fadd     dword ptr [ebx + 8]
1003b92c fstp     dword ptr [edi + 0x2c]
1003b92f fld      dword ptr [ebx]
1003b931 fsub     dword ptr [esp + 0x30]
1003b935 fstp     dword ptr [edi + 0x48]
1003b938 fld      dword ptr [ebx + 4]
1003b93b fsub     dword ptr [esp + 0x34]
1003b93f fstp     dword ptr [edi + 0x4c]
1003b942 fld      dword ptr [ebx + 8]
1003b945 fsub     dword ptr [esp + 0x38]
1003b949 fstp     dword ptr [edi + 0x50]
1003b94c fld      dword ptr [ebx]
1003b94e fsub     dword ptr [esp + 0x3c]
1003b952 fstp     dword ptr [edi + 0x6c]
1003b955 fld      dword ptr [ebx + 4]
1003b958 fsub     dword ptr [esp + 0x40]
1003b95c fstp     dword ptr [edi + 0x70]
1003b95f fld      dword ptr [ebx + 8]
1003b962 fsub     dword ptr [esp + 0x44]
1003b966 fstp     dword ptr [edi + 0x74]
1003b969 call     0x1003e0b0
1003b96e add      esp, 4
1003b971 call     0x1003a8d0
1003b976 push     0x3f800000
1003b97b call     0x1003e0b0
1003b980 add      esp, 4
1003b983 pop      edi
1003b984 pop      esi
1003b985 pop      ebx
1003b986 add      esp, 0x38
1003b989 ret      

1003b990/582
1003b990 mov      eax, dword ptr [0x101d1b9c]
1003b995 sub      esp, 0x3c
1003b998 push     ebx
1003b999 push     ebp
1003b99a push     esi
1003b99b push     edi
1003b99c mov      edi, dword ptr [eax + 0x164]
1003b9a2 lea      ebx, [eax + 0x1b4]
1003b9a8 mov      eax, dword ptr [0x1072d9bc]
1003b9ad xor      ebp, ebp
1003b9af cmp      eax, edi
1003b9b1 mov      esi, 1
1003b9b6 jne      0x1003b9c0
1003b9b8 cmp      dword ptr [0x1072d9c0], esi
1003b9be je       0x1003b9df
1003b9c0 cmp      dword ptr [0x1072d9d0], ebp
1003b9c6 jne      0x1003b9d0
1003b9c8 cmp      dword ptr [0x1072d9e0], ebp
1003b9ce je       0x1003b9d5
1003b9d0 call     0x1003a8d0
1003b9d5 push     0x1f
1003b9d7 call     0x1003a5f0
1003b9dc add      esp, 4
1003b9df or       eax, 0xffffffff
1003b9e2 push     eax
1003b9e3 call     0x1003ad40
1003b9e8 mov      ecx, dword ptr [ebx + 8]
1003b9eb mov      edi, eax
1003b9ed mov      eax, dword ptr [0x101d1b9c]
1003b9f2 fld      dword ptr [eax + 0x16c]
1003b9f8 mov      dword ptr [esp + 0x1c], ecx
1003b9fc fmul     dword ptr [0x1019bf28]
1003ba02 add      esp, 4
1003ba05 fstp     dword ptr [esp + 0x14]
1003ba09 fld      dword ptr [esp + 0x18]
1003ba0d fmul     dword ptr [esp + 0x18]
1003ba11 fcomp    dword ptr [0x1019bf24]
1003ba17 fnstsw   ax
1003ba19 test     ah, 0x41
1003ba1c jne      0x1003ba2c
1003ba1e mov      dword ptr [esp + 0x40], 0x3f800000
1003ba26 mov      dword ptr [esp + 0x44], ebp
1003ba2a jmp      0x1003ba43
1003ba2c fld      dword ptr [ebx]
1003ba2e mov      edx, dword ptr [ebx + 4]
1003ba31 fchs     
1003ba33 mov      dword ptr [esp + 0x40], edx
1003ba37 fstp     dword ptr [esp + 0x18]
1003ba3b mov      eax, dword ptr [esp + 0x18]
1003ba3f mov      dword ptr [esp + 0x44], eax
1003ba43 fld      dword ptr [ebx + 4]
1003ba46 lea      esi, [esp + 0x1c]
1003ba4a fmul     dword ptr [0x1019bc84]
1003ba50 fld      dword ptr [esp + 0x44]
1003ba54 fmul     dword ptr [ebx + 8]
1003ba57 fsubp    st(1)
1003ba59 fstp     dword ptr [esp + 0x1c]
1003ba5d fld      dword ptr [esp + 0x40]
1003ba61 fmul     dword ptr [ebx + 8]
1003ba64 fld      dword ptr [ebx]
1003ba66 fmul     dword ptr [0x1019bc84]
1003ba6c fsubp    st(1)
1003ba6e fstp     dword ptr [esp + 0x20]
1003ba72 fld      dword ptr [esp + 0x44]
1003ba76 fmul     dword ptr [ebx]
1003ba78 fld      dword ptr [esp + 0x40]
1003ba7c fmul     dword ptr [ebx + 4]
1003ba7f fsubp    st(1)
1003ba81 fstp     dword ptr [esp + 0x24]
1003ba85 call     0x100590b0
1003ba8a fstp     st(0)
1003ba8c fld      dword ptr [esp + 0x1c]
1003ba90 fmul     dword ptr [esp + 0x14]
1003ba94 fstp     dword ptr [esp + 0x1c]
1003ba98 fld      dword ptr [esp + 0x20]
1003ba9c fmul     dword ptr [esp + 0x14]
1003baa0 fstp     dword ptr [esp + 0x20]
1003baa4 fld      dword ptr [esp + 0x24]
1003baa8 fmul     dword ptr [esp + 0x14]
1003baac fstp     dword ptr [esp + 0x24]
1003bab0 fld      dword ptr [esp + 0x20]
1003bab4 fmul     dword ptr [ebx + 8]
1003bab7 fld      dword ptr [esp + 0x24]
1003babb fmul     dword ptr [ebx + 4]
1003babe fsubp    st(1)
1003bac0 fstp     dword ptr [esp + 0x28]
1003bac4 fld      dword ptr [esp + 0x24]
1003bac8 fmul     dword ptr [ebx]
1003baca fld      dword ptr [esp + 0x1c]
1003bace fmul     dword ptr [ebx + 8]
1003bad1 fsubp    st(1)
1003bad3 fstp     dword ptr [esp + 0x2c]
1003bad7 fld      dword ptr [esp + 0x1c]
1003badb fmul     dword ptr [ebx + 4]
1003bade fld      dword ptr [esp + 0x20]
1003bae2 fmul     dword ptr [ebx]
1003bae4 fsubp    st(1)
1003bae6 fstp     dword ptr [esp + 0x30]
1003baea fld      dword ptr [esp + 0x28]
1003baee fadd     dword ptr [esp + 0x1c]
1003baf2 fstp     dword ptr [esp + 0x34]
1003baf6 fld      dword ptr [esp + 0x2c]
1003bafa fadd     dword ptr [esp + 0x20]
1003bafe fstp     dword ptr [esp + 0x38]
1003bb02 fld      dword ptr [esp + 0x30]
1003bb06 fadd     dword ptr [esp + 0x24]
1003bb0a fstp     dword ptr [esp + 0x3c]
1003bb0e fld      dword ptr [esp + 0x1c]
1003bb12 fsub     dword ptr [esp + 0x28]
1003bb16 fstp     dword ptr [esp + 0x40]
1003bb1a fld      dword ptr [esp + 0x20]
1003bb1e fsub     dword ptr [esp + 0x2c]
1003bb22 fstp     dword ptr [esp + 0x44]
1003bb26 fld      dword ptr [esp + 0x24]
1003bb2a fsub     dword ptr [esp + 0x30]
1003bb2e fstp     dword ptr [esp + 0x48]
1003bb32 fld      dword ptr [esp + 0x34]
1003bb36 fadd     dword ptr [ebx]
1003bb38 fstp     dword ptr [edi]
1003bb3a fld      dword ptr [esp + 0x38]
1003bb3e fadd     dword ptr [ebx + 4]
1003bb41 fstp     dword ptr [edi + 4]
1003bb44 fld      dword ptr [esp + 0x3c]
1003bb48 fadd     dword ptr [ebx + 8]
1003bb4b fstp     dword ptr [edi + 8]
1003bb4e fld      dword ptr [esp + 0x40]
1003bb52 fadd     dword ptr [ebx]
1003bb54 fstp     dword ptr [edi + 0x40]
1003bb57 fld      dword ptr [esp + 0x44]
1003bb5b fadd     dword ptr [ebx + 4]
1003bb5e fstp     dword ptr [edi + 0x44]
1003bb61 fld      dword ptr [esp + 0x48]
1003bb65 fadd     dword ptr [ebx + 8]
1003bb68 fstp     dword ptr [edi + 0x48]
1003bb6b fld      dword ptr [ebx]
1003bb6d fsub     dword ptr [esp + 0x34]
1003bb71 fstp     dword ptr [edi + 0x80]
1003bb77 fld      dword ptr [ebx + 4]
1003bb7a fsub     dword ptr [esp + 0x38]
1003bb7e fstp     dword ptr [edi + 0x84]
1003bb84 fld      dword ptr [ebx + 8]
1003bb87 fsub     dword ptr [esp + 0x3c]
1003bb8b fstp     dword ptr [edi + 0x88]
1003bb91 fld      dword ptr [ebx]
1003bb93 fsub     dword ptr [esp + 0x40]
1003bb97 fstp     dword ptr [edi + 0xc0]
1003bb9d fld      dword ptr [ebx + 4]
1003bba0 fsub     dword ptr [esp + 0x44]
1003bba4 fstp     dword ptr [edi + 0xc4]
1003bbaa fld      dword ptr [ebx + 8]
1003bbad fsub     dword ptr [esp + 0x48]
1003bbb1 fstp     dword ptr [edi + 0xc8]
1003bbb7 mov      dword ptr [edi + 0xc], ebp
1003bbba mov      dword ptr [edi + 0x4c], ebp
1003bbbd mov      dword ptr [edi + 0x8c], ebp
1003bbc3 mov      dword ptr [edi + 0xcc], ebp
1003bbc9 call     0x1003a8d0
1003bbce pop      edi
1003bbcf pop      esi
1003bbd0 pop      ebp
1003bbd1 pop      ebx
1003bbd2 add      esp, 0x3c
1003bbd5 ret      

1003bbe0/244
1003bbe0 mov      eax, dword ptr [0x1072d9d0]
1003bbe5 sub      esp, 0x14
1003bbe8 test     eax, eax
1003bbea push     esi
1003bbeb push     edi
1003bbec jne      0x1003bbf7
1003bbee mov      eax, dword ptr [0x1072d9e0]
1003bbf3 test     eax, eax
1003bbf5 je       0x1003bbfc
1003bbf7 call     0x1003a8d0
1003bbfc mov      eax, dword ptr [0x101d1b9c]
1003bc01 mov      edi, dword ptr [eax + 0x168]
1003bc07 cmp      dword ptr [0x1072d9bc], edi
1003bc0d mov      esi, 3
1003bc12 jne      0x1003bc1c
1003bc14 cmp      dword ptr [0x1072d9c0], esi
1003bc1a je       0x1003bc3d
1003bc1c mov      eax, dword ptr [0x1072d9d0]
1003bc21 test     eax, eax
1003bc23 jne      0x1003bc2e
1003bc25 mov      eax, dword ptr [0x1072d9e0]
1003bc2a test     eax, eax
1003bc2c je       0x1003bc33
1003bc2e call     0x1003a8d0
1003bc33 push     0x1f
1003bc35 call     0x1003a5f0
1003bc3a add      esp, 4
1003bc3d mov      eax, dword ptr [0x10730550]
1003bc42 fld      dword ptr [esp + 0x20]
1003bc46 fmul     dword ptr [0x1019bcac]
1003bc4c imul     eax, eax, 0xcd0
1003bc52 fstp     dword ptr [esp + 0x20]
1003bc56 fld      qword ptr [0x1019bd80]
1003bc5c fstp     qword ptr [esp + 0x10]
1003bc60 lea      esi, [eax + 0x1072dee0]
1003bc66 lea      edi, [eax + 0x1072ebb0]
1003bc6c mov      ecx, 0x334
1003bc71 rep movsd dword ptr es:[edi], dword ptr [esi]
1003bc73 inc      dword ptr [0x10730550]
1003bc79 fld      dword ptr [esp + 0x20]
1003bc7d fadd     qword ptr [esp + 0x10]
1003bc81 fistp    dword ptr [esp + 0xc]
1003bc85 mov      al, byte ptr [esp + 0xc]
1003bc89 fld      dword ptr [esp + 0x24]
1003bc8d mov      byte ptr [esp + 0x22], al
1003bc91 fmul     dword ptr [0x1019bd58]
1003bc97 mov      byte ptr [esp + 0x21], al
1003bc9b mov      byte ptr [esp + 0x20], al
1003bc9f mov      byte ptr [esp + 0x23], 0xff
1003bca4 mov      ecx, dword ptr [esp + 0x20]
1003bca8 push     ecx
1003bca9 sub      esp, 8
1003bcac fstp     dword ptr [esp + 4]
1003bcb0 fld      dword ptr [esp + 0x30]
1003bcb4 fmul     dword ptr [0x1019bf20]
1003bcba fstp     dword ptr [esp]
1003bcbd call     0x1003b0c0
1003bcc2 add      esp, 0xc
1003bcc5 call     0x1003a8d0
1003bcca pop      edi
1003bccb pop      esi
1003bccc add      esp, 0x14
1003bccf jmp      0x1003e4b0

1003bce0/179
1003bce0 mov      ecx, dword ptr [0x101d1b9c]
1003bce6 mov      eax, dword ptr [ecx + 0x168]
1003bcec sub      esp, 8
1003bcef test     eax, eax
1003bcf1 je       0x1003bd8f
1003bcf7 fld      dword ptr [edx + 0x1c]
1003bcfa fcomp    dword ptr [ecx + 0x174]
1003bd00 fnstsw   ax
1003bd02 test     ah, 0x41
1003bd05 jnp      0x1003bd8f
1003bd0b fld      dword ptr [edx + 0x1c]
1003bd0e fcomp    dword ptr [ecx + 0x17c]
1003bd14 fnstsw   ax
1003bd16 test     ah, 1
1003bd19 jne      0x1003bd23
1003bd1b fld      dword ptr [0x1019bc78]
1003bd21 jmp      0x1003bd3a
1003bd23 fld      dword ptr [edx + 0x1c]
1003bd26 fsub     dword ptr [ecx + 0x174]
1003bd2c fld      dword ptr [ecx + 0x17c]
1003bd32 fsub     dword ptr [ecx + 0x174]
1003bd38 fdivp    st(1)
1003bd3a mov      eax, dword ptr [esp + 0xc]
1003bd3e fld      st(0)
1003bd40 fmul     dword ptr [ecx + 0x180]
1003bd46 push     eax
1003bd47 mov      eax, dword ptr [ecx + 0x188]
1003bd4d push     eax
1003bd4e mov      eax, dword ptr [edx + 0x18]
1003bd51 fstp     dword ptr [esp + 0xc]
1003bd55 fmul     dword ptr [ecx + 0x178]
1003bd5b fadd     dword ptr [ecx + 0x170]
1003bd61 mov      ecx, dword ptr [ecx + 0x184]
1003bd67 push     ecx
1003bd68 mov      ecx, dword ptr [edx]
1003bd6a push     eax
1003bd6b fstp     dword ptr [esp + 0x10]
1003bd6f push     ecx
1003bd70 call     0x1003abd0
1003bd75 fst      dword ptr [edx]
1003bd77 mov      edx, dword ptr [esp + 0x14]
1003bd7b fmul     dword ptr [esp + 0x18]
1003bd7f add      esp, 0x14
1003bd82 push     edx
1003bd83 push     ecx
1003bd84 fstp     dword ptr [esp]
1003bd87 call     0x1003bbe0
1003bd8c add      esp, 8
1003bd8f add      esp, 8
1003bd92 ret      

1003bda0/352
1003bda0 push     ecx
1003bda1 mov      ecx, dword ptr [0x101d1b9c]
1003bda7 mov      eax, dword ptr [0x1072ddc8]
1003bdac fld      dword ptr [ecx + 0x1bc]
1003bdb2 fmul     dword ptr [eax + 0x14]
1003bdb5 fld      dword ptr [ecx + 0x1b8]
1003bdbb fmul     dword ptr [eax + 0x10]
1003bdbe faddp    st(1)
1003bdc0 fld      dword ptr [ecx + 0x1b4]
1003bdc6 fmul     dword ptr [eax + 0xc]
1003bdc9 faddp    st(1)
1003bdcb fstp     dword ptr [esp]
1003bdce fld      dword ptr [ecx + 0x194]
1003bdd4 fcomp    dword ptr [0x1019bc84]
1003bdda fnstsw   ax
1003bddc test     ah, 0x41
1003bddf jp       0x1003bde9
1003bde1 mov      dword ptr [esi], 0
1003bde7 jmp      0x1003be63
1003bde9 fld      dword ptr [esp]
1003bdec fcomp    dword ptr [ecx + 0x18c]
1003bdf2 fnstsw   ax
1003bdf4 test     ah, 0x41
1003bdf7 jp       0x1003be01
1003bdf9 fld      dword ptr [0x1019bc84]
1003bdff jmp      0x1003be30
1003be01 fld      dword ptr [esp]
1003be04 fcomp    dword ptr [ecx + 0x190]
1003be0a fnstsw   ax
1003be0c test     ah, 1
1003be0f jne      0x1003be19
1003be11 fld      dword ptr [0x1019bc78]
1003be17 jmp      0x1003be30
1003be19 fld      dword ptr [esp]
1003be1c fsub     dword ptr [ecx + 0x18c]
1003be22 fld      dword ptr [ecx + 0x190]
1003be28 fsub     dword ptr [ecx + 0x18c]
1003be2e fdivp    st(1)
1003be30 mov      eax, dword ptr [ecx + 0x19c]
1003be36 fmul     dword ptr [edx + 0x18]
1003be39 mov      ecx, dword ptr [ecx + 0x198]
1003be3f push     edi
1003be40 push     eax
1003be41 mov      eax, dword ptr [edx + 4]
1003be44 push     ecx
1003be45 push     ecx
1003be46 fstp     dword ptr [esp]
1003be49 push     eax
1003be4a call     0x1003abd0
1003be4f fst      dword ptr [edx + 4]
1003be52 mov      ecx, dword ptr [0x101d1b9c]
1003be58 fmul     dword ptr [ecx + 0x194]
1003be5e add      esp, 0x14
1003be61 fstp     dword ptr [esi]
1003be63 mov      ecx, dword ptr [0x101d1b9c]
1003be69 fld      dword ptr [ecx + 0x1a8]
1003be6f fcomp    dword ptr [0x1019bc84]
1003be75 fnstsw   ax
1003be77 test     ah, 0x41
1003be7a jp       0x1003be84
1003be7c mov      dword ptr [ebx], 0
1003be82 pop      ecx
1003be83 ret      
1003be84 fld      dword ptr [esp]
1003be87 fcomp    dword ptr [ecx + 0x1a0]
1003be8d fnstsw   ax
1003be8f test     ah, 0x41
1003be92 jp       0x1003be9c
1003be94 fld      dword ptr [0x1019bc84]
1003be9a jmp      0x1003becb
1003be9c fld      dword ptr [esp]
1003be9f fcomp    dword ptr [ecx + 0x1a4]
1003bea5 fnstsw   ax
1003bea7 test     ah, 1
1003beaa jne      0x1003beb4
1003beac fld      dword ptr [0x1019bc78]
1003beb2 jmp      0x1003becb
1003beb4 fld      dword ptr [esp]
1003beb7 fsub     dword ptr [ecx + 0x1a0]
1003bebd fld      dword ptr [ecx + 0x1a4]
1003bec3 fsub     dword ptr [ecx + 0x1a0]
1003bec9 fdivp    st(1)
1003becb mov      eax, dword ptr [ecx + 0x1b0]
1003bed1 fmul     dword ptr [edx + 0x18]
1003bed4 mov      ecx, dword ptr [ecx + 0x1ac]
1003beda push     edi
1003bedb push     eax
1003bedc mov      eax, dword ptr [edx + 8]
1003bedf push     ecx
1003bee0 push     ecx
1003bee1 fstp     dword ptr [esp]
1003bee4 push     eax
1003bee5 call     0x1003abd0
1003beea fst      dword ptr [edx + 8]
1003beed mov      ecx, dword ptr [0x101d1b9c]
1003bef3 fmul     dword ptr [ecx + 0x1a8]
1003bef9 add      esp, 0x14
1003befc fstp     dword ptr [ebx]
1003befe pop      ecx
1003beff ret      

1003bf00/87
1003bf00 mov      ecx, dword ptr [0x101d1b9c]
1003bf06 mov      eax, dword ptr [0x1072ddc8]
1003bf0b fld      dword ptr [ecx + 0x1bc]
1003bf11 fmul     dword ptr [eax + 0x14]
1003bf14 fld      dword ptr [ecx + 0x1b8]
1003bf1a fmul     dword ptr [eax + 0x10]
1003bf1d faddp    st(1)
1003bf1f fld      dword ptr [ecx + 0x1b4]
1003bf25 fmul     dword ptr [eax + 0xc]
1003bf28 mov      eax, dword ptr [esp + 4]
1003bf2c faddp    st(1)
1003bf2e fld      st(0)
1003bf30 fstp     dword ptr [eax + 0x1c]
1003bf33 fcomp    dword ptr [0x1019bc84]
1003bf39 fnstsw   ax
1003bf3b test     ah, 0x41
1003bf3e jnp      0x1003bf56
1003bf40 mov      ecx, dword ptr [0x101ce708]
1003bf46 cmp      dword ptr [ecx + 8], 2
1003bf4a jne      0x1003bf51
1003bf4c jmp      0x1003b750
1003bf51 jmp      0x1003b990
1003bf56 ret      

1003bf60/132
1003bf60 sub      esp, 0xc
1003bf63 push     ebx
1003bf64 push     esi
1003bf65 lea      ebx, [esp + 0xc]
1003bf69 lea      esi, [esp + 0x10]
1003bf6d call     0x1003bda0
1003bf72 fld      dword ptr [esp + 0xc]
1003bf76 fmul     dword ptr [0x1019bcac]
1003bf7c call     0x1010a8a8
1003bf81 fld      dword ptr [esp + 0x10]
1003bf85 fmul     dword ptr [0x1019bcac]
1003bf8b mov      byte ptr [esp + 0xc], al
1003bf8f mov      byte ptr [esp + 0xd], al
1003bf93 mov      byte ptr [esp + 0xe], al
1003bf97 call     0x1010a8a8
1003bf9c fild     dword ptr [0x10766720]
1003bfa2 push     0x3f800000
1003bfa7 push     0x3f800000
1003bfac push     0
1003bfae push     0
1003bfb0 sub      esp, 8
1003bfb3 fstp     dword ptr [esp + 4]
1003bfb7 mov      byte ptr [esp + 0x27], al
1003bfbb fild     dword ptr [0x1076671c]
1003bfc1 mov      ebx, dword ptr [esp + 0x24]
1003bfc5 mov      eax, dword ptr [0x101d1b58]
1003bfca fstp     dword ptr [esp]
1003bfcd push     0
1003bfcf push     0
1003bfd1 call     0x1002e850
1003bfd6 add      esp, 0x20
1003bfd9 call     0x1003a8d0
1003bfde pop      esi
1003bfdf pop      ebx
1003bfe0 add      esp, 0xc
1003bfe3 ret      

1003bff0/87
1003bff0 push     ebp
1003bff1 mov      ebp, esp
1003bff3 and      esp, 0xfffffff8
1003bff6 push     ecx
1003bff7 push     esi
1003bff8 mov      esi, eax
1003bffa mov      eax, dword ptr [0x101ce684]
1003bfff mov      cl, byte ptr [eax + 8]
1003c002 test     cl, cl
1003c004 je       0x1003c042
1003c006 mov      ecx, dword ptr [0x101d1b9c]
1003c00c mov      al, byte ptr [ecx + 0x160]
1003c012 test     al, al
1003c014 je       0x1003c042
1003c016 mov      al, byte ptr [0x1072debd]
1003c01b test     al, al
1003c01d je       0x1003c024
1003c01f call     0x1002e380
1003c024 lea      esi, [esi + esi*2]
1003c027 shl      esi, 4
1003c02a add      esi, 0x10764590
1003c030 push     esi
1003c031 call     0x1003b550
1003c036 add      esp, 4
1003c039 push     esi
1003c03a call     0x1003bf00
1003c03f add      esp, 4
1003c042 pop      esi
1003c043 mov      esp, ebp
1003c045 pop      ebp
1003c046 ret      

1003c050/96
1003c050 push     ecx
1003c051 mov      ecx, dword ptr [0x1072ddb8]
1003c057 push     esi
1003c058 lea      esi, [eax + eax*2]
1003c05b shl      esi, 4
1003c05e add      esi, 0x10764590
1003c064 mov      eax, dword ptr [esi + 0xc]
1003c067 test     eax, eax
1003c069 push     edi
1003c06a je       0x1003c076
1003c06c cmp      eax, ecx
1003c06e jg       0x1003c076
1003c070 mov      edi, ecx
1003c072 sub      edi, eax
1003c074 jmp      0x1003c07b
1003c076 mov      edi, 0xa
1003c07b mov      eax, dword ptr [0x101ce684]
1003c080 mov      dword ptr [esi + 0xc], ecx
1003c083 mov      cl, byte ptr [eax + 8]
1003c086 test     cl, cl
1003c088 je       0x1003c0ac
1003c08a mov      ecx, dword ptr [0x101d1b9c]
1003c090 mov      al, byte ptr [ecx + 0x160]
1003c096 test     al, al
1003c098 je       0x1003c0ac
1003c09a push     edi
1003c09b mov      edx, esi
1003c09d call     0x1003bce0
1003c0a2 add      esp, 4
1003c0a5 mov      edx, esi
1003c0a7 call     0x1003bf60
1003c0ac pop      edi
1003c0ad pop      esi
1003c0ae pop      ecx
1003c0af ret      
