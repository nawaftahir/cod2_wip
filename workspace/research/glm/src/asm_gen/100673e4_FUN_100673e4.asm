; FUN_100673e4 @ 0x100673e4 — auto-synthesized
    sub_10063e12 PROTO C
    sub_100670c7 PROTO C
.CODE
FUN_100673e4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 0x68], 0
    jne L0
    mov eax, 0x8876086c
    jmp L1
    cmp dword ptr [ebp - 0x20], 0xd
    je L2
    lea eax, [ebp - 0x20]
    mov ecx, esi
    push eax
    call sub_100670c7
    test eax, eax
    jge L3
    jmp L1
    mov ecx, dword ptr [esi + 0x68]
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esi + 0x68], eax
    and dword ptr [ecx + 4], 0
    push 1
    call sub_10063e12
    mov eax, dword ptr [esi + 0x68]
    test eax, eax
    je L4
    mov eax, dword ptr [eax]
    jmp L5
    xor eax, eax
    inc eax
    mov dword ptr [esi + 0x298], eax
    xor eax, eax
    pop esi
    leave
    ret
FUN_100673e4 ENDP
END