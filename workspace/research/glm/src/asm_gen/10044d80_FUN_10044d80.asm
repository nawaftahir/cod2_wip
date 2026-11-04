; FUN_10044d80 @ 0x10044d80 — auto-synthesized
.CODE
FUN_10044d80 PROC
    mov eax, dword ptr [esi + 4]
    push 0x40
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x148], eax
    mov dword ptr [eax], 0x10044c80
    mov cl, byte ptr [esi + 0xb8]
    add esp, 0xc
    test cl, cl
    jne L0
    mov cl, byte ptr [esp + 4]
    test cl, cl
    je L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 4
    mov edx, dword ptr [esi]
    mov dword ptr [esp + 4], esi
    jmp dword ptr [edx]
    mov edx, dword ptr [esi + 0x44]
    mov ecx, dword ptr [esi + 0x4c]
    push ebp
    xor ebp, ebp
    test edx, edx
    jle L2
    push ebx
    push edi
    lea edi, [ecx + 0x1c]
    lea ebx, [eax + 0x18]
    mov ecx, dword ptr [edi - 0x10]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi + 4]
    shl ecx, 3
    push ecx
    shl edx, 3
    push edx
    push 1
    push esi
    call dword ptr [eax + 8]
    add esp, 0x10
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 0x44]
    inc ebp
    add ebx, 4
    add edi, 0x54
    cmp ebp, eax
    jl L3
    pop edi
    pop ebx
    pop ebp
    ret
FUN_10044d80 ENDP
END