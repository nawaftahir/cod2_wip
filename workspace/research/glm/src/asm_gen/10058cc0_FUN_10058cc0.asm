; FUN_10058cc0 @ 0x10058cc0 — auto-synthesized
.CODE
FUN_10058cc0 PROC
    sub esp, 8
    xor edx, edx
    test esi, esi
    push edi
    jle L0
    fld dword ptr [esp + 0x10]
    mov edi, eax
    fmul dword ptr [esp + 0x10]
    sub edi, ecx
    fstp dword ptr [esp + 8]
    lea ebx, [ebx]
    fld dword ptr [ecx + edi]
    fsub dword ptr [ecx]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fmul dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 0x41
    je L1
    inc edx
    add ecx, 4
    cmp edx, esi
    jl L2
    mov eax, 1
    pop edi
    add esp, 8
    ret
    xor eax, eax
    pop edi
    add esp, 8
    ret
FUN_10058cc0 ENDP
END