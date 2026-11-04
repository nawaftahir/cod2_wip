; FUN_1007de7a @ 0x1007de7a — auto-synthesized
.CODE
FUN_1007de7a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0x18]
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov edx, ebx
    shl edx, 2
    push edi
    je L0
    mov eax, dword ptr [ebp + 0x14]
    mov ecx, esi
    sub ecx, eax
    fild dword ptr [ecx + eax]
    fstp dword ptr [eax]
    add eax, 4
    dec edx
    jne L1
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push eax
    shl ebx, 4
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov eax, dword ptr [ebp + 0xc]
    shl eax, 4
    add edi, eax
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    pop ebp
    ret 0x14
FUN_1007de7a ENDP
END