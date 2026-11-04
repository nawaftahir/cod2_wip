.686
.MODEL FLAT, C
EXTRN sub_1003061C:PROC
EXTRN sub_10035798:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101CE784:DWORD:DWORD
EXTRN EXTRN g_101CE82C:DWORD:DWORD
EXTRN EXTRN g_1072DC00:DWORD:DWORD
EXTRN EXTRN g_1072DC04:DWORD:DWORD
EXTRN EXTRN g_1072DC08:DWORD:DWORD
EXTRN EXTRN g_1072DC0C:DWORD:DWORD
EXTRN EXTRN g_1072DECC:DWORD:DWORD
.CODE
FUN_100306b0 PROC
    mov mov eax, dword ptr [g_101CE784]
    fld fld dword ptr [eax + 8]
    mov mov ecx, dword ptr [g_101CE82C]
    fld fld dword ptr [ecx + 8]
    sub sub esp, 16
    fld fld st(1)
    push push ebx
    fstp fstp dword ptr [g_1072DC00]
    lea lea ecx, [esp + 8]
    fld fld dword ptr [g_1019BC78]
    mov mov dword ptr [g_1072DC08], 0
    fsub fsub st(2)
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [g_1072DC04]
    fstp fstp dword ptr [g_1072DC0C]
    fstp fstp st(0)
    call sub_1003061C
    mov mov ebx, ecx
    mov mov dword ptr [g_1072DECC], eax
    call sub_10035798
    pop pop ebx
    add add esp, 16
    ret ret
FUN_100306b0 ENDP
END
