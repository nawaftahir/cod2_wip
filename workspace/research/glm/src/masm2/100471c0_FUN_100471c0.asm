.686
.MODEL FLAT, C
EXTRN sub_100474B5:PROC
EXTRN sub_10047675:PROC
EXTRN sub_1004769C:PROC
EXTRN sub_10047701:PROC
EXTRN sub_10047710:PROC
.CODE
FUN_100471c0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov edi, eax
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
    cmp cmp edi, 5
    mov mov dword ptr [esi + 72], edi
    mov mov byte ptr [esi + 0CCh], 0
L0:
    mov mov byte ptr [esi + 0D4h], 0
    ja sub_100474B5
    jmp jmp dword ptr [edi*4 + 01004748Ch]
    mov mov ebx, 1
    mov mov byte ptr [esi + 0CCh], bl
    mov mov dword ptr [esi + 68], ebx
    mov mov esi, dword ptr [esi + 76]
    xor xor eax, eax
    pop pop edi
    mov mov dword ptr [esi], ebx
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi + 16], eax
    mov mov dword ptr [esi + 20], eax
    mov mov dword ptr [esi + 24], eax
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [esi + 68], 3
    xor xor ecx, ecx
    mov mov ebx, 1
    mov mov byte ptr [esi + 0D4h], bl
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax], 82
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [esi + 76]
    add add eax, 84
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax], 71
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0A8h
    pop pop edi
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi], 66
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [esi + 68], 3
    mov mov ebx, 1
    mov mov byte ptr [esi + 0CCh], bl
    mov mov dword ptr [eax], ebx
    xor xor ecx, ecx
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, 2
    mov mov dword ptr [eax + 8], edx
    mov mov dword ptr [eax + 12], edx
    mov mov eax, dword ptr [esi + 76]
    add add eax, 84
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [eax + 20], ebx
    mov mov dword ptr [eax + 24], ebx
    mov mov dword ptr [eax], edx
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0A8h
    pop pop edi
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi + 20], ebx
    mov mov dword ptr [esi + 24], ebx
    mov mov dword ptr [esi], 3
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [esi + 68], 4
    xor xor ecx, ecx
    mov mov ebx, 1
    mov mov byte ptr [esi + 0D4h], bl
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax], 67
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [eax + 92], ebx
    mov mov dword ptr [eax + 96], ebx
    mov mov dword ptr [eax + 84], 77
    mov mov dword ptr [eax + 100], ecx
    mov mov dword ptr [eax + 104], ecx
    mov mov dword ptr [eax + 108], ecx
    add add eax, 84
    mov mov eax, dword ptr [esi + 76]
    add add eax, 0A8h
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax], 89
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0FCh
    pop pop edi
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [esi], 75
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [esi + 68], 4
    mov mov ebx, 1
    mov mov byte ptr [esi + 0D4h], bl
    mov mov dword ptr [eax], ebx
    xor xor ecx, ecx
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, 2
    mov mov dword ptr [eax + 8], edx
    mov mov dword ptr [eax + 12], edx
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [eax + 92], ebx
    mov mov dword ptr [eax + 96], ebx
    mov mov dword ptr [eax + 100], ebx
    mov mov dword ptr [eax + 104], ebx
    mov mov dword ptr [eax + 108], ebx
    mov mov dword ptr [eax + 84], edx
    add add eax, 84
    mov mov eax, dword ptr [esi + 76]
    add add eax, 0A8h
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], ebx
    mov mov dword ptr [eax + 20], ebx
    mov mov dword ptr [eax + 24], ebx
    mov mov dword ptr [eax], 3
    mov mov esi, dword ptr [esi + 76]
    add add esi, 0FCh
    pop pop edi
    mov mov dword ptr [esi], 4
    mov mov dword ptr [esi + 8], edx
    mov mov dword ptr [esi + 12], edx
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ecx
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + 44]
    mov mov ebx, 1
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 68], eax
    jl sub_10047675
    cmp cmp eax, 10
    jle sub_1004769C
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 26
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 68]
    mov mov dword ptr [edx + 24], eax
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 28], 10
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 68]
    xor xor edi, edi
    xor xor ecx, ecx
    cmp cmp eax, edi
    jle sub_10047710
    xor xor edx, edx
    lea lea esp, [esp]
    mov mov eax, dword ptr [esi + 76]
    add add eax, edx
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov dword ptr [eax + 16], edi
    mov mov dword ptr [eax + 20], edi
    mov mov dword ptr [eax + 24], edi
    mov mov eax, dword ptr [esi + 68]
    inc inc ecx
    add add edx, 84
    cmp cmp ecx, eax
    jl sub_10047701
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 10
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_100471c0 ENDP
END
