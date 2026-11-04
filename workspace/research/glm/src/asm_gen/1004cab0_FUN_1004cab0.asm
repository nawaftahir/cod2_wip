; FUN_1004cab0 @ 0x1004cab0 — auto-synthesized
.CODE
FUN_1004cab0 PROC
    mov ecx, dword ptr [esi + 0x19c]
    push edi
    mov edi, dword ptr [esi + 0x1a0]
    mov eax, dword ptr [edi + 0x10]
    cdq
    and edx, 7
    add eax, edx
    mov edx, dword ptr [ecx + 0x14]
    sar eax, 3
    add edx, eax
    mov dword ptr [ecx + 0x14], edx
    mov dword ptr [edi + 0x10], 0
    mov eax, dword ptr [esi + 0x19c]
    push esi
    call dword ptr [eax + 8]
    add esp, 4
    test al, al
    jne L0
    pop edi
    ret
    mov ecx, dword ptr [esi + 0x12c]
    xor eax, eax
    test ecx, ecx
    jle L1
    lea ecx, [edi + 0x14]
    lea ebx, [ebx]
    mov dword ptr [ecx], 0
    mov edx, dword ptr [esi + 0x12c]
    inc eax
    add ecx, 4
    cmp eax, edx
    jl L2
    mov ecx, dword ptr [esi + 0x104]
    mov dword ptr [edi + 0x24], ecx
    mov eax, dword ptr [esi + 0x184]
    test eax, eax
    jne L3
    mov byte ptr [edi + 8], 0
    mov al, 1
    pop edi
    ret
FUN_1004cab0 ENDP
END