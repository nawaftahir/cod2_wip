; FUN_1003a5f0 @ 0x1003a5f0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_1072d9b8:DWORD
    EXTRN g_1072d9bc:DWORD
    EXTRN g_1072d9c0:DWORD
    EXTRN g_1072d9c4:DWORD
    EXTRN g_1072d9cc:DWORD
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9d4:DWORD
    EXTRN g_1072d9d8:DWORD
    EXTRN g_1072d9dc:DWORD
    EXTRN g_10764584:DWORD
    sub_10037946 PROTO C
    sub_10060c94 PROTO C
    sub_100f6c97 PROTO C
    sub_100f6d54 PROTO C
.CODE
FUN_1003a5f0 PROC
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    push ebx
    xor ebx, ebx
    cmp ecx, ebx
    je L0
    mov eax, esi
    call sub_10037946
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    push 0x1019892c
    call sub_10060c94
    mov edx, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [edx + 8]
    add esp, 0xc
    cmp ecx, ebx
    je L0
    mov edx, dword ptr [g_10764584]
    cmp edx, ebx
    setne cl
    cmp cl, bl
    je L0
    push eax
    push 0x10193358
    push edx
    call sub_100f6d54
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6c97
    add esp, 0x10
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [g_1072d9cc], ebx
    mov dword ptr [g_1072d9b8], ebx
    mov dword ptr [g_1072d9d0], ebx
    mov dword ptr [g_1072d9d4], ebx
    mov dword ptr [g_1072d9d8], ebx
    mov dword ptr [g_1072d9dc], ebx
    mov dword ptr [g_1072d9bc], edi
    mov dword ptr [g_1072d9c0], esi
    mov dword ptr [g_1072d9c4], ecx
    pop ebx
    ret
FUN_1003a5f0 ENDP
END