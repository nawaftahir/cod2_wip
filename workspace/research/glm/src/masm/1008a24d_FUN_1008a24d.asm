.686
.MODEL FLAT, C
EXTRN sub_10085465:PROC
EXTRN sub_1008A25F:PROC
EXTRN sub_1008A35E:PROC
.CODE
FUN_1008a24d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 72
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [ebp + 12]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + edx*4]
    test byte ptr [esi + 3], 000000080h
    mov eax, dword ptr [esi + 12]
    mov edx, dword ptr [ebx + 8]
    mov eax, dword ptr [edx + eax*4]
    push edi
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp - 28], esi
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ebp - 8], 4
    jne L2
    cmp eax, 1
    jne L0
    test byte ptr [ecx + 108], 4
    jne L2
    cmp eax, eax
L0:
    jbe L1
    test byte ptr [ecx + 108], 2
    jne L2
L1:
    mov eax, dword ptr [esi + 72]
    mov ecx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + eax*4]
    call sub_10085465
    test eax, eax
    je L3
L2:
    mov dword ptr [ebp - 8], 1
L3:
    or eax, 0FFFFFFFFh
    mov esi, dword ptr [esi + 12]
    lea edi, [ebp - 56]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 72]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor edi, edi
    mov dword ptr [ebp - 4], 4
    mov dword ptr [ebp + 12], edi
    shl esi, 4
L4:
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [esi + eax]
    cmp eax, -1
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 24], edi
    je L11
    mov eax, dword ptr [ebx + 48]
    mov eax, dword ptr [esi + eax]
    cmp eax, edi
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 40], eax
    jbe L11
    mov eax, dword ptr [ebx + 52]
    mov eax, dword ptr [esi + eax]
    mov ecx, dword ptr [ebx + 56]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 12], eax
L5:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 16]
    mov edx, eax
    shr edx, 2
    mov ecx, dword ptr [ecx + edx*4]
    cmp ecx, -1
    je L6
    mov dword ptr [ebp - 24], 1
L6:
    cmp dword ptr [ebp + 16], ecx
    jne L8
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + eax*4]
    cmp edi, -1
    je L8
    cmp dword ptr [ebp + edi*4 - 56], -1
    jne L8
    cmp dword ptr [ebp - 8], 1
    jne L7
    cmp dword ptr [ebp + 12], edi
    jne L8
L7:
    mov ecx, dword ptr [ebp - 20]
    push edi
    push dword ptr [ebp + 16]
    push dword ptr [ebp - 36]
    push ebx
    call sub_1008A25F
    cmp eax, -1
    je L9
L8:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    add dword ptr [ebp - 12], 4
    cmp eax, dword ptr [ebp - 40]
    jb L5
    jmp L10
L9:
    mov eax, dword ptr [ebp + 12]
    dec dword ptr [ebp - 4]
    mov dword ptr [ebp + edi*4 - 56], eax
    mov dword ptr [ebp + eax*4 - 72], edi
L10:
    xor edi, edi
    cmp dword ptr [ebp - 24], edi
    jne L12
L11:
    dec dword ptr [ebp - 4]
L12:
    inc dword ptr [ebp + 12]
    add esi, 4
    cmp dword ptr [ebp + 12], 4
    jb L4
    mov ecx, dword ptr [ebp - 4]
    shl ecx, 29
    cmp ecx, dword ptr [ebp + 28]
    jae L27
    xor eax, eax
    cmp dword ptr [ebp + 20], edi
    jge L13
    test byte ptr [ebp + 16], 1
    je L15
    jmp L14
L13:
    jle L15
    test byte ptr [ebp + 16], 1
    jne L15
L14:
    xor eax, eax
    inc eax
L15:
    shl eax, 28
    or ecx, eax
    cmp ecx, dword ptr [ebp + 28]
    mov dword ptr [ebp + 20], ecx
    jae L27
L16:
    cmp dword ptr [ebp + edi*4 - 72], -1
    jne L26
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 12]
    lea edx, [edi + eax*4]
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, -1
    mov dword ptr [ebp + 12], eax
    je L26
    xor ebx, ebx
    cmp dword ptr [ebp - 8], ebx
    jbe L22
L17:
    mov ecx, dword ptr [ebp - 20]
    lea esi, [ebx + edi]
    and esi, 3
    cmp dword ptr [ebp - 32], 1
    jne L19
    test byte ptr [ecx + 112], 2
    je L18
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax]
    mov edx, eax
    and edx, 0FFF00000h
    cmp edx, 050000000h
    jne L18
    and eax, 0000FFFFFh
    cmp eax, 4
    jb L19
L18:
    push 3
    pop eax
    sub eax, esi
    mov esi, eax
L19:
    cmp dword ptr [ebp + esi*4 - 56], -1
    jne L20
    push esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1008A35E
    cmp eax, -1
    je L21
L20:
    inc ebx
    cmp ebx, dword ptr [ebp - 8]
    jb L17
    jmp L22
L21:
    mov dword ptr [ebp + esi*4 - 56], edi
    mov dword ptr [ebp + edi*4 - 72], esi
L22:
    cmp dword ptr [ebp - 8], ebx
    je L29
    mov eax, dword ptr [ebp + 8]
    test byte ptr [eax + 96], 1
    je L23
    cmp dword ptr [ebp - 32], 1
    jbe L24
L23:
    mov ecx, dword ptr [ebp + 20]
    shl ebx, 24
    add ecx, ebx
    cmp ecx, dword ptr [ebp + 28]
    mov dword ptr [ebp + 20], ecx
    jae L27
    jmp L25
L24:
    mov ecx, dword ptr [ebp + 20]
L25:
    mov ebx, dword ptr [ebp + 8]
L26:
    inc edi
    cmp edi, 4
    jb L16
    mov edi, dword ptr [ebp + 24]
    test edi, edi
    je L27
    lea esi, [ebp - 72]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
L27:
    mov eax, ecx
L28:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
L29:
    or eax, 0FFFFFFFFh
    jmp L28
FUN_1008a24d ENDP
END
