; FUN_1000a840 @ 0x1000a840 — auto-synthesized
    EXTRN g_10678514:DWORD
.CODE
FUN_1000a840 PROC
    push ecx
    mov eax, dword ptr [g_10678514]
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push edi
    xor edi, edi
    test eax, eax
    jle L0
    push esi
    mov esi, 0x10678520
    xor edx, edx
    test ebx, ebx
    jle L1
    fld dword ptr [esi + 8]
    lea ecx, [ebp + 4]
    fchs
    fstp dword ptr [esp + 0xc]
    lea ebx, [ebx]
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi - 4]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 8]
    fcomp dword ptr [esp + 0xc]
    fnstsw ax
    test ah, 5
    jnp L2
    inc edx
    add ecx, 0x14
    cmp edx, ebx
    jl L3
    xor eax, eax
    cmp eax, 2
    sete al
    mov byte ptr [edi + 0x10678a98], al
    mov eax, dword ptr [g_10678514]
    inc edi
    add esi, 0x2c
    cmp edi, eax
    jl L4
    pop esi
    pop edi
    pop ebp
    pop ecx
    ret
    mov eax, 2
    jmp L5
FUN_1000a840 ENDP
END