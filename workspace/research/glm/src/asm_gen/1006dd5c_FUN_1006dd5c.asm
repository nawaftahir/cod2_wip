; FUN_1006dd5c @ 0x1006dd5c — auto-synthesized
.CODE
FUN_1006dd5c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0x10]
    mov eax, dword ptr [ecx + 0x18]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + 0x14]
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + edi*4]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edx + 0x6c]
    mov esi, dword ptr [ecx + 0x6c]
    cmp eax, esi
    jae L0
    or eax, 0xffffffff
    jmp L1
    jbe L2
    xor eax, eax
    inc eax
    jmp L1
    mov edx, dword ptr [edx + 0x10]
    mov ecx, dword ptr [ecx + 0x10]
    cmp edx, ecx
    jb L3
    ja L4
    cmp ebx, edi
    ja L3
    sbb eax, eax
    neg eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_1006dd5c ENDP
END