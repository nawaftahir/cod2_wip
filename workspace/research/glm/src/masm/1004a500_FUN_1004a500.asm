.686
.MODEL FLAT, C
.CODE
FUN_1004a500 PROC
    mov eax, dword ptr [esi + 20]
    push ebx
    push edi
    mov edi, 0000000CCh
    cmp eax, edi
    je L0
    mov eax, dword ptr [esi + 000000188h]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov dword ptr [esi + 000000080h], 0
    mov dword ptr [esi + 20], edi
L0:
    mov ecx, dword ptr [esi + 000000188h]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L5
    lea edi, [esi + 000000080h]
    lea ebx, [ebx]
L1:
    mov eax, dword ptr [edi]
    cmp eax, dword ptr [esi + 104]
    jae L4
L2:
    mov ecx, dword ptr [esi + 8]
    test ecx, ecx
    je L3
    mov dword ptr [ecx + 4], eax
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 104]
    mov dword ptr [edx + 8], eax
    mov ecx, dword ptr [esi + 8]
    push esi
    call dword ptr [ecx]
    add esp, 4
L3:
    mov edx, dword ptr [esi + 00000018Ch]
    mov ebx, dword ptr [edi]
    push 0
    push edi
    push 0
    push esi
    call dword ptr [edx + 4]
    mov eax, dword ptr [edi]
    add esp, 16
    cmp eax, ebx
    je L6
    mov edx, dword ptr [esi + 104]
    mov ecx, eax
    cmp ecx, edx
    jb L2
L4:
    mov edx, dword ptr [esi + 000000188h]
    push esi
    call dword ptr [edx + 4]
    mov eax, dword ptr [esi + 000000188h]
    push esi
    call dword ptr [eax]
    mov dword ptr [edi], 0
    mov ecx, dword ptr [esi + 000000188h]
    mov al, byte ptr [ecx + 8]
    add esp, 8
    test al, al
    jne L1
L5:
    mov cl, byte ptr [esi + 73]
    xor edx, edx
    test cl, cl
    setne dl
    pop edi
    mov al, 1
    pop ebx
    add edx, 0000000CDh
    mov dword ptr [esi + 20], edx
    ret
L6:
    pop edi
    xor al, al
    pop ebx
    ret
FUN_1004a500 ENDP
END
