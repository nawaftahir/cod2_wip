.686
.MODEL FLAT, C
.CODE
FUN_100b5a53 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000B0h
    push esi
    push edi
    mov esi, ecx
    mov ecx, dword ptr [ebp + 8]
    xor edi, edi
    cmp ecx, edi
    jne L0
    xor eax, eax
    inc eax
    jmp L17
L0:
    mov eax, dword ptr [ecx]
    mov edx, eax
    and edx, 0FFF00000h
    je L1
    cmp edx, 020700000h
    jne L2
L1:
    xor eax, eax
    jmp L17
L2:
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ecx + 4]
    xor edx, edx
    div dword ptr [ebp - 4]
    push ebx
    xor ebx, ebx
    inc ebx
    cmp eax, ebx
    mov dword ptr [ebp - 28], eax
    jbe L15
    mov eax, dword ptr [esi + 000000080h]
    mov ecx, dword ptr [esi + 000000088h]
    mov edx, dword ptr [esi + 124]
    shl eax, 2
    mov dword ptr [ebp + eax - 104], edi
    shl ecx, 2
    mov dword ptr [ebp + ecx - 104], edi
    shl edx, 2
    mov dword ptr [ebp + edx - 104], edi
    mov edi, dword ptr [esi + 000000094h]
    mov dword ptr [ebp + eax - 0000000B0h], ebx
    shl edi, 2
    and dword ptr [ebp + edi - 104], 0
    xor eax, eax
    cmp dword ptr [ebp - 28], eax
    mov dword ptr [ebp + ecx - 0000000B0h], 3
    mov dword ptr [ebp + edx - 0000000B0h], ebx
    mov dword ptr [ebp + edi - 0000000B0h], ebx
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], eax
    jbe L15
    mov ecx, dword ptr [ebp - 4]
    shl ecx, 2
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 20], ecx
L3:
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [eax + 4]
    mov ecx, eax
    and ecx, 000000200h
    je L4
    test al, al
    js L5
    mov eax, dword ptr [esi + 124]
    jmp L8
L4:
    test al, al
    jns L6
L5:
    mov eax, dword ptr [esi + 000000094h]
    jmp L8
L6:
    test al, 16
    je L7
    test ecx, ecx
    jne L7
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 00000FFFFh
    je L7
    mov eax, dword ptr [esi + 000000080h]
    jmp L8
L7:
    mov eax, dword ptr [esi + 000000088h]
L8:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 8], eax
    jbe L12
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + 8]
L9:
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    mov ebx, dword ptr [edi + 4]
    cmp ebx, dword ptr [eax + 4]
    jne L10
    mov ebx, dword ptr [edi + 8]
    cmp ebx, dword ptr [eax + 8]
    jne L10
    mov ebx, dword ptr [edi + 12]
    cmp ebx, dword ptr [eax + 12]
    je L11
L10:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add ecx, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 12]
    jb L9
L11:
    xor ebx, ebx
    inc ebx
L12:
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 4], edx
    jne L13
    mov eax, dword ptr [ebp - 8]
    cmp eax, 18
    jae L13
    mov ecx, eax
    shl ecx, 2
    lea eax, [ebp + ecx - 104]
    inc dword ptr [eax]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp + ecx - 0000000B0h]
    ja L18
L13:
    mov eax, dword ptr [ebp - 32]
    test byte ptr [eax + 5], 2
    je L14
    inc dword ptr [ebp - 16]
    cmp dword ptr [ebp - 16], 2
    ja L18
L14:
    mov eax, dword ptr [ebp - 24]
    add eax, dword ptr [ebp - 20]
    inc edx
    cmp edx, dword ptr [ebp - 28]
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp - 24], eax
    jb L3
L15:
    xor eax, eax
L16:
    pop ebx
L17:
    pop edi
    pop esi
    leave
    ret 8
L18:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L19
    mov dword ptr [eax], edx
L19:
    mov eax, ebx
    jmp L16
FUN_100b5a53 ENDP
END
