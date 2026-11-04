; R_BeginDebugFrame @ 0x10022040 — auto-synthesized
    EXTRN g_101d4d00:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_101e4a00:DWORD
    EXTRN g_101e4a04:DWORD
    EXTRN g_101e4a08:DWORD
    EXTRN g_1042e778:DWORD
    sub_1001e511 PROTO C
    sub_10020ed1 PROTO C
    sub_10033b56 PROTO C
    sub_10033d4e PROTO C
.CODE
R_BeginDebugFrame PROC
    mov al, byte ptr [g_101d4d00]
    push ebx
    xor ebx, ebx
    cmp al, bl
    je L0
    call sub_10020ed1
    mov eax, dword ptr [g_101da9c8]
    push eax
    mov dword ptr [eax + 0x249d0c], ebx
    mov dword ptr [eax + 0x249d10], ebx
    mov dword ptr [eax + 0x249d14], ebx
    call sub_10033d4e
    add esp, 4
    call sub_10033b56
    mov eax, dword ptr [g_101e4a00]
    mov ecx, dword ptr [g_101e4a04]
    mov dword ptr [g_1042e778], eax
    cmp byte ptr [g_101e4a08], bl
    mov dword ptr [g_101da9c8], ecx
    je L1
    push 1
    mov byte ptr [g_101e4a08], bl
    call sub_1001e511
    add esp, 4
    mov dword ptr [g_101e4a00], ebx
    mov dword ptr [g_101e4a04], ebx
    pop ebx
    ret
R_BeginDebugFrame ENDP
END