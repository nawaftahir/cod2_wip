; FUN_100bb955 @ 0x100bb955 — auto-synthesized
.CODE
FUN_100bb955 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ecx + 0x100]
    mov edx, dword ptr [ecx + 0x14]
    push esi
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 0x30]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ecx + 0x10]
    mov eax, dword ptr [edx + eax*4]
    and esi, 0xfffff
    test byte ptr [eax + 4], 0x80
    jne L0
    xor eax, eax
    inc eax
    jmp L1
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L2
    push ebx
    push edi
    mov eax, dword ptr [ecx + 0x100]
    mov ebx, dword ptr [eax + 8]
    mov edi, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + 0x10]
    shl edi, 2
    mov ebx, dword ptr [edi + ebx]
    mov eax, dword ptr [edi + eax]
    mov ebx, dword ptr [edx + ebx*4]
    mov eax, dword ptr [edx + eax*4]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], esi
    mov edx, dword ptr [ebx + 0x30]
    mov dword ptr [eax + 0x30], edx
    jb L3
    pop edi
    pop ebx
    mov eax, dword ptr [ecx + 0x100]
    and dword ptr [eax], 0
    xor eax, eax
    pop esi
    leave
    ret
FUN_100bb955 ENDP
END