; FUN_1002b8c0 @ 0x1002b8c0 — auto-synthesized
    EXTRN g_101da9c8:DWORD
    EXTRN g_106a312c:DWORD
.CODE
FUN_1002b8c0 PROC
    sub eax, 0x10696d00
    mov ecx, eax
    mov eax, 0x5397829d
    imul ecx
    mov ecx, dword ptr [g_101da9c8]
    sar edx, 7
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    mov edx, dword ptr [ecx]
    imul eax, eax, 0x188
    add eax, 0x10696d00
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [eax], 0x106a3128
    mov ecx, dword ptr [g_106a312c]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [g_106a312c], eax
    mov edx, dword ptr [eax + 4]
    mov dword ptr [edx], eax
    ret
FUN_1002b8c0 ENDP
END