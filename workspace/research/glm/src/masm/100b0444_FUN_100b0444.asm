.686
.MODEL FLAT, C
.CODE
FUN_100b0444 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000ACh
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
    push esi
    mov esi, eax
    and esi, 0FFF00000h
    jne L2
L1:
    xor eax, eax
    jmp L19
L2:
    cmp esi, 020700000h
    je L1
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [edx + 4]
    xor edx, edx
    div dword ptr [ebp - 8]
    push edi
    cmp eax, 1
    mov dword ptr [ebp - 24], eax
    jbe L17
    mov eax, dword ptr [ecx + 000000080h]
    mov edx, dword ptr [ecx + 000000088h]
    mov esi, dword ptr [ecx + 124]
    mov edi, dword ptr [ecx + 000000094h]
    and dword ptr [ebp - 4], 0
    shl eax, 2
    mov dword ptr [ebp + eax - 100], ebx
    shl edx, 2
    mov dword ptr [ebp + edx - 100], ebx
    shl esi, 2
    shl edi, 2
    mov dword ptr [ebp + esi - 100], ebx
    mov dword ptr [ebp + edi - 100], ebx
    push 2
    pop ebx
    mov dword ptr [ebp + eax - 0000000ACh], ebx
    mov dword ptr [ebp + edx - 0000000ACh], 3
    mov dword ptr [ebp + esi - 0000000ACh], ebx
    xor ebx, ebx
    cmp dword ptr [ebp - 24], ebx
    mov dword ptr [ebp + edi - 0000000ACh], 1
    mov dword ptr [ebp - 12], ebx
    jbe L17
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 8]
    shl edx, 2
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 20], edx
    mov dword ptr [ebp - 16], eax
L3:
    mov edx, dword ptr [eax]
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edx*4]
    and dword ptr [ebp + 8], 0
    test ebx, ebx
    mov edi, dword ptr [edx + 4]
    jbe L6
    mov eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 8], eax
L4:
    mov esi, dword ptr [eax]
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + esi*4]
    cmp edi, dword ptr [eax + 4]
    jne L5
    mov esi, dword ptr [edx + 8]
    cmp esi, dword ptr [eax + 8]
    jne L5
    mov esi, dword ptr [edx + 12]
    cmp esi, dword ptr [eax + 12]
    jne L5
    mov esi, dword ptr [ecx + 16]
    mov ebx, dword ptr [esi + edi*4]
    test byte ptr [ebx + 5], 1
    je L6
    mov ebx, dword ptr [eax + 4]
    mov esi, dword ptr [esi + ebx*4]
    test byte ptr [esi + 5], 1
    je L6
    fld qword ptr [eax + 32]
    fld qword ptr [edx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L6
L5:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 8]
    add eax, dword ptr [ebp - 20]
    mov esi, dword ptr [ebp + 8]
    cmp esi, dword ptr [ebp - 12]
    mov dword ptr [ebp - 8], eax
    jb L4
L6:
    mov ebx, dword ptr [ebp - 12]
    cmp dword ptr [ebp + 8], ebx
    jne L16
    mov eax, dword ptr [ecx + 000000080h]
    cmp edi, eax
    jne L8
    cmp byte ptr [edx + 108], 3
    jne L12
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000101h
    jne L7
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 2
    jbe L7
    cmp dword ptr [ebp + 12], 0
    je L21
L7:
    mov eax, dword ptr [ecx + 000000088h]
    jmp L12
L8:
    mov eax, dword ptr [ecx + 16]
    mov esi, dword ptr [eax + edi*4]
    mov eax, dword ptr [esi + 4]
    test ah, 2
    je L9
    test al, al
    js L10
    mov eax, dword ptr [ecx + 124]
    jmp L12
L9:
    test al, al
    jns L11
L10:
    mov eax, dword ptr [ecx + 000000094h]
    jmp L12
L11:
    mov eax, edi
L12:
    mov edx, dword ptr [edx + 72]
    cmp edx, -1
    je L15
    mov esi, dword ptr [ecx + 000000088h]
    cmp edi, esi
    jne L15
    mov edi, dword ptr [ecx + 0000000C8h]
    and edi, 00000FFFFh
    cmp edi, 000000101h
    jne L15
    mov eax, dword ptr [ecx + 24]
    mov eax, dword ptr [eax + edx*4]
    test eax, eax
    je L14
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 060F00000h
    je L13
    cmp eax, 060500000h
    je L13
    cmp eax, 060A00000h
    je L13
    cmp eax, 060000000h
    jne L14
L13:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 2
    jbe L14
    cmp dword ptr [ebp + 12], 0
    je L21
L14:
    mov eax, esi
L15:
    cmp eax, 18
    jae L16
    mov edx, eax
    shl edx, 2
    lea eax, [ebp + edx - 100]
    inc dword ptr [eax]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp + edx - 0000000ACh]
    ja L22
L16:
    mov eax, dword ptr [ebp - 16]
    add eax, dword ptr [ebp - 20]
    inc ebx
    cmp ebx, dword ptr [ebp - 24]
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 16], eax
    jb L3
L17:
    xor eax, eax
L18:
    pop edi
L19:
    pop esi
L20:
    pop ebx
    leave
    ret 8
L21:
    xor eax, eax
    inc eax
    jmp L18
L22:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L21
    mov dword ptr [eax], ebx
    jmp L21
FUN_100b0444 ENDP
END
