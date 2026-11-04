.686
.MODEL FLAT, C
.CODE
FUN_1004a310 PROC
    mov eax, dword ptr [esi + 20]
    cmp eax, 0000000CDh
    je L0
    cmp eax, 0000000CEh
    jne L2
L0:
    mov cl, byte ptr [esi + 72]
    test cl, cl
    jne L2
    mov eax, dword ptr [esi + 000000080h]
    cmp eax, dword ptr [esi + 104]
    jae L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 67
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L1:
    mov eax, dword ptr [esi + 000000188h]
    push esi
    call dword ptr [eax + 4]
    mov dword ptr [esi + 20], 0000000D2h
    jmp L4
L2:
    cmp eax, 0000000CFh
    jne L3
    mov dword ptr [esi + 20], 0000000D2h
    jmp L5
L3:
    cmp eax, 0000000D2h
    je L5
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 20
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
L4:
    add esp, 4
L5:
    mov edx, dword ptr [esi + 000000198h]
    mov al, byte ptr [edx + 17]
    test al, al
    jne L7
L6:
    mov eax, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [eax]
    add esp, 4
    test eax, eax
    je L8
    mov ecx, dword ptr [esi + 000000198h]
    mov al, byte ptr [ecx + 17]
    test al, al
    je L6
L7:
    mov edx, dword ptr [esi + 32]
    push esi
    call dword ptr [edx + 0x18]
    mov eax, dword ptr [esi + 4]
    add esp, 4
    test eax, eax
    je L10
    push 1
    push esi
    call dword ptr [eax + 0x24]
    mov al, byte ptr [esi + 16]
    add esp, 8
    test al, al
    je L9
    mov dword ptr [esi + 20], 0000000C8h
    mov dword ptr [esi + 000000114h], 0
    mov al, 1
    ret
L8:
    xor al, al
    ret
L9:
    mov dword ptr [esi + 20], 100
L10:
    mov al, 1
    ret
FUN_1004a310 ENDP
END
