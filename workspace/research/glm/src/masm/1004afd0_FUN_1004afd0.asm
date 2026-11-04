.686
.MODEL FLAT, C
.CODE
FUN_1004afd0 PROC
    sub esp, 32
    push ebp
    push edi
    mov edi, dword ptr [esp + 44]
    mov eax, dword ptr [edi + 000000124h]
    mov ebp, dword ptr [edi + 000000190h]
    dec eax
    mov dword ptr [esp + 28], eax
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [edi + 000000084h]
    mov ecx, dword ptr [edi + 00000008Ch]
    cmp eax, ecx
    jl L1
    jne L2
    mov eax, dword ptr [edi + 000000088h]
    cmp eax, dword ptr [edi + 000000090h]
    ja L2
L1:
    mov ecx, dword ptr [edi + 000000198h]
    push edi
    call dword ptr [ecx]
    add esp, 4
    test eax, eax
    jne L0
    pop edi
    pop ebp
    add esp, 32
    ret
L2:
    mov eax, dword ptr [edi + 44]
    push ebx
    xor ebx, ebx
    test eax, eax
    push esi
    mov esi, dword ptr [edi + 0000000CCh]
    mov dword ptr [esp + 28], ebx
    jle L10
    add ebp, 72
    mov dword ptr [esp + 32], ebp
    jmp L3
    lea esp, [esp]
    nop
L3:
    mov al, byte ptr [esi + 48]
    test al, al
    je L9
    mov eax, dword ptr [esi + 12]
    mov ecx, dword ptr [edi + 000000090h]
    mov edx, dword ptr [edi + 4]
    imul ecx, eax
    push 0
    push eax
    mov eax, dword ptr [ebp]
    push ecx
    push eax
    push edi
    call dword ptr [edx + 0x20]
    mov ecx, dword ptr [esp + 56]
    mov dword ptr [esp + 60], eax
    mov eax, dword ptr [edi + 000000090h]
    add esp, 20
    cmp eax, ecx
    jae L4
    mov edx, dword ptr [esi + 12]
    mov dword ptr [esp + 16], edx
    jmp L5
L4:
    mov ecx, dword ptr [esi + 12]
    mov eax, dword ptr [esi + 32]
    xor edx, edx
    div ecx
    test edx, edx
    mov dword ptr [esp + 16], edx
    jne L5
    mov dword ptr [esp + 16], ecx
L5:
    mov eax, dword ptr [edi + 0000001A4h]
    mov ecx, dword ptr [eax + ebx*4 + 4]
    mov edx, dword ptr [esp + 56]
    mov eax, dword ptr [edx + ebx*4]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [esp + 16]
    mov dword ptr [esp + 44], ecx
    xor ecx, ecx
    test eax, eax
    mov dword ptr [esp + 24], ecx
    jle L9
    mov eax, dword ptr [esi + 28]
L6:
    mov edx, dword ptr [esp + 40]
    mov ebx, dword ptr [edx + ecx*4]
    xor edi, edi
    xor ebp, ebp
    test eax, eax
    jbe L8
L7:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 52]
    push edi
    push eax
    push ebx
    push esi
    push ecx
    call dword ptr [esp + 0x40]
    add edi, dword ptr [esi + 36]
    mov eax, dword ptr [esi + 28]
    add esp, 20
    add ebx, 000000080h
    inc ebp
    cmp ebp, eax
    jb L7
    mov ecx, dword ptr [esp + 24]
L8:
    mov edi, dword ptr [esp + 20]
    mov edx, dword ptr [esi + 36]
    lea edx, [edi + edx*4]
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [esp + 16]
    inc ecx
    cmp ecx, edx
    mov dword ptr [esp + 24], ecx
    jl L6
    mov edi, dword ptr [esp + 52]
    mov ebx, dword ptr [esp + 28]
L9:
    mov ebp, dword ptr [esp + 32]
    mov eax, dword ptr [edi + 44]
    inc ebx
    add ebp, 4
    add esi, 84
    cmp ebx, eax
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 32], ebp
    jl L3
L10:
    mov esi, dword ptr [edi + 000000090h]
    mov edx, dword ptr [edi + 000000124h]
    inc esi
    mov eax, esi
    mov dword ptr [edi + 000000090h], esi
    pop esi
    cmp eax, edx
    pop ebx
    sbb eax, eax
    pop edi
FUN_1004afd0 ENDP
END
