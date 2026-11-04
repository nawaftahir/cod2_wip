.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
.CODE
FUN_1005b550 PROC
    sub sub esp, 16
    fld fld dword ptr [esp + 20]
    lea lea eax, [esp]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea ecx, [esp + 20]
    mov mov dword ptr [esp + 8], eax
    mov mov dword ptr [esp + 4], ecx
    fstp fstp dword ptr [esp + 12]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 20]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 12]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [esp]
    fmul fmul dword ptr [edx]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 12]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx]
    mov mov dword ptr [edx], eax
    fld fld dword ptr [esp]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [edx + 4]
    add add esp, 16
    ret ret
FUN_1005b550 ENDP
END
