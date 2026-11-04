.686
.MODEL FLAT, C
EXTRN sub_100472BB:PROC
EXTRN sub_1004743D:PROC
.CODE
FUN_10046f10 PROC
    push push ebx
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, 5
    push push edi
    ja L5
    jmp jmp dword ptr [eax*4 + 0100471A4h]
    cmp cmp dword ptr [esi + 20], 100
    je L0
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, 1
    mov mov dword ptr [esi + 72], eax
    mov mov byte ptr [esi + 0CCh], al
    mov mov dword ptr [esi + 68], eax
    xor xor ecx, ecx
    mov mov byte ptr [esi + 0D4h], cl
    mov mov esi, dword ptr [esi + 76]
    pop pop edi
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 20], 100
    je L1
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 20
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [edx + 24], eax
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    jmp L2
    cmp cmp dword ptr [esi + 20], 100
    je L3
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 20
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov edx, dword ptr [esi + 76]
    mov mov eax, 1
    mov mov byte ptr [esi + 0CCh], al
    xor xor ecx, ecx
    mov mov byte ptr [esi + 0D4h], cl
    mov mov ebx, 3
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [edx], eax
    mov mov edi, 2
    mov mov dword ptr [edx + 8], edi
    mov mov dword ptr [edx + 12], edi
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [edx + 20], ecx
    mov mov dword ptr [edx + 24], ecx
    mov mov ecx, dword ptr [esi + 76]
    mov mov dword ptr [ecx + 84], edi
    mov mov dword ptr [ecx + 92], eax
    add add ecx, 84
    mov mov dword ptr [ecx + 12], eax
    mov mov dword ptr [ecx + 16], eax
    mov mov dword ptr [ecx + 20], eax
    mov mov dword ptr [ecx + 24], eax
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0A8h
    mov mov dword ptr [esi], ebx
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], eax
    mov mov dword ptr [esi + 20], eax
    pop pop edi
    mov mov dword ptr [esi + 24], eax
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 20], 100
    je L4
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
L3:
    mov mov edx, dword ptr [esi + 76]
    xor xor ecx, ecx
    mov mov byte ptr [esi + 0CCh], cl
    mov mov eax, 1
    mov mov byte ptr [esi + 0D4h], al
    mov mov ebx, 4
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [edx], 67
    mov mov dword ptr [edx + 8], eax
    mov mov dword ptr [edx + 12], eax
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [edx + 20], ecx
    mov mov dword ptr [edx + 24], ecx
    mov mov edx, dword ptr [esi + 76]
    mov mov dword ptr [edx + 84], 77
    mov mov dword ptr [edx + 92], eax
    mov mov dword ptr [edx + 96], eax
    mov mov dword ptr [edx + 100], ecx
    mov mov dword ptr [edx + 104], ecx
    mov mov dword ptr [edx + 108], ecx
    add add edx, 84
    mov mov edx, dword ptr [esi + 76]
    add add edx, 0A8h
    mov mov dword ptr [edx], 89
    mov mov dword ptr [edx + 8], eax
    mov mov dword ptr [edx + 12], eax
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [edx + 20], ecx
    mov mov dword ptr [edx + 24], ecx
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0FCh
    pop pop edi
    mov mov dword ptr [esi], 75
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp dword ptr [esi + 20], 100
    je sub_100472BB
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 20
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [edx + 24], eax
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [esi + 76]
    mov mov dword ptr [esi + 72], 5
    mov mov eax, 1
    mov mov byte ptr [esi + 0D4h], al
    xor xor ecx, ecx
    mov mov byte ptr [esi + 0CCh], cl
    mov mov edi, 2
    mov mov ebx, 4
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [edx + 8], edi
    mov mov dword ptr [edx + 12], edi
    mov mov dword ptr [edx], eax
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [edx + 20], ecx
    mov mov dword ptr [edx + 24], ecx
    mov mov edx, dword ptr [esi + 76]
    mov mov dword ptr [edx + 84], edi
    mov mov dword ptr [edx + 92], eax
    mov mov dword ptr [edx + 96], eax
    mov mov dword ptr [edx + 100], eax
    mov mov dword ptr [edx + 104], eax
    mov mov dword ptr [edx + 108], eax
    add add edx, 84
    mov mov edx, dword ptr [esi + 76]
    add add edx, 0A8h
    mov mov dword ptr [edx], 3
    mov mov dword ptr [edx + 8], eax
    mov mov dword ptr [edx + 12], eax
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx + 20], eax
    mov mov dword ptr [edx + 24], eax
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0FCh
    mov mov dword ptr [esi + 8], edi
    mov mov dword ptr [esi + 12], edi
    pop pop edi
    mov mov dword ptr [esi], ebx
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    pop pop edi
    mov mov ecx, esi
    pop pop esi
    xor xor eax, eax
    pop pop ebx
    jmp sub_1004743D
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 9
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
L5:
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10046f10 ENDP
END
