.686
.MODEL FLAT, C
EXTRN sub_100423A0:PROC
EXTRN sub_100423A2:PROC
EXTRN sub_100423C2:PROC
EXTRN sub_100423D3:PROC
EXTRN sub_10042465:PROC
EXTRN sub_100424B1:PROC
EXTRN sub_100424D0:PROC
EXTRN sub_100424D3:PROC
EXTRN sub_100424F3:PROC
EXTRN sub_100424FA:PROC
EXTRN sub_100424FB:PROC
EXTRN sub_10042500:PROC
EXTRN sub_100425E3:PROC
.CODE
FUN_10042150 PROC
    sub sub esp, 48
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 64]
    mov mov ebp, dword ptr [esi + 0E8h]
    mov mov eax, dword ptr [esi + 68]
    mov mov ebx, dword ptr [esi + 0150h]
    push push edi
    mov mov edi, dword ptr [esi + 76]
    dec dec ebp
    test test eax, eax
    mov mov dword ptr [esp + 48], ebx
    mov mov dword ptr [esp + 44], ebp
    mov mov dword ptr [esp + 52], 0
    mov mov dword ptr [esp + 24], edi
    jle sub_100423C2
    mov mov eax, dword ptr [esp + 72]
    lea lea ecx, [ebx + 64]
    mov mov dword ptr [esp + 40], eax
    mov mov dword ptr [esp + 36], ecx
    jmp L0
    mov mov ebx, dword ptr [esp + 48]
    mov mov ebp, dword ptr [esp + 44]
    mov mov eax, dword ptr [edi + 12]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [esi + 4]
    imul imul ecx, eax
    push push 1
    push push eax
    mov mov eax, dword ptr [esp + 44]
    push push ecx
    mov mov ecx, dword ptr [eax]
    push push ecx
    push push esi
    call call dword ptr [edx + 32]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebx + 8]
    add add esp, 20
    cmp cmp eax, ebp
    mov mov dword ptr [esp + 28], ecx
    jae L1
    mov mov edx, dword ptr [edi + 12]
    mov mov dword ptr [esp + 20], edx
    jmp L2
    mov mov ebx, dword ptr [edi + 12]
    mov mov eax, dword ptr [edi + 32]
    xor xor edx, edx
    div div ebx
    test test edx, edx
    mov mov dword ptr [esp + 20], edx
    jne L3
    mov mov dword ptr [esp + 20], ebx
    mov mov ebp, dword ptr [edi + 28]
    mov mov ebx, dword ptr [edi + 8]
    xor xor edx, edx
    mov mov eax, ebp
    div div ebx
    mov mov dword ptr [esp + 32], ebx
    mov mov ebx, edx
    test test ebx, ebx
    jle L4
    mov mov eax, dword ptr [esp + 32]
    sub sub eax, ebx
    mov mov ebx, eax
    mov mov edx, dword ptr [esp + 20]
    xor xor eax, eax
    test test edx, edx
    mov mov dword ptr [esp + 16], eax
    jle L7
    jmp L5
    mov mov eax, dword ptr [esp + 16]
    mov mov esi, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esp + 68]
    mov mov edx, dword ptr [ecx + 0160h]
    push push ebp
    push push 0
    shl shl eax, 3
    push push eax
    mov mov eax, dword ptr [esp + 52]
    mov mov eax, dword ptr [eax]
    push push esi
    push push eax
    push push edi
    push push ecx
    call call dword ptr [edx + 4]
    add add esp, 28
    test test ebx, ebx
    jle L8
    mov mov ecx, ebp
    shl shl ecx, 7
    add add esi, ecx
    mov mov ecx, ebx
    shl shl ecx, 7
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    test test ebx, ebx
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov cx, word ptr [esi - 080h]
    jle sub_100423A0
    mov mov eax, ebx
    mov mov word ptr [esi], cx
    add add esi, 080h
    dec dec eax
    jne sub_100423A2
    mov mov edi, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 20]
    inc inc eax
    cmp cmp eax, ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [esp + 16], eax
    jl L6
    mov mov esi, dword ptr [esp + 68]
    mov mov eax, dword ptr [esp + 44]
    mov mov edx, dword ptr [esp + 48]
    cmp cmp dword ptr [edx + 8], eax
    jne sub_100424B1
    add add ebp, ebx
    xor xor edx, edx
    mov mov eax, ebp
    div div dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 60], eax
    cmp cmp edx, dword ptr [edi + 12]
    jge sub_100424D0
    shl shl ebp, 7
    mov mov dword ptr [esp + 56], ebp
    jmp sub_10042465
    mov mov ecx, dword ptr [esp + 28]
    lea lea esp, [esp]
    mov mov ebp, dword ptr [ecx + edx*4]
    mov mov ebx, dword ptr [ecx + edx*4 - 4]
    mov mov ecx, dword ptr [esp + 56]
    mov mov esi, ecx
    shr shr ecx, 2
    xor xor eax, eax
L5:
    mov mov edi, ebp
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, esi
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [esp + 60]
    test test eax, eax
    jbe sub_100424F3
    mov mov edi, dword ptr [esp + 32]
    mov mov ecx, edi
    shl shl ecx, 7
    mov mov dword ptr [esp + 20], eax
    test test edi, edi
    mov mov si, word ptr [ecx + ebx - 080h]
    jle sub_100424FA
    mov mov eax, ebp
    mov mov edx, edi
    nop nop
    mov mov word ptr [eax], si
    add add eax, 080h
    dec dec edx
    jne sub_100424FB
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    add add ebp, ecx
    add add ebx, ecx
    dec dec eax
    mov mov dword ptr [esp + 20], eax
    jne sub_10042500
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [eax + 12]
    inc inc edx
    cmp cmp edx, ecx
    mov mov dword ptr [esp + 16], edx
    jl sub_100424D3
    mov mov esi, dword ptr [esp + 68]
    mov mov edi, eax
    mov mov ebp, dword ptr [esp + 36]
    mov mov ebx, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, 4
    add add ebp, ecx
L6:
    add add ebx, ecx
L7:
    mov mov ecx, dword ptr [esi + 68]
    inc inc eax
    add add edi, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 52], eax
    mov mov dword ptr [esp + 36], ebp
    mov mov dword ptr [esp + 40], ebx
L8:
    mov mov dword ptr [esp + 24], edi
    jl sub_100423D3
    mov mov ecx, dword ptr [esp + 72]
    push push ecx
    push push esi
    call sub_100425E3
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 48
    ret ret
FUN_10042150 ENDP
END
