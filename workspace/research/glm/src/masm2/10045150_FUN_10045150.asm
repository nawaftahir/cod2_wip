.686
.MODEL FLAT, C
EXTRN sub_10044EA0:PROC
EXTRN sub_10045330:PROC
EXTRN sub_1004533B:PROC
EXTRN sub_1004535D:PROC
EXTRN sub_10045392:PROC
EXTRN sub_1004539D:PROC
EXTRN sub_100453F2:PROC
EXTRN sub_10045408:PROC
EXTRN sub_10045413:PROC
EXTRN sub_10045476:PROC
EXTRN sub_1004548A:PROC
EXTRN sub_10045495:PROC
.CODE
FUN_10045150 PROC
    push push ecx
    push push esi
    test test al, al
    mov mov eax, dword ptr [esp + 12]
    push push edi
    mov mov esi, ecx
    je L0
    mov mov edi, dword ptr [esi + eax*4 + 112]
    add add eax, 16
    mov mov dword ptr [esp + 8], edi
    mov mov dword ptr [esp + 16], eax
    jmp L1
    mov mov ecx, dword ptr [esi + eax*4 + 96]
    mov mov dword ptr [esp + 8], ecx
    mov mov edi, ecx
    test test edi, edi
    jne L2
    mov mov edx, dword ptr [esi]
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [edx + 20], 50
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
L1:
    mov mov al, byte ptr [edi + 0111h]
    test test al, al
    jne sub_1004535D
    push push ebx
    push push ebp
    push push 0C4h
    call sub_10044EA0
    add add esp, 4
    xor xor ebp, ebp
    lea lea eax, [edi + 3]
    mov mov ecx, 4
    lea lea ecx, [ecx]
    movzx movzx edi, byte ptr [eax - 1]
    movzx movzx edx, byte ptr [eax - 2]
    add add edx, edi
    movzx movzx edi, byte ptr [eax + 1]
    add add edx, edi
    movzx movzx edi, byte ptr [eax]
    add add edi, ebp
    add add eax, 4
    dec dec ecx
    lea lea ebp, [edi + edx]
    jne L3
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    lea lea ebx, [ebp + 19]
    mov mov ecx, ebx
    sar sar ecx, 8
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L4
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L5
    mov mov eax, dword ptr [esi]
    mov mov edi, 24
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    jmp L6
    mov mov edi, 24
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], bl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045330
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_1004533B
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], edi
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov cl, byte ptr [esp + 24]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045392
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_1004539D
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov edi, 1
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov ebx, dword ptr [esp + 16]
    mov mov dl, byte ptr [edi + ebx]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045408
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045413
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 24
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    inc inc edi
    cmp cmp edi, 16
    jle sub_100453F2
    xor xor edi, edi
    test test ebp, ebp
    jle sub_10045476
    mov mov eax, dword ptr [esi + 32]
    mov mov cl, byte ptr [ebx + edi + 17]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_1004548A
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045495
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 24
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    inc inc edi
    cmp cmp edi, ebp
    jl sub_10045476
    pop pop ebp
    mov mov byte ptr [ebx + 0111h], 1
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_10045150 ENDP
END
