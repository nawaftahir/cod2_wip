; FUN_100168e0 @ 0x100168e0 — auto-synthesized
    sub_100f790a PROTO C
.CODE
FUN_100168e0 PROC
    mov cl, byte ptr [edi]
    push esi
    xor esi, esi
    test cl, cl
    mov eax, 0x77
    je L0
    mov edi, edi
    movsx ecx, cl
    imul ecx, eax
    add esi, ecx
    mov cl, byte ptr [edi + eax - 0x76]
    inc eax
    test cl, cl
    jne L1
    and esi, 0x3ff
    mov eax, dword ptr [esi*4 + 0x101d92d4]
    test eax, eax
    je L2
    mov edx, dword ptr [eax]
    push edi
    push edx
    call sub_100f790a
    add esp, 8
    test eax, eax
    je L3
    inc esi
    and esi, 0x3ff
    mov eax, dword ptr [esi*4 + 0x101d92d4]
    test eax, eax
    jne L4
    mov dword ptr [ebx], esi
    xor al, al
    pop esi
    ret
    mov dword ptr [ebx], esi
    mov al, 1
    pop esi
    ret
FUN_100168e0 ENDP
END