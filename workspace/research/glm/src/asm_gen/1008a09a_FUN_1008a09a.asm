; FUN_1008a09a @ 0x1008a09a — auto-synthesized
.CODE
FUN_1008a09a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push esi
    mov edx, ecx
    xor esi, esi
    cmp eax, -1
    push edi
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 4], esi
    mov ecx, eax
    je L0
    mov edi, dword ptr [edx + 0x14]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 0x14]
    inc dword ptr [ebp - 4]
    cmp ecx, -1
    jne L1
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, -1
    push ebx
    mov edi, ecx
    je L2
    mov ebx, dword ptr [edx + 0x14]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 0x14]
    inc esi
    cmp edi, -1
    jne L3
    cmp esi, dword ptr [ebp - 4]
    jae L4
    mov edi, dword ptr [edx + 0x14]
    mov edx, dword ptr [ebp - 4]
    sub edx, esi
    mov eax, dword ptr [edi + eax*4]
    mov ebx, dword ptr [eax + 0x18]
    dec dword ptr [ebp - 4]
    dec edx
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [ebp + 0xc], ebx
    jne L5
    mov edx, dword ptr [ebp - 8]
    cmp esi, dword ptr [ebp - 4]
    jbe L6
    mov ebx, dword ptr [edx + 0x14]
    sub esi, dword ptr [ebp - 4]
    dec esi
    mov ecx, dword ptr [ebx + ecx*4]
    mov edi, dword ptr [ecx + 0x18]
    mov ecx, dword ptr [ecx + 0x14]
    jne L7
    jmp L8
    mov edi, dword ptr [ebp + 0x14]
    cmp eax, ecx
    pop ebx
    je L9
    mov edx, dword ptr [edx + 0x14]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [eax + 0x18]
    mov edi, dword ptr [ecx + 0x18]
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [ecx + 0x14]
    cmp eax, ecx
    mov dword ptr [ebp + 0xc], esi
    jne L10
    xor eax, eax
    cmp dword ptr [ebp + 0xc], edi
    pop edi
    setne al
    pop esi
    leave
    ret 0x10
FUN_1008a09a ENDP
END