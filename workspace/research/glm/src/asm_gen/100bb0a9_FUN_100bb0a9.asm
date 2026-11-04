; FUN_100bb0a9 @ 0x100bb0a9 — auto-synthesized
.CODE
FUN_100bb0a9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 4]
    push esi
    mov esi, dword ptr [ecx]
    and esi, 0xfffff
    xor edx, edx
    div esi
    push edi
    mov edi, dword ptr [ebp + 0xc]
    test eax, eax
    jbe L0
    mov edx, esi
    shl edx, 2
    mov dword ptr [ebp + 0xc], edx
    mov edx, edi
    shl edx, 2
    mov dword ptr [ebp + 8], eax
    push ebx
    mov eax, dword ptr [ecx + 8]
    add eax, edx
    mov ebx, dword ptr [eax + 4]
    mov esi, dword ptr [eax]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [eax + edx + 4], esi
    add edx, dword ptr [ebp + 0xc]
    dec dword ptr [ebp + 8]
    jne L1
    pop ebx
    mov eax, dword ptr [ecx + 0x10]
    mov edx, edi
    shl edx, 2
    add eax, edx
    mov edi, dword ptr [eax + 4]
    mov esi, dword ptr [eax]
    mov dword ptr [eax], edi
    mov eax, dword ptr [ecx + 0x10]
    pop edi
    mov dword ptr [eax + edx + 4], esi
    pop esi
    pop ebp
    ret 8
FUN_100bb0a9 ENDP
END