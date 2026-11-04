.686
.MODEL FLAT, C
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49E4:DWORD
.CODE
FUN_1002a010 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
L0:
    mov eax, dword ptr [ebp + 32]
    lea ecx, [eax - 1]
    test eax, ecx
    jne L3
    test eax, eax
    je L1
    add eax, eax
    jmp L2
L1:
    mov eax, 1
L2:
    lea edx, [eax*4]
    push edx
    call dword ptr [fp_101D49D8]
    mov ecx, dword ptr [ebp + 32]
    mov esi, dword ptr [ebp + 36]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    add esp, 4
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov dword ptr [ebp + 36], eax
L3:
    mov eax, dword ptr [ebp + 32]
    mov ecx, dword ptr [ebp + 36]
    mov ebx, dword ptr [esp + 28]
    mov dword ptr [ecx + eax*4], ebx
    mov ecx, dword ptr [ebp + 32]
    mov edx, dword ptr [ebp + 40]
    inc ecx
    test edx, edx
    mov dword ptr [ebp + 32], ecx
    je L17
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax + 0000000F8h]
    lea ebx, [ebx + ebx*2]
    shl ebx, 5
    add ebx, ecx
    xor esi, esi
    test edx, edx
    jle L6
    mov ecx, dword ptr [ebp + 44]
L4:
    fld dword ptr [ecx]
    fcomp dword ptr [ebx + 20]
    fnstsw ax
    test ah, 65
    je L5
    fld dword ptr [ecx + 4]
    fcomp dword ptr [ebx + 24]
    fnstsw ax
    test ah, 65
    je L5
    fld dword ptr [ecx + 8]
    fcomp dword ptr [ebx + 28]
    fnstsw ax
    test ah, 65
    je L5
    fld dword ptr [ecx + 12]
    fcomp dword ptr [ebx + 32]
    fnstsw ax
    test ah, 5
    jnp L5
    fld dword ptr [ecx + 16]
    fcomp dword ptr [ebx + 36]
    fnstsw ax
    test ah, 5
    jnp L5
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebx + 40]
    fnstsw ax
    test ah, 5
    jp L9
L5:
    mov eax, dword ptr [ebp + 40]
    inc esi
    add ecx, 48
    cmp esi, eax
    jl L4
L6:
    xor eax, eax
    test edx, edx
    jle L8
    mov ecx, dword ptr [ebp + 44]
    jmp L7
    lea ecx, [ecx]
L7:
    mov esi, dword ptr [ecx + 24]
    test esi, esi
    je L10
    mov esi, dword ptr [ebp + 40]
    inc eax
    add ecx, 48
    cmp eax, esi
    jl L7
L8:
    lea eax, [edx + edx*2 + 3]
    shl eax, 4
    push 4
    push eax
    call dword ptr [fp_101D49E4]
    mov ecx, dword ptr [ebp + 40]
    mov esi, dword ptr [ebp + 44]
    lea ecx, [ecx + ecx*2]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edx, dword ptr [ebp + 40]
    mov dword ptr [ebp + 44], eax
    lea ecx, [edx + edx*2]
    shl ecx, 4
    add ecx, eax
    add esp, 8
    inc edx
    mov dword ptr [ebp + 40], edx
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [ecx], eax
    mov edx, dword ptr [ebx + 24]
    mov dword ptr [ecx + 4], edx
    mov eax, dword ptr [ebx + 28]
    mov dword ptr [ecx + 8], eax
    mov edx, dword ptr [ebx + 32]
    mov dword ptr [ecx + 12], edx
    mov eax, dword ptr [ebx + 36]
    mov dword ptr [ecx + 16], eax
    mov edx, dword ptr [ebx + 40]
    mov dword ptr [ecx + 20], edx
L9:
    mov ebp, ecx
    jmp L0
L10:
    fld dword ptr [ecx]
    fcomp dword ptr [ebx + 20]
    fnstsw ax
    test ah, 65
    jne L11
    mov edx, dword ptr [ebx + 20]
    mov dword ptr [ecx], edx
L11:
    fld dword ptr [ecx + 12]
    fcomp dword ptr [ebx + 32]
    fnstsw ax
    test ah, 5
    jp L12
    mov eax, dword ptr [ebx + 32]
    mov dword ptr [ecx + 12], eax
L12:
    fld dword ptr [ecx + 4]
    fcomp dword ptr [ebx + 24]
    fnstsw ax
    test ah, 65
    jne L13
    mov edx, dword ptr [ebx + 24]
    mov dword ptr [ecx + 4], edx
L13:
    fld dword ptr [ecx + 16]
    fcomp dword ptr [ebx + 36]
    fnstsw ax
    test ah, 5
    jp L14
    mov eax, dword ptr [ebx + 36]
    mov dword ptr [ecx + 16], eax
L14:
    fld dword ptr [ecx + 8]
    fcomp dword ptr [ebx + 28]
    fnstsw ax
    test ah, 65
    jne L15
    mov edx, dword ptr [ebx + 28]
    mov dword ptr [ecx + 8], edx
L15:
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebx + 40]
    fnstsw ax
    test ah, 5
    jp L16
    mov eax, dword ptr [ebx + 40]
    mov dword ptr [ecx + 20], eax
L16:
    mov ebp, ecx
    jmp L0
L17:
    pop edi
    pop esi
FUN_1002a010 ENDP
END
