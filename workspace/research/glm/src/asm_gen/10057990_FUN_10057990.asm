; FUN_10057990 @ 0x10057990 — auto-synthesized
.CODE
FUN_10057990 PROC
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    test ebx, ebx
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [esp + 8]
    lea edx, [ecx + edx*4]
    jle L0
    push ebp
    push esi
    push edi
    mov ecx, dword ptr [esp + 0x1c]
    mov esi, dword ptr [eax]
    mov edi, dword ptr [edx]
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    add eax, 4
    add edx, 4
    dec ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jne L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10057990 ENDP
END