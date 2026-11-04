.686
.MODEL FLAT, C
.CODE
FUN_100a5d6e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000A8h
    push esi
    push edi
    mov esi, ecx
    mov ecx, dword ptr [ebp + 8]
    xor edi, edi
    cmp ecx, edi
    jne L0
    xor eax, eax
    inc eax
    jmp L22
L0:
    mov eax, dword ptr [ecx]
    push ebx
    mov ebx, eax
    and ebx, 0FFF00000h
    je L20
    cmp ebx, 020700000h
    je L20
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ecx + 4]
    xor edx, edx
    div dword ptr [ebp - 16]
    cmp ebx, 070500000h
    mov dword ptr [ebp - 8], eax
    je L1
    cmp ebx, 070600000h
    je L1
    cmp ebx, 070700000h
    jne L2
L1:
    mov dword ptr [ebp - 8], 2
L2:
    xor ebx, ebx
    inc ebx
    cmp dword ptr [ebp - 8], ebx
    jbe L20
    mov eax, dword ptr [esi + 000000080h]
    mov ecx, dword ptr [esi + 000000088h]
    mov edx, dword ptr [esi + 124]
    shl eax, 2
    mov dword ptr [ebp + eax - 96], edi
    shl ecx, 2
    shl edx, 2
    mov dword ptr [ebp + ecx - 96], edi
    mov dword ptr [ebp + edx - 96], edi
    mov edi, dword ptr [esi + 000000094h]
    mov dword ptr [ebp + eax - 0000000A8h], ebx
    shl edi, 2
    and dword ptr [ebp + edi - 96], 0
    mov dword ptr [ebp + ecx - 0000000A8h], 3
    mov dword ptr [ebp + edx - 0000000A8h], ebx
    xor edx, edx
    cmp dword ptr [ebp - 8], edx
    mov dword ptr [ebp + edi - 0000000A8h], ebx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 4], edx
    jbe L17
    mov dword ptr [ebp - 12], edx
L3:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edi + 108]
    cmp ecx, 17
    jne L4
    test byte ptr [eax + 4], 16
    jne L16
L4:
    mov eax, dword ptr [eax + 4]
    mov edx, eax
    and edx, 000000200h
    je L5
    test al, al
    js L6
    mov edx, dword ptr [esi + 124]
    jmp L9
L5:
    test al, al
    jns L7
L6:
    mov edx, dword ptr [esi + 000000094h]
    jmp L9
L7:
    test al, 16
    je L8
    test edx, edx
    jne L8
    mov eax, dword ptr [esi]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 00000FFFFh
    je L8
    mov edx, dword ptr [esi + 000000080h]
    jmp L9
L8:
    mov edx, dword ptr [esi + 000000088h]
L9:
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 4], 0
    jbe L13
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 8]
L10:
    mov ebx, dword ptr [ecx]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [edi + 4]
    cmp ebx, dword ptr [eax + 4]
    jne L11
    mov ebx, dword ptr [edi + 8]
    cmp ebx, dword ptr [eax + 8]
    jne L11
    mov ebx, dword ptr [edi + 12]
    cmp ebx, dword ptr [eax + 12]
    je L12
L11:
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 20]
    shl eax, 2
    add ecx, eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 4]
    jb L10
L12:
    xor ebx, ebx
    inc ebx
L13:
    mov ecx, dword ptr [ebp - 4]
    cmp dword ptr [ebp - 20], ecx
    jne L14
    lea eax, [ebp + edx*4 - 96]
    inc dword ptr [eax]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp + edx*4 - 0000000A8h]
    ja L23
L14:
    cmp dword ptr [esi + 124], edx
    jne L15
    inc dword ptr [ebp - 24]
    cmp dword ptr [ebp - 24], 2
    ja L26
L15:
    xor edx, edx
L16:
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 4]
    shl eax, 2
    add dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L3
L17:
    cmp dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 4], edx
    jbe L20
    mov eax, dword ptr [ebp - 16]
    xor ebx, ebx
    shl eax, 2
    mov dword ptr [ebp - 12], eax
L18:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    and ecx, 0F0000000h
    cmp ecx, 060000000h
    jne L19
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [ebx + eax]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 18
    jne L19
    mov eax, dword ptr [edi + 4]
    cmp eax, dword ptr [esi + 000000080h]
    je L27
L19:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add ebx, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 8]
    jb L18
L20:
    xor eax, eax
L21:
    pop ebx
L22:
    pop edi
    pop esi
    leave
    ret 8
L23:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L25
L24:
    mov dword ptr [eax], ecx
L25:
    mov eax, ebx
    jmp L21
L26:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L25
    mov ecx, dword ptr [ebp - 4]
    jmp L24
L27:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L28
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], ecx
L28:
    xor eax, eax
    inc eax
    jmp L21
FUN_100a5d6e ENDP
END
