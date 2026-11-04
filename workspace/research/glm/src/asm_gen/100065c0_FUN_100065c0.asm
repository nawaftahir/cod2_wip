; FUN_100065c0 @ 0x100065c0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce5c0:DWORD
    EXTRN g_101ce5c4:DWORD
.CODE
FUN_100065c0 PROC
    push ebx
    push esi
    xor bl, bl
    test eax, eax
    push edi
    mov esi, edx
    jle L0
    add ecx, 0x11
    mov edx, eax
    movzx eax, byte ptr [ecx + 2]
    cmp dword ptr [esp + 0x10], eax
    jg L1
    movzx eax, byte ptr [ecx - 1]
    mov edi, esi
    sub edi, eax
    movzx eax, byte ptr [ecx]
    fld dword ptr [edi + 0xc]
    fmul dword ptr [ecx - 0x11]
    mov edi, esi
    sub edi, eax
    movzx eax, byte ptr [ecx + 1]
    fld dword ptr [edi + 0x14]
    fmul dword ptr [ecx - 0xd]
    mov edi, esi
    sub edi, eax
    faddp st(1)
    fld dword ptr [edi + 0x1c]
    fmul dword ptr [ecx - 9]
    faddp st(1)
    fadd dword ptr [ecx - 5]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 1
    jne L2
    mov al, byte ptr [esp + 0x10]
    mov byte ptr [ecx + 2], al
    jmp L1
    mov bl, 1
    add ecx, 0x14
    dec edx
    jne L3
    test bl, bl
    jne L4
    mov esi, dword ptr [g_101ce5c0]
    xor eax, eax
    test esi, esi
    jle L5
    mov ecx, dword ptr [g_101ce5c4]
    mov edi, edi
    mov edx, dword ptr [ecx + eax*4]
    mov edi, dword ptr [esp + 0x10]
    cmp edi, dword ptr [edx + 0x18]
    jle L4
    inc eax
    cmp eax, esi
    jl L6
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
FUN_100065c0 ENDP
END