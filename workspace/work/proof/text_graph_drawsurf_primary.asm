
1002f330/187
1002f330 cmp      eax, 6
1002f333 push     esi
1002f334 jne      0x1002f376
1002f336 cmp      edx, 0x1f
1002f339 jne      0x1002f376
1002f33b cmp      ecx, 0x7fe
1002f341 jne      0x1002f34a
1002f343 mov      eax, 9
1002f348 jmp      0x1002f3c8
1002f34a cmp      ecx, 0x7ff
1002f350 jne      0x1002f359
1002f352 mov      eax, 0xf
1002f357 jmp      0x1002f3c8
1002f359 mov      edx, dword ptr [0x1072ddc4]
1002f35f imul     ecx, ecx, 0x74
1002f362 mov      esi, dword ptr [ecx + edx]
1002f365 xor      eax, eax
1002f367 cmp      esi, 2
1002f36a setne    al
1002f36d dec      eax
1002f36e and      eax, 3
1002f371 add      eax, 9
1002f374 jmp      0x1002f3c8
1002f376 mov      edx, dword ptr [0x101ce748]
1002f37c push     ebx
1002f37d mov      bl, byte ptr [edx + 8]
1002f380 test     bl, bl
1002f382 pop      ebx
1002f383 jne      0x1002f3be
1002f385 test     eax, eax
1002f387 je       0x1002f38e
1002f389 cmp      eax, 2
1002f38c jne      0x1002f3be
1002f38e cmp      ecx, 0x7ff
1002f394 je       0x1002f3b9
1002f396 cmp      ecx, 0x7fe
1002f39c jge      0x1002f3be
1002f39e mov      esi, dword ptr [0x1072ddc4]
1002f3a4 imul     ecx, ecx, 0x74
1002f3a7 mov      edx, dword ptr [ecx + esi]
1002f3aa add      ecx, esi
1002f3ac cmp      edx, 2
1002f3af jg       0x1002f3be
1002f3b1 mov      edx, dword ptr [ecx + 4]
1002f3b4 test     dh, 1
1002f3b7 jne      0x1002f3be
1002f3b9 or       eax, 0xffffffff
1002f3bc pop      esi
1002f3bd ret      
1002f3be cmp      eax, 3
1002f3c1 jl       0x1002f3e9
1002f3c3 cmp      eax, 0x1a
1002f3c6 jg       0x1002f3e9
1002f3c8 mov      ecx, dword ptr [0x101ce828]
1002f3ce mov      dl, byte ptr [ecx + 8]
1002f3d1 test     dl, dl
1002f3d3 jne      0x1002f3db
1002f3d5 xor      ecx, ecx
1002f3d7 add      eax, ecx
1002f3d9 pop      esi
1002f3da ret      
1002f3db mov      edx, dword ptr [0x106d3194]
1002f3e1 mov      ecx, dword ptr [edx + 0x219cec]
1002f3e7 add      eax, ecx
1002f3e9 pop      esi
1002f3ea ret      

1002f430/1184
1002f430 sub      esp, 0x34
1002f433 mov      edx, dword ptr [esp + 0x38]
1002f437 push     ebx
1002f438 push     ebp
1002f439 push     esi
1002f43a xor      esi, esi
1002f43c mov      dword ptr [esp + 0x34], edx
1002f440 mov      edx, dword ptr [esp + 0x48]
1002f444 push     edi
1002f445 xor      edi, edi
1002f447 cmp      edx, esi
1002f449 mov      dword ptr [esp + 0x30], esi
1002f44d mov      dword ptr [esp + 0x34], 0x1f
1002f455 mov      byte ptr [esp + 0x17], 0
1002f45a mov      byte ptr [esp + 0x15], 1
1002f45f mov      byte ptr [esp + 0x16], 1
1002f464 mov      dword ptr [esp + 0x24], 0x7fe
1002f46c mov      dword ptr [esp + 0x1c], esi
1002f470 mov      dword ptr [esp + 0x2c], 0xffffffff
1002f478 mov      dword ptr [esp + 0x28], edi
1002f47c mov      dword ptr [esp + 0x18], edi
1002f480 mov      dword ptr [esp + 0x20], 0x7f7fffff
1002f488 mov      dword ptr [0x1072de40], 0x1072de48
1002f492 mov      dword ptr [0x1072de44], esi
1002f498 jne      0x1002f4a5
1002f49a mov      dword ptr [esp + 0x4c], eax
1002f49e mov      eax, 1
1002f4a3 jmp      0x1002f4b0
1002f4a5 lea      eax, [eax + ecx*8 - 8]
1002f4a9 mov      dword ptr [esp + 0x4c], eax
1002f4ad or       eax, 0xffffffff
1002f4b0 cmp      ecx, esi
1002f4b2 jle      0x1002f860
1002f4b8 lea      edx, [eax*8]
1002f4bf mov      dword ptr [esp + 0x3c], ecx
1002f4c3 mov      ecx, dword ptr [esp + 0x4c]
1002f4c7 mov      dword ptr [esp + 0x40], edx
1002f4cb jmp      0x1002f4d0
1002f4cd lea      ecx, [ecx]
1002f4d0 mov      eax, dword ptr [ecx]
1002f4d2 cmp      eax, dword ptr [esp + 0x2c]
1002f4d6 jne      0x1002f4f9
1002f4d8 mov      al, byte ptr [esp + 0x17]
1002f4dc test     al, al
1002f4de jne      0x1002f83f
1002f4e4 mov      eax, dword ptr [ecx + 4]
1002f4e7 mov      ecx, dword ptr [eax]
1002f4e9 push     eax
1002f4ea call     dword ptr [ecx*4 + 0x101904f8]
1002f4f1 add      esp, 4
1002f4f4 jmp      0x1002f83f
1002f4f9 mov      edx, eax
1002f4fb and      edx, 0x80000000
1002f501 mov      dword ptr [esp + 0x2c], eax
1002f505 mov      ebp, eax
1002f507 je       0x1002f50e
1002f509 shr      ebp, 0x13
1002f50c jmp      0x1002f511
1002f50e shr      ebp, 4
1002f511 and      ebp, 0xfff
1002f517 cmp      ebp, 0x800
1002f51d jl       0x1002f524
1002f51f mov      ebp, 0x7fe
1002f524 cmp      edx, esi
1002f526 mov      ecx, eax
1002f528 je       0x1002f52f
1002f52a shr      ecx, 9
1002f52d jmp      0x1002f532
1002f52f shr      ecx, 0x15
1002f532 and      ecx, 0x3ff
1002f538 cmp      edx, esi
1002f53a mov      edi, dword ptr [ecx*4 + 0x101d0b08]
1002f541 je       0x1002f548
1002f543 shr      eax, 4
1002f546 jmp      0x1002f54b
1002f548 shr      eax, 0x10
1002f54b and      eax, 0x1f
1002f54e mov      ebx, eax
1002f550 mov      eax, dword ptr [esp + 0x48]
1002f554 mov      ecx, ebp
1002f556 mov      edx, ebx
1002f558 call     0x1002f330
1002f55d mov      edx, dword ptr [0x101ce7bc]
1002f563 mov      esi, eax
1002f565 mov      al, byte ptr [edx + 8]
1002f568 test     al, al
1002f56a jne      0x1002f572
1002f56c test     byte ptr [edi + 0x30], 0x30
1002f570 jne      0x1002f597
1002f572 cmp      esi, -1
1002f575 je       0x1002f597
1002f577 mov      eax, dword ptr [edi + 0x38]
1002f57a mov      ecx, dword ptr [eax + esi*4 + 4]
1002f57e test     ecx, ecx
1002f580 je       0x1002f597
1002f582 cmp      ebp, dword ptr [esp + 0x24]
1002f586 mov      edx, dword ptr [0x1072ddc4]
1002f58c mov      byte ptr [esp + 0x17], 0
1002f591 jne      0x1002f5a1
1002f593 mov      cl, 1
1002f595 jmp      0x1002f5fa
1002f597 mov      byte ptr [esp + 0x17], 1
1002f59c jmp      0x1002f83d
1002f5a1 cmp      ebp, 0x7fe
1002f5a7 je       0x1002f5dc
1002f5a9 cmp      ebp, 0x7ff
1002f5af je       0x1002f5dc
1002f5b1 mov      ecx, ebp
1002f5b3 imul     ecx, ecx, 0x74
1002f5b6 mov      eax, dword ptr [ecx + edx]
1002f5b9 mov      cl, byte ptr [eax + 0x1019806c]
1002f5bf test     cl, cl
1002f5c1 jne      0x1002f5dc
1002f5c3 mov      byte ptr [esp + 0x16], 0
1002f5c8 xor      cl, cl
1002f5ca cmp      ebp, 0x7fe
1002f5d0 jne      0x1002f5ed
1002f5d2 mov      dword ptr [esp + 0x18], 0
1002f5da jmp      0x1002f5fa
1002f5dc mov      al, byte ptr [esp + 0x15]
1002f5e0 test     al, al
1002f5e2 mov      byte ptr [esp + 0x16], 1
1002f5e7 je       0x1002f5c8
1002f5e9 mov      cl, 1
1002f5eb jmp      0x1002f5ca
1002f5ed mov      eax, ebp
1002f5ef imul     eax, eax, 0x74
1002f5f2 fld      dword ptr [eax + edx + 0x5c]
1002f5f6 fstp     dword ptr [esp + 0x18]
1002f5fa cmp      edi, dword ptr [esp + 0x30]
1002f5fe jne      0x1002f621
1002f600 cmp      ebx, dword ptr [esp + 0x34]
1002f604 jne      0x1002f621
1002f606 cmp      esi, dword ptr [esp + 0x38]
1002f60a jne      0x1002f621
1002f60c fld      dword ptr [esp + 0x20]
1002f610 fld      dword ptr [esp + 0x18]
1002f614 fucompp  
1002f616 fnstsw   ax
1002f618 test     ah, 0x44
1002f61b jp       0x1002f621
1002f61d test     cl, cl
1002f61f jne      0x1002f682
1002f621 mov      eax, dword ptr [0x1072d9d0]
1002f626 test     eax, eax
1002f628 jne      0x1002f633
1002f62a mov      eax, dword ptr [0x1072d9e0]
1002f62f test     eax, eax
1002f631 je       0x1002f638
1002f633 call     0x1003a8d0
1002f638 fld      dword ptr [esp + 0x20]
1002f63c fld      dword ptr [esp + 0x18]
1002f640 fucompp  
1002f642 fnstsw   ax
1002f644 test     ah, 0x44
1002f647 jnp      0x1002f65f
1002f649 fld      dword ptr [0x1072ddbc]
1002f64f push     ecx
1002f650 fsub     dword ptr [esp + 0x1c]
1002f654 fstp     dword ptr [esp]
1002f657 call     0x1002f2a0
1002f65c add      esp, 4
1002f65f push     ebx
1002f660 call     0x1003a5f0
1002f665 mov      ecx, dword ptr [esp + 0x1c]
1002f669 mov      edx, dword ptr [0x1072ddc4]
1002f66f add      esp, 4
1002f672 mov      dword ptr [esp + 0x30], edi
1002f676 mov      dword ptr [esp + 0x34], ebx
1002f67a mov      dword ptr [esp + 0x38], esi
1002f67e mov      dword ptr [esp + 0x20], ecx
1002f682 cmp      ebp, dword ptr [esp + 0x24]
1002f686 je       0x1002f829
1002f68c cmp      ebp, 0x7fe
1002f692 je       0x1002f6c0
1002f694 cmp      ebp, 0x7ff
1002f69a je       0x1002f6c0
1002f69c mov      eax, ebp
1002f69e imul     eax, eax, 0x74
1002f6a1 add      eax, edx
1002f6a3 mov      dword ptr [0x1072de40], eax
1002f6a8 cmp      dword ptr [eax], 1
1002f6ab jg       0x1002f6ca
1002f6ad mov      edx, ebp
1002f6af imul     edx, edx, 0x68
1002f6b2 add      edx, 0x107305e8
1002f6b8 mov      dword ptr [0x1072de44], edx
1002f6be jmp      0x1002f6d4
1002f6c0 mov      eax, 0x1072de48
1002f6c5 mov      dword ptr [0x1072de40], eax
1002f6ca mov      dword ptr [0x1072de44], 0
1002f6d4 mov      cl, byte ptr [esp + 0x16]
1002f6d8 test     cl, cl
1002f6da je       0x1002f711
1002f6dc mov      al, byte ptr [esp + 0x15]
1002f6e0 test     al, al
1002f6e2 jne      0x1002f6e9
1002f6e4 call     0x1003e4b0
1002f6e9 mov      eax, dword ptr [esp + 0x1c]
1002f6ed test     eax, eax
1002f6ef je       0x1002f81d
1002f6f5 push     0x3f800000
1002f6fa push     0
1002f6fc call     0x1003e800
1002f701 add      esp, 8
1002f704 mov      dword ptr [esp + 0x1c], 0
1002f70c jmp      0x1002f81d
1002f711 mov      cl, byte ptr [esp + 0x15]
1002f715 test     cl, cl
1002f717 je       0x1002f742
1002f719 mov      eax, dword ptr [0x10730550]
1002f71e imul     eax, eax, 0xcd0
1002f724 lea      esi, [eax + 0x1072dee0]
1002f72a lea      edi, [eax + 0x1072ebb0]
1002f730 mov      ecx, 0x334
1002f735 rep movsd dword ptr es:[edi], dword ptr [esi]
1002f737 inc      dword ptr [0x10730550]
1002f73d mov      eax, dword ptr [0x1072de40]
1002f742 mov      ecx, dword ptr [eax + 0x38]
1002f745 lea      esi, [eax + 0x38]
1002f748 lea      edx, [eax + 0x3c]
1002f74b push     ecx
1002f74c lea      ecx, [eax + 0x14]
1002f74f mov      eax, dword ptr [0x10730550]
1002f754 imul     eax, eax, 0xcd0
1002f75a add      eax, 0x1072def0
1002f75f call     0x1005a3a0
1002f764 mov      edx, dword ptr [esi]
1002f766 add      esp, 4
1002f769 push     edx
1002f76a call     0x1003de30
1002f76f mov      eax, dword ptr [0x1072de40]
1002f774 mov      eax, dword ptr [eax + 4]
1002f777 mov      edi, dword ptr [esp + 0x20]
1002f77b and      eax, 0x18
1002f77e add      esp, 4
1002f781 cmp      edi, eax
1002f783 mov      dword ptr [esp + 0x28], eax
1002f787 je       0x1002f81d
1002f78d mov      eax, dword ptr [0x1072d9d0]
1002f792 test     eax, eax
1002f794 jne      0x1002f79f
1002f796 mov      eax, dword ptr [0x1072d9e0]
1002f79b test     eax, eax
1002f79d je       0x1002f7a4
1002f79f call     0x1002df40
1002f7a4 mov      esi, dword ptr [esp + 0x28]
1002f7a8 cmp      esi, 0x18
1002f7ab ja       0x1002f7ed
1002f7ad movzx    ecx, byte ptr [esi + 0x1002f8e4]
1002f7b4 jmp      dword ptr [ecx*4 + 0x1002f8d4]
1002f7bb push     0x3f800000
1002f7c0 jmp      0x1002f7e3
1002f7c2 mov      edx, dword ptr [0x1072ddc8]
1002f7c8 mov      eax, dword ptr [edx + 0x148]
1002f7ce push     eax
1002f7cf call     0x1003e250
1002f7d4 add      esp, 4
1002f7d7 push     0x3e4ccccd
1002f7dc jmp      0x1002f7e3
1002f7de push     0x3f000000
1002f7e3 push     0
1002f7e5 call     0x1003e800
1002f7ea add      esp, 8
1002f7ed cmp      edi, 8
1002f7f0 jne      0x1002f819
1002f7f2 mov      edx, dword ptr [0x10730550]
1002f7f8 mov      ecx, dword ptr [0x1072ddc8]
1002f7fe imul     edx, edx, 0xcd0
1002f804 fld      dword ptr [ecx + 0xc0]
1002f80a fchs     
1002f80c fchs     
1002f80e fstp     dword ptr [edx + 0x1072e258]
1002f814 call     0x1003e130
1002f819 mov      dword ptr [esp + 0x1c], esi
1002f81d mov      al, byte ptr [esp + 0x16]
1002f821 mov      byte ptr [esp + 0x15], al
1002f825 mov      dword ptr [esp + 0x24], ebp
1002f829 mov      ecx, dword ptr [esp + 0x4c]
1002f82d mov      eax, dword ptr [ecx + 4]
1002f830 mov      edx, dword ptr [eax]
1002f832 push     eax
1002f833 call     dword ptr [edx*4 + 0x101904f8]
1002f83a add      esp, 4
1002f83d xor      esi, esi
1002f83f mov      ecx, dword ptr [esp + 0x4c]
1002f843 mov      edx, dword ptr [esp + 0x40]
1002f847 mov      eax, dword ptr [esp + 0x3c]
1002f84b add      ecx, edx
1002f84d dec      eax
1002f84e mov      dword ptr [esp + 0x4c], ecx
1002f852 mov      dword ptr [esp + 0x3c], eax
1002f856 jne      0x1002f4d0
1002f85c mov      edi, dword ptr [esp + 0x28]
1002f860 cmp      dword ptr [0x1072d9d0], esi
1002f866 jne      0x1002f870
1002f868 cmp      dword ptr [0x1072d9e0], esi
1002f86e je       0x1002f875
1002f870 call     0x1003a8d0
1002f875 cmp      edi, esi
1002f877 je       0x1002f8b2
1002f879 push     0x3f800000
1002f87e push     esi
1002f87f call     0x1003e800
1002f884 add      esp, 8
1002f887 cmp      edi, 8
1002f88a jne      0x1002f8b2
1002f88c mov      ecx, dword ptr [0x10730550]
1002f892 mov      eax, dword ptr [0x1072ddc8]
1002f897 imul     ecx, ecx, 0xcd0
1002f89d fld      dword ptr [eax + 0xc0]
1002f8a3 fchs     
1002f8a5 fchs     
1002f8a7 fstp     dword ptr [ecx + 0x1072e258]
1002f8ad call     0x1003e130
1002f8b2 mov      al, byte ptr [esp + 0x15]
1002f8b6 test     al, al
1002f8b8 jne      0x1002f8bf
1002f8ba call     0x1003e4b0
1002f8bf pop      edi
1002f8c0 mov      dword ptr [0x1072de40], esi
1002f8c6 mov      dword ptr [0x1072de44], esi
1002f8cc pop      esi
1002f8cd pop      ebp
1002f8ce pop      ebx

1002f900/108
1002f900 push     ebp
1002f901 mov      ebp, esp
1002f903 and      esp, 0xfffffff8
1002f906 push     ecx
1002f907 mov      eax, dword ptr [ebp + 8]
1002f90a push     esi
1002f90b mov      esi, dword ptr [eax]
1002f90d movzx    ecx, word ptr [esi + 2]
1002f911 add      ecx, esi
1002f913 mov      dword ptr [eax], ecx
1002f915 mov      eax, dword ptr [0x1072d9d0]
1002f91a test     eax, eax
1002f91c jne      0x1002f927
1002f91e mov      eax, dword ptr [0x1072d9e0]
1002f923 test     eax, eax
1002f925 je       0x1002f92c
1002f927 call     0x1003a8d0
1002f92c mov      al, byte ptr [0x1072debd]
1002f931 test     al, al
1002f933 je       0x1002f93a
1002f935 call     0x1002e380
1002f93a mov      al, byte ptr [0x1072debc]
1002f93f test     al, al
1002f941 je       0x1002f948
1002f943 call     0x1003e9b0
1002f948 mov      al, byte ptr [0x10766748]
1002f94d test     al, al
1002f94f jne      0x1002f967
1002f951 mov      edx, dword ptr [esi + 4]
1002f954 mov      eax, dword ptr [esi + 0x10]
1002f957 mov      ecx, dword ptr [esi + 0xc]
1002f95a push     edx
1002f95b push     eax
1002f95c mov      eax, dword ptr [esi + 8]
1002f95f call     0x1002f430
1002f964 add      esp, 8
1002f967 pop      esi
1002f968 mov      esp, ebp
1002f96a pop      ebp
1002f96b ret      
