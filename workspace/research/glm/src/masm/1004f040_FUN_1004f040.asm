.686
.MODEL FLAT, C
.CODE
FUN_1004f040 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 16]
    push edi
    mov edi, dword ptr [esi + 32]
    mov ebp, dword ptr [edi + 4]
    test ebp, ebp
    mov ebx, dword ptr [edi]
    jne L0
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    je L1
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
L0:
    xor eax, eax
    mov ah, byte ptr [ebx]
    dec ebp
    inc ebx
    test ebp, ebp
    mov dword ptr [esp + 20], eax
    jne L3
    push esi
    call dword ptr [edi + 0xc]
    add esp, 4
    test al, al
    jne L2
L1:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L2:
    mov ebx, dword ptr [edi]
    mov ebp, dword ptr [edi + 4]
L3:
    movzx ecx, byte ptr [ebx]
    mov edx, dword ptr [esp + 20]
    lea eax, [edx + ecx - 2]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 91
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esi + 000000184h]
    mov dword ptr [edx + 24], ecx
    mov edx, dword ptr [esi]
    mov dword ptr [esp + 20], eax
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [esi]
    push 1
    push esi
    call dword ptr [eax + 4]
    mov eax, dword ptr [esp + 28]
    add esp, 8
    inc ebx
    dec ebp
    test eax, eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebp
    jle L4
    mov ecx, dword ptr [esi + 32]
    push eax
    push esi
    call dword ptr [ecx + 0x10]
    add esp, 8
L4:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004f040 ENDP
END
