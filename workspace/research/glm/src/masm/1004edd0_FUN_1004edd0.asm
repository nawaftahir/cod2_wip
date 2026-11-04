.686
.MODEL FLAT, C
EXTRN sub_1004EBC8:PROC
EXTRN sub_1004EE0C:PROC
.CODE
FUN_1004edd0 PROC
    sub esp, 16
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [esi + 00000019Ch]
    mov eax, dword ptr [esi + 32]
    mov ebx, dword ptr [edx + 0000000A0h]
    test ebx, ebx
    mov ecx, dword ptr [eax]
    mov ebp, dword ptr [eax + 4]
    push edi
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 36], ecx
    jne L6
    test ebp, ebp
    jne L0
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    je L13
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [esp + 36], ecx
L0:
    xor ebx, ebx
    mov bh, byte ptr [ecx]
    dec ebp
    inc ecx
    test ebp, ebp
    jne L1
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    je L13
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [eax]
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [esp + 36], edx
    mov ecx, edx
L1:
    movzx eax, byte ptr [ecx]
    dec ebp
    add ebx, eax
    inc ecx
    sub ebx, 2
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 28], ebx
    js L5
    mov eax, dword ptr [esi + 000000184h]
    cmp eax, 0000000FEh
    jne L2
    mov ecx, dword ptr [esp + 24]
    mov edi, dword ptr [ecx + 92]
    mov dword ptr [esp + 16], edi
    jmp L3
L2:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [edx + eax*4 - 000000320h]
    mov dword ptr [esp + 16], eax
    mov edi, eax
L3:
    cmp ebx, edi
    jae L4
    mov dword ptr [esp + 16], ebx
    mov edi, ebx
L4:
    mov ecx, dword ptr [esi + 4]
    lea edx, [edi + 20]
    push edx
    push 1
    push esi
    call dword ptr [ecx + 4]
    mov ecx, dword ptr [esp + 40]
    mov ebx, eax
    mov dword ptr [ebx], 0
    mov al, byte ptr [esi + 000000184h]
    mov byte ptr [ebx + 4], al
    mov eax, dword ptr [esp + 36]
    lea edx, [ebx + 20]
    mov dword ptr [ebx + 8], ecx
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [ebx + 12], edi
    mov dword ptr [ebx + 16], edx
    mov dword ptr [eax + 0000000A0h], ebx
    mov dword ptr [eax + 0000000A4h], 0
    mov eax, dword ptr [esp + 28]
    add esp, 12
    mov dword ptr [esp + 28], edx
    xor edi, edi
    mov dword ptr [esp + 16], eax
    jmp L7
L5:
    xor edi, edi
    mov dword ptr [esp + 16], edi
    mov eax, edi
    jmp L18
L6:
    mov edi, dword ptr [edx + 0000000A4h]
    mov edx, dword ptr [ebx + 12]
    mov eax, dword ptr [ebx + 16]
    add eax, edi
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 28], eax
    mov edx, eax
    mov eax, dword ptr [esp + 16]
L7:
    cmp edi, eax
    jae L11
    mov edi, edi
L8:
    test ebp, ebp
    mov eax, dword ptr [esp + 20]
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ebp
    mov eax, dword ptr [esp + 24]
    mov dword ptr [eax + 0000000A4h], edi
    jne L9
    mov ecx, dword ptr [esp + 20]
    push esi
    call dword ptr [ecx + 0xc]
    add esp, 4
    test al, al
    je L13
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [eax]
    mov ebp, dword ptr [eax + 4]
    mov dword ptr [esp + 36], edx
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 36]
L9:
    mov eax, dword ptr [esp + 16]
    nop
L10:
    test ebp, ebp
    jbe L12
    mov al, byte ptr [ecx]
    inc edx
    mov byte ptr [edx - 1], al
    mov eax, dword ptr [esp + 16]
    inc ecx
    dec ebp
    inc edi
    cmp edi, eax
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 36], ecx
    jb L10
L11:
    mov ecx, dword ptr [esi + 000000114h]
    test ecx, ecx
    jne L14
    mov dword ptr [esi + 000000114h], ebx
    jmp L17
L12:
    cmp edi, eax
    jb L8
    jmp L11
L13:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 16
    ret
L14:
    cmp dword ptr [ecx], 0
    je L16
L15:
    mov ecx, dword ptr [ecx]
    cmp dword ptr [ecx], 0
    jne L15
L16:
    mov dword ptr [ecx], ebx
L17:
    mov edi, dword ptr [ebx + 16]
    mov ebx, dword ptr [ebx + 8]
    sub ebx, eax
    mov dword ptr [esp + 28], ebx
L18:
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [ecx + 0000000A0h], 0
    mov ecx, dword ptr [esi + 000000184h]
    sub ecx, 0000000E0h
    je L20
    sub ecx, 14
    je L19
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 91
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 000000184h]
    mov dword ptr [ecx + 24], edx
    mov ecx, dword ptr [esi]
    add eax, ebx
    mov dword ptr [ecx + 28], eax
    mov edx, dword ptr [esi]
    push 1
    push esi
    call dword ptr [edx + 4]
    add esp, 8
    jmp L21
L19:
    mov ecx, eax
    push ebx
    mov eax, edi
    call sub_1004EE0C
    add esp, 4
    jmp L21
L20:
    mov ecx, ebx
    call sub_1004EBC8
L21:
    test ebx, ebx
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ebp
    jle L22
    mov edx, dword ptr [esi + 32]
    push ebx
    push esi
    call dword ptr [edx + 0x10]
    add esp, 8
L22:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 16
    ret
FUN_1004edd0 ENDP
END
