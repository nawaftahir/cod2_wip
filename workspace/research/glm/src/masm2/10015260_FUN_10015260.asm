.686
.MODEL FLAT, C
EXTRN sub_100153F2:PROC
EXTRN sub_1001546B:PROC
EXTRN sub_1001548E:PROC
EXTRN sub_100154C0:PROC
EXTRN sub_100154C6:PROC
EXTRN sub_100154CD:PROC
EXTRN sub_100154EA:PROC
EXTRN sub_100154EE:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDEC:DWORD:DWORD
.CODE
FUN_10015260 PROC
    sub sub esp, 100
    mov mov edx, dword ptr [esp + 104]
    push push ebx
    push push ebp
    xor xor ebx, ebx
    push push esi
    xor xor ecx, ecx
    cmp cmp edx, ebx
    push push edi
    mov mov edi, dword ptr [esp + 124]
    mov mov esi, eax
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 28], ebx
    mov mov dword ptr [esp + 32], ebx
    jle L1
    lea lea ebp, [edi + 4]
    fld fld dword ptr [ebp - 4]
    fmul fmul dword ptr [esi]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 084h]
    fcom fcom dword ptr [g_1019BCB0]
    fst fst dword ptr [esp + ecx*4 + 76]
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    fstp fstp st(0)
    mov mov dword ptr [esp + ecx*4 + 36], ebx
    jmp L4
    fcomp fcomp dword ptr [g_1019BDEC]
    fnstsw fnstsw ax
    test test ah, 5
    jp L5
    mov mov dword ptr [esp + ecx*4 + 36], 1
    jmp L6
    mov mov dword ptr [esp + ecx*4 + 36], 2
    mov mov eax, dword ptr [esp + ecx*4 + 36]
    inc inc dword ptr [esp + eax*4 + 24]
    lea lea eax, [esp + eax*4 + 24]
    inc inc ecx
    add add ebp, 32
    cmp cmp ecx, edx
    jl L2
    mov mov eax, dword ptr [esp + 36]
    fld fld dword ptr [esp + 76]
    mov mov dword ptr [esp + ecx*4 + 36], eax
    fstp fstp dword ptr [esp + ecx*4 + 76]
    cmp cmp dword ptr [esp + 24], ebx
    jne L7
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 100
    ret ret
    cmp cmp dword ptr [esp + 28], ebx
    jne sub_100153F2
    mov mov ecx, edx
L2:
    shl shl ecx, 5
    mov mov eax, ecx
    mov mov esi, edi
    mov mov edi, dword ptr [esp + 080h]
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, edx
    pop pop ebx
L3:
    add add esp, 100
    ret ret
    xor xor ebp, ebp
L5:
    cmp cmp edx, ebx
    mov mov dword ptr [esp + 16], ebx
    jle sub_100154C0
    mov mov ebx, dword ptr [esp + 080h]
    mov mov esi, edi
    mov mov dword ptr [esp + 20], esi
    mov mov edx, dword ptr [esp + ebp*4 + 36]
    cmp cmp edx, 2
    jne sub_1001546B
    mov mov ecx, 8
    mov mov edi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp sub_100154C6
    test test edx, edx
    jne sub_1001548E
    mov mov edi, ebx
    mov mov ecx, 8
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    inc inc dword ptr [esp + 16]
    add add ebx, 32
    mov mov eax, dword ptr [esp + ebp*4 + 40]
    cmp cmp eax, 2
    je sub_100154EA
    cmp cmp eax, edx
    je sub_100154EE
    fld fld dword ptr [esp + ebp*4 + 76]
    lea lea eax, [ebp + 1]
    fsub fsub dword ptr [esp + ebp*4 + 80]
    cdq cdq
    idiv idiv dword ptr [esp + 120]
    mov mov esi, dword ptr [esp + 124]
    fdivr fdivr dword ptr [esp + ebp*4 + 76]
    mov mov eax, dword ptr [esp + 20]
    push push ecx
    mov mov ecx, ebx
    shl shl edx, 5
    add add edx, esi
    fstp fstp dword ptr [esp]
    call L3
    add add esp, 4
    inc inc dword ptr [esp + 16]
    add add ebx, 32
    mov mov esi, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 120]
    inc inc ebp
    add add esi, 32
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 20], esi
    jl sub_100154CD
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 100
    ret ret
FUN_10015260 ENDP
END
