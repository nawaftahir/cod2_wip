; FUN_100609b0 @ 0x100609b0 — auto-synthesized
.CODE
FUN_100609b0 PROC
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
    jne L1
    test eax, eax
    jne L2
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
FUN_100609b0 ENDP
END