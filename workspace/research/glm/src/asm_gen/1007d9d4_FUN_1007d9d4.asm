; FUN_1007d9d4 @ 0x1007d9d4 — auto-synthesized
.CODE
FUN_1007d9d4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push esi
    push edi
    xor eax, eax
    mov edi, edx
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov esi, dword ptr [ecx + 4]
    test esi, esi
    je L0
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [eax + 8]
    add eax, esi
    jmp L1
    xor eax, eax
    mov dword ptr [edx], eax
    movzx eax, word ptr [ecx + 8]
    mov dword ptr [edx + 4], eax
    movzx eax, word ptr [ecx + 0xa]
    mov dword ptr [edx + 8], eax
    movzx eax, word ptr [ecx + 0xc]
    mov dword ptr [edx + 0xc], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax + 2]
    mov dword ptr [edx + 0x14], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax + 4]
    mov dword ptr [edx + 0x18], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax + 6]
    mov dword ptr [edx + 0x1c], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax + 8]
    mov dword ptr [edx + 0x20], eax
    mov eax, dword ptr [ecx + 0x18]
    movzx eax, word ptr [eax + 0xa]
    mov dword ptr [edx + 0x24], eax
    mov eax, dword ptr [edx + 0x20]
    imul eax, dword ptr [edx + 0x18]
    imul eax, dword ptr [edx + 0x1c]
    shl eax, 2
    mov dword ptr [edx + 0x28], eax
    mov esi, dword ptr [ecx + 0x14]
    test esi, esi
    je L2
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [eax + 8]
    add eax, esi
    jmp L3
    xor eax, eax
    pop edi
    mov dword ptr [edx + 0x2c], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1007d9d4 ENDP
END