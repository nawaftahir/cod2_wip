; FUN_1002da90 @ 0x1002da90 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_101d1bf8:DWORD
    sub_100050bc PROTO C
    sub_100050d6 PROTO C
    sub_1002d26f PROTO C
    sub_1002d2d2 PROTO C
.CODE
FUN_1002da90 PROC
    push ecx
    mov eax, dword ptr [edi + 0x10]
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    lea esi, [edi + 0x10]
    jne L0
    mov eax, dword ptr [g_101ce708]
    mov edx, dword ptr [eax + 8]
    movsx eax, word ptr [edi + 2]
    xor ecx, ecx
    cmp edx, 2
    setne cl
    push 0
    push esi
    push 0
    push 0
    push 8
    dec ecx
    and ecx, 0xffffffe4
    add ecx, 0x40
    imul eax, ecx
    mov ecx, dword ptr [g_101d1bf8]
    mov edx, dword ptr [ecx]
    push eax
    push ecx
    call dword ptr [edx + 0x68]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push 0
    lea edx, [esp + 0xc]
    push edx
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x2c]
    test eax, eax
    jge L2
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov dword ptr [esi], 0
    pop esi
    pop ebp
    pop ecx
    ret
    mov edx, dword ptr [g_101ce708]
    cmp dword ptr [edx + 8], 2
    jne L3
    mov ecx, dword ptr [esp + 8]
    movsx eax, word ptr [edi + 2]
    push ecx
    mov ecx, ebp
    call sub_1002d2d2
    mov esi, dword ptr [esi]
    add esp, 4
    call sub_100050bc
    pop esi
    pop ebp
    pop ecx
    ret
    movsx edx, word ptr [edi + 2]
    mov eax, dword ptr [esp + 8]
    mov ecx, ebp
    call sub_1002d26f
    mov esi, dword ptr [esi]
    call sub_100050d6
    pop esi
    pop ebp
    pop ecx
    ret
FUN_1002da90 ENDP
END