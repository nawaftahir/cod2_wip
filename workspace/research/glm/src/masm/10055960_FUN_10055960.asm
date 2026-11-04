.686
.MODEL FLAT, C
.CODE
FUN_10055960 PROC
    sub esp, 12
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 32]
    mov esi, dword ptr [edi + 108]
    mov edx, dword ptr [edi + 92]
    mov dword ptr [esp + 20], esi
    mov dword ptr [esp + 24], edx
    mov ebp, 1
    mov edi, edi
L0:
    inc ebp
    cmp esi, 1
    mov eax, ebp
    jle L2
    lea ecx, [esi - 1]
    jmp L1
    lea ecx, [ecx]
L1:
    imul eax, ebp
    dec ecx
    jne L1
L2:
    cmp eax, edx
    jle L0
    dec ebp
    cmp ebp, 2
    jge L3
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 56
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L3:
    test esi, esi
    mov ebx, 1
    jle L6
    mov edi, dword ptr [esp + 36]
    mov ecx, esi
    mov eax, ebp
    mov edx, esi
    rep stosd dword ptr es:[edi], eax
    jmp L4
    lea ecx, [ecx]
L4:
    imul ebx, ebp
    dec edx
    jne L4
    jmp L6
L5:
    mov esi, dword ptr [esp + 20]
    lea esp, [esp]
L6:
    xor ebp, ebp
    test esi, esi
    mov byte ptr [esp + 19], 0
    jle L11
    jmp L7
    lea ecx, [ecx]
L7:
    mov ecx, dword ptr [esp + 32]
    cmp dword ptr [ecx + 52], 2
    jne L8
    mov edi, dword ptr [ebp*4 + 0101911F0h]
    jmp L9
L8:
    mov edi, ebp
L9:
    mov edx, dword ptr [esp + 36]
    mov esi, dword ptr [edx + edi*4]
    mov eax, ebx
    cdq
    idiv esi
    mov edx, dword ptr [esp + 24]
    lea ecx, [esi + 1]
    imul eax, ecx
    cmp eax, edx
    jg L10
    mov edx, dword ptr [esp + 36]
    mov ebx, eax
    mov eax, dword ptr [esp + 20]
    inc ebp
    cmp ebp, eax
    mov dword ptr [edx + edi*4], ecx
    mov byte ptr [esp + 19], 1
    jl L7
    jmp L5
L10:
    mov al, byte ptr [esp + 19]
    test al, al
    jne L5
L11:
    pop edi
FUN_10055960 ENDP
END
