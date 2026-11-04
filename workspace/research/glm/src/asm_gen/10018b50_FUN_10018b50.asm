; FUN_10018b50 @ 0x10018b50 — auto-synthesized
    EXTRN g_101d496c:DWORD
    EXTRN g_101d496d:DWORD
.CODE
FUN_10018b50 PROC
    mov al, byte ptr [g_101d496d]
    push ebx
    xor ebx, ebx
    cmp al, bl
    push esi
    jne L0
    mov esi, dword ptr [edi + 0x1c]
    mov eax, dword ptr [edi + 0x14]
    or esi, 0x7ff0000
    and eax, 0xf812ffff
    mov dword ptr [edi + 0x1c], esi
    or eax, 0x120000
    pop esi
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 8], ebx
    mov dword ptr [edi + 0xc], ebx
    mov dword ptr [edi + 0x10], ebx
    mov dword ptr [edi], 1
    mov dword ptr [edi + 0x14], eax
    pop ebx
    ret
    cmp byte ptr [g_101d496c], bl
    jne L1
    mov eax, dword ptr [edi]
    push ebp
    xor ebp, ebp
    cmp eax, ebx
    jle L2
    lea edx, [edi + 0x14]
    mov esi, dword ptr [edx + 8]
    test esi, 0x7000000
    je L3
    mov eax, dword ptr [edx]
    mov ecx, eax
    sar ecx, 0x18
    and ecx, 7
    cmp ecx, 1
    je L3
    cmp ecx, ebx
    je L3
    or esi, 0x7ff0000
    and eax, 0xf911ffff
    or eax, 0x1110000
    mov dword ptr [edx + 8], esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [edi]
    inc ebp
    add edx, 0x20
    cmp ebp, eax
    jl L4
    pop ebp
    pop esi
    pop ebx
    ret
FUN_10018b50 ENDP
END