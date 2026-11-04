.686
.MODEL FLAT, C
.CODE
FUN_1004c8b0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    mov ebx, dword ptr [ebp + 16]
    mov eax, dword ptr [ebx + 000000184h]
    test eax, eax
    push esi
    mov esi, dword ptr [ebp]
    push edi
    mov edi, dword ptr [ebp + 4]
    jne L7
    cmp dword ptr [esp + 28], 25
    jge L9
    lea ebx, [ebx]
L0:
    test edi, edi
    jne L1
    mov eax, dword ptr [ebx + 32]
    push ebx
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    je L5
    mov eax, dword ptr [ebx + 32]
    mov esi, dword ptr [eax]
    mov edi, dword ptr [eax + 4]
L1:
    movzx eax, byte ptr [esi]
    dec edi
    inc esi
    cmp eax, 0000000FFh
    jne L4
L2:
    test edi, edi
    jne L3
    mov ecx, dword ptr [ebx + 32]
    push ebx
    call dword ptr [ecx + 0xc]
    add esp, 4
    test al, al
    je L5
    mov eax, dword ptr [ebx + 32]
    mov esi, dword ptr [eax]
    mov edi, dword ptr [eax + 4]
L3:
    movzx eax, byte ptr [esi]
    dec edi
    inc esi
    cmp eax, 0000000FFh
    je L2
    test eax, eax
    jne L6
    mov eax, 0000000FFh
L4:
    mov edx, dword ptr [esp + 24]
    shl edx, 8
    or edx, eax
    mov eax, dword ptr [esp + 28]
    add eax, 8
    cmp eax, 25
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    jl L0
    jmp L9
L5:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L6:
    mov dword ptr [ebx + 000000184h], eax
L7:
    mov eax, dword ptr [esp + 28]
    cmp dword ptr [esp + 32], eax
    jle L9
    mov ecx, dword ptr [ebx + 0000001A0h]
    mov al, byte ptr [ecx + 8]
    test al, al
    jne L8
    mov edx, dword ptr [ebx]
    mov dword ptr [edx + 20], 117
    mov eax, dword ptr [ebx]
    push -1
    push ebx
    call dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + 0000001A0h]
    add esp, 8
    mov byte ptr [ecx + 8], 1
L8:
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 24]
    mov ecx, 25
    sub ecx, edx
    shl eax, cl
    mov dword ptr [esp + 28], 25
    mov dword ptr [esp + 24], eax
L9:
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 24]
    mov dword ptr [ebp + 4], edi
    pop edi
    mov dword ptr [ebp], esi
    pop esi
    mov dword ptr [ebp + 12], eax
    mov dword ptr [ebp + 8], edx
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1004c8b0 ENDP
END
