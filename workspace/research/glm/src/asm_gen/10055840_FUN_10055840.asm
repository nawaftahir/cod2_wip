; FUN_10055840 @ 0x10055840 — auto-synthesized
.CODE
FUN_10055840 PROC
    push ebx
    push esi
    xor ebx, ebx
    push 0x54
    mov dword ptr [edi + 4], ebx
    call dword ptr [edi + 0x18]
    mov esi, eax
    add esp, 4
    cmp esi, ebx
    jne L0
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 0x14], 0x36
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 0x18], ebx
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    mov dword ptr [esi + 0x2c], ebx
    mov dword ptr [esi], 0x10054d40
    mov dword ptr [esi + 4], 0x10054e90
    mov dword ptr [esi + 8], 0x10054f50
    mov dword ptr [esi + 0xc], 0x10055000
    mov dword ptr [esi + 0x10], 0x100550b0
    mov dword ptr [esi + 0x14], 0x10055120
    mov dword ptr [esi + 0x18], 0x10055190
    mov dword ptr [esi + 0x1c], 0x10055440
    mov dword ptr [esi + 0x20], 0x10055590
    mov dword ptr [esi + 0x24], 0x100556f0
    mov dword ptr [esi + 0x28], 0x10055800
    mov dword ptr [esi + 0x30], 0x3b9aca00
    mov dword ptr [esi + 0x38], ebx
    mov dword ptr [esi + 0x40], ebx
    mov dword ptr [esi + 0x34], ebx
    mov dword ptr [esi + 0x3c], ebx
    mov dword ptr [esi + 0x44], ebx
    mov dword ptr [esi + 0x48], ebx
    mov dword ptr [esi + 0x4c], 0x54
    mov dword ptr [edi + 4], esi
    pop esi
    pop ebx
    ret
FUN_10055840 ENDP
END