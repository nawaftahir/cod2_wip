; FUN_10047510 @ 0x10047510 — auto-synthesized
.CODE
FUN_10047510 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    xor ecx, ecx
    xor edi, edi
    cmp edx, 4
    jg L0
    cmp edx, edi
    mov dword ptr [eax], edx
    jle L1
    push esi
    lea esi, [eax + 4]
    lea esp, [esp]
    mov dword ptr [esi], ecx
    inc ecx
    add esi, 4
    cmp ecx, edx
    jl L2
    pop esi
    mov dword ptr [eax + 0x18], edi
    mov dword ptr [eax + 0x14], edi
    mov dword ptr [eax + 0x1c], ebp
    pop edi
    mov dword ptr [eax + 0x20], ebx
    add eax, 0x24
    pop ebp
    ret
    cmp edx, edi
    jle L3
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], 1
    mov dword ptr [eax + 0x14], edi
    mov dword ptr [eax + 0x18], edi
    mov dword ptr [eax + 0x1c], ebp
    mov dword ptr [eax + 0x20], ebx
    add eax, 0x24
    inc ecx
    cmp ecx, edx
    jl L4
    pop edi
    pop ebp
    ret
FUN_10047510 ENDP
END