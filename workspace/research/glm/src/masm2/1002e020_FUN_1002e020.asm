.686
.MODEL FLAT, C
EXTRN sub_1002E40C:PROC
EXTRN sub_1002E41A:PROC
EXTRN sub_1002E41E:PROC
EXTRN sub_1002E4C5:PROC
EXTRN sub_1002E4D3:PROC
EXTRN sub_1002E4D6:PROC
EXTRN sub_1002E4D7:PROC
EXTRN sub_1002E539:PROC
EXTRN sub_1002E584:PROC
EXTRN sub_1002E592:PROC
EXTRN sub_1002E597:PROC
EXTRN sub_1002E5F4:PROC
EXTRN sub_1003A8F1:PROC
EXTRN sub_100F6E48:PROC
EXTRN sub_100F6EA4:PROC
EXTRN sub_100F6F01:PROC
EXTRN sub_100F6F04:PROC
EXTRN sub_100F6F5E:PROC
EXTRN sub_100F6FBD:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BE68:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DAB0:DWORD:DWORD
EXTRN EXTRN g_1072DAB4:DWORD:DWORD
EXTRN EXTRN g_1072DAB8:DWORD:DWORD
EXTRN EXTRN g_1072DABC:DWORD:DWORD
EXTRN EXTRN g_1072DAC0:DWORD:DWORD
EXTRN EXTRN g_1072DAC4:DWORD:DWORD
EXTRN EXTRN g_1072DAC8:DWORD:DWORD
EXTRN EXTRN g_1072DACC:DWORD:DWORD
EXTRN EXTRN g_1072DAD0:DWORD:DWORD
EXTRN EXTRN g_1072DAD4:DWORD:DWORD
EXTRN EXTRN g_1072DAD8:DWORD:DWORD
EXTRN EXTRN g_1072DADC:DWORD:DWORD
EXTRN EXTRN g_1072DAE0:DWORD:DWORD
EXTRN EXTRN g_1072DAE4:DWORD:DWORD
EXTRN EXTRN g_1072DAE8:DWORD:DWORD
EXTRN EXTRN g_1072DAEC:DWORD:DWORD
EXTRN EXTRN g_1072DDE0:DWORD:DWORD
EXTRN EXTRN g_1072DDE4:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
EXTRN EXTRN g_10766724:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002e020 PROC
    mov mov eax, dword ptr [g_1072D9D0]
    sub sub esp, 09Ch
    test test eax, eax
    push push ebx
    push push ebp
    push push esi
    push push edi
    jne L0
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L1
    call sub_1003A8F1
    cmp cmp dword ptr [g_10766724], 1
    mov mov byte ptr [g_1072DEBD], 1
L0:
    jne L2
    mov mov eax, dword ptr [g_1076671C]
    mov mov ecx, dword ptr [g_10766720]
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 36], ecx
    jmp L3
    mov mov edx, dword ptr [g_1072DDE0]
    mov mov eax, dword ptr [g_1072DDE4]
    mov mov ecx, dword ptr [g_1072DDE8]
    mov mov dword ptr [esp + 24], edx
    mov mov edx, dword ptr [g_1072DDEC]
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 36], edx
    fild fild dword ptr [esp + 32]
    xor xor eax, eax
    mov mov ecx, 16
    lea lea edi, [esp + 40]
    fstp fstp dword ptr [esp + 16]
    rep stosd rep stosd dword ptr es:[edi], eax
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 16]
    mov mov eax, dword ptr [g_10730550]
    mov mov ecx, 16
    mov mov esi, 010191368h
    lea lea edi, [esp + 104]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [esp + 100], 03F800000h
    mov mov ecx, 16
    lea lea esi, [esp + 40]
    fstp fstp dword ptr [esp + 20]
    imul imul eax, eax, 0CD0h
    fild fild dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 16]
    add add eax, 01072DEE0h
    lea lea edi, [eax + 0340h]
    mov mov byte ptr [eax + 0440h], 1
    lea lea ebx, [eax + 16]
    mov mov ebp, ebx
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 20]
    fadd fadd st(0), st(0)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BE68]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [g_1019BDA0]
    fsub fsub dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 88]
    fld fld dword ptr [esp + 16]
    fadd fadd dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 92]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    xor xor ecx, ecx
    mov mov word ptr [eax + 0441h], cx
    mov mov byte ptr [eax + 0443h], cl
    xor xor edx, edx
    mov mov edi, ebp
    mov mov ecx, 16
    lea lea esi, [esp + 104]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov byte ptr [eax + edx + 0110h], 1
    inc inc edx
    add add ebp, 64
    cmp cmp edx, 3
    jle L4
    lea lea edi, [eax + 0230h]
    mov mov ecx, 68
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edx, [eax + 0340h]
    lea lea edi, [eax + 0450h]
    mov mov ecx, 68
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edi, [eax + 0670h]
    mov mov esi, edx
    mov mov ecx, 68
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edi, [eax + 0780h]
    mov mov esi, edx
    mov mov edx, dword ptr [g_101CE708]
    mov mov ecx, 68
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edi, [eax + 0120h]
    mov mov ecx, 68
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edi, [eax + 0560h]
    mov mov ecx, 68
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea edi, [eax + 0890h]
    mov mov ecx, 68
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    cmp cmp dword ptr [edx + 8], 2
    jne sub_1002E4D6
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    xor xor esi, esi
    cmp cmp ecx, esi
    je sub_1002E40C
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, esi
    setne setne cl
    test test cl, cl
    je sub_1002E41A
    push push 010198198h
    push push 010193358h
    push push eax
    call sub_100F6F01
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6E48
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp + 104]
    push push ecx
    push push 0100h
    push push eax
    call call dword ptr [edx + 0B0h]
    cmp cmp dword ptr [g_1076A830], esi
    jne sub_1002E41E
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [edx + 8], esi
    je sub_1002E4C5
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, esi
    setne setne cl
    test test cl, cl
    je sub_1002E4D3
    push push 010198160h
    push push 010193358h
    push push eax
    call sub_100F6F5E
    mov mov eax, dword ptr [g_10764584]
    add add esp, 12
    push push eax
    call sub_100F6EA4
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 104]
    push push edx
    push push 2
    push push eax
    call call dword ptr [ecx + 0B0h]
    cmp cmp dword ptr [g_1076A830], esi
    jne sub_1002E4D7
    jmp sub_1002E539
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [eax + 8], esi
    je sub_1002E584
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, esi
    setne setne cl
    test test cl, cl
    je sub_1002E592
    push push 010198124h
    push push 010193358h
    push push eax
    call sub_100F6FBD
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 12
    push push ecx
    call sub_100F6F04
    add add esp, 4
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp + 40]
    push push ecx
    push push 3
    push push eax
    call call dword ptr [edx + 0B0h]
    cmp cmp dword ptr [g_1076A830], esi
    jne sub_1002E597
    jmp sub_1002E5F4
    xor xor esi, esi
    pop pop edi
    mov mov eax, 03F800000h
    mov mov dword ptr [g_1072DAB0], esi
    mov mov dword ptr [g_1072DAB4], esi
    mov mov dword ptr [g_1072DAC0], esi
    mov mov dword ptr [g_1072DAC4], esi
    mov mov dword ptr [g_1072DACC], esi
    mov mov dword ptr [g_1072DAD4], esi
    mov mov dword ptr [g_1072DAD8], esi
    mov mov dword ptr [g_1072DADC], esi
    mov mov dword ptr [g_1072DAE0], esi
    mov mov dword ptr [g_1072DAE8], esi
    mov mov dword ptr [g_1072DAEC], esi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [g_1072DAB8], eax
    mov mov dword ptr [g_1072DABC], eax
    mov mov dword ptr [g_1072DAC8], eax
    mov mov dword ptr [g_1072DAD0], eax
    mov mov dword ptr [g_1072DAE4], eax
    pop pop ebx
FUN_1002e020 ENDP
END
