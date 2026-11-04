.686
.MODEL FLAT, C
EXTRN sub_1003061C:PROC
EXTRN sub_10035798:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_101CE784:DWORD
EXTRN g_101CE82C:DWORD
EXTRN g_1072DC00:DWORD
EXTRN g_1072DC04:DWORD
EXTRN g_1072DC08:DWORD
EXTRN g_1072DC0C:DWORD
EXTRN g_1072DECC:DWORD
.CODE
FUN_100306b0 PROC
    mov eax, dword ptr [g_101CE784]
    fld dword ptr [eax + 8]
    mov ecx, dword ptr [g_101CE82C]
    fld dword ptr [ecx + 8]
    sub esp, 16
    fld st(1)
    push ebx
    fstp dword ptr [g_1072DC00]
    lea ecx, [esp + 8]
    fld dword ptr [g_1019BC78]
    mov dword ptr [g_1072DC08], 0
    fsub st(2)
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [g_1072DC04]
    fstp dword ptr [g_1072DC0C]
    fstp st(0)
    call sub_1003061C
    mov ebx, ecx
    mov dword ptr [g_1072DECC], eax
    call sub_10035798
    pop ebx
    add esp, 16
    ret
FUN_100306b0 ENDP
END
