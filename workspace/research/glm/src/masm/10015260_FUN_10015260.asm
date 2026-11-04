.686
.MODEL FLAT, C
EXTRN sub_10015338:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDEC:DWORD
.CODE
FUN_10015260 PROC
    sub esp, 100
    mov edx, dword ptr [esp + 104]
    push ebx
    push ebp
    xor ebx, ebx
    push esi
    xor ecx, ecx
    cmp edx, ebx
    push edi
    mov edi, dword ptr [esp + 124]
    mov esi, eax
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 32], ebx
    jle L4
    lea ebp, [edi + 4]
L0:
    fld dword ptr [ebp - 4]
    fmul dword ptr [esi]
    fld dword ptr [ebp + 4]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fsub dword ptr [esp + 000000084h]
    fcom dword ptr [g_1019BCB0]
    fst dword ptr [esp + ecx*4 + 76]
    fnstsw ax
    test ah, 65
    jne L1
    fstp st(0)
    mov dword ptr [esp + ecx*4 + 36], ebx
    jmp L3
L1:
    fcomp dword ptr [g_1019BDEC]
    fnstsw ax
    test ah, 5
    jp L2
    mov dword ptr [esp + ecx*4 + 36], 1
    jmp L3
L2:
    mov dword ptr [esp + ecx*4 + 36], 2
L3:
    mov eax, dword ptr [esp + ecx*4 + 36]
    inc dword ptr [esp + eax*4 + 24]
    lea eax, [esp + eax*4 + 24]
    inc ecx
    add ebp, 32
    cmp ecx, edx
    jl L0
L4:
    mov eax, dword ptr [esp + 36]
    fld dword ptr [esp + 76]
    mov dword ptr [esp + ecx*4 + 36], eax
    fstp dword ptr [esp + ecx*4 + 76]
    cmp dword ptr [esp + 24], ebx
    jne L5
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 100
    ret
L5:
    cmp dword ptr [esp + 28], ebx
    jne L6
    mov ecx, edx
    shl ecx, 5
    mov eax, ecx
    mov esi, edi
    mov edi, dword ptr [esp + 000000080h]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    pop ebp
    mov eax, edx
    pop ebx
    add esp, 100
    ret
L6:
    xor ebp, ebp
    cmp edx, ebx
    mov dword ptr [esp + 16], ebx
    jle L12
    mov ebx, dword ptr [esp + 000000080h]
    mov esi, edi
    mov dword ptr [esp + 20], esi
L7:
    mov edx, dword ptr [esp + ebp*4 + 36]
    cmp edx, 2
    jne L8
    mov ecx, 8
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp L10
L8:
    test edx, edx
    jne L9
    mov edi, ebx
    mov ecx, 8
    rep movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [esp + 16]
    add ebx, 32
L9:
    mov eax, dword ptr [esp + ebp*4 + 40]
    cmp eax, 2
    je L11
    cmp eax, edx
    je L11
    fld dword ptr [esp + ebp*4 + 76]
    lea eax, [ebp + 1]
    fsub dword ptr [esp + ebp*4 + 80]
    cdq
    idiv dword ptr [esp + 120]
    mov esi, dword ptr [esp + 124]
    fdivr dword ptr [esp + ebp*4 + 76]
    mov eax, dword ptr [esp + 20]
    push ecx
    mov ecx, ebx
    shl edx, 5
    add edx, esi
    fstp dword ptr [esp]
    call sub_10015338
    add esp, 4
L10:
    inc dword ptr [esp + 16]
    add ebx, 32
L11:
    mov esi, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 120]
    inc ebp
    add esi, 32
    cmp ebp, eax
    mov dword ptr [esp + 20], esi
    jl L7
L12:
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 100
    ret
FUN_10015260 ENDP
END
