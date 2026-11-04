; FUN_10043bd0 @ 0x10043bd0 — auto-synthesized
.CODE
FUN_10043bd0 PROC
    mov eax, dword ptr [edi + 4]
    push ebx
    push esi
    push 0x30
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    mov dword ptr [edi + 0x160], esi
    mov dword ptr [esi], 0x10042e10
    mov eax, dword ptr [edi + 0xc0]
    xor ebx, ebx
    add esp, 0xc
    sub eax, ebx
    je L0
    dec eax
    je L1
    dec eax
    je L2
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 0x14], 0x30
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    jmp L3
    mov dword ptr [esi + 4], 0x100434e0
    mov dword ptr [esi + 0x1c], 0x10052180
    jmp L3
    mov dword ptr [esi + 8], 0x100532c0
    jmp L4
    mov dword ptr [esi + 8], 0x100534d0
    mov dword ptr [esi + 4], 0x10043110
    mov dword ptr [esi + 0xc], ebx
    mov dword ptr [esi + 0x20], ebx
    mov dword ptr [esi + 0x10], ebx
    mov dword ptr [esi + 0x24], ebx
    mov dword ptr [esi + 0x14], ebx
    mov dword ptr [esi + 0x28], ebx
    mov dword ptr [esi + 0x18], ebx
    mov dword ptr [esi + 0x2c], ebx
    pop esi
    pop ebx
    ret
FUN_10043bd0 ENDP
END