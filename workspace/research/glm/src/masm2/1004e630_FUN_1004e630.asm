.686
.MODEL FLAT, C
EXTRN sub_1004E89F:PROC
EXTRN sub_1004E8B6:PROC
EXTRN sub_1004E8BA:PROC
EXTRN sub_1004E8D6:PROC
EXTRN sub_1004E8D8:PROC
EXTRN sub_1004E8D9:PROC
EXTRN sub_1004E8DA:PROC
EXTRN sub_1004E90C:PROC
EXTRN sub_1004E90E:PROC
EXTRN sub_1004E9B8:PROC
EXTRN sub_1004E9DB:PROC
EXTRN sub_1004E9EC:PROC
EXTRN sub_1004E9F7:PROC
EXTRN sub_1004EA07:PROC
EXTRN sub_1004EA83:PROC
EXTRN sub_1004EAC5:PROC
.CODE
FUN_1004e630 PROC
    sub sub esp, 24
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [edi + 32]
    mov mov ebx, dword ptr [esi + 4]
    test test ebx, ebx
    mov mov ebp, dword ptr [esi]
    mov mov dword ptr [esp + 16], esi
    jne L0
    push push edi
    call call dword ptr [esi + 12]
    add add esp, 4
    test test al, al
    je sub_1004E8B6
    mov mov ebp, dword ptr [esi]
    mov mov ebx, dword ptr [esi + 4]
    xor xor eax, eax
    mov mov ah, byte ptr [ebp]
    dec dec ebx
    inc inc ebp
    test test ebx, ebx
    mov mov dword ptr [esp + 12], eax
    jne L1
    push push edi
    call call dword ptr [esi + 12]
    add add esp, 4
L0:
    test test al, al
    je sub_1004E8D9
    mov mov ebp, dword ptr [esi]
    mov mov ebx, dword ptr [esi + 4]
    mov mov eax, dword ptr [esp + 12]
    movzx movzx ecx, byte ptr [ebp]
    add add eax, ecx
    dec dec ebx
    sub sub eax, 2
    inc inc ebp
    test test eax, eax
    mov mov dword ptr [esp + 12], eax
    jle sub_1004E8D8
    test test ebx, ebx
    jne L2
    push push edi
    call call dword ptr [esi + 12]
    add add esp, 4
    test test al, al
    je sub_1004E90C
    mov mov ebp, dword ptr [esi]
    mov mov ebx, dword ptr [esi + 4]
    movzx movzx esi, byte ptr [ebp]
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 20], 81
    mov mov ecx, dword ptr [edi]
    mov mov eax, esi
    sar sar eax, 4
    and and esi, 15
    mov mov dword ptr [ecx + 24], esi
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [edx + 28], eax
    mov mov eax, dword ptr [edi]
    push push 1
    dec dec ebx
    push push edi
    inc inc ebp
    call call dword ptr [eax + 4]
    add add esp, 8
    cmp cmp esi, 4
    jl L3
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 31
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 24], esi
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [edi + esi*4 + 098h]
    test test eax, eax
    jne L4
    mov mov ecx, dword ptr [edi + 4]
    push push 082h
    push push 0
    push push edi
    call call dword ptr [ecx]
    mov mov byte ptr [eax + 080h], 0
    add add esp, 12
    mov mov dword ptr [edi + esi*4 + 098h], eax
    mov mov edx, dword ptr [edi + esi*4 + 098h]
    mov mov esi, 010191200h
    mov mov dword ptr [esp + 32], edx
    mov mov dword ptr [esp + 24], esi
    mov mov eax, dword ptr [esp + 28]
    test test eax, eax
    je sub_1004E89F
    test test ebx, ebx
    mov mov esi, dword ptr [esp + 16]
    jne L5
    push push edi
    call call dword ptr [esi + 12]
    add add esp, 4
    test test al, al
    je sub_1004E9B8
    mov mov ebp, dword ptr [esi]
    mov mov ebx, dword ptr [esi + 4]
    xor xor eax, eax
    mov mov ah, byte ptr [ebp]
    dec dec ebx
    inc inc ebp
    test test ebx, ebx
    mov mov dword ptr [esp + 20], eax
    jne sub_1004E8BA
    push push edi
    call call dword ptr [esi + 12]
    add add esp, 4
    test test al, al
    je sub_1004E9DB
    mov mov ebp, dword ptr [esi]
    mov mov ebx, dword ptr [esi + 4]
    movzx movzx ecx, byte ptr [ebp]
    mov mov edx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 24]
    add add edx, ecx
    jmp sub_1004E90E
    test test ebx, ebx
    jne sub_1004E90E
    mov mov ebx, dword ptr [esp + 16]
    push push edi
    call call dword ptr [ebx + 12]
    add add esp, 4
    test test al, al
    je sub_1004EA07
    mov mov ebp, dword ptr [ebx]
    mov mov ebx, dword ptr [ebx + 4]
    movzx movzx edx, byte ptr [ebp]
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [esp + 32]
    dec dec ebx
    add add esi, 4
    inc inc ebp
    cmp cmp esi, 010191300h
    mov mov dword ptr [esp + 20], edx
    mov mov word ptr [eax + ecx*2], dx
    mov mov dword ptr [esp + 24], esi
    jl sub_1004E8DA
    mov mov ecx, dword ptr [edi]
    cmp cmp dword ptr [ecx + 104], 2
    jl sub_1004E9EC
    lea lea esi, [eax + 4]
    mov mov dword ptr [esp + 24], 8
    mov mov eax, dword ptr [edi]
    movzx movzx edx, word ptr [esi - 4]
    add add eax, 24
    mov mov dword ptr [eax], edx
    movzx movzx ecx, word ptr [esi - 2]
    mov mov dword ptr [eax + 4], ecx
    movzx movzx edx, word ptr [esi]
L4:
    mov mov dword ptr [eax + 8], edx
    movzx movzx ecx, word ptr [esi + 2]
    mov mov dword ptr [eax + 12], ecx
    movzx movzx edx, word ptr [esi + 4]
    mov mov dword ptr [eax + 16], edx
    movzx movzx ecx, word ptr [esi + 6]
    mov mov dword ptr [eax + 20], ecx
    movzx movzx edx, word ptr [esi + 8]
    mov mov dword ptr [eax + 24], edx
    movzx movzx ecx, word ptr [esi + 10]
    mov mov dword ptr [eax + 28], ecx
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 20], 93
    mov mov eax, dword ptr [edi]
    push push 2
    push push edi
    call call dword ptr [eax + 4]
    mov mov eax, dword ptr [esp + 32]
    add add esp, 8
    add add esi, 16
    dec dec eax
    mov mov dword ptr [esp + 24], eax
    jne sub_1004E9F7
    mov mov ecx, dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 28]
    sub sub ecx, 65
    test test eax, eax
    mov mov dword ptr [esp + 12], ecx
    je sub_1004EA83
    mov mov eax, ecx
    sub sub eax, 64
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [esp + 12]
    test test eax, eax
    mov mov esi, dword ptr [esp + 16]
    jg sub_1004E8D6
    test test eax, eax
    je sub_1004EAC5
    mov mov ecx, dword ptr [edi]
L5:
    mov mov dword ptr [ecx + 20], 11
    mov mov edx, dword ptr [edi]
    push push edi
    call call dword ptr [edx]
    add add esp, 4
    mov mov dword ptr [esi], ebp
    mov mov dword ptr [esi + 4], ebx
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 24
    ret ret
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 24
    ret ret
FUN_1004e630 ENDP
END
