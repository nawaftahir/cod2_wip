; FUN_10048cd0 @ 0x10048cd0 — auto-synthesized
.CODE
FUN_10048cd0 PROC
    mov ecx, dword ptr [esp + 0xc]
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    sub ebp, ecx
    test ebp, ebp
    jle L0
    mov eax, dword ptr [esp + 0xc]
    push esi
    xor esi, esi
    test eax, eax
    jle L1
    push ebx
    push edi
    lea esp, [esp]
    mov eax, dword ptr [esp + 0x14]
    mov edi, dword ptr [eax + esi*4]
    add edi, dword ptr [esp + 0x1c]
    mov al, byte ptr [edi - 1]
    mov bl, al
    mov bh, bl
    mov ecx, ebp
    mov edx, ecx
    shr ecx, 2
    mov eax, ebx
    shl eax, 0x10
    mov ax, bx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 0x18]
    inc esi
    cmp esi, eax
    jl L2
    pop edi
    pop ebx
    pop esi
    pop ebp
    ret
FUN_10048cd0 ENDP
END