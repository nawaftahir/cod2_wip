; FUN_10047b40 @ 0x10047b40 — auto-synthesized
    sub_100479c2 PROTO C
.CODE
FUN_10047b40 PROC
    push ebx
    push esi
    mov esi, edx
    mov ebx, eax
    mov al, byte ptr [esi + 0xc]
    test al, al
    push edi
    mov edi, ecx
    jne L0
    test ebx, ebx
    jbe L0
    movsx eax, byte ptr [edi]
    push eax
    mov eax, 1
    call sub_100479c2
    add esp, 4
    inc edi
    dec ebx
    jne L1
    pop edi
    pop esi
    pop ebx
    ret
FUN_10047b40 ENDP
END