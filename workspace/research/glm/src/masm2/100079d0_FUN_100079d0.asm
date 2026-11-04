.686
.MODEL FLAT, C
EXTRN sub_10007A16:PROC
EXTRN sub_10007A1C:PROC
EXTRN sub_10007A44:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_100079d0 PROC
    push push esi
    mov mov esi, dword ptr [eax + 16]
    xor xor edx, edx
    test test esi, esi
    jle sub_10007A16
    mov mov ecx, dword ptr [eax + 20]
    lea lea ecx, [ecx]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [edi + 4]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [edi + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [edi]
    faddp faddp st(1)
    fadd fadd dword ptr [edi + 12]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10007A44
    inc inc edx
    add add ecx, 12
    cmp cmp edx, esi
    jl sub_10007A1C
    mov mov al, 1
    pop pop esi
    ret ret
    xor xor al, al
    pop pop esi
    ret ret
FUN_100079d0 ENDP
END
