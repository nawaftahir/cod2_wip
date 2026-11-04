; FUN_100c3da3 @ 0x100c3da3 — auto-synthesized
.CODE
FUN_100c3da3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    jmp L0
    mov eax, dword ptr [esi + 4]
    dec eax
    je L1
    sub eax, 5
    je L2
    dec eax
    dec eax
    je L3
    dec eax
    je L4
    dec eax
    dec eax
    jne L5
    mov esi, dword ptr [esi + 0x20]
    jmp L0
    mov esi, dword ptr [esi + 0x18]
    test esi, esi
    jne L6
    xor eax, eax
    jmp L7
    mov eax, dword ptr [esi + 0x1c]
    imul eax, dword ptr [esi + 0x18]
    jmp L7
    push dword ptr [esi + 0x10]
    call L8
    imul eax, dword ptr [esi + 0x14]
    jmp L7
    push edi
    push dword ptr [esi + 0xc]
    call L8
    push dword ptr [esi + 8]
    mov edi, eax
    call L8
    add eax, edi
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100c3da3 ENDP
END