; FUN_1004d460 @ 0x1004d460 — auto-synthesized
    sub_1004d02a PROTO C
    sub_1004d4b2 PROTO C
.CODE
FUN_1004d460 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esi + 0x198]
    mov al, byte ptr [edi + 0x11]
    test al, al
    je L0
    pop edi
    mov eax, 2
    pop esi
    ret
    mov eax, dword ptr [esi + 0x19c]
    push ebx
    push esi
    call dword ptr [eax + 4]
    add esp, 4
    mov ebx, eax
    dec eax
    je L1
    dec eax
    jne L2
    mov al, byte ptr [edi + 0x14]
    test al, al
    mov byte ptr [edi + 0x11], 1
    je L3
    mov ecx, dword ptr [esi + 0x19c]
    mov al, byte ptr [ecx + 0xd]
    test al, al
    je L2
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x14], 0x3b
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    ret
    mov eax, dword ptr [esi + 0x84]
    cmp dword ptr [esi + 0x8c], eax
    jle L2
    mov dword ptr [esi + 0x8c], eax
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    ret
    mov al, byte ptr [edi + 0x14]
    test al, al
    je L4
    call sub_1004d02a
    mov eax, ebx
    pop ebx
    mov byte ptr [edi + 0x14], 0
    pop edi
    pop esi
    ret
    mov al, byte ptr [edi + 0x10]
    test al, al
    jne L5
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x23
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    push esi
    call sub_1004d4b2
    add esp, 4
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    ret
FUN_1004d460 ENDP
END