; FUN_1004d5a0 @ 0x1004d5a0 — auto-synthesized
.CODE
FUN_1004d5a0 PROC
    sub esp, 0xc
    mov ecx, dword ptr [esi + 0x2c]
    mov eax, dword ptr [esi + 4]
    push ebx
    push ebp
    mov ebp, dword ptr [esi + 0x120]
    push edi
    mov edi, dword ptr [esi + 0x18c]
    shl ecx, 3
    push ecx
    push 1
    push esi
    mov dword ptr [esp + 0x20], edi
    call dword ptr [eax]
    mov dword ptr [edi + 0x38], eax
    mov edx, dword ptr [esi + 0x2c]
    lea eax, [eax + edx*4]
    mov dword ptr [edi + 0x3c], eax
    mov ecx, dword ptr [esi + 0x2c]
    mov eax, dword ptr [esi + 0xcc]
    add esp, 0xc
    xor ebx, ebx
    test ecx, ecx
    jle L0
    add ebp, 4
    mov dword ptr [esp + 0xc], ebp
    lea ebp, [eax + 0xc]
    lea ecx, [ecx]
    mov eax, dword ptr [ebp + 0x18]
    imul eax, dword ptr [ebp]
    cdq
    idiv dword ptr [esi + 0x120]
    mov edi, dword ptr [esp + 0xc]
    mov ecx, dword ptr [esi + 4]
    imul edi, eax
    lea edx, [edi*8]
    push edx
    push 1
    push esi
    mov dword ptr [esp + 0x1c], eax
    call dword ptr [ecx]
    mov ecx, dword ptr [esp + 0x1c]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [esp + 0x20]
    mov edx, dword ptr [ecx + 0x38]
    mov dword ptr [edx + ebx*4], eax
    mov ecx, dword ptr [ecx + 0x3c]
    lea eax, [eax + edi*4]
    add esp, 0xc
    mov dword ptr [ecx + ebx*4], eax
    mov eax, dword ptr [esi + 0x2c]
    inc ebx
    add ebp, 0x54
    cmp ebx, eax
    jl L1
    pop edi
    pop ebp
    pop ebx
    add esp, 0xc
    ret
FUN_1004d5a0 ENDP
END