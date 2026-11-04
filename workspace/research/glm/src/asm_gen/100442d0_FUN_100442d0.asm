; FUN_100442d0 @ 0x100442d0 — auto-synthesized
    sub_10044034 PROTO C
.CODE
FUN_100442d0 PROC
    push ebx
    mov bl, byte ptr [esp + 8]
    push esi
    mov esi, eax
    push 0x7f
    mov eax, 7
    call sub_10044034
    add esp, 4
    test al, al
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [esi + 8], 0
    mov dword ptr [esi + 0xc], 0
    mov byte ptr [eax], 0xff
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    push edi
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L1
    mov eax, dword ptr [esi + 0x20]
    mov edi, dword ptr [eax + 0x20]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L2
    mov ecx, dword ptr [edi]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
    mov eax, dword ptr [esi]
    sub bl, 0x30
    mov byte ptr [eax], bl
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L3
    mov eax, dword ptr [esi + 0x20]
    mov edi, dword ptr [eax + 0x20]
    push eax
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L2
    mov ecx, dword ptr [edi]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [esi + 4], edx
    mov ecx, dword ptr [esi + 0x20]
    mov edx, dword ptr [ecx + 0xec]
    xor eax, eax
    test edx, edx
    jle L4
    lea ecx, [esi + 0x10]
    mov edi, edi
    mov dword ptr [ecx], 0
    mov edx, dword ptr [esi + 0x20]
    mov edi, dword ptr [edx + 0xec]
    inc eax
    add ecx, 4
    cmp eax, edi
    jl L5
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
    pop esi
    xor al, al
    pop ebx
    ret
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
FUN_100442d0 ENDP
END