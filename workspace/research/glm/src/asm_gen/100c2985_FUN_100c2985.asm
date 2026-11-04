; FUN_100c2985 @ 0x100c2985 — auto-synthesized
.CODE
FUN_100c2985 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    cmp dword ptr [ebp + 0xc], eax
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ecx + 0x10]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ebx*4]
    test byte ptr [eax + 5], 2
    je L2
    mov eax, 0x80004005
    jmp L3
    push esi
    mov esi, dword ptr [ecx + 8]
    push edi
    xor edi, edi
    test esi, esi
    jbe L4
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [edx]
    cmp dword ptr [eax + 4], ebx
    jne L5
    cmp dword ptr [eax + 0x30], 0
    je L5
    mov eax, dword ptr [eax + 0xc]
    cmp eax, dword ptr [ebp + 0xc]
    je L6
    cmp eax, dword ptr [ebp + 0x10]
    je L6
    mov ebx, dword ptr [ebp + 8]
    inc edi
    add edx, 4
    cmp edi, esi
    jb L7
    xor edx, edx
    test esi, esi
    jbe L8
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 4], ebx
    jne L9
    mov esi, dword ptr [eax + 0xc]
    cmp esi, dword ptr [ebp + 0xc]
    jne L10
    mov esi, dword ptr [ebp + 0x10]
    jmp L11
    mov eax, 0x80004005
    jmp L12
    cmp esi, dword ptr [ebp + 0x10]
    jne L9
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 0xc], esi
    inc edx
    cmp edx, dword ptr [ecx + 8]
    jb L13
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_100c2985 ENDP
END