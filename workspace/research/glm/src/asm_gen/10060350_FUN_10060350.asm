; FUN_10060350 @ 0x10060350 — auto-synthesized
.CODE
FUN_10060350 PROC
    push esi
    push edi
    mov edi, eax
    mov al, byte ptr [ecx]
    xor edx, edx
    test al, al
    mov esi, ecx
    je L0
    mov edi, edi
    cmp al, 0x2e
    jne L1
    mov edx, esi
    jmp L2
    cmp al, 0x2f
    je L3
    cmp al, 0x5c
    jne L2
    xor edx, edx
    mov al, byte ptr [esi + 1]
    inc esi
    test al, al
    jne L4
    test edx, edx
    jne L5
    mov edx, esi
    cmp ecx, edx
    je L6
    mov al, byte ptr [ecx]
    mov byte ptr [edi], al
    inc edi
    inc ecx
    cmp ecx, edx
    jne L7
    mov byte ptr [edi], 0
    pop edi
    pop esi
    ret
FUN_10060350 ENDP
END