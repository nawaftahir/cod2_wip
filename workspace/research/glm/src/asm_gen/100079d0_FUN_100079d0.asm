; FUN_100079d0 @ 0x100079d0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
.CODE
FUN_100079d0 PROC
    push esi
    mov esi, dword ptr [eax + 0x10]
    xor edx, edx
    test esi, esi
    jle L0
    mov ecx, dword ptr [eax + 0x14]
    lea ecx, [ecx]
    fld dword ptr [ecx + 4]
    fmul dword ptr [edi + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [edi]
    faddp st(1)
    fadd dword ptr [edi + 0xc]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L1
    inc edx
    add ecx, 0xc
    cmp edx, esi
    jl L2
    mov al, 1
    pop esi
    ret
    xor al, al
    pop esi
    ret
FUN_100079d0 ENDP
END