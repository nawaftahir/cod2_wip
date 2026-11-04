.686
.MODEL FLAT, C
EXTRN sub_1000CDE6:PROC
EXTRN sub_1000D222:PROC
EXTRN sub_1000DE1B:PROC
EXTRN sub_1000FC20:PROC
EXTRN sub_100109A0:PROC
EXTRN sub_100139D3:PROC
EXTRN sub_1001648A:PROC
EXTRN sub_10016599:PROC
EXTRN sub_10016BF0:PROC
EXTRN sub_1001C211:PROC
EXTRN sub_1001C79C:PROC
EXTRN sub_1001C79D:PROC
EXTRN sub_1001C79F:PROC
EXTRN sub_1001C7CA:PROC
EXTRN sub_1001C7D5:PROC
EXTRN sub_1001C7F5:PROC
EXTRN sub_1001C84A:PROC
EXTRN sub_1001C856:PROC
EXTRN sub_1001C87E:PROC
EXTRN sub_1001C883:PROC
EXTRN sub_1001C894:PROC
EXTRN sub_1001C8A2:PROC
EXTRN sub_1001C8F5:PROC
EXTRN sub_1001C902:PROC
EXTRN sub_1001C94B:PROC
EXTRN sub_1001C94E:PROC
EXTRN sub_1001C953:PROC
EXTRN sub_1001C96F:PROC
EXTRN sub_100F7A7C:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1001c4e0 PROC
    sub sub esp, 72
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 84]
    mov mov edx, dword ptr [ebp + 4]
    push push esi
    mov mov esi, dword ptr [ebp]
    push push edi
    mov mov edi, dword ptr [ebp + 60]
    add add esi, ebp
    add add edx, ebp
    add add edi, ebp
    cmp cmp word ptr [ebp + 52], 0
    mov mov dword ptr [ebp], esi
    mov mov dword ptr [ebp + 4], edx
    mov mov dword ptr [ebp + 60], edi
    mov mov dword ptr [esp + 16], 0
    jbe L2
    add add edi, 8
    lea lea esp, [esp]
    mov mov eax, dword ptr [edi - 8]
    add add eax, ebp
    call sub_1001648A
    mov mov dword ptr [edi - 8], eax
    mov mov al, byte ptr [edi - 3]
    cmp cmp al, 5
    jne L0
    mov mov eax, dword ptr [edi]
    add add eax, ebp
    mov mov esi, eax
    mov mov dword ptr [edi], eax
    movzx movzx eax, word ptr [esi]
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 36], eax
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [esp + 40], eax
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [esp + 56], eax
    mov mov dword ptr [esp + 44], ecx
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [esp + 52], edx
    mov mov edx, dword ptr [esi + 12]
    lea lea eax, [esp + 20]
    push push eax
    mov mov dword ptr [esp + 52], 044480000h
    mov mov dword ptr [esp + 64], ecx
    mov mov dword ptr [esp + 68], edx
    mov mov dword ptr [esp + 88], 0
    call sub_1000DE1B
    add add esp, 4
    mov mov dword ptr [esi + 28], eax
    test test eax, eax
    jmp L7
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], 2
    mov mov byte ptr [esp + 92], al
    jne L5
    cmp cmp al, 3
    je L4
    cmp cmp al, 4
    jne L6
    mov mov dword ptr [edi], 0
    mov mov al, 1
    jmp L8
    mov mov esi, dword ptr [edi]
    add add esi, ebp
    mov mov ebx, esi
    call sub_1000D222
    mov mov ebx, eax
    test test ebx, ebx
    jne L9
    cmp cmp byte ptr [esi], 36
    mov mov edx, dword ptr [esp + 96]
    jne sub_1001C79D
    mov mov bl, byte ptr [esp + 92]
    mov mov eax, esi
    call sub_100109A0
    mov mov ebx, eax
    test test ebx, ebx
    jne L10
    push push esi
    push push 010193544h
    push push 1
    call sub_100139D3
    add add esp, 12
    mov mov dword ptr [edi], ebx
    test test ebx, ebx
    setne setne al
    test test al, al
    je sub_1001C856
    mov mov eax, dword ptr [esp + 16]
    movzx movzx ecx, word ptr [ebp + 52]
    inc inc eax
    add add edi, 12
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    jl L3
    mov mov esi, dword ptr [ebp + 64]
    add add esi, ebp
    xor xor edi, edi
    cmp cmp word ptr [ebp + 54], di
    mov mov dword ptr [ebp + 64], esi
    jbe sub_1001C79C
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esi]
    add add eax, ebp
    call sub_10016599
    test test eax, eax
    mov mov dword ptr [esi], eax
    je sub_1001C894
    movzx movzx edx, word ptr [ebp + 54]
    inc inc edi
    add add esi, 20
    cmp cmp edi, edx
    jl sub_1001C79F
    mov mov edi, dword ptr [ebp + 56]
    mov mov cl, byte ptr [edi + ebp]
    add add edi, ebp
    xor xor esi, esi
    test test cl, cl
    mov mov eax, 119
    je sub_1001C7F5
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add esi, ecx
    mov mov cl, byte ptr [edi + eax - 118]
    inc inc eax
    test test cl, cl
    jne sub_1001C7F5
    and and esi, 03FFh
    mov mov eax, dword ptr [esi*4 + 0101D82D0h]
    test test eax, eax
    je sub_1001C87E
L6:
    mov mov edx, dword ptr [eax]
    push push edi
    push push edx
    call sub_100F7A7C
    add add esp, 8
    test test eax, eax
    je sub_1001C883
    inc inc esi
    and and esi, 03FFh
    mov mov eax, dword ptr [esi*4 + 0101D82D0h]
    test test eax, eax
    jne sub_1001C84A
    jmp sub_1001C8A2
    mov mov eax, dword ptr [esp + 92]
    push push edx
    push push eax
    push push 3
    push push esi
    call sub_1000CDE6
    add add esp, 16
    mov mov ebx, eax
    call sub_1000FC20
    test test al, al
    jne sub_1001C7CA
    xor xor ebx, ebx
    jmp sub_1001C7D5
    mov mov esi, dword ptr [esi*4 + 0101D82D0h]
    test test esi, esi
    jne sub_1001C8F5
    mov mov eax, edi
    call sub_1001C211
    mov mov esi, eax
    test test esi, esi
    je sub_1001C902
    lea lea ebx, [esp + 92]
    call sub_10016BF0
    mov mov eax, dword ptr [esp + 92]
    mov mov dword ptr [eax*4 + 0101D82D0h], esi
    test test esi, esi
    mov mov dword ptr [ebp + 56], esi
    je sub_1001C953
    xor xor ebx, ebx
    lea lea edi, [esi + 4]
    mov mov eax, dword ptr [edi]
    test test eax, eax
    je sub_1001C94B
    mov mov ecx, dword ptr [esi]
    push push ecx
    mov mov ecx, ebp
    call L1
    add add esp, 4
    test test al, al
    je sub_1001C96F
    inc inc ebx
    add add edi, 4
    cmp cmp ebx, 34
    jl sub_1001C94E
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 72
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 72
    ret ret
FUN_1001c4e0 ENDP
END
