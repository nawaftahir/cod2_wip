.686
.MODEL FLAT, C
EXTRN sub_10044EA0:PROC
.CODE
FUN_10045150 PROC
    push ecx
    push esi
    test al, al
    mov eax, dword ptr [esp + 12]
    push edi
    mov esi, ecx
    je L0
    mov edi, dword ptr [esi + eax*4 + 112]
    add eax, 16
    mov dword ptr [esp + 8], edi
    mov dword ptr [esp + 16], eax
    jmp L1
L0:
    mov ecx, dword ptr [esi + eax*4 + 96]
    mov dword ptr [esp + 8], ecx
    mov edi, ecx
L1:
    test edi, edi
    jne L2
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [edx + 20], 50
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L2:
    mov al, byte ptr [edi + 000000111h]
    test al, al
    jne L13
    push ebx
    push ebp
    push 0000000C4h
    call sub_10044EA0
    add esp, 4
    xor ebp, ebp
    lea eax, [edi + 3]
    mov ecx, 4
    lea ecx, [ecx]
L3:
    movzx edi, byte ptr [eax - 1]
    movzx edx, byte ptr [eax - 2]
    add edx, edi
    movzx edi, byte ptr [eax + 1]
    add edx, edi
    movzx edi, byte ptr [eax]
    add edi, ebp
    add eax, 4
    dec ecx
    lea ebp, [edi + edx]
    jne L3
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    lea ebx, [ebp + 19]
    mov ecx, ebx
    sar ecx, 8
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L4
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L4
    mov eax, dword ptr [esi]
    mov edi, 24
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    jmp L5
L4:
    mov edi, 24
L5:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], bl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L6
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L6
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], edi
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L6:
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    mov cl, byte ptr [esp + 24]
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L7
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L7
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L7:
    mov edi, 1
L8:
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov ebx, dword ptr [esp + 16]
    mov dl, byte ptr [edi + ebx]
    mov byte ptr [ecx], dl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L9
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L9
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 24
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L9:
    inc edi
    cmp edi, 16
    jle L8
    xor edi, edi
    test ebp, ebp
    jle L12
L10:
    mov eax, dword ptr [esi + 32]
    mov cl, byte ptr [ebx + edi + 17]
    mov edx, dword ptr [eax]
    mov byte ptr [edx], cl
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [eax + 4]
    inc edx
    dec ecx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], ecx
    jne L11
    push esi
    call dword ptr [eax + 0xc]
    add esp, 4
    test al, al
    jne L11
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 24
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L11:
    inc edi
    cmp edi, ebp
    jl L10
L12:
    pop ebp
    mov byte ptr [ebx + 000000111h], 1
    pop ebx
L13:
    pop edi
    pop esi
    pop ecx
    ret
FUN_10045150 ENDP
END
