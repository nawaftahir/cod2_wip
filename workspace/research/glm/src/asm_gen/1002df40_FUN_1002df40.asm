; FUN_1002df40 @ 0x1002df40 — auto-synthesized
    EXTRN g_1072d9bc:DWORD
    EXTRN g_1072d9c0:DWORD
    EXTRN g_1072d9c4:DWORD
    EXTRN g_1072d9cc:DWORD
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9e0:DWORD
    sub_1003a615 PROTO C
    sub_1003a8de PROTO C
    sub_1003a918 PROTO C
.CODE
FUN_1002df40 PROC
    push ebx
    mov ebx, dword ptr [g_1072d9cc]
    push esi
    push edi
    call sub_1003a8de
    mov eax, dword ptr [g_1072d9c4]
    mov esi, dword ptr [g_1072d9c0]
    mov edi, dword ptr [g_1072d9bc]
    push eax
    call sub_1003a615
    mov eax, dword ptr [g_1072d9cc]
    add esp, 4
    cmp eax, ebx
    je L0
    mov eax, dword ptr [g_1072d9d0]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    je L2
    call sub_1003a918
    mov dword ptr [g_1072d9cc], ebx
    pop edi
    pop esi
    pop ebx
    ret
FUN_1002df40 ENDP
END