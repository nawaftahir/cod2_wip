.686
.MODEL FLAT, C
.CODE
FUN_100b0922 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000C8h
    mov edx, dword ptr [ebp + 8]
    push ebx
    xor ebx, ebx
    cmp edx, ebx
    jne L0
    xor eax, eax
    inc eax
    jmp L20
L0:
    mov eax, dword ptr [edx]
    test eax, 0FFF00000h
    jne L1
    xor eax, eax
    jmp L20
L1:
    push esi
    push edi
    mov edi, 0000FFFFFh
    and eax, edi
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [edx + 4]
    xor edx, edx
    div dword ptr [ebp - 12]
    xor edx, edx
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp + 12]
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    and esi, edi
    div esi
    mov edx, dword ptr [ecx + 000000080h]
    mov edi, dword ptr [ecx + 000000088h]
    shl edx, 2
    mov dword ptr [ebp + edx - 000000080h], ebx
    shl edi, 2
    mov dword ptr [ebp + edi - 000000080h], ebx
    mov ebx, dword ptr [ecx + 124]
    shl ebx, 2
    and dword ptr [ebp + ebx - 000000080h], 0
    mov dword ptr [ebp + edx - 0000000C8h], 2
    mov edx, dword ptr [ebp - 28]
    mov dword ptr [ebp + edi - 0000000C8h], 5
    mov dword ptr [ebp + ebx - 0000000C8h], 3
    add eax, edx
    mov dword ptr [ebp - 52], eax
    je L18
    mov eax, dword ptr [ebp - 12]
    and dword ptr [ebp - 20], 0
    shl eax, 2
    mov dword ptr [ebp - 36], eax
    mov eax, esi
    imul esi, edx
    shl eax, 2
    neg esi
    shl esi, 2
    mov dword ptr [ebp - 44], eax
    mov eax, esi
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 40], eax
L2:
    mov edx, dword ptr [ebp - 28]
    cmp dword ptr [ebp - 4], edx
    mov edi, dword ptr [ecx + 20]
    jae L3
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 20]
    mov eax, dword ptr [edx + eax]
    jmp L4
L3:
    mov edx, dword ptr [ebp + 12]
    mov edx, dword ptr [edx + 8]
    mov eax, dword ptr [eax + edx]
L4:
    mov ebx, dword ptr [edi + eax*4]
    mov eax, dword ptr [ebx + 4]
    mov edx, dword ptr [ecx + 16]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 48], edx
    xor edx, edx
    cmp dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 16], edx
    jbe L9
    mov esi, dword ptr [ebp - 56]
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp - 32], esi
L5:
    cmp edx, dword ptr [ebp - 28]
    jae L6
    mov edx, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp - 12]
    jmp L7
L6:
    mov edx, dword ptr [ebp + 12]
    mov esi, dword ptr [ebp - 32]
L7:
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [esi + edx]
    mov esi, dword ptr [edi + edx*4]
    cmp eax, dword ptr [esi + 4]
    jne L8
    mov edx, dword ptr [ebx + 8]
    cmp edx, dword ptr [esi + 8]
    jne L8
    mov edx, dword ptr [ebx + 12]
    cmp edx, dword ptr [esi + 12]
    je L9
L8:
    mov edx, dword ptr [ebp - 44]
    add dword ptr [ebp - 32], edx
    mov edx, dword ptr [ebp - 36]
    inc dword ptr [ebp - 16]
    add dword ptr [ebp - 12], edx
    mov edx, dword ptr [ebp - 16]
    cmp edx, dword ptr [ebp - 4]
    jb L5
L9:
    mov edx, dword ptr [ebp - 4]
    cmp dword ptr [ebp - 16], edx
    jne L17
    mov esi, dword ptr [ecx + 000000088h]
    cmp eax, esi
    jne L10
    cmp dword ptr [ebx + 12], 1
    jbe L10
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 3
    ja L21
L10:
    mov edx, dword ptr [ecx + 000000080h]
    cmp eax, edx
    jne L14
    cmp byte ptr [ebx + 108], 3
    jne L12
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000101h
    jne L11
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 3
    ja L21
L11:
    mov eax, esi
    jmp L13
L12:
    mov eax, edx
L13:
    mov esi, eax
    shl esi, 2
    lea edi, [ebp + esi - 000000080h]
    inc dword ptr [edi]
    mov edi, dword ptr [edi]
    cmp edi, dword ptr [ebp + esi - 0000000C8h]
    jmp L16
L14:
    mov eax, dword ptr [ebp - 48]
    mov eax, dword ptr [eax + 4]
    test al, al
    js L18
    test ah, 2
    je L15
    inc dword ptr [ebp - 24]
    cmp dword ptr [ebp - 24], 3
    jmp L16
L15:
    mov edi, dword ptr [ebx + 4]
    shl edi, 2
    lea ebx, [ebp + edi - 000000080h]
    inc dword ptr [ebx]
    mov ebx, dword ptr [ebx]
    cmp ebx, dword ptr [ebp + edi - 0000000C8h]
L16:
    ja L21
L17:
    mov edx, dword ptr [ebp - 36]
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 40]
    add dword ptr [ebp - 20], edx
    add eax, dword ptr [ebp - 44]
    mov edx, dword ptr [ebp - 4]
    cmp edx, dword ptr [ebp - 52]
    mov dword ptr [ebp - 40], eax
    jb L2
L18:
    xor eax, eax
L19:
    pop edi
    pop esi
L20:
    pop ebx
    leave
    ret 8
L21:
    xor eax, eax
    inc eax
    jmp L19
FUN_100b0922 ENDP
END
