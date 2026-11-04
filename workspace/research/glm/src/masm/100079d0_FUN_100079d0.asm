.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_100079d0 PROC
    push esi
    mov esi, dword ptr [eax + 16]
    xor edx, edx
    test esi, esi
    jle L1
    mov ecx, dword ptr [eax + 20]
    lea ecx, [ecx]
L0:
    fld dword ptr [ecx + 4]
    fmul dword ptr [edi + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [edi + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [edi]
    faddp st(1)
    fadd dword ptr [edi + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L2
    inc edx
    add ecx, 12
    cmp edx, esi
    jl L0
L1:
    mov al, 1
    pop esi
    ret
L2:
    xor al, al
    pop esi
    ret
FUN_100079d0 ENDP
END
