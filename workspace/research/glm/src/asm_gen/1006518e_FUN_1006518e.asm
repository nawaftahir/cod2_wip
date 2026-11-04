; FUN_1006518e @ 0x1006518e — auto-synthesized
    EXTRN g_101ac95c:DWORD
    sub_100639e0 PROTO C
.CODE
FUN_1006518e PROC
    mov eax, dword ptr [ecx + 0x2a8]
    mov dword ptr [g_101ac95c], eax
    and dword ptr [ecx + 0x2a4], 0
    jmp sub_100639e0
FUN_1006518e ENDP
END