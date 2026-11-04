; FUN_10016c10 @ 0x10016c10 — auto-synthesized
.CODE
FUN_10016c10 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov cl, byte ptr [ebp]
    push esi
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 0x77
    je L0
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [eax + ebp - 0x76]
    inc eax
    test cl, cl
    jne L1
    mov edi, dword ptr [esp + 0x14]
    imul edi, edi, 0x61
    add edi, edx
    add edi, ebx
    and edi, 0xff
    mov eax, dword ptr [edi*4 + 0x101da564]
    test eax, eax
    je L2
    movzx edx, byte ptr [eax + 0xa]
    cmp edx, dword ptr [esp + 0x14]
    jne L3
    movzx ecx, byte ptr [eax + 0xb]
    cmp ecx, ebx
    jne L3
    mov eax, dword ptr [eax]
    mov esi, ebp
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L4
    test cl, cl
    je L5
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L4
    add eax, 2
    add esi, 2
    test cl, cl
    jne L6
    xor eax, eax
    jmp L7
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L8
    inc edi
    and edi, 0xff
    mov eax, dword ptr [edi*4 + 0x101da564]
    test eax, eax
    jne L9
    mov ecx, dword ptr [esp + 0x18]
    mov dword ptr [ecx], edi
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
    mov eax, dword ptr [esp + 0x18]
    mov dword ptr [eax], edi
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
FUN_10016c10 ENDP
END