; FUN_100266f0 @ 0x100266f0 — auto-synthesized
    EXTRN g_101d4928:DWORD
.CODE
FUN_100266f0 PROC
    mov ax, word ptr [g_101d4928]
    movzx edx, ax
    mov ecx, edx
    push ebx
    shr ecx, 1
    xor ebx, ebx
    test ecx, ecx
    jle L0
    push ebp
    push esi
    xor esi, esi
    test edx, edx
    jle L1
    lea esp, [esp]
    mov ecx, edx
    imul ecx, ebx
    add ecx, esi
    mov eax, edx
    sub eax, ebx
    shl ecx, 2
    dec eax
    imul eax, edx
    mov edx, dword ptr [ecx + edi]
    add eax, esi
    shl eax, 2
    mov ebp, dword ptr [eax + edi]
    mov dword ptr [ecx + edi], ebp
    mov dword ptr [eax + edi], edx
    mov ax, word ptr [g_101d4928]
    movzx edx, ax
    inc esi
    cmp esi, edx
    jl L2
    movzx edx, ax
    mov ecx, edx
    inc ebx
    shr ecx, 1
    cmp ebx, ecx
    jl L3
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100266f0 ENDP
END