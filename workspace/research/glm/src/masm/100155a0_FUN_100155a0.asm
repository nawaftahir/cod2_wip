.686
.MODEL FLAT, C
EXTRN sub_10015585:PROC
EXTRN sub_100156B0:PROC
EXTRN g_101D1B9C:DWORD
EXTRN g_101D4D20:DWORD
.CODE
FUN_100155a0 PROC
    push ecx
    mov eax, dword ptr [g_101D4D20]
    push edi
    mov edi, dword ptr [esp + 12]
    cmp dword ptr [edi], eax
    je L7
    mov ecx, dword ptr [edi + 40]
    mov dword ptr [edi], eax
    xor eax, eax
    test ecx, ecx
    push esi
    mov dword ptr [esp + 8], eax
    jle L5
    push ebx
    push ebp
    lea esp, [esp]
L0:
    mov ecx, dword ptr [edi + 44]
    mov ebp, dword ptr [ecx + eax*4]
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 0000000F0h]
    mov esi, dword ptr [esp + 28]
    shl ebp, 5
    fld dword ptr [ebp + eax + 12]
    add ebp, eax
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 5
    jnp L4
    fld dword ptr [ebp]
    mov ecx, dword ptr [esp + 32]
    fcomp dword ptr [ecx]
    fnstsw ax
    test ah, 65
    je L4
    fld dword ptr [ebp + 16]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 5
    jnp L4
    fld dword ptr [ebp + 4]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    je L4
    fld dword ptr [ebp + 20]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 5
    jnp L4
    fld dword ptr [ebp + 8]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L4
    mov eax, dword ptr [ebp + 28]
    mov edx, dword ptr [edx + 20]
    lea eax, [eax + eax*2]
    lea edi, [edx + eax*4]
    mov eax, dword ptr [ebp + 24]
    xor ebx, ebx
    test eax, eax
    jle L3
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 44]
    cmp dword ptr [edx], eax
    jge L3
    mov eax, dword ptr [edi]
    test byte ptr [eax + 12], 4
    jne L2
    mov edx, dword ptr [edi + 8]
    fld dword ptr [edx + 16]
    fcomp dword ptr [esi]
    fnstsw ax
    test ah, 5
    jnp L2
    fld dword ptr [edx + 4]
    fcomp dword ptr [ecx]
    fnstsw ax
    test ah, 65
    je L2
    fld dword ptr [edx + 20]
    fcomp dword ptr [esi + 4]
    fnstsw ax
    test ah, 5
    jnp L2
    fld dword ptr [edx + 8]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 65
    je L2
    fld dword ptr [edx + 24]
    fcomp dword ptr [esi + 8]
    fnstsw ax
    test ah, 5
    jnp L2
    fld dword ptr [edx + 12]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 65
    je L2
    mov ecx, dword ptr [esp + 44]
    mov esi, dword ptr [esp + 36]
    call sub_100156B0
    mov esi, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 32]
L2:
    mov eax, dword ptr [ebp + 24]
    inc ebx
    add edi, 12
    cmp ebx, eax
    jl L1
L3:
    mov edi, dword ptr [esp + 24]
L4:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [edi + 40]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jl L0
    pop ebp
    pop ebx
    jmp L6
L5:
    mov esi, dword ptr [esp + 20]
L6:
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 28]
    push ecx
    mov ecx, dword ptr [esp + 28]
    push edx
    mov edx, dword ptr [edi + 28]
    push eax
    push ecx
    push esi
    push edx
    call sub_10015585
    add esp, 24
    pop esi
L7:
    pop edi
    pop ecx
    ret
FUN_100155a0 ENDP
END
