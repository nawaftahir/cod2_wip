.686
.MODEL FLAT, C
EXTRN sub_10058FC7:PROC
EXTRN g_1019BC84:DWORD
.CODE
FUN_1005d800 PROC
    sub esp, 28
    push ebx
    mov ebx, dword ptr [esp + 36]
    push ebp
    push esi
    lea edx, [esp + 20]
    lea esi, [esp + 12]
    call sub_10058FC7
    xor esi, esi
    cmp ebx, esi
    mov dword ptr [esp + 16], esi
    jle L1
    mov ecx, dword ptr [esp + 12]
    mov edx, dword ptr [esp + 20]
    lea eax, [ebx + ebx*2 - 3]
    mov dword ptr [esp + 12], esi
    shl eax, 2
    lea ebx, [edi + ecx*4]
    lea esi, [edi + edx*4]
    mov edi, edi
L0:
    fld dword ptr [esi]
    lea ebp, [eax + edx*4]
    fsub dword ptr [edi + ebp]
    lea ebp, [eax + ecx*4]
    fstp dword ptr [esp + 32]
    fld dword ptr [edi + ebp]
    mov ebp, dword ptr [esp + 48]
    fsub dword ptr [ebx]
    fstp dword ptr [esp + 36]
    fld dword ptr [ebp + ecx*4]
    lea ebp, [eax + ecx*4]
    fsub dword ptr [edi + ebp]
    mov ebp, dword ptr [esp + 48]
    lea eax, [eax + edx*4]
    fstp dword ptr [esp + 24]
    fld dword ptr [ebp + edx*4]
    fsub dword ptr [eax + edi]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 32]
    faddp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jnp L2
    mov ebp, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 12]
    inc ebp
    mov dword ptr [esp + 16], ebp
    mov ebp, eax
    add ebp, 12
    mov dword ptr [esp + 12], ebp
    mov ebp, dword ptr [esp + 44]
    add esi, 12
    add ebx, 12
    cmp dword ptr [esp + 16], ebp
    jl L0
L1:
    pop esi
    pop ebp
    mov eax, 1
    pop ebx
    add esp, 28
    ret
L2:
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 28
    ret
FUN_1005d800 ENDP
END
