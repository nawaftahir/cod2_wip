; FUN_1001c400 @ 0x1001c400 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_1001c341 PROTO C
    sub_1001c35a PROTO C
    sub_1001c3df PROTO C
.CODE
FUN_1001c400 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101ce708]
    push edi
    mov edi, ecx
    cmp dword ptr [eax + 8], 2
    jne L0
    push ebp
    mov eax, edi
    call sub_1001c3df
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
    cmp word ptr [esi + 6], 0
    push ebx
    mov dword ptr [esp + 0x10], 0
    jbe L1
    lea ebx, [esi + 0x1a]
    lea ebx, [ebx]
    mov ecx, dword ptr [ebx + 6]
    movzx edx, word ptr [ebx]
    mov eax, dword ptr [esi]
    push ecx
    push edx
    push eax
    push ebp
    call sub_1001c341
    add esp, 0x10
    test al, al
    je L2
    mov ecx, dword ptr [ebx + 2]
    movzx edx, word ptr [ebx - 2]
    mov eax, dword ptr [esi]
    push ecx
    push edx
    push eax
    push ebp
    call sub_1001c35a
    add esp, 0x10
    test al, al
    je L2
    mov eax, dword ptr [esp + 0x10]
    movzx ecx, word ptr [esi + 6]
    inc eax
    add ebx, 0x1c
    cmp eax, ecx
    mov dword ptr [esp + 0x10], eax
    jl L3
    pop ebx
    pop edi
    pop esi
    mov al, 1
    pop ebp
    pop ecx
    ret
    pop ebx
    pop edi
    pop esi
    xor al, al
    pop ebp
    pop ecx
    ret
FUN_1001c400 ENDP
END