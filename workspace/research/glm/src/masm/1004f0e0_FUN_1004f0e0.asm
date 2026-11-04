.686
.MODEL FLAT, C
.CODE
FUN_1004f0e0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    mov ebx, dword ptr [ebp + 32]
    push esi
    mov esi, dword ptr [ebx + 4]
    push edi
    mov edi, dword ptr [ebx]
L0:
    test esi, esi
    jne L1
    push ebp
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L6
    mov edi, dword ptr [ebx]
    mov esi, dword ptr [ebx + 4]
L1:
    movzx eax, byte ptr [edi]
    dec esi
    inc edi
    cmp eax, 0000000FFh
    je L4
L2:
    mov eax, dword ptr [ebp + 00000019Ch]
    mov ecx, dword ptr [eax + 20]
    inc ecx
    test esi, esi
    mov dword ptr [eax + 20], ecx
    mov dword ptr [ebx], edi
    mov dword ptr [ebx + 4], esi
    jne L3
    push ebp
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L6
    mov edi, dword ptr [ebx]
    mov esi, dword ptr [ebx + 4]
L3:
    movzx eax, byte ptr [edi]
    dec esi
    inc edi
    cmp eax, 0000000FFh
    jne L2
L4:
    test esi, esi
    jne L5
    push ebp
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L6
    mov edi, dword ptr [ebx]
    mov esi, dword ptr [ebx + 4]
L5:
    movzx eax, byte ptr [edi]
    dec esi
    inc edi
    cmp eax, 0000000FFh
    mov dword ptr [esp + 20], eax
    je L4
    test eax, eax
    jne L7
    mov eax, dword ptr [ebp + 00000019Ch]
    add dword ptr [eax + 20], 2
    mov dword ptr [ebx], edi
    mov dword ptr [ebx + 4], esi
    jmp L0
L6:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L7:
    mov ecx, dword ptr [ebp + 00000019Ch]
    mov edx, dword ptr [ecx + 20]
    test edx, edx
    je L8
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], 116
    mov ecx, dword ptr [ebp + 00000019Ch]
    mov edx, dword ptr [ebp]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [edx + 24], ecx
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [ebp]
    push -1
    push ebp
    call dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 00000019Ch]
    mov eax, dword ptr [esp + 28]
    add esp, 8
    mov dword ptr [ecx + 20], 0
L8:
    mov dword ptr [ebp + 000000184h], eax
    mov dword ptr [ebx], edi
    pop edi
    mov dword ptr [ebx + 4], esi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004f0e0 ENDP
END
