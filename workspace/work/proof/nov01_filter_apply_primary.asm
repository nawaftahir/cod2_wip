
100353c0/110
100353c0 mov      eax, dword ptr [ecx + 0x14]
100353c3 sub      esp, 8
100353c6 xor      edx, edx
100353c8 test     eax, eax
100353ca jle      0x1003542a
100353cc push     ebx
100353cd push     ebp
100353ce push     esi
100353cf mov      ebx, 0x1072dc1c
100353d4 sub      ebx, ecx
100353d6 push     edi
100353d7 mov      dword ptr [esp + 0x14], ebx
100353db mov      esi, 0x1072dc14
100353e0 mov      edi, 0x1072dc18
100353e5 mov      ebx, 0x1072dc10
100353ea sub      esi, ecx
100353ec sub      edi, ecx
100353ee sub      ebx, ecx
100353f0 lea      eax, [ecx + 0x20]
100353f3 mov      dword ptr [esp + 0x10], ebx
100353f7 jmp      0x10035400
100353f9 mov      ebx, dword ptr [esp + 0x10]
100353fd lea      ecx, [ecx]
10035400 mov      ebp, dword ptr [eax - 8]
10035403 mov      dword ptr [ebx + eax], ebp
10035406 mov      ebx, dword ptr [eax - 4]
10035409 mov      ebp, dword ptr [esp + 0x14]
1003540d mov      dword ptr [esi + eax], ebx
10035410 mov      ebx, dword ptr [eax]
10035412 mov      dword ptr [edi + eax], ebx
10035415 mov      ebx, dword ptr [eax + 4]
10035418 mov      dword ptr [eax + ebp], ebx
1003541b mov      ebx, dword ptr [ecx + 0x14]
1003541e inc      edx
1003541f add      eax, 0x10
10035422 cmp      edx, ebx
10035424 jl       0x100353f9
10035426 pop      edi
10035427 pop      esi
10035428 pop      ebp
10035429 pop      ebx
1003542a add      esp, 8
1003542d ret      

10035490/187
10035490 push     ebx
10035491 push     ebp
10035492 mov      ebp, dword ptr [esp + 0xc]
10035496 mov      eax, dword ptr [ebp]
10035499 push     esi
1003549a push     edi
1003549b xor      edi, edi
1003549d test     eax, eax
1003549f jle      0x1003554f
100354a5 jmp      0x100354b0
100354a7 lea      esp, [esp]
100354ae mov      edi, edi
100354b0 mov      eax, edi
100354b2 imul     eax, eax, 0x98
100354b8 lea      esi, [eax + ebp + 4]
100354bc mov      eax, edi
100354be and      eax, 1
100354c1 test     edi, edi
100354c3 jne      0x100354d3
100354c5 mov      ecx, dword ptr [ebp + 0x984]
100354cb mov      dword ptr [0x1073055c], ecx
100354d1 jmp      0x100354ee
100354d3 mov      edx, 0x264
100354d8 sub      edx, eax
100354da mov      ecx, dword ptr [ebp + edx*4]
100354de lea      ecx, [ecx + ecx*4]
100354e1 mov      edx, dword ptr [ecx*4 + 0x101d4820]
100354e8 mov      dword ptr [0x1073055c], edx
100354ee mov      ecx, dword ptr [ebp]
100354f1 dec      ecx
100354f2 cmp      edi, ecx
100354f4 jne      0x100354fe
100354f6 mov      eax, dword ptr [ebp + 0x988]
100354fc jmp      0x10035505
100354fe mov      eax, dword ptr [ebp + eax*4 + 0x98c]
10035505 call     0x1003ea30
1003550a mov      ecx, esi
1003550c call     0x100353c0
10035511 fild     dword ptr [esi + 0x10]
10035514 mov      edx, dword ptr [esi + 8]
10035517 mov      eax, dword ptr [esi + 4]
1003551a push     edx
1003551b push     eax
1003551c mov      eax, dword ptr [esi]
1003551e push     0
10035520 push     0
10035522 sub      esp, 8
10035525 fstp     dword ptr [esp + 4]
10035529 or       ebx, 0xffffffff
1003552c fild     dword ptr [esi + 0xc]
1003552f fstp     dword ptr [esp]
10035532 push     0
10035534 push     0
10035536 call     0x1002e850
1003553b add      esp, 0x20
1003553e call     0x1003a8d0
10035543 mov      eax, dword ptr [ebp]
10035546 inc      edi
10035547 cmp      edi, eax

10035560/177
10035560 mov      eax, dword ptr [0x1072ddc8]
10035565 mov      edx, dword ptr [eax + 0x3c]
10035568 fild     dword ptr [eax + 0x3c]
1003556b sub      esp, 0x99c
10035571 test     edx, edx
10035573 push     esi
10035574 jge      0x1003557c
10035576 fadd     dword ptr [0x1019bc80]
1003557c fmul     dword ptr [esp + 0x9a4]
10035583 mov      esi, dword ptr [0x101d4848]
10035589 lea      eax, [ecx + ecx*4]
1003558c shl      eax, 2
1003558f mov      edx, dword ptr [eax + 0x101d482c]
10035595 mov      eax, dword ptr [eax + 0x101d4830]
1003559b mov      dword ptr [esp + 0x990], ecx
100355a2 lea      ecx, [esp + 0xc]
100355a6 push     ecx
100355a7 push     eax
100355a8 mov      eax, dword ptr [0x101d4c6c]
100355ad push     edx
100355ae mov      edx, dword ptr [0x101d4c70]
100355b4 fmul     dword ptr [0x1019bd58]
100355ba push     edx
100355bb push     eax
100355bc fstp     dword ptr [esp + 0x18]
100355c0 mov      dword ptr [esp + 0x9a8], 0xb
100355cb mov      ecx, dword ptr [esp + 0x18]
100355cf fld      dword ptr [0x101d4c80]
100355d5 fmul     dword ptr [esp + 0x18]
100355d9 push     ecx
100355da push     ecx
100355db mov      dword ptr [esp + 0x9b4], 0xc
100355e6 fstp     dword ptr [esp]
100355e9 mov      dword ptr [esp + 0x9a8], esi
100355f0 call     0x100351a0
100355f5 lea      edx, [esp + 0x24]
100355f9 add      esp, 0x1c
100355fc push     edx
100355fd mov      dword ptr [esp + 0xc], eax
10035601 call     0x10035490
10035606 add      esp, 4
10035609 pop      esi
1003560a add      esp, 0x99c
10035610 ret      

10035620/281
10035620 fld      dword ptr [0x1019bc84]
10035626 sub      esp, 0x9a0
1003562c fld      dword ptr [esp + 0x9a4]
10035633 fucompp  
10035635 fnstsw   ax
10035637 test     ah, 0x44
1003563a jnp      0x1003571a
10035640 mov      eax, dword ptr [0x1072ddc8]
10035645 mov      ecx, dword ptr [eax + 0x3c]
10035648 fild     dword ptr [eax + 0x3c]
1003564b test     ecx, ecx
1003564d jge      0x10035655
1003564f fadd     dword ptr [0x1019bc80]
10035655 fmul     dword ptr [esp + 0x9a4]
1003565c lea      ecx, [esi + esi*4]
1003565f mov      ecx, dword ptr [ecx*4 + 0x101d4820]
10035666 lea      eax, [edi + edi*4]
10035669 fmul     dword ptr [0x1019bd58]
1003566f shl      eax, 2
10035672 mov      edx, dword ptr [eax + 0x101d482c]
10035678 mov      eax, dword ptr [eax + 0x101d4830]
1003567e fstp     dword ptr [esp + 4]
10035682 fld      dword ptr [0x101d4c80]
10035688 mov      dword ptr [esp + 0x98c], ecx
1003568f fmul     dword ptr [esp + 4]
10035693 xor      ecx, ecx
10035695 cmp      esi, 2
10035698 mov      dword ptr [esp + 0x994], 0xb
100356a3 fstp     dword ptr [esp]
100356a6 mov      dword ptr [esp + 0x998], 0xc
100356b1 mov      dword ptr [esp + 0x990], edi
100356b8 mov      dword ptr [esp + 8], ecx
100356bc jne      0x100356ed
100356be mov      dword ptr [esp + 0x20], ecx
100356c2 mov      ecx, dword ptr [0x101d1bd4]
100356c8 mov      dword ptr [esp + 0xc], ecx
100356cc mov      ecx, 1
100356d1 mov      dword ptr [esp + 0x10], 0x3f800000
100356d9 mov      dword ptr [esp + 0x14], 0x3f800000
100356e1 mov      dword ptr [esp + 0x18], edx
100356e5 mov      dword ptr [esp + 0x1c], eax
100356e9 mov      dword ptr [esp + 8], ecx
100356ed imul     ecx, ecx, 0x98
100356f3 lea      ecx, [esp + ecx + 0xc]
100356f7 push     ecx
100356f8 push     eax
100356f9 push     edx
100356fa push     eax
100356fb mov      eax, dword ptr [esp + 0x10]
100356ff push     edx
10035700 mov      edx, dword ptr [esp + 0x18]
10035704 push     edx
10035705 push     eax
10035706 call     0x100351a0
1003570b mov      ecx, dword ptr [esp + 0x24]
1003570f add      esp, 0x1c
10035712 add      ecx, eax
10035714 mov      dword ptr [esp + 8], ecx
10035718 jne      0x10035723
1003571a mov      eax, esi
1003571c add      esp, 0x9a0
10035722 ret      
10035723 lea      ecx, [esp + 8]
10035727 push     ecx
10035728 call     0x10035490
1003572d add      esp, 4
10035730 mov      eax, edi
10035732 add      esp, 0x9a0
10035738 ret      

10035740/202
10035740 push     ecx
10035741 fld      dword ptr [0x1019bc84]
10035747 push     esi
10035748 fld      dword ptr [ebx]
1003574a push     edi
1003574b fucompp  
1003574d fnstsw   ax
1003574f test     ah, 0x44
10035752 jnp      0x10035806
10035758 fild     dword ptr [0x101d48e0]
1003575e mov      edi, 9
10035763 fidiv    dword ptr [0x101d4854]
10035769 fld      st(0)
1003576b fmul     dword ptr [ebx]
1003576d fst      dword ptr [esp + 8]
10035771 mov      eax, dword ptr [esp + 8]
10035775 fstp     dword ptr [ebx]
10035777 push     eax
10035778 fmul     dword ptr [ebx + 4]
1003577b fstp     dword ptr [ebx + 4]
1003577e mov      esi, dword ptr [0x10730558]
10035784 call     0x10035620
10035789 fld      dword ptr [0x1019bc84]
1003578f mov      esi, eax
10035791 lea      ecx, [esi + esi*4]
10035794 mov      edx, dword ptr [ecx*4 + 0x101d4820]
1003579b mov      dword ptr [0x1072ded4], edx
100357a1 fld      dword ptr [ebx + 4]
100357a4 fucompp  
100357a6 add      esp, 4
100357a9 fnstsw   ax
100357ab test     ah, 0x44
100357ae jp       0x100357be
100357b0 mov      dword ptr [0x1072ded0], 1
100357ba pop      edi
100357bb pop      esi
100357bc pop      ecx
100357bd ret      
100357be fld      dword ptr [ebx + 4]
100357c1 mov      edi, 9
100357c6 fld      st(0)
100357c8 fmul     st(1)
100357ca fld      dword ptr [ebx]
100357cc fstp     st(2)
100357ce fld      st(1)
100357d0 fmul     st(2)
100357d2 fsubp    st(1)
100357d4 fsqrt    
100357d6 fstp     st(1)
100357d8 fst      dword ptr [esp + 8]
100357dc mov      eax, dword ptr [esp + 8]
100357e0 fstp     dword ptr [ebx + 4]
100357e3 push     eax
100357e4 call     0x10035620
100357e9 lea      ecx, [eax + eax*4]
100357ec mov      edx, dword ptr [ecx*4 + 0x101d4820]
100357f3 add      esp, 4
100357f6 mov      dword ptr [0x1072ded8], edx
100357fc mov      dword ptr [0x1072ded0], 2
10035806 pop      edi
10035807 pop      esi
10035808 pop      ecx
10035809 ret      
