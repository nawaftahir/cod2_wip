; FUN_10019400 @ 0x10019400 — auto-synthesized
    sub_100f6278 PROTO C
.CODE
FUN_10019400 PROC
    mov eax, dword ptr [esp + 8]
    mov eax, dword ptr [eax + 0xc]
    push ebx
    push ebp
    push esi
    xor ebp, ebp
    test eax, eax
    push edi
    jbe L0
    mov edi, ecx
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [esp + 0x18]
    mov esi, dword ptr [esp + 0x1c]
    add ecx, edx
    nop
    mov bl, byte ptr [ecx]
    mov dl, bl
    cmp bl, byte ptr [esi]
    jne L1
    test dl, dl
    je L2
    mov bl, byte ptr [ecx + 1]
    mov dl, bl
    cmp bl, byte ptr [esi + 1]
    jne L1
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L3
    xor ecx, ecx
    jmp L4
    sbb ecx, ecx
    sbb ecx, -1
    test ecx, ecx
    je L5
    inc ebp
    add edi, 0x14
    cmp ebp, eax
    jb L6
    mov ecx, dword ptr [esp + 0x14]
    mov edx, dword ptr [esp + 0x1c]
    push ecx
    push edx
    push 0x101955dc
    call sub_100f6278
    add esp, 0xc
    pop edi
    pop esi
    pop ebp
    or eax, 0xffffffff
    pop ebx
    ret
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10019400 ENDP
END