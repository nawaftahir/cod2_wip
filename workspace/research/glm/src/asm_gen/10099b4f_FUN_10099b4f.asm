; FUN_10099b4f @ 0x10099b4f — auto-synthesized
    sub_100995d6 PROTO C
.CODE
FUN_10099b4f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    mov ebx, ecx
    je L0
    cmp dword ptr [esi + 4], 1
    jne L1
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L2
    mov esi, dword ptr [esi + 0xc]
    add edi, eax
    test esi, esi
    jne L3
    test esi, esi
    jne L4
    mov eax, edi
    jmp L5
    mov eax, dword ptr [esi + 4]
    sub eax, 6
    je L6
    dec eax
    dec eax
    je L7
    dec eax
    je L8
    dec eax
    dec eax
    je L9
    push 0x1010f7b0
    push 0
    push 0
    push ebx
    call sub_100995d6
    add esp, 0x10
    xor eax, eax
    jmp L5
    push dword ptr [esi + 0x20]
    jmp L10
    mov eax, dword ptr [esi + 0x1c]
    imul eax, dword ptr [esi + 0x18]
    jmp L11
    push dword ptr [esi + 0x10]
    mov ecx, ebx
    call L2
    imul eax, dword ptr [esi + 0x14]
    jmp L11
    push dword ptr [esi + 0x18]
    mov ecx, ebx
    call L2
    add eax, edi
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_10099b4f ENDP
END