.686
.MODEL FLAT, C
EXTRN sub_1002A1FA:PROC
EXTRN sub_1002A1FC:PROC
EXTRN sub_1002A202:PROC
EXTRN sub_1002A24D:PROC
EXTRN sub_1002A25F:PROC
EXTRN sub_1002A274:PROC
EXTRN sub_1002A307:PROC
EXTRN sub_1002A32C:PROC
EXTRN sub_1002A352:PROC
EXTRN sub_1002A378:PROC
EXTRN sub_1002A39E:PROC
EXTRN sub_1002A3C4:PROC
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D49E4:DWORD:DWORD
.CODE
FUN_1002a010 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    push push edi
    mov mov eax, dword ptr [ebp + 32]
    lea lea ecx, [eax - 1]
    test test eax, ecx
    jne L2
    test test eax, eax
    je L0
    add add eax, eax
    jmp L1
    mov mov eax, 1
    lea lea edx, [eax*4]
    push push edx
    call dword ptr [fp_101D49D8]
    mov mov ecx, dword ptr [ebp + 32]
L0:
    mov mov esi, dword ptr [ebp + 36]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    add add esp, 4
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov dword ptr [ebp + 36], eax
    mov mov eax, dword ptr [ebp + 32]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov ebx, dword ptr [esp + 28]
    mov mov dword ptr [ecx + eax*4], ebx
    mov mov ecx, dword ptr [ebp + 32]
    mov mov edx, dword ptr [ebp + 40]
    inc inc ecx
    test test edx, edx
    mov mov dword ptr [ebp + 32], ecx
    je sub_1002A25F
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax + 0F8h]
    lea lea ebx, [ebx + ebx*2]
    shl shl ebx, 5
    add add ebx, ecx
    xor xor esi, esi
    test test edx, edx
    jle L3
    mov mov ecx, dword ptr [ebp + 44]
    fld fld dword ptr [ecx]
    fcomp fcomp dword ptr [ebx + 20]
    fnstsw fnstsw ax
    test test ah, 65
    je L5
    fld fld dword ptr [ecx + 4]
    fcomp fcomp dword ptr [ebx + 24]
    fnstsw fnstsw ax
    test test ah, 65
    je L7
    fld fld dword ptr [ecx + 8]
    fcomp fcomp dword ptr [ebx + 28]
    fnstsw fnstsw ax
    test test ah, 65
    je L8
    fld fld dword ptr [ecx + 12]
    fcomp fcomp dword ptr [ebx + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L9
    fld fld dword ptr [ecx + 16]
    fcomp fcomp dword ptr [ebx + 36]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L10
    fld fld dword ptr [ecx + 20]
    fcomp fcomp dword ptr [ebx + 40]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A24D
    mov mov eax, dword ptr [ebp + 40]
    inc inc esi
    add add ecx, 48
    cmp cmp esi, eax
    jl L4
    xor xor eax, eax
    test test edx, edx
    jle sub_1002A1FA
    mov mov ecx, dword ptr [ebp + 44]
    jmp L11
    lea lea ecx, [ecx]
    mov mov esi, dword ptr [ecx + 24]
    test test esi, esi
    je sub_1002A274
    mov mov esi, dword ptr [ebp + 40]
    inc inc eax
    add add ecx, 48
    cmp cmp eax, esi
    jl sub_1002A202
    lea lea eax, [edx + edx*2 + 3]
    shl shl eax, 4
    push push 4
    push push eax
    call dword ptr [fp_101D49E4]
    mov mov ecx, dword ptr [ebp + 40]
    mov mov esi, dword ptr [ebp + 44]
    lea lea ecx, [ecx + ecx*2]
    shl shl ecx, 4
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edx, dword ptr [ebp + 40]
    mov mov dword ptr [ebp + 44], eax
    lea lea ecx, [edx + edx*2]
    shl shl ecx, 4
    add add ecx, eax
    add add esp, 8
    inc inc edx
    mov mov dword ptr [ebp + 40], edx
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [ecx], eax
    mov mov edx, dword ptr [ebx + 24]
    mov mov dword ptr [ecx + 4], edx
    mov mov eax, dword ptr [ebx + 28]
    mov mov dword ptr [ecx + 8], eax
    mov mov edx, dword ptr [ebx + 32]
    mov mov dword ptr [ecx + 12], edx
    mov mov eax, dword ptr [ebx + 36]
    mov mov dword ptr [ecx + 16], eax
    mov mov edx, dword ptr [ebx + 40]
    mov mov dword ptr [ecx + 20], edx
    mov mov ebp, ecx
L4:
    jmp L6
    fld fld dword ptr [ecx]
    fcomp fcomp dword ptr [ebx + 20]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A307
    mov mov edx, dword ptr [ebx + 20]
    mov mov dword ptr [ecx], edx
    fld fld dword ptr [ecx + 12]
    fcomp fcomp dword ptr [ebx + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A32C
    mov mov eax, dword ptr [ebx + 32]
    mov mov dword ptr [ecx + 12], eax
    fld fld dword ptr [ecx + 4]
    fcomp fcomp dword ptr [ebx + 24]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A352
    mov mov edx, dword ptr [ebx + 24]
    mov mov dword ptr [ecx + 4], edx
    fld fld dword ptr [ecx + 16]
    fcomp fcomp dword ptr [ebx + 36]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A378
    mov mov eax, dword ptr [ebx + 36]
    mov mov dword ptr [ecx + 16], eax
    fld fld dword ptr [ecx + 8]
    fcomp fcomp dword ptr [ebx + 28]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A39E
    mov mov edx, dword ptr [ebx + 28]
    mov mov dword ptr [ecx + 8], edx
    fld fld dword ptr [ecx + 20]
    fcomp fcomp dword ptr [ebx + 40]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A3C4
    mov mov eax, dword ptr [ebx + 40]
    mov mov dword ptr [ecx + 20], eax
L11:
    mov mov ebp, ecx
    jmp sub_1002A1FC
    pop pop edi
    pop pop esi
FUN_1002a010 ENDP
END
