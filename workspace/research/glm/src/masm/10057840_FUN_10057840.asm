.686
.MODEL FLAT, C
EXTRN sub_10057756:PROC
.CODE
FUN_10057840 PROC
    mov eax, dword ptr [esi + 4]
    push edi
    push 44
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    mov dword ptr [esi + 0000001B0h], edi
    mov dword ptr [edi], 010057710h
    mov dword ptr [edi + 12], 010057830h
    mov dword ptr [edi + 32], 0
    mov dword ptr [edi + 40], 0
    mov eax, dword ptr [esi + 108]
    add esp, 12
    cmp eax, 3
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 47
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    mov eax, dword ptr [esi + 4]
    push ebp
    push 000000080h
    push 1
    push esi
    call dword ptr [eax]
    add esp, 12
    mov dword ptr [edi + 24], eax
    xor ebp, ebp
L1:
    mov ecx, dword ptr [esi + 4]
    push 000001000h
    push 1
    push esi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [edi + 24]
    mov dword ptr [edx + ebp], eax
    add ebp, 4
    add esp, 12
    cmp ebp, 000000080h
    jl L1
    mov byte ptr [edi + 28], 1
    mov al, byte ptr [esi + 98]
    test al, al
    je L4
    mov ebp, dword ptr [esi + 92]
    cmp ebp, 8
    jge L2
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 56
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], 8
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L2:
    cmp ebp, 000000100h
    jle L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 57
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], 000000100h
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L3:
    mov eax, dword ptr [esi + 4]
    push 3
    push ebp
    push 1
    push esi
    call dword ptr [eax + 8]
    add esp, 16
    mov dword ptr [edi + 16], eax
    mov dword ptr [edi + 20], ebp
    jmp L5
L4:
    mov dword ptr [edi + 16], 0
L5:
    mov eax, dword ptr [esi + 84]
    test eax, eax
    mov ecx, 2
    pop ebp
    je L6
    mov dword ptr [esi + 84], ecx
L6:
    cmp dword ptr [esi + 84], ecx
    jne L7
    mov eax, dword ptr [esi + 100]
    mov edx, dword ptr [esi + 4]
    add eax, ecx
    lea eax, [eax + eax*2]
    shl eax, 1
    push eax
    push 1
    push esi
    call dword ptr [edx + 4]
    add esp, 12
    mov dword ptr [edi + 32], eax
    mov eax, esi
    pop edi
    jmp sub_10057756
L7:
    pop edi
    ret
FUN_10057840 ENDP
END
