; FUN_100cc7e2 @ 0x100cc7e2 — auto-synthesized
.CODE
FUN_100cc7e2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0xc]
    xor eax, eax
    cmp esi, eax
    mov ecx, esi
    je L0
    mov edx, dword ptr [ebp + 8]
    cmp word ptr [edx], ax
    je L1
    inc edx
    inc edx
    dec esi
    jne L2
    cmp esi, eax
    jne L3
    mov eax, 0x80070057
    jmp L4
    mov edx, dword ptr [ebp + 0x10]
    cmp edx, eax
    je L4
    sub ecx, esi
    mov dword ptr [edx], ecx
    pop esi
    pop ebp
    ret 0xc
FUN_100cc7e2 ENDP
END