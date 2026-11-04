; R_DrawTextWithCursor @ 0x100201b0 — auto-synthesized
    EXTRN fp_101d4b68:DWORD
    EXTRN fp_101d4b98:DWORD
    EXTRN fp_101d4ba0:DWORD
    EXTRN fp_101d4bb4:DWORD
.CODE
R_DrawTextWithCursor PROC
    sub esp, 0x11c
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x128]
    push edi
    push ebp
    call dword ptr [fp_101d4b98]
    add esp, 4
    test eax, eax
    jle L0
    mov ecx, eax
    mov al, byte ptr [esp + 0x130]
    mov bl, al
    mov bh, bl
    mov edx, ecx
    shr ecx, 2
    lea edi, [esp + 0x10]
    mov eax, ebx
    shl eax, 0x10
    mov ax, bx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    lea eax, [esp + 0x10]
    push eax
    lea ecx, [esp + 0x1c]
    push ecx
    lea edx, [esp + 0x30]
    push edx
    push ebp
    call dword ptr [fp_101d4ba0]
    add esp, 0x10
    test eax, eax
    jle L1
    push esi
    mov esi, dword ptr [esp + 0x138]
    lea ebx, [esp + 0x2e]
    sub ebx, esi
    mov dword ptr [esp + 0x10], eax
    movsx edi, word ptr [ebx + esi - 2]
    push edi
    push ebp
    call dword ptr [fp_101d4bb4]
    push eax
    call dword ptr [fp_101d4b68]
    add esp, 0xc
    test eax, eax
    jne L2
    mov dword ptr [esi], eax
    jmp L3
    movsx ecx, byte ptr [esp + edi + 0x14]
    movsx edx, word ptr [ebx + esi]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + edx*4]
    mov dword ptr [esi], ecx
    mov eax, dword ptr [esp + 0x10]
    add esi, 4
    dec eax
    mov dword ptr [esp + 0x10], eax
    jne L4
    pop esi
    pop edi
    pop ebp
    pop ebx
    add esp, 0x11c
    ret
R_DrawTextWithCursor ENDP
END