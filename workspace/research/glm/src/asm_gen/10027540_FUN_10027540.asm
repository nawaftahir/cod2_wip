; FUN_10027540 @ 0x10027540 — auto-synthesized
    EXTRN g_1019bc84:DWORD
.CODE
FUN_10027540 PROC
    xor edx, edx
    add ecx, 4
    movzx eax, byte ptr [ecx + 0xc]
    fld dword ptr [eax + esi]
    movzx eax, byte ptr [ecx + 0xd]
    fmul dword ptr [ecx - 4]
    fld dword ptr [eax + esi]
    movzx eax, byte ptr [ecx + 0xe]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + esi]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 8]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jnp L0
    inc edx
    add ecx, 0x14
    cmp edx, 5
    jne L1
    xor al, al
    ret
    mov al, 1
    ret
FUN_10027540 ENDP
END