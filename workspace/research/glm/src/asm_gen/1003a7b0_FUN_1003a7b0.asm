; FUN_1003a7b0 @ 0x1003a7b0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_101d49a4:DWORD
    EXTRN g_1072d9b0:DWORD
    EXTRN g_1072d9cc:DWORD
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9d4:DWORD
    sub_1003871c PROTO C
    sub_1003886e PROTO C
    sub_1003a632 PROTO C
.CODE
FUN_1003a7b0 PROC
    sub esp, 0x14
    mov eax, dword ptr [g_1072d9d4]
    mov ecx, dword ptr [g_1072d9d0]
    mov dword ptr [esp + 4], eax
    mov eax, 0x55555556
    imul ecx
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    push esi
    mov dword ptr [esp + 0xc], eax
    mov eax, dword ptr [g_1072d9cc]
    push edi
    xor edi, edi
    xor edx, edx
    cmp eax, 1
    mov eax, dword ptr [g_101ce708]
    mov esi, dword ptr [eax + 8]
    mov dword ptr [esp + 8], edi
    jne L0
    cmp esi, 2
    setne dl
    dec edx
    and edx, 0xffffffdc
    add edx, 0x44
    jmp L1
    cmp esi, 2
    setne dl
    dec edx
    and edx, 0xffffffe4
    add edx, 0x40
    mov esi, edx
    mov edx, dword ptr [g_1072d9b0]
    push edx
    mov eax, ecx
    call sub_1003871c
    mov ecx, dword ptr [g_1072d9d4]
    imul ecx, esi
    mov dword ptr [esp + 0x1c], eax
    mov eax, dword ptr [g_101d49a4]
    add ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    add esp, 4
    cmp ecx, edx
    jle L2
    mov dword ptr [eax], edi
    mov eax, dword ptr [g_1072d9d4]
    push 0x106d3200
    push edi
    mov ecx, esi
    call sub_1003886e
    mov eax, dword ptr [g_1072d9cc]
    lea edx, [esp + 0x10]
    push edx
    push eax
    mov dword ptr [esp + 0x24], edi
    call sub_1003a632
    add esp, 0x10
    mov dword ptr [g_1072d9d0], edi
    mov dword ptr [g_1072d9d4], edi
    pop edi
    pop esi
    add esp, 0x14
    ret
FUN_1003a7b0 ENDP
END