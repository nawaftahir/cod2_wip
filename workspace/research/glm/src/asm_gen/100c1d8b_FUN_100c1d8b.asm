; FUN_100c1d8b @ 0x100c1d8b — auto-synthesized
.CODE
FUN_100c1d8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 0xc], 0
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [eax + 0x10]
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [eax + 0x14]
    cmp ecx, -1
    push ebx
    push esi
    push edi
    je L2
    mov ebx, dword ptr [ebp + 0xc]
    sub ebx, dword ptr [ebp + 0x10]
    mov dword ptr [ebp + 8], ebx
    mov esi, dword ptr [ebp + 0x10]
    xor edi, edi
    cmp ecx, dword ptr [ebx + esi]
    jne L3
    mov ebx, dword ptr [eax + 0x18]
    cmp ebx, dword ptr [esi]
    je L4
    mov ebx, dword ptr [ebp + 8]
    inc edi
    add esi, 4
    cmp edi, 4
    jb L5
    mov eax, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [eax + 0x14]
    cmp ecx, -1
    jne L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
    xor eax, eax
    inc eax
    jmp L7
FUN_100c1d8b ENDP
END