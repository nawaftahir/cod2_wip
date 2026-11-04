.686
.MODEL FLAT, C
EXTRN g_1072DDC8:DWORD
.CODE
FUN_10040ca0 PROC
    sub esp, 68
    mov ecx, dword ptr [g_1072DDC8]
    push esi
    mov esi, dword ptr [ecx + 80]
    mov dword ptr [esp + 32], esi
    mov esi, dword ptr [ecx + 76]
    mov dword ptr [esp + 20], esi
    mov esi, dword ptr [ecx + 72]
    mov dword ptr [esp + 36], esi
    mov esi, dword ptr [ecx + 96]
    mov dword ptr [esp + 28], esi
    mov esi, dword ptr [ecx + 92]
    mov dword ptr [esp + 16], esi
    mov esi, dword ptr [ecx + 88]
    mov dword ptr [esp + 8], esi
    mov esi, dword ptr [ecx + 112]
    mov dword ptr [esp + 24], esi
    mov esi, dword ptr [ecx + 108]
    mov ecx, dword ptr [ecx + 104]
    mov dword ptr [esp + 4], ecx
    fld dword ptr [esp + 4]
    mov dword ptr [esp + 12], esi
    fmul dword ptr [eax + 8]
    pop esi
    fld dword ptr [esp + 4]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 32]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 12]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 24]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx + 8]
    add esp, 68
    ret
FUN_10040ca0 ENDP
END
