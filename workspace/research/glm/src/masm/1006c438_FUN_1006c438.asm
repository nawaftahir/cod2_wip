.686
.MODEL FLAT, C
EXTRN sub_100826CE:PROC
EXTRN g_101AC95C:DWORD
.CODE
FUN_1006c438 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [g_101AC95C]
    pop ebp
    jmp sub_100826CE
FUN_1006c438 ENDP
END
