; FUN_100cc7ab @ 0x100cc7ab — auto-synthesized
.CODE
FUN_100cc7ab PROC
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
    cmp byte ptr [edx], al
    je L1
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
FUN_100cc7ab ENDP
END