.686
.MODEL FLAT, C
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_10040ca0 PROC
    sub sub esp, 68
    mov mov ecx, dword ptr [g_1072DDC8]
    push push esi
    mov mov esi, dword ptr [ecx + 80]
    mov mov dword ptr [esp + 32], esi
    mov mov esi, dword ptr [ecx + 76]
    mov mov dword ptr [esp + 20], esi
    mov mov esi, dword ptr [ecx + 72]
    mov mov dword ptr [esp + 36], esi
    mov mov esi, dword ptr [ecx + 96]
    mov mov dword ptr [esp + 28], esi
    mov mov esi, dword ptr [ecx + 92]
    mov mov dword ptr [esp + 16], esi
    mov mov esi, dword ptr [ecx + 88]
    mov mov dword ptr [esp + 8], esi
    mov mov esi, dword ptr [ecx + 112]
    mov mov dword ptr [esp + 24], esi
    mov mov esi, dword ptr [ecx + 108]
    mov mov ecx, dword ptr [ecx + 104]
    mov mov dword ptr [esp + 4], ecx
    fld fld dword ptr [esp + 4]
    mov mov dword ptr [esp + 12], esi
    fmul fmul dword ptr [eax + 8]
    pop pop esi
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx + 4]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx + 8]
    add add esp, 68
    ret ret
FUN_10040ca0 ENDP
END
