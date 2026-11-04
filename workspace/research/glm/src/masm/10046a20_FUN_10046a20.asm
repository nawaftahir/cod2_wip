.686
.MODEL FLAT, C
.CODE
FUN_10046a20 PROC
    cmp dword ptr [edi + 20], 100
    je L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L0:
    test ebx, ebx
    jl L1
    cmp ebx, 4
    jl L2
L1:
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 31
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], ebx
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L2:
    mov eax, dword ptr [edi + ebx*4 + 80]
    test eax, eax
    jne L3
    mov ecx, dword ptr [edi + 4]
    push 000000082h
    push 0
    push edi
    call dword ptr [ecx]
    mov byte ptr [eax + 000000080h], 0
    add esp, 12
    mov dword ptr [edi + ebx*4 + 80], eax
L3:
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    xor esi, esi
    add ebp, 8
    lea esp, [esp]
L4:
    mov ecx, dword ptr [ebp - 8]
    imul ecx, dword ptr [esp + 16]
    add ecx, 50
    mov eax, 051EB851Fh
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
    test eax, eax
    jg L5
    mov eax, 1
    jmp L6
L5:
    cmp eax, 000007FFFh
    jle L6
    mov eax, 000007FFFh
L6:
    mov cl, byte ptr [esp + 20]
    test cl, cl
    je L7
    cmp eax, 0000000FFh
    jle L7
    mov eax, 0000000FFh
L7:
    mov edx, dword ptr [edi + ebx*4 + 80]
    mov word ptr [esi + edx], ax
    mov ecx, dword ptr [ebp - 4]
    imul ecx, dword ptr [esp + 16]
    add ecx, 50
    mov eax, 051EB851Fh
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
    test eax, eax
    jg L8
    mov eax, 1
    jmp L9
L8:
    cmp eax, 000007FFFh
    jle L9
    mov eax, 000007FFFh
L9:
    mov cl, byte ptr [esp + 20]
    test cl, cl
    je L10
    cmp eax, 0000000FFh
    jle L10
    mov eax, 0000000FFh
L10:
    mov ecx, dword ptr [edi + ebx*4 + 80]
    mov word ptr [ecx + esi + 2], ax
    mov ecx, dword ptr [ebp]
    imul ecx, dword ptr [esp + 16]
    add ecx, 50
    mov eax, 051EB851Fh
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
    test eax, eax
    jg L11
    mov eax, 1
    jmp L12
L11:
    cmp eax, 000007FFFh
    jle L12
    mov eax, 000007FFFh
L12:
    mov cl, byte ptr [esp + 20]
    test cl, cl
    je L13
    cmp eax, 0000000FFh
    jle L13
    mov eax, 0000000FFh
L13:
    mov edx, dword ptr [edi + ebx*4 + 80]
    mov word ptr [edx + esi + 4], ax
    mov ecx, dword ptr [ebp + 4]
    imul ecx, dword ptr [esp + 16]
    add ecx, 50
    mov eax, 051EB851Fh
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
    test eax, eax
    jg L14
    mov eax, 1
    jmp L15
L14:
    cmp eax, 000007FFFh
    jle L15
    mov eax, 000007FFFh
L15:
    mov cl, byte ptr [esp + 20]
    test cl, cl
    je L16
    cmp eax, 0000000FFh
    jle L16
    mov eax, 0000000FFh
L16:
    mov ecx, dword ptr [edi + ebx*4 + 80]
    mov word ptr [esi + ecx + 6], ax
    add esi, 8
    add ebp, 16
    cmp esi, 000000080h
    jl L4
    mov edx, dword ptr [edi + ebx*4 + 80]
    pop esi
    mov byte ptr [edx + 000000080h], 0
    pop ebp
    ret
FUN_10046a20 ENDP
END
