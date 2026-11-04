.686
.MODEL FLAT, C
EXTRN sub_1003B7A1:PROC
EXTRN sub_1003B9E6:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003bf00 PROC
    mov ecx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [g_1072DDC8]
    fld dword ptr [ecx + 0000001BCh]
    fmul dword ptr [eax + 20]
    fld dword ptr [ecx + 0000001B8h]
    fmul dword ptr [eax + 16]
    faddp st(1)
    fld dword ptr [ecx + 0000001B4h]
    fmul dword ptr [eax + 12]
    mov eax, dword ptr [esp + 4]
    faddp st(1)
    fld st(0)
    fstp dword ptr [eax + 28]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L1
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], 2
    jne L0
    jmp sub_1003B7A1
L0:
    jmp sub_1003B9E6
L1:
    ret
FUN_1003bf00 ENDP
END
