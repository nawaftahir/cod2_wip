.686
.MODEL FLAT, C
EXTRN sub_1004EBC8:PROC
EXTRN sub_1004F0C2:PROC
EXTRN sub_1004F0CB:PROC
EXTRN sub_1004F0E3:PROC
EXTRN sub_1004F0E7:PROC
EXTRN sub_1004F10B:PROC
EXTRN sub_1004F10D:PROC
EXTRN sub_1004F123:PROC
EXTRN sub_1004F142:PROC
EXTRN sub_1004F156:PROC
EXTRN sub_1004F16C:PROC
EXTRN sub_1004F17F:PROC
EXTRN sub_1004F20C:PROC
EXTRN sub_1004F216:PROC
EXTRN sub_1004F24A:PROC
EXTRN sub_1004F259:PROC
EXTRN sub_1004F28D:PROC
.CODE
FUN_1004edd0 PROC
    sub sub esp, 16
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 32]
    mov mov edx, dword ptr [esi + 019Ch]
    mov mov eax, dword ptr [esi + 32]
    mov mov ebx, dword ptr [edx + 0A0h]
    test test ebx, ebx
    mov mov ecx, dword ptr [eax]
    mov mov ebp, dword ptr [eax + 4]
    push push edi
    mov mov dword ptr [esp + 24], edx
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 36], ecx
    jne L4
    test test ebp, ebp
    jne L1
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    je L8
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    mov mov ebp, dword ptr [eax + 4]
    mov mov dword ptr [esp + 36], ecx
    xor xor ebx, ebx
    mov mov bh, byte ptr [ecx]
    dec dec ebp
    inc inc ecx
    test test ebp, ebp
    jne L2
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    je L9
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [eax]
    mov mov ebp, dword ptr [eax + 4]
    mov mov dword ptr [esp + 36], edx
    mov mov ecx, edx
    movzx movzx eax, byte ptr [ecx]
    dec dec ebp
    add add ebx, eax
    inc inc ecx
    sub sub ebx, 2
    mov mov dword ptr [esp + 36], ecx
    mov mov dword ptr [esp + 28], ebx
    js L7
    mov mov eax, dword ptr [esi + 0184h]
    cmp cmp eax, 0FEh
    jne L3
    mov mov ecx, dword ptr [esp + 24]
    mov mov edi, dword ptr [ecx + 92]
    mov mov dword ptr [esp + 16], edi
    jmp L5
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [edx + eax*4 - 0320h]
    mov mov dword ptr [esp + 16], eax
    mov mov edi, eax
    cmp cmp ebx, edi
    jae L6
    mov mov dword ptr [esp + 16], ebx
    mov mov edi, ebx
    mov mov ecx, dword ptr [esi + 4]
    lea lea edx, [edi + 20]
    push push edx
    push push 1
    push push esi
    call call dword ptr [ecx + 4]
    mov mov ecx, dword ptr [esp + 40]
    mov mov ebx, eax
    mov mov dword ptr [ebx], 0
    mov mov al, byte ptr [esi + 0184h]
    mov mov byte ptr [ebx + 4], al
    mov mov eax, dword ptr [esp + 36]
    lea lea edx, [ebx + 20]
    mov mov dword ptr [ebx + 8], ecx
    mov mov ecx, dword ptr [esp + 48]
    mov mov dword ptr [ebx + 12], edi
    mov mov dword ptr [ebx + 16], edx
    mov mov dword ptr [eax + 0A0h], ebx
    mov mov dword ptr [eax + 0A4h], 0
    mov mov eax, dword ptr [esp + 28]
    add add esp, 12
    mov mov dword ptr [esp + 28], edx
    xor xor edi, edi
    mov mov dword ptr [esp + 16], eax
    jmp L10
    xor xor edi, edi
    mov mov dword ptr [esp + 16], edi
    mov mov eax, edi
    jmp sub_1004F0E7
    mov mov edi, dword ptr [edx + 0A4h]
    mov mov edx, dword ptr [ebx + 12]
    mov mov eax, dword ptr [ebx + 16]
    add add eax, edi
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 28], eax
    mov mov edx, eax
    mov mov eax, dword ptr [esp + 16]
    cmp cmp edi, eax
    jae sub_1004F0CB
    mov mov edi, edi
    test test ebp, ebp
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], ebp
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [eax + 0A4h], edi
    jne sub_1004F0C2
    mov mov ecx, dword ptr [esp + 20]
L5:
    push push esi
    call call dword ptr [ecx + 12]
    add add esp, 4
    test test al, al
    je sub_1004F10B
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [eax]
    mov mov ebp, dword ptr [eax + 4]
    mov mov dword ptr [esp + 36], edx
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 16]
    nop nop
    test test ebp, ebp
    jbe sub_1004F123
    mov mov al, byte ptr [ecx]
    inc inc edx
    mov mov byte ptr [edx - 1], al
    mov mov eax, dword ptr [esp + 16]
    inc inc ecx
    dec dec ebp
    inc inc edi
    cmp cmp edi, eax
    mov mov dword ptr [esp + 28], edx
    mov mov dword ptr [esp + 36], ecx
    jb sub_1004F10D
    mov mov ecx, dword ptr [esi + 0114h]
    test test ecx, ecx
    jne sub_1004F156
    mov mov dword ptr [esi + 0114h], ebx
    jmp sub_1004F16C
    cmp cmp edi, eax
    jb sub_1004F0E3
    jmp sub_1004F142
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 16
    ret ret
    cmp cmp dword ptr [ecx], 0
    je sub_1004F17F
    mov mov ecx, dword ptr [ecx]
    cmp cmp dword ptr [ecx], 0
    jne sub_1004F17F
    mov mov dword ptr [ecx], ebx
    mov mov edi, dword ptr [ebx + 16]
    mov mov ebx, dword ptr [ebx + 8]
    sub sub ebx, eax
    mov mov dword ptr [esp + 28], ebx
    mov mov ecx, dword ptr [esp + 24]
    mov mov dword ptr [ecx + 0A0h], 0
    mov mov ecx, dword ptr [esi + 0184h]
    sub sub ecx, 0E0h
    je sub_1004F216
    sub sub ecx, 14
    je sub_1004F20C
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 91
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 0184h]
    mov mov dword ptr [ecx + 24], edx
    mov mov ecx, dword ptr [esi]
    add add eax, ebx
    mov mov dword ptr [ecx + 28], eax
    mov mov edx, dword ptr [esi]
    push push 1
    push push esi
    call call dword ptr [edx + 4]
    add add esp, 8
    jmp sub_1004F24A
    mov mov ecx, eax
    push push ebx
    mov mov eax, edi
    call L0
    add add esp, 4
    jmp sub_1004F259
    mov mov ecx, ebx
    call sub_1004EBC8
    test test ebx, ebx
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], ebp
    jle sub_1004F28D
    mov mov edx, dword ptr [esi + 32]
    push push ebx
    push push esi
    call call dword ptr [edx + 16]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 16
    ret ret
FUN_1004edd0 ENDP
END
