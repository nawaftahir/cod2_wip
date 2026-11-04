.686
.MODEL FLAT, C
.CODE
FUN_10029910 PROC
    mov eax, dword ptr [esp + 16]
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    xor edx, edx
    xor ebx, ebx
    cmp eax, 4
    push esi
    jl L5
    add eax, -4
    shr eax, 2
    inc eax
    mov dword ptr [esp + 12], eax
    shl eax, 2
    lea esi, [edi + 8]
    mov dword ptr [esp + 16], eax
L0:
    mov ebx, dword ptr [esi - 8]
    mov eax, dword ptr [esp + 24]
    lea ecx, [ebx + ebx*2]
    shl ecx, 5
    add ecx, dword ptr [eax + 0000000F8h]
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebp]
    fnstsw ax
    test ah, 5
    jnp L1
    fld dword ptr [ecx + 24]
    fcomp dword ptr [ebp + 4]
    fnstsw ax
    test ah, 5
    jnp L1
    fld dword ptr [ecx + 28]
    fcomp dword ptr [ebp + 8]
    fnstsw ax
    test ah, 5
    jnp L1
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 32]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 65
    je L1
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 36]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 65
    je L1
    fld dword ptr [ecx + 40]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L1
    mov eax, dword ptr [edi + edx*4]
    mov dword ptr [edi + edx*4], ebx
    mov dword ptr [esi - 8], eax
    inc edx
L1:
    mov ebx, dword ptr [esi - 4]
    mov eax, dword ptr [esp + 24]
    lea ecx, [ebx + ebx*2]
    shl ecx, 5
    add ecx, dword ptr [eax + 0000000F8h]
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebp]
    fnstsw ax
    test ah, 5
    jnp L2
    fld dword ptr [ecx + 24]
    fcomp dword ptr [ebp + 4]
    fnstsw ax
    test ah, 5
    jnp L2
    fld dword ptr [ecx + 28]
    fcomp dword ptr [ebp + 8]
    fnstsw ax
    test ah, 5
    jnp L2
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 32]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 65
    je L2
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 36]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 65
    je L2
    fld dword ptr [ecx + 40]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L2
    mov eax, dword ptr [edi + edx*4]
    mov dword ptr [edi + edx*4], ebx
    mov dword ptr [esi - 4], eax
    inc edx
L2:
    mov ebx, dword ptr [esi]
    mov eax, dword ptr [esp + 24]
    lea ecx, [ebx + ebx*2]
    shl ecx, 5
    add ecx, dword ptr [eax + 0000000F8h]
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebp]
    fnstsw ax
    test ah, 5
    jnp L3
    fld dword ptr [ecx + 24]
    fcomp dword ptr [ebp + 4]
    fnstsw ax
    test ah, 5
    jnp L3
    fld dword ptr [ecx + 28]
    fcomp dword ptr [ebp + 8]
    fnstsw ax
    test ah, 5
    jnp L3
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 32]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 65
    je L3
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 36]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 65
    je L3
    fld dword ptr [ecx + 40]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L3
    mov eax, dword ptr [edi + edx*4]
    mov dword ptr [edi + edx*4], ebx
    mov dword ptr [esi], eax
    inc edx
L3:
    mov ebx, dword ptr [esi + 4]
    mov eax, dword ptr [esp + 24]
    lea ecx, [ebx + ebx*2]
    shl ecx, 5
    add ecx, dword ptr [eax + 0000000F8h]
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebp]
    fnstsw ax
    test ah, 5
    jnp L4
    fld dword ptr [ecx + 24]
    fcomp dword ptr [ebp + 4]
    fnstsw ax
    test ah, 5
    jnp L4
    fld dword ptr [ecx + 28]
    fcomp dword ptr [ebp + 8]
    fnstsw ax
    test ah, 5
    jnp L4
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 32]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 65
    je L4
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 36]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 65
    je L4
    fld dword ptr [ecx + 40]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L4
    mov eax, dword ptr [edi + edx*4]
    mov dword ptr [edi + edx*4], ebx
    mov dword ptr [esi + 4], eax
    inc edx
L4:
    mov eax, dword ptr [esp + 12]
    add esi, 16
    dec eax
    mov dword ptr [esp + 12], eax
    jne L0
    mov ebx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 36]
L5:
    cmp ebx, eax
    jge L8
    jmp L6
    lea ebx, [ebx]
L6:
    mov esi, dword ptr [edi + ebx*4]
    mov eax, dword ptr [esp + 24]
    lea ecx, [esi + esi*2]
    shl ecx, 5
    add ecx, dword ptr [eax + 0000000F8h]
    fld dword ptr [ecx + 20]
    fcomp dword ptr [ebp]
    fnstsw ax
    test ah, 5
    jnp L7
    fld dword ptr [ecx + 24]
    fcomp dword ptr [ebp + 4]
    fnstsw ax
    test ah, 5
    jnp L7
    fld dword ptr [ecx + 28]
    fcomp dword ptr [ebp + 8]
    fnstsw ax
    test ah, 5
    jnp L7
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 32]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 65
    je L7
    mov eax, dword ptr [esp + 32]
    fld dword ptr [ecx + 36]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 65
    je L7
    fld dword ptr [ecx + 40]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L7
    mov eax, dword ptr [edi + edx*4]
    mov dword ptr [edi + edx*4], esi
    mov dword ptr [edi + ebx*4], eax
    inc edx
L7:
    mov eax, dword ptr [esp + 36]
    inc ebx
    cmp ebx, eax
    jl L6
L8:
    xor eax, eax
    cmp edx, 2
    setl al
    pop esi
    pop ebp
    pop ebx
    dec eax
FUN_10029910 ENDP
END
