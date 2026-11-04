.686
.MODEL FLAT, C
EXTRN sub_100639E0:PROC
EXTRN g_101AC95C:DWORD
.CODE
FUN_1006518e PROC
    mov eax, dword ptr [ecx + 0000002A8h]
    mov dword ptr [g_101AC95C], eax
    and dword ptr [ecx + 0000002A4h], 0
    jmp sub_100639E0
FUN_1006518e ENDP
END
