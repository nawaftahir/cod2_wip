; FUN_10060950 @ 0x10060950 — auto-synthesized
.CODE
FUN_10060950 PROC
    push ebx
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    movsx eax, byte ptr [edx]
    movsx ecx, byte ptr [esi]
    inc edx
    inc esi
    mov ebx, edi
    dec edi
    test ebx, ebx
    je L0
    cmp eax, ecx
    je L1
    cmp eax, 0x61
    jl L2
    cmp eax, 0x7a
    jg L2
    sub eax, 0x20
    cmp ecx, 0x61
    jl L3
    cmp ecx, 0x7a
    jg L3
    sub ecx, 0x20
    cmp eax, ecx
    jne L4
    test eax, eax
    jne L5
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    ret
    xor edx, edx
    cmp eax, ecx
    setge dl
    pop edi
    pop esi
    pop ebx
    lea edx, [edx + edx - 1]
    mov eax, edx
    ret
FUN_10060950 ENDP
END