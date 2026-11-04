; FUN_1006dc2f @ 0x1006dc2f — auto-synthesized
.CODE
FUN_1006dc2f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [esi + 4]
    sub eax, 6
    je L2
    sub eax, 5
    je L3
    dec eax
    je L4
    dec eax
    jne L3
    lea eax, [esi + 0x30]
    jmp L1
    push dword ptr [esi + 0x14]
    mov ecx, edi
    call L5
    test eax, eax
    jne L1
    push dword ptr [esi + 0x18]
    mov ecx, edi
    call L5
    test eax, eax
    jne L1
    push dword ptr [esi + 0x1c]
    mov ecx, edi
    call L5
    test eax, eax
    jne L1
    push dword ptr [esi + 0x20]
    mov ecx, edi
    call L5
    test eax, eax
    jne L1
    jmp L3
    mov eax, dword ptr [esi + 0x14]
    add eax, 0x10
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1006dc2f ENDP
END