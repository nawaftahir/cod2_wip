; FUN_10005820 @ 0x10005820 — auto-synthesized
    EXTRN fp_101d49e0:DWORD
.CODE
FUN_10005820 PROC
    mov eax, dword ptr [esi + 0xc]
    push edi
    xor edi, edi
    cmp eax, edi
    je L0
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0xc], edi
    mov eax, dword ptr [esi]
    cmp eax, edi
    je L1
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi], edi
    mov eax, dword ptr [esi + 0x18]
    cmp eax, edi
    je L2
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0x18], edi
    mov eax, dword ptr [esi + 0x24]
    cmp eax, edi
    je L3
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0x24], edi
    mov eax, dword ptr [esi + 0x30]
    cmp eax, edi
    je L4
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0x30], edi
    mov eax, dword ptr [esi + 0x3c]
    cmp eax, edi
    je L5
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0x3c], edi
    mov eax, dword ptr [esi + 0x48]
    cmp eax, edi
    je L6
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 4
    mov dword ptr [esi + 0x48], edi
    pop edi
    ret
FUN_10005820 ENDP
END