.686
.MODEL FLAT, C
EXTRN sub_100639E0:PROC
EXTRN EXTRN g_101AC95C:DWORD:DWORD
.CODE
FUN_1006518e PROC
    mov mov eax, dword ptr [ecx + 02A8h]
    mov mov dword ptr [g_101AC95C], eax
    and and dword ptr [ecx + 02A4h], 0
    jmp sub_100639E0
FUN_1006518e ENDP
END
