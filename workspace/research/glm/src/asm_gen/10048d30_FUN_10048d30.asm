; FUN_10048d30 @ 0x10048d30 — auto-synthesized
.CODE
FUN_10048d30 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x10]
    mov eax, dword ptr [ebx + 0x44]
    test eax, eax
    push ebp
    mov ebp, dword ptr [ebx + 0x15c]
    push edi
    mov edi, dword ptr [ebx + 0x4c]
    mov dword ptr [esp + 0x18], 0
    jle L0
    mov eax, dword ptr [esp + 0x20]
    lea ecx, [eax*4]
    mov eax, dword ptr [esp + 0x24]
    push esi
    mov esi, dword ptr [esp + 0x20]
    add ebp, 0xc
    sub eax, esi
    mov dword ptr [esp + 0x14], ecx
    mov dword ptr [esp + 0x10], eax
    jmp L1
    mov eax, dword ptr [esp + 0x10]
    lea esp, [esp]
    mov edx, dword ptr [edi + 0xc]
    imul edx, dword ptr [esp + 0x2c]
    mov eax, dword ptr [eax + esi]
    lea ecx, [eax + edx*4]
    mov edx, dword ptr [esi]
    push ecx
    add edx, dword ptr [esp + 0x18]
    push edx
    push edi
    push ebx
    call dword ptr [ebp]
    mov eax, dword ptr [esp + 0x2c]
    mov ecx, dword ptr [ebx + 0x44]
    add esp, 0x10
    inc eax
    add esi, 4
    add ebp, 4
    add edi, 0x54
    cmp eax, ecx
    mov dword ptr [esp + 0x1c], eax
    jl L2
    pop esi
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10048d30 ENDP
END