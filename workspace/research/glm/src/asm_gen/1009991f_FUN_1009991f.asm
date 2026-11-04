; FUN_1009991f @ 0x1009991f — auto-synthesized
    sub_100995b5 PROTO C
.CODE
FUN_1009991f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    je L0
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
    je L5
    push 0x1010f7b0
    push 0
    push 0
    push edi
    call sub_100995b5
    add esp, 0x10
    jmp L0
    push dword ptr [ebp + 0xc]
    push dword ptr [esi + 0x20]
    jmp L6
    cmp dword ptr [ebp + 0xc], 0
    je L7
    or byte ptr [esi + 0x21], 2
    jmp L0
    and byte ptr [esi + 0x21], 0xfd
    jmp L0
    push dword ptr [ebp + 0xc]
    push dword ptr [esi + 0x10]
    jmp L6
    push dword ptr [ebp + 0xc]
    push dword ptr [esi + 0x18]
    jmp L6
    cmp dword ptr [esi + 4], 1
    jne L8
    push dword ptr [ebp + 0xc]
    mov ecx, edi
    push dword ptr [esi + 8]
    call L9
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L1
    test esi, esi
    je L0
    push dword ptr [ebp + 0xc]
    push esi
    mov ecx, edi
    call L9
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 8
FUN_1009991f ENDP
END