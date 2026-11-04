.686
.MODEL FLAT, C
.CODE
FUN_10042bf0 PROC
    mov eax, dword ptr [esi + 4]
    push ebx
    push edi
    push 12
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    mov dword ptr [esi + 000000158h], edi
    mov dword ptr [edi], 010042BE0h
    mov eax, dword ptr [esi + 48]
    add esp, 12
    dec eax
    mov ebx, 4
    cmp eax, ebx
    ja L0
    jmp dword ptr [eax*4 + 0x10042de8]
    cmp dword ptr [esi + 44], 1
    je L3
    jmp L1
    cmp dword ptr [esi + 44], 3
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 9
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    jmp L2
    cmp dword ptr [esi + 44], ebx
    je L3
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 9
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    jmp L2
L0:
    cmp dword ptr [esi + 44], 1
    jge L3
L1:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 9
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
L2:
    add esp, 4
L3:
    mov eax, dword ptr [esi + 72]
    lea ecx, [eax - 1]
    cmp ecx, ebx
    ja L14
    jmp dword ptr [ecx*4 + 0x10042dfc]
    cmp dword ptr [esi + 68], 1
    je L4
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L4:
    mov eax, dword ptr [esi + 48]
    cmp eax, 1
    je L6
    cmp eax, 2
    jne L5
    mov dword ptr [edi], 0100426D0h
    mov dword ptr [edi + 4], 0100428D0h
    pop edi
    pop ebx
    ret
L5:
    cmp eax, 3
    jne L11
L6:
    mov dword ptr [edi + 4], 010042AE0h
    pop edi
    pop ebx
    ret
    cmp dword ptr [esi + 68], 3
    je L7
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 10
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L7:
    cmp dword ptr [esi + 48], 2
    je L16
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 27
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    pop edi
    pop ebx
    ret
    cmp dword ptr [esi + 68], 3
    je L8
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 10
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L8:
    mov eax, dword ptr [esi + 48]
    cmp eax, 2
    jne L9
    mov dword ptr [edi], 0100426D0h
    mov dword ptr [edi + 4], 0100427B0h
    pop edi
    pop ebx
    ret
L9:
    cmp eax, 3
    je L16
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 27
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    pop edi
    pop ebx
    ret
    cmp dword ptr [esi + 68], ebx
    je L10
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L10:
    cmp dword ptr [esi + 48], ebx
    je L16
L11:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 27
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    pop edi
    pop ebx
    ret
    cmp dword ptr [esi + 68], ebx
    je L12
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 10
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L12:
    mov eax, dword ptr [esi + 48]
    cmp eax, ebx
    jne L13
    mov dword ptr [edi], 0100426D0h
    mov dword ptr [edi + 4], 010042980h
    pop edi
    pop ebx
    ret
L13:
    cmp eax, 5
    je L16
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 27
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    pop edi
    pop ebx
    ret
L14:
    cmp eax, dword ptr [esi + 48]
    jne L15
    mov edx, dword ptr [esi + 68]
    cmp edx, dword ptr [esi + 44]
    je L16
L15:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 27
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L16:
    mov dword ptr [edi + 4], 010042B50h
    pop edi
    pop ebx
    ret
FUN_10042bf0 ENDP
END
