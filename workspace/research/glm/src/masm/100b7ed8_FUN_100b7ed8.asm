.686
.MODEL FLAT, C
.CODE
FUN_100b7ed8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000ACh
    push ebx
    mov ebx, dword ptr [ebp + 8]
    test ebx, ebx
    push esi
    mov esi, ecx
    jne L0
    xor eax, eax
    inc eax
    jmp L19
L0:
    mov eax, dword ptr [ebx]
    mov ecx, eax
    and ecx, 0FFF00000h
    je L1
    cmp ecx, 020700000h
    jne L2
L1:
    xor eax, eax
    jmp L19
L2:
    and eax, 0000FFFFFh
    push edi
    mov edi, eax
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div edi
    cmp ecx, 070500000h
    mov dword ptr [ebp - 16], eax
    je L3
    cmp ecx, 070600000h
    je L3
    cmp ecx, 070700000h
    jne L4
L3:
    mov dword ptr [ebp - 16], 2
L4:
    cmp dword ptr [ebp - 16], 1
    jbe L17
    mov eax, dword ptr [esi + 000000080h]
    mov ecx, dword ptr [esi + 000000088h]
    mov edx, dword ptr [esi + 124]
    shl eax, 2
    and dword ptr [ebp + eax - 100], 0
    shl ecx, 2
    and dword ptr [ebp + ecx - 100], 0
    shl edx, 2
    and dword ptr [ebp + edx - 100], 0
    mov dword ptr [ebp + eax - 0000000ACh], 1
    xor eax, eax
    cmp dword ptr [ebp - 16], eax
    mov dword ptr [ebp + ecx - 0000000ACh], 3
    mov dword ptr [ebp + edx - 0000000ACh], 1
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 12], eax
    jbe L17
    mov ecx, edi
    shl ecx, 2
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 28], ecx
L5:
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, eax
    and ecx, 000000200h
    je L6
    test al, al
    js L7
    mov eax, dword ptr [esi + 124]
    jmp L10
L6:
    test al, al
    jns L8
L7:
    mov eax, dword ptr [esi + 000000094h]
    jmp L10
L8:
    test al, 16
    je L9
    test ecx, ecx
    jne L9
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 00000FFFFh
    je L9
    mov eax, dword ptr [esi + 000000080h]
    jmp L10
L9:
    mov eax, dword ptr [esi + 000000088h]
L10:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 4], eax
    jbe L14
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + 8]
L11:
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    mov ebx, dword ptr [edi + 4]
    cmp ebx, dword ptr [eax + 4]
    jne L12
    mov ebx, dword ptr [edi + 8]
    cmp ebx, dword ptr [eax + 8]
    jne L12
    mov ebx, dword ptr [edi + 12]
    cmp ebx, dword ptr [eax + 12]
    je L13
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add ecx, dword ptr [ebp - 28]
    cmp eax, dword ptr [ebp - 12]
    jb L11
L13:
    mov ebx, dword ptr [ebp + 8]
L14:
    mov ecx, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 8], ecx
    jne L15
    mov edx, dword ptr [ebp - 4]
    shl edx, 2
    lea eax, [ebp + edx - 100]
    inc dword ptr [eax]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp + edx - 0000000ACh]
    ja L20
L15:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jb L16
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [esi + 124], eax
    jne L16
    inc dword ptr [ebp - 20]
    cmp dword ptr [ebp - 20], 2
    ja L20
L16:
    mov eax, dword ptr [ebp - 24]
    add eax, dword ptr [ebp - 28]
    inc ecx
    cmp ecx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 24], eax
    jb L5
L17:
    xor eax, eax
L18:
    pop edi
L19:
    pop esi
    pop ebx
    leave
    ret 8
L20:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L21
    mov dword ptr [eax], ecx
L21:
    xor eax, eax
    inc eax
    jmp L18
FUN_100b7ed8 ENDP
END
