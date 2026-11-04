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
EXTRN sub_1001C637:PROC
EXTRN sub_100F7A7C:PROC
EXTRN g_101CE708:DWORD
.CODE
FUN_1001c4e0 PROC
    sub esp, 72
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 84]
    mov edx, dword ptr [ebp + 4]
    push esi
    mov esi, dword ptr [ebp]
    push edi
    mov edi, dword ptr [ebp + 60]
    add esi, ebp
    add edx, ebp
    add edi, ebp
    cmp word ptr [ebp + 52], 0
    mov dword ptr [ebp], esi
    mov dword ptr [ebp + 4], edx
    mov dword ptr [ebp + 60], edi
    mov dword ptr [esp + 16], 0
    jbe L9
    add edi, 8
    lea esp, [esp]
L0:
    mov eax, dword ptr [edi - 8]
    add eax, ebp
    call sub_1001648A
    mov dword ptr [edi - 8], eax
    mov al, byte ptr [edi - 3]
    cmp al, 5
    jne L1
    mov eax, dword ptr [edi]
    add eax, ebp
    mov esi, eax
    mov dword ptr [edi], eax
    movzx eax, word ptr [esi]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [esi + 16]
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 36], eax
    mov eax, dword ptr [esi + 4]
    mov dword ptr [esp + 40], eax
    mov eax, dword ptr [esi + 20]
    mov dword ptr [esp + 56], eax
    mov dword ptr [esp + 44], ecx
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [esp + 52], edx
    mov edx, dword ptr [esi + 12]
    lea eax, [esp + 20]
    push eax
    mov dword ptr [esp + 52], 044480000h
    mov dword ptr [esp + 64], ecx
    mov dword ptr [esp + 68], edx
    mov dword ptr [esp + 88], 0
    call sub_1000DE1B
    add esp, 4
    mov dword ptr [esi + 28], eax
    test eax, eax
    jmp L7
L1:
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], 2
    mov byte ptr [esp + 92], al
    jne L3
    cmp al, 3
    je L2
    cmp al, 4
    jne L3
L2:
    mov dword ptr [edi], 0
    mov al, 1
    jmp L8
L3:
    mov esi, dword ptr [edi]
    add esi, ebp
    mov ebx, esi
    call sub_1000D222
    mov ebx, eax
    test ebx, ebx
    jne L6
    cmp byte ptr [esi], 36
    mov edx, dword ptr [esp + 96]
    jne L15
    mov bl, byte ptr [esp + 92]
    mov eax, esi
    call sub_100109A0
    mov ebx, eax
L4:
    test ebx, ebx
    jne L6
L5:
    push esi
    push 010193544h
    push 1
    call sub_100139D3
    add esp, 12
L6:
    mov dword ptr [edi], ebx
    test ebx, ebx
L7:
    setne al
L8:
    test al, al
    je L21
    mov eax, dword ptr [esp + 16]
    movzx ecx, word ptr [ebp + 52]
    inc eax
    add edi, 12
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jl L0
L9:
    mov esi, dword ptr [ebp + 64]
    add esi, ebp
    xor edi, edi
    cmp word ptr [ebp + 54], di
    mov dword ptr [ebp + 64], esi
    jbe L11
    lea ecx, [ecx]
L10:
    mov eax, dword ptr [esi]
    add eax, ebp
    call sub_10016599
    test eax, eax
    mov dword ptr [esi], eax
    je L21
    movzx edx, word ptr [ebp + 54]
    inc edi
    add esi, 20
    cmp edi, edx
    jl L10
L11:
    mov edi, dword ptr [ebp + 56]
    mov cl, byte ptr [edi + ebp]
    add edi, ebp
    xor esi, esi
    test cl, cl
    mov eax, 119
    je L13
L12:
    movsx ecx, cl
    imul ecx, eax
    add esi, ecx
    mov cl, byte ptr [edi + eax - 118]
    inc eax
    test cl, cl
    jne L12
L13:
    and esi, 0000003FFh
    mov eax, dword ptr [esi*4 + 0101D82D0h]
    test eax, eax
    je L17
L14:
    mov edx, dword ptr [eax]
    push edi
    push edx
    call sub_100F7A7C
    add esp, 8
    test eax, eax
    je L16
    inc esi
    and esi, 0000003FFh
    mov eax, dword ptr [esi*4 + 0101D82D0h]
    test eax, eax
    jne L14
    jmp L17
L15:
    mov eax, dword ptr [esp + 92]
    push edx
    push eax
    push 3
    push esi
    call sub_1000CDE6
    add esp, 16
    mov ebx, eax
    call sub_1000FC20
    test al, al
    jne L4
    xor ebx, ebx
    jmp L5
L16:
    mov esi, dword ptr [esi*4 + 0101D82D0h]
    test esi, esi
    jne L18
L17:
    mov eax, edi
    call sub_1001C211
    mov esi, eax
    test esi, esi
    je L18
    lea ebx, [esp + 92]
    call sub_10016BF0
    mov eax, dword ptr [esp + 92]
    mov dword ptr [eax*4 + 0101D82D0h], esi
L18:
    test esi, esi
    mov dword ptr [ebp + 56], esi
    je L21
    xor ebx, ebx
    lea edi, [esi + 4]
L19:
    mov eax, dword ptr [edi]
    test eax, eax
    je L20
    mov ecx, dword ptr [esi]
    push ecx
    mov ecx, ebp
    call sub_1001C637
    add esp, 4
    test al, al
    je L21
L20:
    inc ebx
    add edi, 4
    cmp ebx, 34
    jl L19
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 72
    ret
L21:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 72
    ret
FUN_1001c4e0 ENDP
END
