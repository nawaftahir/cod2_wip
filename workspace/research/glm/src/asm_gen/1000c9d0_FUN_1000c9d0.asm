; FUN_1000c9d0 @ 0x1000c9d0 — auto-synthesized
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    sub_1000f08a PROTO C
.CODE
FUN_1000c9d0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, eax
    xor esi, esi
    lea esp, [esp]
    mov eax, esi
    dec eax
    mov eax, dword ptr [g_101d4c6c]
    jne L0
    mov eax, 0x280
    mov edx, dword ptr [g_101d4c70]
    mov ecx, esi
    dec ecx
    jne L1
    mov edx, 0x1e0
    mov ecx, dword ptr [esp + 0x18]
    sar eax, cl
    mov edi, 1
    sub edi, eax
    mov edi, 1
    jns L2
    mov edi, eax
    sar edx, cl
    mov ecx, 1
    mov eax, edx
    sub ecx, eax
    js L3
    mov eax, 1
    movzx edx, di
    push edx
    movzx eax, ax
    push 3
    mov edx, 1
    call sub_1000f08a
    add dword ptr [ebp + esi*4 + 0x10], eax
    movzx ecx, byte ptr [ebp + 0xc]
    add esp, 8
    test ecx, ecx
    jl L4
    cmp ecx, 1
    jle L5
    cmp ecx, 4
    je L5
    add dword ptr [esi*4 + 0x101d0a74], eax
    inc esi
    cmp esi, 2
    jl L6
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1000c9d0 ENDP
END