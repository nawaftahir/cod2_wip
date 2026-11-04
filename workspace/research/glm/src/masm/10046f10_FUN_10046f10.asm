.686
.MODEL FLAT, C
EXTRN sub_1004743D:PROC
.CODE
FUN_10046f10 PROC
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 48]
    cmp eax, 5
    push edi
    ja L5
    jmp dword ptr [eax*4 + 0x100471a4]
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
    mov eax, 1
    mov dword ptr [esi + 72], eax
    mov byte ptr [esi + 0000000CCh], al
    mov dword ptr [esi + 68], eax
    xor ecx, ecx
    mov byte ptr [esi + 0000000D4h], cl
    mov esi, dword ptr [esi + 76]
    pop edi
    mov dword ptr [esi], eax
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    cmp dword ptr [esi + 20], 100
    je L2
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 20
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    jmp L1
    cmp dword ptr [esi + 20], 100
    je L2
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 20
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
L1:
    add esp, 4
L2:
    mov edx, dword ptr [esi + 76]
    mov eax, 1
    mov byte ptr [esi + 0000000CCh], al
    xor ecx, ecx
    mov byte ptr [esi + 0000000D4h], cl
    mov ebx, 3
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 68], ebx
    mov dword ptr [edx], eax
    mov edi, 2
    mov dword ptr [edx + 8], edi
    mov dword ptr [edx + 12], edi
    mov dword ptr [edx + 16], ecx
    mov dword ptr [edx + 20], ecx
    mov dword ptr [edx + 24], ecx
    mov ecx, dword ptr [esi + 76]
    mov dword ptr [ecx + 84], edi
    mov dword ptr [ecx + 92], eax
    add ecx, 84
    mov dword ptr [ecx + 12], eax
    mov dword ptr [ecx + 16], eax
    mov dword ptr [ecx + 20], eax
    mov dword ptr [ecx + 24], eax
    mov esi, dword ptr [esi + 76]
    add esi, 0000000A8h
    mov dword ptr [esi], ebx
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], eax
    mov dword ptr [esi + 20], eax
    pop edi
    mov dword ptr [esi + 24], eax
    pop esi
    pop ebx
    ret
    cmp dword ptr [esi + 20], 100
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L3:
    mov edx, dword ptr [esi + 76]
    xor ecx, ecx
    mov byte ptr [esi + 0000000CCh], cl
    mov eax, 1
    mov byte ptr [esi + 0000000D4h], al
    mov ebx, 4
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 68], ebx
    mov dword ptr [edx], 67
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], eax
    mov dword ptr [edx + 16], ecx
    mov dword ptr [edx + 20], ecx
    mov dword ptr [edx + 24], ecx
    mov edx, dword ptr [esi + 76]
    mov dword ptr [edx + 84], 77
    mov dword ptr [edx + 92], eax
    mov dword ptr [edx + 96], eax
    mov dword ptr [edx + 100], ecx
    mov dword ptr [edx + 104], ecx
    mov dword ptr [edx + 108], ecx
    add edx, 84
    mov edx, dword ptr [esi + 76]
    add edx, 0000000A8h
    mov dword ptr [edx], 89
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], eax
    mov dword ptr [edx + 16], ecx
    mov dword ptr [edx + 20], ecx
    mov dword ptr [edx + 24], ecx
    mov esi, dword ptr [esi + 76]
    add esi, 0000000FCh
    pop edi
    mov dword ptr [esi], 75
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    cmp dword ptr [esi + 20], 100
    je L4
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 20
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L4:
    mov edx, dword ptr [esi + 76]
    mov dword ptr [esi + 72], 5
    mov eax, 1
    mov byte ptr [esi + 0000000D4h], al
    xor ecx, ecx
    mov byte ptr [esi + 0000000CCh], cl
    mov edi, 2
    mov ebx, 4
    mov dword ptr [esi + 68], ebx
    mov dword ptr [edx + 8], edi
    mov dword ptr [edx + 12], edi
    mov dword ptr [edx], eax
    mov dword ptr [edx + 16], ecx
    mov dword ptr [edx + 20], ecx
    mov dword ptr [edx + 24], ecx
    mov edx, dword ptr [esi + 76]
    mov dword ptr [edx + 84], edi
    mov dword ptr [edx + 92], eax
    mov dword ptr [edx + 96], eax
    mov dword ptr [edx + 100], eax
    mov dword ptr [edx + 104], eax
    mov dword ptr [edx + 108], eax
    add edx, 84
    mov edx, dword ptr [esi + 76]
    add edx, 0000000A8h
    mov dword ptr [edx], 3
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], eax
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx + 24], eax
    mov esi, dword ptr [esi + 76]
    add esi, 0000000FCh
    mov dword ptr [esi + 8], edi
    mov dword ptr [esi + 12], edi
    pop edi
    mov dword ptr [esi], ebx
    mov dword ptr [esi + 16], ecx
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ecx
    pop esi
    pop ebx
    ret
    pop edi
    mov ecx, esi
    pop esi
    xor eax, eax
    pop ebx
    jmp sub_1004743D
L5:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 9
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
FUN_10046f10 ENDP
END
