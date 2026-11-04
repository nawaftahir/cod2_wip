.686
.MODEL FLAT, C
.CODE
FUN_1004f1e0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [ebp + 32]
    mov ebx, dword ptr [esi]
    push edi
    mov edi, dword ptr [esi + 4]
    test edi, edi
    jne L0
    push ebp
    call dword ptr [esi + 0xc]
    add esp, 4
    test al, al
    je L1
    mov ebx, dword ptr [esi]
    mov edi, dword ptr [esi + 4]
L0:
    movzx ecx, byte ptr [ebx]
    dec edi
    inc ebx
    test edi, edi
    mov dword ptr [esp + 20], ecx
    jne L3
    push ebp
    call dword ptr [esi + 0xc]
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
    mov ebx, dword ptr [esi]
    mov edi, dword ptr [esi + 4]
    mov ecx, dword ptr [esp + 20]
L3:
    movzx eax, byte ptr [ebx]
    dec edi
    inc ebx
    cmp ecx, 0000000FFh
    mov dword ptr [esp + 20], eax
    jne L4
    cmp eax, 0000000D8h
    je L5
L4:
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], 53
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 24], ecx
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 28], eax
    mov edx, dword ptr [ebp]
    push ebp
    call dword ptr [edx]
    mov eax, dword ptr [esp + 24]
    add esp, 4
L5:
    mov dword ptr [ebp + 000000184h], eax
    mov dword ptr [esi + 4], edi
    pop edi
    mov dword ptr [esi], ebx
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004f1e0 ENDP
END
