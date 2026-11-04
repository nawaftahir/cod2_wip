; FUN_10035fb0 @ 0x10035fb0 — auto-synthesized
.CODE
FUN_10035fb0 PROC
    push ebx
    mov bl, byte ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov esi, ecx
    mov ecx, eax
    and ecx, 0xfffffffc
    shl ecx, 0xb
    or ecx, ebp
    shl al, 2
    push edi
    and bl, 3
    or al, bl
    and ecx, 0xfffffffc
    mov edi, edx
    sar edi, 2
    shl al, 2
    shl ecx, 8
    and dl, 3
    or ecx, edi
    mov edi, dword ptr [esi]
    or al, dl
    shl al, 2
    xor ebp, ebp
    dec edi
    mov byte ptr [esp + 0x14], al
    js L0
    mov ebx, dword ptr [esi + 4]
    lea esi, [edi + ebp]
    sar esi, 1
    mov edx, dword ptr [ebx + esi*8]
    sub edx, ecx
    jne L1
    movzx edx, byte ptr [ebx + esi*8 + 4]
    movzx eax, byte ptr [esp + 0x14]
    sub edx, eax
    and edx, 0xfffffffe
    je L2
    test edx, edx
    jge L3
    lea ebp, [esi + 1]
    jmp L4
    lea edi, [esi - 1]
    cmp ebp, edi
    jle L5
    mov edx, dword ptr [esp + 0x18]
    mov dword ptr [edx], edi
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov ecx, dword ptr [esp + 0x18]
    pop edi
    mov dword ptr [ecx], esi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_10035fb0 ENDP
END