.686
.MODEL FLAT, C
.CODE
FUN_10044020 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esi + 12]
    mov ebx, eax
    test ebx, ebx
    push edi
    jne L0
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 40
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L0:
    mov eax, dword ptr [esp + 16]
    mov ecx, ebx
    mov edi, 1
    shl edi, cl
    add ebp, ebx
    mov ecx, 24
    sub ecx, ebp
    dec edi
    and edi, eax
    shl edi, cl
    or edi, dword ptr [esi + 8]
    cmp ebp, 8
    mov dword ptr [esp + 16], edi
    jl L4
    mov edi, edi
L1:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esi]
    shr eax, 16
    movzx eax, al
    mov byte ptr [ecx], al
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L2
    mov eax, dword ptr [esi + 32]
    mov ebx, dword ptr [eax + 32]
    push eax
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L5
    mov edx, dword ptr [ebx]
    mov dword ptr [esi], edx
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esi + 4], eax
L2:
    movzx eax, byte ptr [esp + 18]
    cmp eax, 0000000FFh
    jne L3
    mov ecx, dword ptr [esi]
    mov byte ptr [ecx], 0
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    inc ecx
    dec eax
    mov dword ptr [esi], ecx
    mov dword ptr [esi + 4], eax
    jne L3
    mov eax, dword ptr [esi + 32]
    mov ebx, dword ptr [eax + 32]
    push eax
    call dword ptr [ebx + 0xc]
    add esp, 4
    test al, al
    je L5
    mov edx, dword ptr [ebx]
    mov dword ptr [esi], edx
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esi + 4], eax
L3:
    shl edi, 8
    sub ebp, 8
    cmp ebp, 8
    mov dword ptr [esp + 16], edi
    jge L1
L4:
    mov dword ptr [esi + 8], edi
    pop edi
    mov dword ptr [esi + 12], ebp
    pop ebp
    mov al, 1
    pop ebx
    ret
L5:
    pop edi
    pop ebp
    xor al, al
    pop ebx
    ret
FUN_10044020 ENDP
END
