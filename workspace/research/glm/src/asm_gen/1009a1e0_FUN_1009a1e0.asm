; FUN_1009a1e0 @ 0x1009a1e0 — auto-synthesized
    sub_1009951b PROTO C
.CODE
FUN_1009a1e0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x10]
    jmp L0
    mov edx, dword ptr [eax + 0x10]
    cmp edx, 2
    je L1
    cmp edx, 3
    je L1
    cmp edx, 4
    je L1
    mov eax, dword ptr [eax + 0x20]
    test eax, eax
    jne L2
    mov eax, dword ptr [ebp + 8]
    pop ebp
    ret 4
    push 0x10114968
    push 0xbf8
    lea eax, [ecx + 0x20]
    push eax
    push ecx
    call sub_1009951b
    add esp, 0x10
    xor eax, eax
    jmp L3
FUN_1009a1e0 ENDP
END