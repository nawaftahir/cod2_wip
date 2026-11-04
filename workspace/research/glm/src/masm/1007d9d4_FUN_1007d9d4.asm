.686
.MODEL FLAT, C
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
L0:
    xor eax, eax
L1:
    mov dword ptr [edx], eax
    movzx eax, word ptr [ecx + 8]
    mov dword ptr [edx + 4], eax
    movzx eax, word ptr [ecx + 10]
    mov dword ptr [edx + 8], eax
    movzx eax, word ptr [ecx + 12]
    mov dword ptr [edx + 12], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 2]
    mov dword ptr [edx + 20], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 4]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 6]
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 8]
    mov dword ptr [edx + 32], eax
    mov eax, dword ptr [ecx + 24]
    movzx eax, word ptr [eax + 10]
    mov dword ptr [edx + 36], eax
    mov eax, dword ptr [edx + 32]
    imul eax, dword ptr [edx + 24]
    imul eax, dword ptr [edx + 28]
    shl eax, 2
    mov dword ptr [edx + 40], eax
    mov esi, dword ptr [ecx + 20]
    test esi, esi
    je L2
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [eax + 8]
    add eax, esi
    jmp L3
L2:
    xor eax, eax
L3:
    pop edi
    mov dword ptr [edx + 44], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1007d9d4 ENDP
END
