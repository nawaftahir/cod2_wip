; FUN_1000ca70 @ 0x1000ca70 — auto-synthesized
    sub_1000f0a9 PROTO C
.CODE
FUN_1000ca70 PROC
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push esi
    mov ebx, eax
    mov eax, dword ptr [esp + 0x1c]
    push edi
    xor edi, edi
    and eax, 1
    lea ecx, [ebp + 0x10]
    mov dword ptr [esp + 0x14], eax
    mov dword ptr [esp + 0x10], ecx
    jmp L0
    mov eax, dword ptr [esp + 0x14]
    test eax, eax
    je L1
    mov esi, dword ptr [esp + 0x24]
    mov eax, dword ptr [esp + 0x28]
    mov edx, dword ptr [esp + 0x2c]
    jmp L2
    movzx ecx, byte ptr [edi + ebp + 8]
    mov eax, dword ptr [esp + 0x24]
    sar eax, cl
    mov edx, 1
    mov esi, 1
    sub edx, eax
    jns L3
    mov esi, eax
    mov edx, dword ptr [esp + 0x28]
    sar edx, cl
    mov eax, 1
    sub eax, edx
    mov eax, 1
    jns L4
    mov eax, edx
    mov edx, dword ptr [esp + 0x2c]
    sar edx, cl
    mov ecx, 1
    sub ecx, edx
    js L2
    mov edx, 1
    mov ecx, dword ptr [esp + 0x20]
    push esi
    push ecx
    call sub_1000f0a9
    mov edx, dword ptr [esp + 0x18]
    mov dword ptr [edx], eax
    movzx ecx, byte ptr [ebp + 0xc]
    add esp, 8
    test ecx, ecx
    jl L5
    cmp ecx, 1
    jle L6
    cmp ecx, 4
    je L6
    add dword ptr [edi*4 + 0x101d0a74], eax
    mov ecx, dword ptr [esp + 0x10]
    inc edi
    add ecx, 4
    cmp edi, 2
    mov dword ptr [esp + 0x10], ecx
    jl L7
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_1000ca70 ENDP
END