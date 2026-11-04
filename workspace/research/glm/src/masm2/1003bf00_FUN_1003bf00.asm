.686
.MODEL FLAT, C
EXTRN sub_1003B7A1:PROC
EXTRN sub_1003B9E6:PROC
EXTRN sub_1003BF96:PROC
EXTRN sub_1003BF9D:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003bf00 PROC
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [g_1072DDC8]
    fld fld dword ptr [ecx + 01BCh]
    fmul fmul dword ptr [eax + 20]
    fld fld dword ptr [ecx + 01B8h]
    fmul fmul dword ptr [eax + 16]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 01B4h]
    fmul fmul dword ptr [eax + 12]
    mov mov eax, dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld st(0)
    fstp fstp dword ptr [eax + 28]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_1003BF96
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], 2
    jne sub_1003BF9D
    jmp sub_1003B7A1
    jmp sub_1003B9E6
    ret ret
FUN_1003bf00 ENDP
END
