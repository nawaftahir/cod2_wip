.686
.MODEL FLAT, C
EXTRN sub_1003A8F1:PROC
EXTRN sub_100F6E48:PROC
EXTRN sub_100F6EA4:PROC
EXTRN sub_100F6F01:PROC
EXTRN sub_100F6F04:PROC
EXTRN sub_100F6F5E:PROC
EXTRN sub_100F6FBD:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BE68:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DAB0:DWORD
EXTRN g_1072DAB4:DWORD
EXTRN g_1072DAB8:DWORD
EXTRN g_1072DABC:DWORD
EXTRN g_1072DAC0:DWORD
EXTRN g_1072DAC4:DWORD
EXTRN g_1072DAC8:DWORD
EXTRN g_1072DACC:DWORD
EXTRN g_1072DAD0:DWORD
EXTRN g_1072DAD4:DWORD
EXTRN g_1072DAD8:DWORD
EXTRN g_1072DADC:DWORD
EXTRN g_1072DAE0:DWORD
EXTRN g_1072DAE4:DWORD
EXTRN g_1072DAE8:DWORD
EXTRN g_1072DAEC:DWORD
EXTRN g_1072DDE0:DWORD
EXTRN g_1072DDE4:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
EXTRN g_1072DEBD:DWORD
EXTRN g_10730550:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
EXTRN g_10766724:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002e020 PROC
    mov eax, dword ptr [g_1072D9D0]
    sub esp, 00000009Ch
    test eax, eax
    push ebx
    push ebp
    push esi
    push edi
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8F1
L1:
    cmp dword ptr [g_10766724], 1
    mov byte ptr [g_1072DEBD], 1
    jne L2
    mov eax, dword ptr [g_1076671C]
    mov ecx, dword ptr [g_10766720]
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 36], ecx
    jmp L3
L2:
    mov edx, dword ptr [g_1072DDE0]
    mov eax, dword ptr [g_1072DDE4]
    mov ecx, dword ptr [g_1072DDE8]
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [g_1072DDEC]
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 36], edx
L3:
    fild dword ptr [esp + 32]
    xor eax, eax
    mov ecx, 16
    lea edi, [esp + 40]
    fstp dword ptr [esp + 16]
    rep stosd dword ptr es:[edi], eax
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 16]
    mov eax, dword ptr [g_10730550]
    mov ecx, 16
    mov esi, 010191368h
    lea edi, [esp + 104]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [esp + 100], 03F800000h
    mov ecx, 16
    lea esi, [esp + 40]
    fstp dword ptr [esp + 20]
    imul eax, eax, 000000CD0h
    fild dword ptr [esp + 36]
    fstp dword ptr [esp + 16]
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 16]
    add eax, 01072DEE0h
    lea edi, [eax + 000000340h]
    mov byte ptr [eax + 000000440h], 1
    lea ebx, [eax + 16]
    mov ebp, ebx
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 20]
    fadd st(0), st(0)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 16]
    fmul dword ptr [g_1019BE68]
    fstp dword ptr [esp + 60]
    fld dword ptr [g_1019BDA0]
    fsub dword ptr [esp + 20]
    fstp dword ptr [esp + 88]
    fld dword ptr [esp + 16]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 92]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    xor ecx, ecx
    mov word ptr [eax + 000000441h], cx
    mov byte ptr [eax + 000000443h], cl
    xor edx, edx
L4:
    mov edi, ebp
    mov ecx, 16
    lea esi, [esp + 104]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov byte ptr [eax + edx + 000000110h], 1
    inc edx
    add ebp, 64
    cmp edx, 3
    jle L4
    lea edi, [eax + 000000230h]
    mov ecx, 68
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edx, [eax + 000000340h]
    lea edi, [eax + 000000450h]
    mov ecx, 68
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edi, [eax + 000000670h]
    mov esi, edx
    mov ecx, 68
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edi, [eax + 000000780h]
    mov esi, edx
    mov edx, dword ptr [g_101CE708]
    mov ecx, 68
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edi, [eax + 000000120h]
    mov ecx, 68
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edi, [eax + 000000560h]
    mov ecx, 68
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea edi, [eax + 000000890h]
    mov ecx, 68
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    cmp dword ptr [edx + 8], 2
    jne L11
    lea ecx, [ecx]
L5:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    xor esi, esi
    cmp ecx, esi
    je L6
    mov eax, dword ptr [g_10764584]
    cmp eax, esi
    setne cl
    test cl, cl
    je L6
    push 010198198h
    push 010193358h
    push eax
    call sub_100F6F01
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6E48
    add esp, 4
L6:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    lea ecx, [esp + 104]
    push ecx
    push 000000100h
    push eax
    call dword ptr [edx + 0xb0]
    cmp dword ptr [g_1076A830], esi
    jne L5
    mov edi, edi
L7:
    mov edx, dword ptr [g_101CE7EC]
    cmp dword ptr [edx + 8], esi
    je L8
    mov eax, dword ptr [g_10764584]
    cmp eax, esi
    setne cl
    test cl, cl
    je L8
    push 010198160h
    push 010193358h
    push eax
    call sub_100F6F5E
    mov eax, dword ptr [g_10764584]
    add esp, 12
    push eax
    call sub_100F6EA4
    add esp, 4
L8:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 104]
    push edx
    push 2
    push eax
    call dword ptr [ecx + 0xb0]
    cmp dword ptr [g_1076A830], esi
    jne L7
    jmp L9
    lea esp, [esp]
L9:
    mov eax, dword ptr [g_101CE7EC]
    cmp dword ptr [eax + 8], esi
    je L10
    mov eax, dword ptr [g_10764584]
    cmp eax, esi
    setne cl
    test cl, cl
    je L10
    push 010198124h
    push 010193358h
    push eax
    call sub_100F6FBD
    mov ecx, dword ptr [g_10764584]
    add esp, 12
    push ecx
    call sub_100F6F04
    add esp, 4
L10:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    lea ecx, [esp + 40]
    push ecx
    push 3
    push eax
    call dword ptr [edx + 0xb0]
    cmp dword ptr [g_1076A830], esi
    jne L9
    jmp L12
L11:
    xor esi, esi
L12:
    pop edi
    mov eax, 03F800000h
    mov dword ptr [g_1072DAB0], esi
    mov dword ptr [g_1072DAB4], esi
    mov dword ptr [g_1072DAC0], esi
    mov dword ptr [g_1072DAC4], esi
    mov dword ptr [g_1072DACC], esi
    mov dword ptr [g_1072DAD4], esi
    mov dword ptr [g_1072DAD8], esi
    mov dword ptr [g_1072DADC], esi
    mov dword ptr [g_1072DAE0], esi
    mov dword ptr [g_1072DAE8], esi
    mov dword ptr [g_1072DAEC], esi
    pop esi
    pop ebp
    mov dword ptr [g_1072DAB8], eax
    mov dword ptr [g_1072DABC], eax
    mov dword ptr [g_1072DAC8], eax
    mov dword ptr [g_1072DAD0], eax
    mov dword ptr [g_1072DAE4], eax
    pop ebx
FUN_1002e020 ENDP
END
