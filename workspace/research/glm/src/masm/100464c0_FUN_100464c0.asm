.686
.MODEL FLAT, C
.CODE
FUN_100464c0 PROC
    mov eax, dword ptr [esi + 0000000ECh]
    sub esp, 8
    push ebx
    mov ebx, 1
    cmp eax, ebx
    push edi
    jne L1
    mov ecx, dword ptr [esi + 0000000F0h]
    mov eax, dword ptr [ecx + 28]
    mov dword ptr [esi + 000000100h], eax
    mov edx, dword ptr [ecx + 32]
    mov dword ptr [esi + 000000104h], edx
    mov edi, dword ptr [ecx + 12]
    mov eax, dword ptr [ecx + 32]
    xor edx, edx
    div edi
    mov dword ptr [ecx + 52], ebx
    mov dword ptr [ecx + 56], ebx
    mov dword ptr [ecx + 60], ebx
    mov dword ptr [ecx + 64], 8
    mov dword ptr [ecx + 68], ebx
    test edx, edx
    jne L0
    mov edx, edi
L0:
    mov dword ptr [ecx + 72], edx
    mov dword ptr [esi + 000000108h], ebx
    mov dword ptr [esi + 00000010Ch], 0
    jmp L10
L1:
    xor edi, edi
    cmp eax, edi
    jle L2
    cmp eax, 4
    jle L3
L2:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 26
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0000000ECh]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 28], 4
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L3:
    mov ecx, dword ptr [esi + 0000000E0h]
    mov edx, dword ptr [esi + 36]
    shl ecx, 3
    lea eax, [edx + ecx - 1]
    cdq
    idiv ecx
    mov ecx, dword ptr [esi + 0000000E4h]
    shl ecx, 3
    mov dword ptr [esi + 000000108h], edi
    mov dword ptr [esp + 8], edi
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [esi + 40]
    lea eax, [eax + ecx - 1]
    cdq
    idiv ecx
    mov dword ptr [esi + 000000104h], eax
    cmp dword ptr [esi + 0000000ECh], edi
    jle L10
    lea ecx, [esi + 0000000F0h]
    mov dword ptr [esp + 12], ecx
    push ebp
    lea ebx, [ebx]
L4:
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [edx]
    mov edi, dword ptr [ecx + 8]
    lea eax, [edi*8]
    mov ebp, dword ptr [ecx + 12]
    mov dword ptr [ecx + 64], eax
    mov eax, dword ptr [ecx + 28]
    xor edx, edx
    div edi
    mov ebx, ebp
    imul ebx, edi
    mov dword ptr [ecx + 52], edi
    mov dword ptr [ecx + 56], ebp
    mov dword ptr [ecx + 60], ebx
    test edx, edx
    jne L5
    mov edx, edi
L5:
    mov eax, dword ptr [ecx + 32]
    mov dword ptr [ecx + 68], edx
    xor edx, edx
    div ebp
    test edx, edx
    jne L6
    mov edx, ebp
L6:
    mov dword ptr [ecx + 72], edx
    mov ecx, dword ptr [esi + 000000108h]
    add ecx, ebx
    cmp ecx, 10
    jle L7
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 13
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L7:
    test ebx, ebx
    jle L9
L8:
    mov ecx, dword ptr [esi + 000000108h]
    mov edx, dword ptr [esp + 12]
    mov dword ptr [esi + ecx*4 + 00000010Ch], edx
    mov ecx, dword ptr [esi + 000000108h]
    inc ecx
    dec ebx
    mov dword ptr [esi + 000000108h], ecx
    jne L8
L9:
    mov eax, dword ptr [esp + 12]
    mov edx, dword ptr [esp + 16]
    mov ecx, dword ptr [esi + 0000000ECh]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 16], edx
    jl L4
    pop ebp
L10:
    mov ecx, dword ptr [esi + 0000000C8h]
    test ecx, ecx
    pop edi
    pop ebx
    jle L12
    mov eax, dword ptr [esi + 000000100h]
    imul eax, ecx
    cmp eax, 00000FFFFh
    jl L11
    mov eax, 00000FFFFh
L11:
    mov dword ptr [esi + 0000000C4h], eax
L12:
    add esp, 8
    ret
FUN_100464c0 ENDP
END
