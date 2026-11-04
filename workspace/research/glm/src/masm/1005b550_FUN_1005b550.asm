.686
.MODEL FLAT, C
EXTRN g_1019BD8C:DWORD
.CODE
FUN_1005b550 PROC
    sub esp, 16
    fld dword ptr [esp + 20]
    lea eax, [esp]
    fmul dword ptr [g_1019BD8C]
    lea ecx, [esp + 20]
    mov dword ptr [esp + 8], eax
    mov dword ptr [esp + 4], ecx
    fstp dword ptr [esp + 12]
    push eax
    push ecx
    fld dword ptr [esp + 20]
    fsincos
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 12]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp]
    fmul dword ptr [edx]
    fld dword ptr [esp + 20]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 12]
    mov eax, dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [edx]
    mov dword ptr [edx], eax
    fld dword ptr [esp]
    fmul dword ptr [edx + 4]
    faddp st(1)
    fstp dword ptr [edx + 4]
    add esp, 16
    ret
FUN_1005b550 ENDP
END
