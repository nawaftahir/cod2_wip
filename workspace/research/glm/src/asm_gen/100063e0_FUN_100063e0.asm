; FUN_100063e0 @ 0x100063e0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce5c0:DWORD
    EXTRN g_101ce5c4:DWORD
.CODE
FUN_100063e0 PROC
    push ebx
    push esi
    push edi
    mov edi, eax
    xor esi, esi
    test edi, edi
    mov bl, 0xff
    jle L0
    add ecx, 0x11
    movzx eax, byte ptr [ecx - 1]
    mov byte ptr [ecx + 2], bl
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx]
    fmul dword ptr [ecx - 0x11]
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 1]
    fmul dword ptr [ecx - 0xd]
    faddp st(1)
    fld dword ptr [eax + edx]
    fmul dword ptr [ecx - 9]
    faddp st(1)
    fadd dword ptr [ecx - 5]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jnp L1
    inc esi
    add ecx, 0x14
    cmp esi, edi
    jl L2
    mov eax, dword ptr [g_101ce5c0]
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L3
    jmp L4
    lea ebx, [ebx]
    mov ecx, dword ptr [g_101ce5c4]
    mov edi, dword ptr [ecx + ebp*4]
    mov ecx, dword ptr [edi + 0x20]
    xor esi, esi
    mov edi, edi
    cmp esi, dword ptr [edi + 0x1c]
    jge L5
    movzx eax, byte ptr [ecx + 0x11]
    mov byte ptr [ecx + 0x13], bl
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 0x10]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 0x12]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + edx]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [ecx + 0xc]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L6
    inc esi
    add ecx, 0x14
    jmp L7
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
    mov eax, dword ptr [g_101ce5c0]
    inc ebp
    cmp ebp, eax
    jl L4
    pop ebp
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
    pop ebp
FUN_100063e0 ENDP
END