; ___dtold @ 0x101083f5 — auto-synthesized
.CODE
___dtold PROC
    push ebp
    mov ebp, esp
    push ecx
    mov edx, dword ptr [ebp + 0xc]
    xor eax, eax
    mov ax, word ptr [edx + 6]
    push ebx
    push esi
    push edi
    mov edi, 0x7ff
    mov esi, 0x80000000
    mov dword ptr [ebp - 4], esi
    mov ecx, eax
    shr ecx, 4
    and eax, 0x8000
    and ecx, edi
    mov dword ptr [ebp + 0xc], eax
    mov eax, dword ptr [edx + 4]
    mov edx, dword ptr [edx]
    movzx ebx, cx
    and eax, 0xfffff
    test ebx, ebx
    je L0
    cmp ebx, edi
    je L1
    lea edi, [ecx + 0x3c00]
    jmp L2
    mov edi, 0x7fff
    jmp L2
    xor ebx, ebx
    cmp eax, ebx
    jne L3
    cmp edx, ebx
    jne L3
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax], ebx
    mov word ptr [eax + 8], bx
    jmp L4
    lea edi, [ecx + 0x3c01]
    mov dword ptr [ebp - 4], ebx
    mov ecx, edx
    shr ecx, 0x15
    shl eax, 0xb
    or ecx, eax
    or ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    shl edx, 0xb
    test esi, ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], edx
    jne L5
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov ebx, ecx
    shl edx, 1
    shr ebx, 0x1f
    or edx, ebx
    add ecx, ecx
    add edi, 0xffff
    test esi, edx
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax], ecx
    je L6
    mov ecx, dword ptr [ebp + 0xc]
    or ecx, edi
    mov word ptr [eax + 8], cx
    pop edi
    pop esi
    pop ebx
    leave
    ret
___dtold ENDP
END