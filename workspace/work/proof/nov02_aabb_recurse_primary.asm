100065c0 push     ebx
100065c1 push     esi
100065c2 xor      bl, bl
100065c4 test     eax, eax
100065c6 push     edi
100065c7 mov      esi, edx
100065c9 jle      0x1000662c
100065cb add      ecx, 0x11
100065ce mov      edx, eax
100065d0 movzx    eax, byte ptr [ecx + 2]
100065d4 cmp      dword ptr [esp + 0x10], eax
100065d8 jg       0x10006622
100065da movzx    eax, byte ptr [ecx - 1]
100065de mov      edi, esi
100065e0 sub      edi, eax
100065e2 movzx    eax, byte ptr [ecx]
100065e5 fld      dword ptr [edi + 0xc]
100065e8 fmul     dword ptr [ecx - 0x11]
100065eb mov      edi, esi
100065ed sub      edi, eax
100065ef movzx    eax, byte ptr [ecx + 1]
100065f3 fld      dword ptr [edi + 0x14]
100065f6 fmul     dword ptr [ecx - 0xd]
100065f9 mov      edi, esi
100065fb sub      edi, eax
100065fd faddp    st(1)
100065ff fld      dword ptr [edi + 0x1c]
10006602 fmul     dword ptr [ecx - 9]
10006605 faddp    st(1)
10006607 fadd     dword ptr [ecx - 5]
1000660a fcomp    dword ptr [0x1019bc84]
10006610 fnstsw   ax
10006612 test     ah, 1
10006615 jne      0x10006620
10006617 mov      al, byte ptr [esp + 0x10]
1000661b mov      byte ptr [ecx + 2], al
1000661e jmp      0x10006622
10006620 mov      bl, 1
10006622 add      ecx, 0x14
10006625 dec      edx
10006626 jne      0x100065d0
10006628 test     bl, bl
1000662a jne      0x10006657
1000662c mov      esi, dword ptr [0x101ce5c0]
10006632 xor      eax, eax
10006634 test     esi, esi
10006636 jle      0x10006651
10006638 mov      ecx, dword ptr [0x101ce5c4]
1000663e mov      edi, edi
10006640 mov      edx, dword ptr [ecx + eax*4]
10006643 mov      edi, dword ptr [esp + 0x10]
10006647 cmp      edi, dword ptr [edx + 0x18]
1000664a jle      0x10006657
1000664c inc      eax
1000664d cmp      eax, esi
1000664f jl       0x10006640
10006651 pop      edi
10006652 pop      esi
10006653 xor      al, al
10006655 pop      ebx
10006656 ret      
10006657 pop      edi
10006658 pop      esi
10006659 mov      al, 1
1000665b pop      ebx
1000665c ret      
