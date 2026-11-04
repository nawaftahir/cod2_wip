; FUN_100051e0 @ 0x100051e0 — auto-synthesized
    sub_1000519f PROTO C
    sub_100051df PROTO C
.CODE
FUN_100051e0 PROC
    push ecx
    push ebx
    push esi
    mov dword ptr [esp + 8], 6
    xor esi, esi
    lea ecx, [ecx]
    mov eax, dword ptr [esi + 0x101825d8]
    mov ecx, dword ptr [edi + eax]
    mov eax, dword ptr [esi + 0x101825e0]
    test eax, eax
    je L0
    mov edx, ecx
    not edx
    test eax, edx
    je L1
    mov eax, dword ptr [esi + 0x101825dc]
    test eax, eax
    je L2
    test ecx, eax
    je L1
    mov ebx, dword ptr [esi + 0x101825e8]
    lea eax, [esp + 8]
    push eax
    mov eax, dword ptr [esi + 0x101825e4]
    call sub_1000519f
    add esp, 4
    add esi, 0x14
    cmp esi, 0x2d0
    jb L3
    xor esi, esi
    nop
    mov ecx, dword ptr [esi + 0x101828a8]
    mov eax, dword ptr [edi + ecx]
    cmp eax, dword ptr [esi + 0x101828ac]
    jb L4
    cmp eax, dword ptr [esi + 0x101828b0]
    jbe L5
    mov ebx, dword ptr [esi + 0x101828b8]
    mov eax, dword ptr [esi + 0x101828b4]
    lea edx, [esp + 8]
    push edx
    call sub_100051df
    add esp, 4
    add esi, 0x14
    cmp esi, 0xa0
    jb L6
    mov eax, dword ptr [esp + 8]
    pop esi
    pop ebx
    pop ecx
    ret
FUN_100051e0 ENDP
END