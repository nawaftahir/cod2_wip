; FUN_10063e32 @ 0x10063e32 — auto-synthesized
    sub_10063db9 PROTO C
    sub_100f7879 PROTO C
.CODE
FUN_10063e32 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0xc
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    mov edx, dword ptr [ebp + 8]
    pop ecx
    je L0
    push edx
    mov ecx, eax
    call sub_10063db9
    jmp L1
    xor eax, eax
    test eax, eax
    jne L2
    mov eax, 0x8007000e
    jmp L3
    mov ecx, dword ptr [esi + 0x68]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [esi + 0x68], eax
    mov dword ptr [esi + 0x298], edx
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_10063e32 ENDP
END