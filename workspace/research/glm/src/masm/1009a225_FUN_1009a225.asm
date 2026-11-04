.686
.MODEL FLAT, C
.CODE
FUN_1009a225 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov ebx, ecx
    xor edi, edi
    test esi, esi
    mov dword ptr [ebp - 4], ebx
    jne L1
    xor eax, eax
    jmp L13
L1:
    mov eax, dword ptr [esi + 4]
    dec eax
    je L10
    push 5
    pop ecx
    sub eax, ecx
    je L9
    dec eax
    dec eax
    je L7
    dec eax
    je L3
    dec eax
    dec eax
    jne L12
    push dword ptr [ebp + 12]
    push dword ptr [esi + 32]
L2:
    mov ecx, ebx
    call L0
    mov edi, eax
    jmp L12
L3:
    mov edi, dword ptr [esi + 28]
    imul edi, dword ptr [esi + 24]
    mov esi, dword ptr [esi + 20]
    cmp esi, 29
    push 3
    pop eax
    ja L5
    movzx edx, byte ptr [esi + 01009A34Ch]
    jmp dword ptr [edx*4 + 0x1009a334]
    xor eax, eax
    jmp L5
    xor eax, eax
    inc eax
    jmp L5
    push 2
    jmp L4
    push 4
L4:
    pop eax
    jmp L5
    mov eax, ecx
L5:
    test edi, edi
    jbe L12
    mov ecx, dword ptr [ebp + 12]
    mov edx, edi
L6:
    mov dword ptr [ecx], eax
    add ecx, 16
    dec edx
    jne L6
    jmp L12
L7:
    xor ebx, ebx
    cmp dword ptr [esi + 20], ebx
    jbe L12
L8:
    mov ecx, dword ptr [ebp - 4]
    mov eax, edi
    shl eax, 4
    add eax, dword ptr [ebp + 12]
    push eax
    push dword ptr [esi + 16]
    call L0
    add edi, eax
    inc ebx
    cmp ebx, dword ptr [esi + 20]
    jb L8
    jmp L12
L9:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 24]
    jmp L2
L10:
    cmp dword ptr [esi + 4], 1
    jne L11
    mov eax, edi
    shl eax, 4
    add eax, dword ptr [ebp + 12]
    mov ecx, ebx
    push eax
    push dword ptr [esi + 8]
    call L0
    mov esi, dword ptr [esi + 12]
    add edi, eax
    test esi, esi
    jne L10
L11:
    test esi, esi
    je L12
    mov eax, edi
    shl eax, 4
    add eax, dword ptr [ebp + 12]
    mov ecx, ebx
    push eax
    push esi
    call L0
    add edi, eax
L12:
    mov eax, edi
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_1009a225 ENDP
END
