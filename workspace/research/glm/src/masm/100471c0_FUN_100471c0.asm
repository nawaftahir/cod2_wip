.686
.MODEL FLAT, C
.CODE
FUN_100471c0 PROC
    push ebx
    push esi
    push edi
    mov esi, ecx
    mov edi, eax
    cmp dword ptr [esi + 20], 100
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    cmp edi, 5
    mov dword ptr [esi + 72], edi
    mov byte ptr [esi + 0000000CCh], 0
    mov byte ptr [esi + 0000000D4h], 0
    ja L4
    jmp dword ptr [edi*4 + 0x1004748c]
    mov ebx, 1
    mov byte ptr [esi + 0000000CCh], bl
    mov dword ptr [esi + 68], ebx
    mov esi, dword ptr [esi + 76]
    xor eax, eax
    pop edi
    mov dword ptr [esi], ebx
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi + 16], eax
    mov dword ptr [esi + 20], eax
    mov dword ptr [esi + 24], eax
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 76]
    mov dword ptr [esi + 68], 3
    xor ecx, ecx
    mov ebx, 1
    mov byte ptr [esi + 0000000D4h], bl
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax], 82
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [esi + 76]
    add eax, 84
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax], 71
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov esi, dword ptr [esi + 76]
    add esi, 0000000A8h
    pop edi
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi], 66
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 76]
    mov dword ptr [esi + 68], 3
    mov ebx, 1
    mov byte ptr [esi + 0000000CCh], bl
    mov dword ptr [eax], ebx
    xor ecx, ecx
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov edx, 2
    mov dword ptr [eax + 8], edx
    mov dword ptr [eax + 12], edx
    mov eax, dword ptr [esi + 76]
    add eax, 84
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [eax + 20], ebx
    mov dword ptr [eax + 24], ebx
    mov dword ptr [eax], edx
    mov esi, dword ptr [esi + 76]
    add esi, 0000000A8h
    pop edi
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi + 20], ebx
    mov dword ptr [esi + 24], ebx
    mov dword ptr [esi], 3
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 76]
    mov dword ptr [esi + 68], 4
    xor ecx, ecx
    mov ebx, 1
    mov byte ptr [esi + 0000000D4h], bl
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax], 67
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [esi + 76]
    mov dword ptr [eax + 92], ebx
    mov dword ptr [eax + 96], ebx
    mov dword ptr [eax + 84], 77
    mov dword ptr [eax + 100], ecx
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 108], ecx
    add eax, 84
    mov eax, dword ptr [esi + 76]
    add eax, 0000000A8h
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax], 89
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov esi, dword ptr [esi + 76]
    add esi, 0000000FCh
    pop edi
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [esi], 75
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 76]
    mov dword ptr [esi + 68], 4
    mov ebx, 1
    mov byte ptr [esi + 0000000D4h], bl
    mov dword ptr [eax], ebx
    xor ecx, ecx
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov edx, 2
    mov dword ptr [eax + 8], edx
    mov dword ptr [eax + 12], edx
    mov eax, dword ptr [esi + 76]
    mov dword ptr [eax + 92], ebx
    mov dword ptr [eax + 96], ebx
    mov dword ptr [eax + 100], ebx
    mov dword ptr [eax + 104], ebx
    mov dword ptr [eax + 108], ebx
    mov dword ptr [eax + 84], edx
    add eax, 84
    mov eax, dword ptr [esi + 76]
    add eax, 0000000A8h
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], ebx
    mov dword ptr [eax + 20], ebx
    mov dword ptr [eax + 24], ebx
    mov dword ptr [eax], 3
    mov esi, dword ptr [esi + 76]
    add esi, 0000000FCh
    pop edi
    mov dword ptr [esi], 4
    mov dword ptr [esi + 8], edx
    mov dword ptr [esi + 12], edx
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    mov eax, dword ptr [esi + 44]
    mov ebx, 1
    cmp eax, ebx
    mov dword ptr [esi + 68], eax
    jl L1
    cmp eax, 10
    jle L2
L1:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 26
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 68]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], 10
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L2:
    mov eax, dword ptr [esi + 68]
    xor edi, edi
    xor ecx, ecx
    cmp eax, edi
    jle L5
    xor edx, edx
    lea esp, [esp]
L3:
    mov eax, dword ptr [esi + 76]
    add eax, edx
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 8], ebx
    mov dword ptr [eax + 12], ebx
    mov dword ptr [eax + 16], edi
    mov dword ptr [eax + 20], edi
    mov dword ptr [eax + 24], edi
    mov eax, dword ptr [esi + 68]
    inc ecx
    add edx, 84
    cmp ecx, eax
    jl L3
    pop edi
    pop esi
    pop ebx
    ret
L4:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L5:
    pop edi
    pop esi
    pop ebx
    ret
FUN_100471c0 ENDP
END
