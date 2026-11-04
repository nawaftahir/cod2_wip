; FUN_10007e80 @ 0x10007e80 — auto-synthesized
    EXTRN g_1019bc84:DWORD
.CODE
FUN_10007e80 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, ecx
    test edi, edi
    mov esi, edx
    je L0
    mov ebx, dword ptr [eax + 0x20]
    movzx ebp, byte ptr [eax + 0x24]
    mov edx, ebp
    test edx, edx
    mov ecx, ebx
    je L1
    jmp L2
    lea ecx, [ecx]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [esi]
    faddp st(1)
    fadd dword ptr [esi + 0xc]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L3
    dec edx
    add ecx, 0xc
    test edx, edx
    jne L2
    dec edi
    add esi, 0x14
    test edi, edi
    jne L4
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
    pop edi
    pop esi
    pop ebp
FUN_10007e80 ENDP
END