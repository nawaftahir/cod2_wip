.686
.MODEL FLAT, C
.CODE
FUN_10044f20 PROC
    sub esp, 8
    mov eax, dword ptr [esp + 12]
    push ebx
    mov ebx, dword ptr [esi + eax*4 + 80]
    test ebx, ebx
    push edi
    mov dword ptr [esp + 12], ebx
    jne L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 52
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov dword ptr [esp + 8], 0
    lea eax, [ebx + 4]
    mov edi, 16
    mov edx, 0000000FFh
L1:
    cmp word ptr [eax - 4], dx
    mov ecx, 1
    jbe L2
    mov dword ptr [esp + 8], ecx
L2:
    cmp word ptr [eax - 2], dx
    jbe L3
    mov dword ptr [esp + 8], ecx
L3:
    cmp word ptr [eax], dx
    jbe L4
    mov dword ptr [esp + 8], ecx
L4:
    cmp word ptr [eax + 2], dx
    jbe L5
    mov dword ptr [esp + 8], ecx
L5:
    add eax, 8
    dec edi
    jne L1
    mov al, byte ptr [ebx + 000000080h]
    test al, al
    jne L14
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    push ebp
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    mov ebp, 24
    jne L6
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L6
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov byte ptr [ecx], 0000000DBh
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L7
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L7
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L7:
    mov ebx, dword ptr [esp + 12]
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    neg ebx
    sbb ebx, ebx
    and ebx, 64
    add ebx, 67
    mov ecx, ebx
    sar ecx, 8
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L8
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L8
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], bl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L9
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L9
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L9:
    mov eax, dword ptr [esi + 32]
    mov dl, byte ptr [esp + 12]
    mov bl, byte ptr [esp + 24]
    mov ecx, dword ptr [eax]
    shl dl, 4
    add dl, bl
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L10
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L10
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L10:
    mov edi, 010191200h
    lea ecx, [ecx]
L11:
    mov eax, dword ptr [esp + 12]
    test eax, eax
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [esp + 16]
    movzx ebx, word ptr [edx + ecx*2]
    je L12
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov ecx, ebx
    shr ecx, 8
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L12
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L12
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L12:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], bl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L13
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L13
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L13:
    add edi, 4
    cmp edi, 010191300h
    jl L11
    mov edx, dword ptr [esp + 16]
    mov byte ptr [edx + 000000080h], 1
    pop ebp
L14:
    mov eax, dword ptr [esp + 8]
    pop edi
    pop ebx
    add esp, 8
    ret
FUN_10044f20 ENDP
END
